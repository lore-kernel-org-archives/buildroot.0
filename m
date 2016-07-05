From: David Corvoysier <david.corvoysier@intel.com>
Date: Tue,  5 Jul 2016 11:42:17 +0200
Subject: [Buildroot] [PATCH 2/2] kconfig: add optional file sourcing patch
	to serie
In-Reply-To: <1467711737-5651-1-git-send-email-david.corvoysier@intel.com>
References: <1467711737-5651-1-git-send-email-david.corvoysier@intel.com>
Message-ID: <1467711737-5651-2-git-send-email-david.corvoysier@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This just adds the git formatted patch of the optional file sourcing
commit to the existing patch serie that is used to rebase against the
Kernel upstream Kconfig.

Signed-off-by: David Corvoysier <david.corvoysier@intel.com>
---
 ...-added-support-for-optional-file-sourcing.patch | 1293 ++++++++++++++++++++
 support/kconfig/patches/series                     |    1 +
 2 files changed, 1294 insertions(+)
 create mode 100644 support/kconfig/patches/18-kconfig-added-support-for-optional-file-sourcing.patch

diff --git a/support/kconfig/patches/18-kconfig-added-support-for-optional-file-sourcing.patch b/support/kconfig/patches/18-kconfig-added-support-for-optional-file-sourcing.patch
new file mode 100644
index 0000000..5c6c2ee
--- /dev/null
+++ b/support/kconfig/patches/18-kconfig-added-support-for-optional-file-sourcing.patch
@@ -0,0 +1,1293 @@
+From d77b59b056c8109ffaa6ea141fc6fb095d315de3 Mon Sep 17 00:00:00 2001
+From: David Corvoysier <david.corvoysier@intel.com>
+Date: Mon, 4 Jul 2016 15:55:15 +0200
+Subject: [PATCH] kconfig: added support for optional file sourcing
+
+Following the GNU Make pattern for sourcing files, add a new '-source'
+keyword that will fail silently if the target file does not exist.
+
+The _shipped versions of bison, flex and gperf zconf files have been
+regenerated manually with the following commands:
+
+flex -ozconf.lex.ci_shipped -L -P zconf ./zconf.l
+bison -ozconf.tab.c_shipped -t -l -p zconf ./zconf.y
+gperf -t --output-file ./zconf.hash.c_shipped -a -C -E -g -k '1,3,$' -p
+-t ./zconf.gperf
+
+Signed-off-by: David Corvoysier <david.corvoysier@intel.com>
+---
+ support/kconfig/lkc.h                |   1 +
+ support/kconfig/zconf.gperf          |   1 +
+ support/kconfig/zconf.hash.c_shipped |  68 +++--
+ support/kconfig/zconf.l              |  21 +-
+ support/kconfig/zconf.lex.c_shipped  |  72 ++++-
+ support/kconfig/zconf.tab.c_shipped  | 564 ++++++++++++++++++-----------------
+ support/kconfig/zconf.y              |   5 +
+ 7 files changed, 406 insertions(+), 326 deletions(-)
+
+diff --git a/support/kconfig/lkc.h b/support/kconfig/lkc.h
+index 09f4edf..7b23125 100644
+--- a/support/kconfig/lkc.h
++++ b/support/kconfig/lkc.h
+@@ -74,6 +74,7 @@ extern int zconfdebug;
+ int zconfparse(void);
+ void zconfdump(FILE *out);
+ void zconf_starthelp(void);
++bool zconf_fexists(const char *name);
+ FILE *zconf_fopen(const char *name);
+ void zconf_initscan(const char *name);
+ void zconf_nextfile(const char *name);
+diff --git a/support/kconfig/zconf.gperf b/support/kconfig/zconf.gperf
+index f14ab41..0561b25 100644
+--- a/support/kconfig/zconf.gperf
++++ b/support/kconfig/zconf.gperf
+@@ -16,6 +16,7 @@ mainmenu,	T_MAINMENU,	TF_COMMAND
+ menu,		T_MENU,		TF_COMMAND
+ endmenu,	T_ENDMENU,	TF_COMMAND
+ source,		T_SOURCE,	TF_COMMAND
++-source,	T_MINUSSOURCE,	TF_COMMAND
+ choice,		T_CHOICE,	TF_COMMAND
+ endchoice,	T_ENDCHOICE,	TF_COMMAND
+ comment,	T_COMMENT,	TF_COMMAND
+diff --git a/support/kconfig/zconf.hash.c_shipped b/support/kconfig/zconf.hash.c_shipped
+index 40df000..3a65f3a 100644
+--- a/support/kconfig/zconf.hash.c_shipped
++++ b/support/kconfig/zconf.hash.c_shipped
+@@ -50,7 +50,7 @@ kconf_id_hash (register const char *str, register unsigned int len)
+       73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+       73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+       73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
++      73, 73, 73, 73, 73, 25, 73, 73, 73, 73,
+       73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+       73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+       73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+@@ -112,6 +112,7 @@ struct kconf_id_strings_t
+     char kconf_id_strings_str33[sizeof("env")];
+     char kconf_id_strings_str35[sizeof("range")];
+     char kconf_id_strings_str36[sizeof("choice")];
++    char kconf_id_strings_str37[sizeof("-source")];
+     char kconf_id_strings_str39[sizeof("bool")];
+     char kconf_id_strings_str41[sizeof("source")];
+     char kconf_id_strings_str42[sizeof("visible")];
+@@ -147,6 +148,7 @@ static const struct kconf_id_strings_t kconf_id_strings_contents =
+     "env",
+     "range",
+     "choice",
++    "-source",
+     "bool",
+     "source",
+     "visible",
+@@ -170,7 +172,7 @@ kconf_id_lookup (register const char *str, register unsigned int len)
+ {
+   enum
+     {
+-      TOTAL_KEYWORDS = 32,
++      TOTAL_KEYWORDS = 33,
+       MIN_WORD_LENGTH = 2,
+       MAX_WORD_LENGTH = 14,
+       MIN_HASH_VALUE = 2,
+@@ -180,87 +182,89 @@ kconf_id_lookup (register const char *str, register unsigned int len)
+   static const struct kconf_id wordlist[] =
+     {
+       {-1}, {-1},
+-#line 25 "scripts/kconfig/zconf.gperf"
++#line 26 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_IF,		TF_COMMAND|TF_PARAM},
+-#line 36 "scripts/kconfig/zconf.gperf"
++#line 37 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_TYPE,		TF_COMMAND, S_INT},
+       {-1},
+-#line 26 "scripts/kconfig/zconf.gperf"
++#line 27 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str5,		T_ENDIF,	TF_COMMAND},
+       {-1},
+-#line 29 "scripts/kconfig/zconf.gperf"
++#line 30 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
+-#line 31 "scripts/kconfig/zconf.gperf"
++#line 32 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str8,	T_TYPE,		TF_COMMAND, S_TRISTATE},
+-#line 20 "scripts/kconfig/zconf.gperf"
++#line 21 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str9,	T_ENDCHOICE,	TF_COMMAND},
+       {-1}, {-1},
+-#line 32 "scripts/kconfig/zconf.gperf"
++#line 33 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
+-#line 35 "scripts/kconfig/zconf.gperf"
++#line 36 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
+-#line 45 "scripts/kconfig/zconf.gperf"
++#line 46 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
+       {-1}, {-1},
+-#line 43 "scripts/kconfig/zconf.gperf"
++#line 44 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,		T_ON,		TF_PARAM},
+-#line 28 "scripts/kconfig/zconf.gperf"
++#line 29 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,	T_OPTIONAL,	TF_COMMAND},
+       {-1}, {-1},
+-#line 42 "scripts/kconfig/zconf.gperf"
++#line 43 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_OPTION,	TF_COMMAND},
+ #line 17 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,	T_ENDMENU,	TF_COMMAND},
+ #line 15 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,	T_MAINMENU,	TF_COMMAND},
+       {-1},
+-#line 23 "scripts/kconfig/zconf.gperf"
++#line 24 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str25,	T_MENUCONFIG,	TF_COMMAND},
+       {-1},
+-#line 44 "scripts/kconfig/zconf.gperf"
++#line 45 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,	T_OPT_MODULES,	TF_OPTION},
+       {-1},
+ #line 16 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str29,		T_MENU,		TF_COMMAND},
+       {-1},
+-#line 39 "scripts/kconfig/zconf.gperf"
++#line 40 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_SELECT,	TF_COMMAND},
+-#line 21 "scripts/kconfig/zconf.gperf"
++#line 22 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_COMMENT,	TF_COMMAND},
+-#line 46 "scripts/kconfig/zconf.gperf"
++#line 47 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,		T_OPT_ENV,	TF_OPTION},
+       {-1},
+-#line 40 "scripts/kconfig/zconf.gperf"
++#line 41 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,		T_RANGE,	TF_COMMAND},
+-#line 19 "scripts/kconfig/zconf.gperf"
++#line 20 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_CHOICE,	TF_COMMAND},
+-      {-1}, {-1},
+-#line 33 "scripts/kconfig/zconf.gperf"
++#line 19 "scripts/kconfig/zconf.gperf"
++      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str37,	T_MINUSSOURCE,	TF_COMMAND},
++      {-1},
++#line 34 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str39,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
+       {-1},
+ #line 18 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str41,		T_SOURCE,	TF_COMMAND},
+-#line 41 "scripts/kconfig/zconf.gperf"
++#line 42 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_VISIBLE,	TF_COMMAND},
+-#line 37 "scripts/kconfig/zconf.gperf"
++#line 38 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str43,		T_TYPE,		TF_COMMAND, S_HEX},
+       {-1}, {-1},
+-#line 22 "scripts/kconfig/zconf.gperf"
++#line 23 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str46,		T_CONFIG,	TF_COMMAND},
+-#line 34 "scripts/kconfig/zconf.gperf"
++#line 35 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str47,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
+       {-1}, {-1}, {-1},
+-#line 38 "scripts/kconfig/zconf.gperf"
++#line 39 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str51,		T_TYPE,		TF_COMMAND, S_STRING},
+       {-1}, {-1},
+-#line 24 "scripts/kconfig/zconf.gperf"
++#line 25 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str54,		T_HELP,		TF_COMMAND},
+       {-1},
+-#line 30 "scripts/kconfig/zconf.gperf"
++#line 31 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str56,		T_PROMPT,	TF_COMMAND},
+       {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
+       {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
+-#line 27 "scripts/kconfig/zconf.gperf"
++#line 28 "scripts/kconfig/zconf.gperf"
+       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str72,	T_DEPENDS,	TF_COMMAND}
+     };
+ 
+@@ -282,5 +286,5 @@ kconf_id_lookup (register const char *str, register unsigned int len)
+     }
+   return 0;
+ }
+-#line 47 "scripts/kconfig/zconf.gperf"
++#line 48 "scripts/kconfig/zconf.gperf"
+ 
+diff --git a/support/kconfig/zconf.l b/support/kconfig/zconf.l
+index 1a9f53e..f7babf4 100644
+--- a/support/kconfig/zconf.l
++++ b/support/kconfig/zconf.l
+@@ -68,7 +68,7 @@ static void alloc_string(const char *str, int size)
+ }
+ %}
+ 
+-n	[A-Za-z0-9_]
++n	[A-Za-z0-9_-]
+ 
+ %%
+ 	int str = 0;
+@@ -254,6 +254,25 @@ static void zconf_endhelp(void)
+ 	BEGIN(INITIAL);
+ }
+ 
++/*
++ * Check if a file with the following name exists:
++ * ./name
++ * $(srctree)/name
++ * The latter is used when srctree is separate from objtree
++ * when compiling the kernel.
++ * Returns true if the file exists, false otherwise.
++ */
++bool zconf_fexists(const char *name)
++{
++	const char *file_name = sym_expand_string_value(name);
++	FILE* f = zconf_fopen(file_name);
++	free((void*)file_name);
++	if (f) {
++		fclose(f);
++		return true;
++	}
++	return false;
++}
+ 
+ /*
+  * Try to open specified file with following names:
+diff --git a/support/kconfig/zconf.lex.c_shipped b/support/kconfig/zconf.lex.c_shipped
+index a0521aa..2561bc8 100644
+--- a/support/kconfig/zconf.lex.c_shipped
++++ b/support/kconfig/zconf.lex.c_shipped
+@@ -72,7 +72,6 @@ typedef int flex_int32_t;
+ typedef unsigned char flex_uint8_t; 
+ typedef unsigned short int flex_uint16_t;
+ typedef unsigned int flex_uint32_t;
+-#endif /* ! C99 */
+ 
+ /* Limits of integral types. */
+ #ifndef INT8_MIN
+@@ -103,6 +102,8 @@ typedef unsigned int flex_uint32_t;
+ #define UINT32_MAX             (4294967295U)
+ #endif
+ 
++#endif /* ! C99 */
++
+ #endif /* ! FLEXINT_H */
+ 
+ #ifdef __cplusplus
+@@ -159,7 +160,15 @@ typedef unsigned int flex_uint32_t;
+ 
+ /* Size of default input buffer. */
+ #ifndef YY_BUF_SIZE
++#ifdef __ia64__
++/* On IA-64, the buffer size is 16k, not 8k.
++ * Moreover, YY_BUF_SIZE is 2*YY_READ_BUF_SIZE in the general case.
++ * Ditto for the __ia64__ case accordingly.
++ */
++#define YY_BUF_SIZE 32768
++#else
+ #define YY_BUF_SIZE 16384
++#endif /* __ia64__ */
+ #endif
+ 
+ /* The state buf must be large enough to hold one state per character in the main buffer.
+@@ -384,12 +393,12 @@ static yyconst flex_int16_t yy_nxt[][17] =
+ 
+     {
+        11,   16,   16,   17,   16,   16,   16,   16,   16,   16,
+-       16,   16,   16,   18,   16,   16,   16
++       16,   18,   16,   18,   16,   16,   16
+     },
+ 
+     {
+        11,   16,   16,   17,   16,   16,   16,   16,   16,   16,
+-       16,   16,   16,   18,   16,   16,   16
++       16,   18,   16,   18,   16,   16,   16
+ 
+     },
+ 
+@@ -462,7 +471,7 @@ static yyconst flex_int16_t yy_nxt[][17] =
+ 
+     {
+        11,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
+-      -18,  -18,  -18,   44,  -18,  -18,  -18
++      -18,   44,  -18,   44,  -18,  -18,  -18
+     },
+ 
+     {
+@@ -551,7 +560,7 @@ static yyconst flex_int16_t yy_nxt[][17] =
+ 
+     {
+        11,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
+-      -35,   57,   57,   57,  -35,  -35,  -35
++      -35,   58,   57,   57,  -35,  -35,  -35
+     },
+ 
+     {
+@@ -560,13 +569,13 @@ static yyconst flex_int16_t yy_nxt[][17] =
+     },
+ 
+     {
+-       11,  -37,  -37,   58,  -37,  -37,  -37,  -37,  -37,  -37,
++       11,  -37,  -37,   59,  -37,  -37,  -37,  -37,  -37,  -37,
+       -37,  -37,  -37,  -37,  -37,  -37,  -37
+     },
+ 
+     {
+        11,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
+-      -38,  -38,  -38,  -38,  -38,  -38,   59
++      -38,  -38,  -38,  -38,  -38,  -38,   60
+     },
+ 
+     {
+@@ -597,7 +606,7 @@ static yyconst flex_int16_t yy_nxt[][17] =
+ 
+     {
+        11,  -44,  -44,  -44,  -44,  -44,  -44,  -44,  -44,  -44,
+-      -44,  -44,  -44,   44,  -44,  -44,  -44
++      -44,   44,  -44,   44,  -44,  -44,  -44
+ 
+     },
+ 
+@@ -660,17 +669,17 @@ static yyconst flex_int16_t yy_nxt[][17] =
+ 
+     {
+        11,  -56,  -56,  -56,  -56,  -56,  -56,  -56,  -56,  -56,
+-      -56,   60,   57,   57,  -56,  -56,  -56
++      -56,   61,   57,   57,  -56,  -56,  -56
+     },
+ 
+     {
+        11,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
+-      -57,   57,   57,   57,  -57,  -57,  -57
++      -57,   58,   57,   57,  -57,  -57,  -57
+     },
+ 
+     {
+        11,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
+-      -58,  -58,  -58,  -58,  -58,  -58,  -58
++      -58,   58,   57,   57,  -58,  -58,  -58
+     },
+ 
+     {
+@@ -681,7 +690,12 @@ static yyconst flex_int16_t yy_nxt[][17] =
+ 
+     {
+        11,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
+-      -60,   57,   57,   57,  -60,  -60,  -60
++      -60,  -60,  -60,  -60,  -60,  -60,  -60
++    },
++
++    {
++       11,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
++      -61,   58,   57,   57,  -61,  -61,  -61
+     },
+ 
+     } ;
+@@ -710,14 +724,15 @@ struct yy_trans_info
+ 	flex_int32_t yy_verify;
+ 	flex_int32_t yy_nxt;
+ 	};
+-static yyconst flex_int16_t yy_accept[61] =
++static yyconst flex_int16_t yy_accept[62] =
+     {   0,
+         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
+        34,    5,    4,    2,    3,    7,    8,    6,   32,   29,
+        31,   24,   28,   27,   26,   22,   17,   13,   16,   20,
+        22,   11,   12,   19,   19,   14,   22,   22,    4,    2,
+         3,    3,    1,    6,   32,   29,   31,   30,   24,   23,
+-       26,   25,   15,   20,    9,   19,   19,   21,   10,   18
++       26,   25,   15,   20,    9,   19,   19,   19,   21,   10,
++       18
+     } ;
+ 
+ static yyconst flex_int32_t yy_ec[256] =
+@@ -912,7 +927,12 @@ static int input (void );
+ 
+ /* Amount of stuff to slurp up with each read. */
+ #ifndef YY_READ_BUF_SIZE
++#ifdef __ia64__
++/* On IA-64, the buffer size is 16k, not 8k */
++#define YY_READ_BUF_SIZE 16384
++#else
+ #define YY_READ_BUF_SIZE 8192
++#endif /* __ia64__ */
+ #endif
+ 
+ /* Copy whatever the last rule matched to the standard output. */
+@@ -2058,8 +2078,8 @@ YY_BUFFER_STATE zconf_scan_string (yyconst char * yystr )
+ 
+ /** Setup the input buffer state to scan the given bytes. The next call to zconflex() will
+  * scan from a @e copy of @a bytes.
+- * @param bytes the byte buffer to scan
+- * @param len the number of bytes in the buffer pointed to by @a bytes.
++ * @param yybytes the byte buffer to scan
++ * @param _yybytes_len the number of bytes in the buffer pointed to by @a bytes.
+  * 
+  * @return the newly allocated buffer state object.
+  */
+@@ -2312,6 +2332,26 @@ static void zconf_endhelp(void)
+ }
+ 
+ /*
++ * Check if a file with the following name exists:
++ * ./name
++ * $(srctree)/name
++ * The latter is used when srctree is separate from objtree
++ * when compiling the kernel.
++ * Returns true if the file exists, false otherwise.
++ */
++bool zconf_fexists(const char *name)
++{
++	const char *file_name = sym_expand_string_value(name);
++	FILE* f = zconf_fopen(file_name);
++	free((void*)file_name);
++	if (f) {
++		fclose(f);
++		return true;
++	}
++	return false;
++}
++
++/*
+  * Try to open specified file with following names:
+  * ./name
+  * $(srctree)/name
+diff --git a/support/kconfig/zconf.tab.c_shipped b/support/kconfig/zconf.tab.c_shipped
+index f343030..747a1ef 100644
+--- a/support/kconfig/zconf.tab.c_shipped
++++ b/support/kconfig/zconf.tab.c_shipped
+@@ -137,35 +137,36 @@ static struct menu *current_menu, *current_entry;
+      T_MENU = 259,
+      T_ENDMENU = 260,
+      T_SOURCE = 261,
+-     T_CHOICE = 262,
+-     T_ENDCHOICE = 263,
+-     T_COMMENT = 264,
+-     T_CONFIG = 265,
+-     T_MENUCONFIG = 266,
+-     T_HELP = 267,
+-     T_HELPTEXT = 268,
+-     T_IF = 269,
+-     T_ENDIF = 270,
+-     T_DEPENDS = 271,
+-     T_OPTIONAL = 272,
+-     T_PROMPT = 273,
+-     T_TYPE = 274,
+-     T_DEFAULT = 275,
+-     T_SELECT = 276,
+-     T_RANGE = 277,
+-     T_VISIBLE = 278,
+-     T_OPTION = 279,
+-     T_ON = 280,
+-     T_WORD = 281,
+-     T_WORD_QUOTE = 282,
+-     T_UNEQUAL = 283,
+-     T_CLOSE_PAREN = 284,
+-     T_OPEN_PAREN = 285,
+-     T_EOL = 286,
+-     T_OR = 287,
+-     T_AND = 288,
+-     T_EQUAL = 289,
+-     T_NOT = 290
++     T_MINUSSOURCE = 262,
++     T_CHOICE = 263,
++     T_ENDCHOICE = 264,
++     T_COMMENT = 265,
++     T_CONFIG = 266,
++     T_MENUCONFIG = 267,
++     T_HELP = 268,
++     T_HELPTEXT = 269,
++     T_IF = 270,
++     T_ENDIF = 271,
++     T_DEPENDS = 272,
++     T_OPTIONAL = 273,
++     T_PROMPT = 274,
++     T_TYPE = 275,
++     T_DEFAULT = 276,
++     T_SELECT = 277,
++     T_RANGE = 278,
++     T_VISIBLE = 279,
++     T_OPTION = 280,
++     T_ON = 281,
++     T_WORD = 282,
++     T_WORD_QUOTE = 283,
++     T_UNEQUAL = 284,
++     T_CLOSE_PAREN = 285,
++     T_OPEN_PAREN = 286,
++     T_EOL = 287,
++     T_OR = 288,
++     T_AND = 289,
++     T_EQUAL = 290,
++     T_NOT = 291
+    };
+ #endif
+ 
+@@ -417,20 +418,20 @@ union yyalloc
+ /* YYFINAL -- State number of the termination state.  */
+ #define YYFINAL  11
+ /* YYLAST -- Last index in YYTABLE.  */
+-#define YYLAST   290
++#define YYLAST   296
+ 
+ /* YYNTOKENS -- Number of terminals.  */
+-#define YYNTOKENS  36
++#define YYNTOKENS  37
+ /* YYNNTS -- Number of nonterminals.  */
+ #define YYNNTS  50
+ /* YYNRULES -- Number of rules.  */
+-#define YYNRULES  118
++#define YYNRULES  119
+ /* YYNRULES -- Number of states.  */
+-#define YYNSTATES  191
++#define YYNSTATES  194
+ 
+ /* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
+ #define YYUNDEFTOK  2
+-#define YYMAXUTOK   290
++#define YYMAXUTOK   291
+ 
+ #define YYTRANSLATE(YYX)						\
+   ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)
+@@ -467,7 +468,7 @@ static const yytype_uint8 yytranslate[] =
+        5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
+       15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
+       25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
+-      35
++      35,    36
+ };
+ 
+ #if YYDEBUG
+@@ -483,67 +484,67 @@ static const yytype_uint16 yyprhs[] =
+      143,   146,   150,   153,   155,   159,   160,   163,   166,   169,
+      172,   175,   180,   184,   187,   192,   193,   196,   200,   202,
+      206,   207,   210,   213,   216,   220,   224,   228,   230,   234,
+-     235,   238,   241,   244,   248,   252,   255,   258,   261,   262,
+-     265,   268,   271,   276,   277,   280,   283,   286,   287,   290,
+-     292,   294,   297,   300,   303,   305,   308,   309,   312,   314,
+-     318,   322,   326,   329,   333,   337,   339,   341,   342
++     235,   238,   241,   244,   248,   252,   256,   259,   262,   265,
++     266,   269,   272,   275,   280,   281,   284,   287,   290,   291,
++     294,   296,   298,   301,   304,   307,   309,   312,   313,   316,
++     318,   322,   326,   330,   333,   337,   341,   343,   345,   346
+ };
+ 
+ /* YYRHS -- A `-1'-separated list of the rules' RHS.  */
+ static const yytype_int8 yyrhs[] =
+ {
+-      37,     0,    -1,    81,    38,    -1,    38,    -1,    63,    39,
+-      -1,    39,    -1,    -1,    39,    41,    -1,    39,    55,    -1,
+-      39,    67,    -1,    39,    80,    -1,    39,    26,     1,    31,
+-      -1,    39,    40,     1,    31,    -1,    39,     1,    31,    -1,
+-      16,    -1,    18,    -1,    19,    -1,    21,    -1,    17,    -1,
+-      22,    -1,    20,    -1,    23,    -1,    31,    -1,    61,    -1,
+-      71,    -1,    44,    -1,    46,    -1,    69,    -1,    26,     1,
+-      31,    -1,     1,    31,    -1,    10,    26,    31,    -1,    43,
+-      47,    -1,    11,    26,    31,    -1,    45,    47,    -1,    -1,
+-      47,    48,    -1,    47,    49,    -1,    47,    75,    -1,    47,
+-      73,    -1,    47,    42,    -1,    47,    31,    -1,    19,    78,
+-      31,    -1,    18,    79,    82,    31,    -1,    20,    83,    82,
+-      31,    -1,    21,    26,    82,    31,    -1,    22,    84,    84,
+-      82,    31,    -1,    24,    50,    31,    -1,    -1,    50,    26,
+-      51,    -1,    -1,    34,    79,    -1,     7,    85,    31,    -1,
+-      52,    56,    -1,    80,    -1,    53,    58,    54,    -1,    -1,
+-      56,    57,    -1,    56,    75,    -1,    56,    73,    -1,    56,
+-      31,    -1,    56,    42,    -1,    18,    79,    82,    31,    -1,
+-      19,    78,    31,    -1,    17,    31,    -1,    20,    26,    82,
+-      31,    -1,    -1,    58,    41,    -1,    14,    83,    81,    -1,
+-      80,    -1,    59,    62,    60,    -1,    -1,    62,    41,    -1,
+-      62,    67,    -1,    62,    55,    -1,     3,    79,    81,    -1,
+-       4,    79,    31,    -1,    64,    76,    74,    -1,    80,    -1,
+-      65,    68,    66,    -1,    -1,    68,    41,    -1,    68,    67,
+-      -1,    68,    55,    -1,     6,    79,    31,    -1,     9,    79,
+-      31,    -1,    70,    74,    -1,    12,    31,    -1,    72,    13,
+-      -1,    -1,    74,    75,    -1,    74,    31,    -1,    74,    42,
+-      -1,    16,    25,    83,    31,    -1,    -1,    76,    77,    -1,
+-      76,    31,    -1,    23,    82,    -1,    -1,    79,    82,    -1,
+-      26,    -1,    27,    -1,     5,    31,    -1,     8,    31,    -1,
+-      15,    31,    -1,    31,    -1,    81,    31,    -1,    -1,    14,
+-      83,    -1,    84,    -1,    84,    34,    84,    -1,    84,    28,
+-      84,    -1,    30,    83,    29,    -1,    35,    83,    -1,    83,
+-      32,    83,    -1,    83,    33,    83,    -1,    26,    -1,    27,
+-      -1,    -1,    26,    -1
++      38,     0,    -1,    82,    39,    -1,    39,    -1,    64,    40,
++      -1,    40,    -1,    -1,    40,    42,    -1,    40,    56,    -1,
++      40,    68,    -1,    40,    81,    -1,    40,    27,     1,    32,
++      -1,    40,    41,     1,    32,    -1,    40,     1,    32,    -1,
++      17,    -1,    19,    -1,    20,    -1,    22,    -1,    18,    -1,
++      23,    -1,    21,    -1,    24,    -1,    32,    -1,    62,    -1,
++      72,    -1,    45,    -1,    47,    -1,    70,    -1,    27,     1,
++      32,    -1,     1,    32,    -1,    11,    27,    32,    -1,    44,
++      48,    -1,    12,    27,    32,    -1,    46,    48,    -1,    -1,
++      48,    49,    -1,    48,    50,    -1,    48,    76,    -1,    48,
++      74,    -1,    48,    43,    -1,    48,    32,    -1,    20,    79,
++      32,    -1,    19,    80,    83,    32,    -1,    21,    84,    83,
++      32,    -1,    22,    27,    83,    32,    -1,    23,    85,    85,
++      83,    32,    -1,    25,    51,    32,    -1,    -1,    51,    27,
++      52,    -1,    -1,    35,    80,    -1,     8,    86,    32,    -1,
++      53,    57,    -1,    81,    -1,    54,    59,    55,    -1,    -1,
++      57,    58,    -1,    57,    76,    -1,    57,    74,    -1,    57,
++      32,    -1,    57,    43,    -1,    19,    80,    83,    32,    -1,
++      20,    79,    32,    -1,    18,    32,    -1,    21,    27,    83,
++      32,    -1,    -1,    59,    42,    -1,    15,    84,    82,    -1,
++      81,    -1,    60,    63,    61,    -1,    -1,    63,    42,    -1,
++      63,    68,    -1,    63,    56,    -1,     3,    80,    82,    -1,
++       4,    80,    32,    -1,    65,    77,    75,    -1,    81,    -1,
++      66,    69,    67,    -1,    -1,    69,    42,    -1,    69,    68,
++      -1,    69,    56,    -1,     6,    80,    32,    -1,     7,    80,
++      32,    -1,    10,    80,    32,    -1,    71,    75,    -1,    13,
++      32,    -1,    73,    14,    -1,    -1,    75,    76,    -1,    75,
++      32,    -1,    75,    43,    -1,    17,    26,    84,    32,    -1,
++      -1,    77,    78,    -1,    77,    32,    -1,    24,    83,    -1,
++      -1,    80,    83,    -1,    27,    -1,    28,    -1,     5,    32,
++      -1,     9,    32,    -1,    16,    32,    -1,    32,    -1,    82,
++      32,    -1,    -1,    15,    84,    -1,    85,    -1,    85,    35,
++      85,    -1,    85,    29,    85,    -1,    31,    84,    30,    -1,
++      36,    84,    -1,    84,    33,    84,    -1,    84,    34,    84,
++      -1,    27,    -1,    28,    -1,    -1,    27,    -1
+ };
+ 
+ /* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
+ static const yytype_uint16 yyrline[] =
+ {
+-       0,   103,   103,   103,   105,   105,   107,   109,   110,   111,
+-     112,   113,   114,   118,   122,   122,   122,   122,   122,   122,
+-     122,   122,   126,   127,   128,   129,   130,   131,   135,   136,
+-     142,   150,   156,   164,   174,   176,   177,   178,   179,   180,
+-     181,   184,   192,   198,   208,   214,   220,   223,   225,   236,
+-     237,   242,   251,   256,   264,   267,   269,   270,   271,   272,
+-     273,   276,   282,   293,   299,   309,   311,   316,   324,   332,
+-     335,   337,   338,   339,   344,   351,   358,   363,   371,   374,
+-     376,   377,   378,   381,   389,   396,   403,   409,   416,   418,
+-     419,   420,   423,   431,   433,   434,   437,   444,   446,   451,
+-     452,   455,   456,   457,   461,   462,   465,   466,   469,   470,
+-     471,   472,   473,   474,   475,   478,   479,   482,   483
++       0,   104,   104,   104,   106,   106,   108,   110,   111,   112,
++     113,   114,   115,   119,   123,   123,   123,   123,   123,   123,
++     123,   123,   127,   128,   129,   130,   131,   132,   136,   137,
++     143,   151,   157,   165,   175,   177,   178,   179,   180,   181,
++     182,   185,   193,   199,   209,   215,   221,   224,   226,   237,
++     238,   243,   252,   257,   265,   268,   270,   271,   272,   273,
++     274,   277,   283,   294,   300,   310,   312,   317,   325,   333,
++     336,   338,   339,   340,   345,   352,   359,   364,   372,   375,
++     377,   378,   379,   382,   386,   394,   401,   408,   414,   421,
++     423,   424,   425,   428,   436,   438,   439,   442,   449,   451,
++     456,   457,   460,   461,   462,   466,   467,   470,   471,   474,
++     475,   476,   477,   478,   479,   480,   483,   484,   487,   488
+ };
+ #endif
+ 
+@@ -553,22 +554,23 @@ static const yytype_uint16 yyrline[] =
+ static const char *const yytname[] =
+ {
+   "$end", "error", "$undefined", "T_MAINMENU", "T_MENU", "T_ENDMENU",
+-  "T_SOURCE", "T_CHOICE", "T_ENDCHOICE", "T_COMMENT", "T_CONFIG",
+-  "T_MENUCONFIG", "T_HELP", "T_HELPTEXT", "T_IF", "T_ENDIF", "T_DEPENDS",
+-  "T_OPTIONAL", "T_PROMPT", "T_TYPE", "T_DEFAULT", "T_SELECT", "T_RANGE",
+-  "T_VISIBLE", "T_OPTION", "T_ON", "T_WORD", "T_WORD_QUOTE", "T_UNEQUAL",
+-  "T_CLOSE_PAREN", "T_OPEN_PAREN", "T_EOL", "T_OR", "T_AND", "T_EQUAL",
+-  "T_NOT", "$accept", "input", "start", "stmt_list", "option_name",
+-  "common_stmt", "option_error", "config_entry_start", "config_stmt",
+-  "menuconfig_entry_start", "menuconfig_stmt", "config_option_list",
+-  "config_option", "symbol_option", "symbol_option_list",
+-  "symbol_option_arg", "choice", "choice_entry", "choice_end",
+-  "choice_stmt", "choice_option_list", "choice_option", "choice_block",
+-  "if_entry", "if_end", "if_stmt", "if_block", "mainmenu_stmt", "menu",
+-  "menu_entry", "menu_end", "menu_stmt", "menu_block", "source_stmt",
+-  "comment", "comment_stmt", "help_start", "help", "depends_list",
+-  "depends", "visibility_list", "visible", "prompt_stmt_opt", "prompt",
+-  "end", "nl", "if_expr", "expr", "symbol", "word_opt", 0
++  "T_SOURCE", "T_MINUSSOURCE", "T_CHOICE", "T_ENDCHOICE", "T_COMMENT",
++  "T_CONFIG", "T_MENUCONFIG", "T_HELP", "T_HELPTEXT", "T_IF", "T_ENDIF",
++  "T_DEPENDS", "T_OPTIONAL", "T_PROMPT", "T_TYPE", "T_DEFAULT", "T_SELECT",
++  "T_RANGE", "T_VISIBLE", "T_OPTION", "T_ON", "T_WORD", "T_WORD_QUOTE",
++  "T_UNEQUAL", "T_CLOSE_PAREN", "T_OPEN_PAREN", "T_EOL", "T_OR", "T_AND",
++  "T_EQUAL", "T_NOT", "$accept", "input", "start", "stmt_list",
++  "option_name", "common_stmt", "option_error", "config_entry_start",
++  "config_stmt", "menuconfig_entry_start", "menuconfig_stmt",
++  "config_option_list", "config_option", "symbol_option",
++  "symbol_option_list", "symbol_option_arg", "choice", "choice_entry",
++  "choice_end", "choice_stmt", "choice_option_list", "choice_option",
++  "choice_block", "if_entry", "if_end", "if_stmt", "if_block",
++  "mainmenu_stmt", "menu", "menu_entry", "menu_end", "menu_stmt",
++  "menu_block", "source_stmt", "comment", "comment_stmt", "help_start",
++  "help", "depends_list", "depends", "visibility_list", "visible",
++  "prompt_stmt_opt", "prompt", "end", "nl", "if_expr", "expr", "symbol",
++  "word_opt", 0
+ };
+ #endif
+ 
+@@ -580,25 +582,25 @@ static const yytype_uint16 yytoknum[] =
+        0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
+      265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
+      275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
+-     285,   286,   287,   288,   289,   290
++     285,   286,   287,   288,   289,   290,   291
+ };
+ # endif
+ 
+ /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
+ static const yytype_uint8 yyr1[] =
+ {
+-       0,    36,    37,    37,    38,    38,    39,    39,    39,    39,
+-      39,    39,    39,    39,    40,    40,    40,    40,    40,    40,
+-      40,    40,    41,    41,    41,    41,    41,    41,    42,    42,
+-      43,    44,    45,    46,    47,    47,    47,    47,    47,    47,
+-      47,    48,    48,    48,    48,    48,    49,    50,    50,    51,
+-      51,    52,    53,    54,    55,    56,    56,    56,    56,    56,
+-      56,    57,    57,    57,    57,    58,    58,    59,    60,    61,
+-      62,    62,    62,    62,    63,    64,    65,    66,    67,    68,
+-      68,    68,    68,    69,    70,    71,    72,    73,    74,    74,
+-      74,    74,    75,    76,    76,    76,    77,    78,    78,    79,
+-      79,    80,    80,    80,    81,    81,    82,    82,    83,    83,
+-      83,    83,    83,    83,    83,    84,    84,    85,    85
++       0,    37,    38,    38,    39,    39,    40,    40,    40,    40,
++      40,    40,    40,    40,    41,    41,    41,    41,    41,    41,
++      41,    41,    42,    42,    42,    42,    42,    42,    43,    43,
++      44,    45,    46,    47,    48,    48,    48,    48,    48,    48,
++      48,    49,    49,    49,    49,    49,    50,    51,    51,    52,
++      52,    53,    54,    55,    56,    57,    57,    57,    57,    57,
++      57,    58,    58,    58,    58,    59,    59,    60,    61,    62,
++      63,    63,    63,    63,    64,    65,    66,    67,    68,    69,
++      69,    69,    69,    70,    70,    71,    72,    73,    74,    75,
++      75,    75,    75,    76,    77,    77,    77,    78,    79,    79,
++      80,    80,    81,    81,    81,    82,    82,    83,    83,    84,
++      84,    84,    84,    84,    84,    84,    85,    85,    86,    86
+ };
+ 
+ /* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
+@@ -612,10 +614,10 @@ static const yytype_uint8 yyr2[] =
+        2,     3,     2,     1,     3,     0,     2,     2,     2,     2,
+        2,     4,     3,     2,     4,     0,     2,     3,     1,     3,
+        0,     2,     2,     2,     3,     3,     3,     1,     3,     0,
+-       2,     2,     2,     3,     3,     2,     2,     2,     0,     2,
+-       2,     2,     4,     0,     2,     2,     2,     0,     2,     1,
+-       1,     2,     2,     2,     1,     2,     0,     2,     1,     3,
+-       3,     3,     2,     3,     3,     1,     1,     0,     1
++       2,     2,     2,     3,     3,     3,     2,     2,     2,     0,
++       2,     2,     2,     4,     0,     2,     2,     2,     0,     2,
++       1,     1,     2,     2,     2,     1,     2,     0,     2,     1,
++       3,     3,     3,     2,     3,     3,     1,     1,     0,     1
+ };
+ 
+ /* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
+@@ -623,177 +625,177 @@ static const yytype_uint8 yyr2[] =
+    means the default is an error.  */
+ static const yytype_uint8 yydefact[] =
+ {
+-       6,     0,   104,     0,     3,     0,     6,     6,    99,   100,
+-       0,     1,     0,     0,     0,     0,   117,     0,     0,     0,
+-       0,     0,     0,    14,    18,    15,    16,    20,    17,    19,
+-      21,     0,    22,     0,     7,    34,    25,    34,    26,    55,
+-      65,     8,    70,    23,    93,    79,     9,    27,    88,    24,
+-      10,     0,   105,     2,    74,    13,     0,   101,     0,   118,
+-       0,   102,     0,     0,     0,   115,   116,     0,     0,     0,
+-     108,   103,     0,     0,     0,     0,     0,     0,     0,    88,
+-       0,     0,    75,    83,    51,    84,    30,    32,     0,   112,
+-       0,     0,    67,     0,     0,    11,    12,     0,     0,     0,
+-       0,    97,     0,     0,     0,    47,     0,    40,    39,    35,
+-      36,     0,    38,    37,     0,     0,    97,     0,    59,    60,
+-      56,    58,    57,    66,    54,    53,    71,    73,    69,    72,
+-      68,   106,    95,     0,    94,    80,    82,    78,    81,    77,
+-      90,    91,    89,   111,   113,   114,   110,   109,    29,    86,
+-       0,   106,     0,   106,   106,   106,     0,     0,     0,    87,
+-      63,   106,     0,   106,     0,    96,     0,     0,    41,    98,
+-       0,     0,   106,    49,    46,    28,     0,    62,     0,   107,
+-      92,    42,    43,    44,     0,     0,    48,    61,    64,    45,
+-      50
++       6,     0,   105,     0,     3,     0,     6,     6,   100,   101,
++       0,     1,     0,     0,     0,     0,     0,   118,     0,     0,
++       0,     0,     0,     0,    14,    18,    15,    16,    20,    17,
++      19,    21,     0,    22,     0,     7,    34,    25,    34,    26,
++      55,    65,     8,    70,    23,    94,    79,     9,    27,    89,
++      24,    10,     0,   106,     2,    74,    13,     0,   102,     0,
++       0,   119,     0,   103,     0,     0,     0,   116,   117,     0,
++       0,     0,   109,   104,     0,     0,     0,     0,     0,     0,
++       0,    89,     0,     0,    75,    83,    84,    51,    85,    30,
++      32,     0,   113,     0,     0,    67,     0,     0,    11,    12,
++       0,     0,     0,     0,    98,     0,     0,     0,    47,     0,
++      40,    39,    35,    36,     0,    38,    37,     0,     0,    98,
++       0,    59,    60,    56,    58,    57,    66,    54,    53,    71,
++      73,    69,    72,    68,   107,    96,     0,    95,    80,    82,
++      78,    81,    77,    91,    92,    90,   112,   114,   115,   111,
++     110,    29,    87,     0,   107,     0,   107,   107,   107,     0,
++       0,     0,    88,    63,   107,     0,   107,     0,    97,     0,
++       0,    41,    99,     0,     0,   107,    49,    46,    28,     0,
++      62,     0,   108,    93,    42,    43,    44,     0,     0,    48,
++      61,    64,    45,    50
+ };
+ 
+ /* YYDEFGOTO[NTERM-NUM].  */
+ static const yytype_int16 yydefgoto[] =
+ {
+-      -1,     3,     4,     5,    33,    34,   108,    35,    36,    37,
+-      38,    74,   109,   110,   157,   186,    39,    40,   124,    41,
+-      76,   120,    77,    42,   128,    43,    78,     6,    44,    45,
+-     137,    46,    80,    47,    48,    49,   111,   112,    81,   113,
+-      79,   134,   152,   153,    50,     7,   165,    69,    70,    60
++      -1,     3,     4,     5,    34,    35,   111,    36,    37,    38,
++      39,    76,   112,   113,   160,   189,    40,    41,   127,    42,
++      78,   123,    79,    43,   131,    44,    80,     6,    45,    46,
++     140,    47,    82,    48,    49,    50,   114,   115,    83,   116,
++      81,   137,   155,   156,    51,     7,   168,    71,    72,    62
+ };
+ 
+ /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
+    STATE-NUM.  */
+-#define YYPACT_NINF -90
++#define YYPACT_NINF -92
+ static const yytype_int16 yypact[] =
+ {
+-       4,    42,   -90,    96,   -90,   111,   -90,    15,   -90,   -90,
+-      75,   -90,    82,    42,   104,    42,   110,   107,    42,   115,
+-     125,    -4,   121,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
+-     -90,   162,   -90,   163,   -90,   -90,   -90,   -90,   -90,   -90,
+-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
+-     -90,   139,   -90,   -90,   138,   -90,   142,   -90,   143,   -90,
+-     152,   -90,   164,   167,   168,   -90,   -90,    -4,    -4,    77,
+-     -18,   -90,   177,   185,    33,    71,   195,   247,   236,    -2,
+-     236,   171,   -90,   -90,   -90,   -90,   -90,   -90,    41,   -90,
+-      -4,    -4,   138,    97,    97,   -90,   -90,   186,   187,   194,
+-      42,    42,    -4,   196,    97,   -90,   219,   -90,   -90,   -90,
+-     -90,   210,   -90,   -90,   204,    42,    42,   199,   -90,   -90,
+-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
+-     -90,   222,   -90,   223,   -90,   -90,   -90,   -90,   -90,   -90,
+-     -90,   -90,   -90,   -90,   215,   -90,   -90,   -90,   -90,   -90,
+-      -4,   222,   228,   222,    -5,   222,    97,    35,   229,   -90,
+-     -90,   222,   232,   222,    -4,   -90,   135,   233,   -90,   -90,
+-     234,   235,   222,   240,   -90,   -90,   237,   -90,   239,   -13,
+-     -90,   -90,   -90,   -90,   244,    42,   -90,   -90,   -90,   -90,
+-     -90
++      17,    73,   -92,     7,   -92,   104,   -92,    19,   -92,   -92,
++     -11,   -92,    37,    73,    65,    73,    73,   -17,    74,    73,
++     -10,    80,    25,    86,   -92,   -92,   -92,   -92,   -92,   -92,
++     -92,   -92,   134,   -92,   163,   -92,   -92,   -92,   -92,   -92,
++     -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
++     -92,   -92,   133,   -92,   -92,   156,   -92,   158,   -92,   160,
++     161,   -92,   166,   -92,   172,   180,   181,   -92,   -92,    25,
++      25,   237,    28,   -92,   183,   184,    23,    71,   190,   247,
++     233,   -13,   233,   162,   -92,   -92,   -92,   -92,   -92,   -92,
++     -92,    40,   -92,    25,    25,   156,   119,   119,   -92,   -92,
++     186,   187,   195,    73,    73,    25,   220,   119,   -92,   249,
++     -92,   -92,   -92,   -92,   241,   -92,   -92,   228,    73,    73,
++     234,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
++     -92,   -92,   -92,   -92,   257,   -92,   219,   -92,   -92,   -92,
++     -92,   -92,   -92,   -92,   -92,   -92,   -92,   239,   -92,   -92,
++     -92,   -92,   -92,    25,   257,   243,   257,   199,   257,   119,
++      27,   245,   -92,   -92,   257,   246,   257,    25,   -92,   248,
++     251,   -92,   -92,   252,   254,   257,   253,   -92,   -92,   255,
++     -92,   258,   142,   -92,   -92,   -92,   -92,   259,    73,   -92,
++     -92,   -92,   -92,   -92
+ };
+ 
+ /* YYPGOTO[NTERM-NUM].  */
+ static const yytype_int16 yypgoto[] =
+ {
+-     -90,   -90,   269,   271,   -90,    23,   -70,   -90,   -90,   -90,
+-     -90,   243,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -48,
+-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
+-     -90,   -20,   -90,   -90,   -90,   -90,   -90,   206,   205,   -68,
+-     -90,   -90,   169,    -1,    27,    -7,   118,   -66,   -89,   -90
++     -92,   -92,   282,   286,   -92,    50,   -74,   -92,   -92,   -92,
++     -92,   256,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -22,
++     -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
++     -92,   -15,   -92,   -92,   -92,   -92,   -92,   215,   214,   -70,
++     -92,   -92,   177,    -1,    79,    -7,   110,   -68,   -91,   -92
+ };
+ 
+ /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
+    positive, shift that token.  If negative, reduce the rule which
+    number is the opposite.  If YYTABLE_NINF, syntax error.  */
+-#define YYTABLE_NINF -86
++#define YYTABLE_NINF -87
+ static const yytype_int16 yytable[] =
+ {
+-      10,    88,    89,    54,   146,   147,   119,     1,   122,   164,
+-      93,   141,    56,   142,    58,   156,    94,    62,     1,    90,
+-      91,   131,    65,    66,   144,   145,    67,    90,    91,   132,
+-     127,    68,   136,   -31,    97,     2,   154,   -31,   -31,   -31,
+-     -31,   -31,   -31,   -31,   -31,    98,    52,   -31,   -31,    99,
+-     -31,   100,   101,   102,   103,   104,   -31,   105,   129,   106,
+-     138,   173,    92,   141,   107,   142,   174,   172,     8,     9,
+-     143,   -33,    97,    90,    91,   -33,   -33,   -33,   -33,   -33,
+-     -33,   -33,   -33,    98,   166,   -33,   -33,    99,   -33,   100,
+-     101,   102,   103,   104,   -33,   105,    11,   106,   179,   151,
+-     123,   126,   107,   135,   125,   130,     2,   139,     2,    90,
+-      91,    -5,    12,    55,   161,    13,    14,    15,    16,    17,
+-      18,    19,    20,    65,    66,    21,    22,    23,    24,    25,
+-      26,    27,    28,    29,    30,    57,    59,    31,    61,    -4,
+-      12,    63,    32,    13,    14,    15,    16,    17,    18,    19,
+-      20,    64,    71,    21,    22,    23,    24,    25,    26,    27,
+-      28,    29,    30,    72,    73,    31,   180,    90,    91,    52,
+-      32,   -85,    97,    82,    83,   -85,   -85,   -85,   -85,   -85,
+-     -85,   -85,   -85,    84,   190,   -85,   -85,    99,   -85,   -85,
+-     -85,   -85,   -85,   -85,   -85,    85,    97,   106,    86,    87,
+-     -52,   -52,   140,   -52,   -52,   -52,   -52,    98,    95,   -52,
+-     -52,    99,   114,   115,   116,   117,    96,   148,   149,   150,
+-     158,   106,   155,   159,    97,   163,   118,   -76,   -76,   -76,
+-     -76,   -76,   -76,   -76,   -76,   160,   164,   -76,   -76,    99,
+-      13,    14,    15,    16,    17,    18,    19,    20,    91,   106,
+-      21,    22,    14,    15,   140,    17,    18,    19,    20,   168,
+-     175,    21,    22,   177,   181,   182,   183,    32,   187,   167,
+-     188,   169,   170,   171,   185,   189,    53,    51,    32,   176,
+-      75,   178,   121,     0,   133,   162,     0,     0,     0,     0,
+-     184
++      10,    91,    92,    55,   122,   149,   150,    11,   125,   144,
++      61,   134,    57,   145,    59,    60,   159,    65,    64,   135,
++       1,     2,     1,   -31,   100,   147,   148,   -31,   -31,   -31,
++     -31,   -31,   -31,   -31,   -31,   -31,   101,   157,   -31,   -31,
++     102,   -31,   103,   104,   105,   106,   107,   -31,   108,     2,
++     109,    53,    67,    68,   176,   110,    69,    96,   130,   177,
++     139,    70,   144,    97,    95,   132,   145,   141,   175,    56,
++     146,   -33,   100,    93,    94,   -33,   -33,   -33,   -33,   -33,
++     -33,   -33,   -33,   -33,   101,   169,   -33,   -33,   102,   -33,
++     103,   104,   105,   106,   107,   -33,   108,    58,   109,   182,
++       8,     9,   154,   110,    -5,    12,    63,    66,    13,    14,
++      15,    16,    17,    18,    19,    20,    21,   164,    73,    22,
++      23,    24,    25,    26,    27,    28,    29,    30,    31,   126,
++     129,    32,   138,    -4,    12,    74,    33,    13,    14,    15,
++      16,    17,    18,    19,    20,    21,    67,    68,    22,    23,
++      24,    25,    26,    27,    28,    29,    30,    31,   128,   133,
++      32,   142,   -86,   100,    75,    33,   -86,   -86,   -86,   -86,
++     -86,   -86,   -86,   -86,   -86,    93,    94,   -86,   -86,   102,
++     -86,   -86,   -86,   -86,   -86,   -86,   -86,   193,    53,   109,
++      84,   100,    85,    86,   143,   -52,   -52,   -52,    87,   -52,
++     -52,   -52,   -52,   101,    88,   -52,   -52,   102,   117,   118,
++     119,   120,    89,    90,   167,    98,    99,   109,   151,   152,
++     100,   153,   121,   -76,   -76,   -76,   -76,   -76,   -76,   -76,
++     -76,   -76,    93,    94,   -76,   -76,   102,    13,    14,    15,
++      16,    17,    18,    19,    20,    21,   109,   158,    22,    23,
++     161,   143,    14,    15,    16,   162,    18,    19,    20,    21,
++     163,   166,    22,    23,   170,    33,   172,   173,   174,     2,
++      93,    94,   167,    94,   179,   171,   181,   178,   180,    33,
++     183,    93,    94,   184,   185,   187,   186,   190,   188,    54,
++     191,   192,    52,   124,    77,   136,   165
+ };
+ 
+ #define yypact_value_is_default(yystate) \
+-  ((yystate) == (-90))
++  ((yystate) == (-92))
+ 
+ #define yytable_value_is_error(yytable_value) \
+   YYID (0)
+ 
+-static const yytype_int16 yycheck[] =
++static const yytype_uint8 yycheck[] =
+ {
+-       1,    67,    68,    10,    93,    94,    76,     3,    76,    14,
+-      28,    81,    13,    81,    15,   104,    34,    18,     3,    32,
+-      33,    23,    26,    27,    90,    91,    30,    32,    33,    31,
+-      78,    35,    80,     0,     1,    31,   102,     4,     5,     6,
+-       7,     8,     9,    10,    11,    12,    31,    14,    15,    16,
+-      17,    18,    19,    20,    21,    22,    23,    24,    78,    26,
+-      80,    26,    69,   133,    31,   133,    31,   156,    26,    27,
+-      29,     0,     1,    32,    33,     4,     5,     6,     7,     8,
+-       9,    10,    11,    12,   150,    14,    15,    16,    17,    18,
+-      19,    20,    21,    22,    23,    24,     0,    26,   164,   100,
+-      77,    78,    31,    80,    77,    78,    31,    80,    31,    32,
+-      33,     0,     1,    31,   115,     4,     5,     6,     7,     8,
+-       9,    10,    11,    26,    27,    14,    15,    16,    17,    18,
+-      19,    20,    21,    22,    23,    31,    26,    26,    31,     0,
+-       1,    26,    31,     4,     5,     6,     7,     8,     9,    10,
+-      11,    26,    31,    14,    15,    16,    17,    18,    19,    20,
+-      21,    22,    23,     1,     1,    26,    31,    32,    33,    31,
+-      31,     0,     1,    31,    31,     4,     5,     6,     7,     8,
+-       9,    10,    11,    31,   185,    14,    15,    16,    17,    18,
+-      19,    20,    21,    22,    23,    31,     1,    26,    31,    31,
+-       5,     6,    31,     8,     9,    10,    11,    12,    31,    14,
+-      15,    16,    17,    18,    19,    20,    31,    31,    31,    25,
+-       1,    26,    26,    13,     1,    26,    31,     4,     5,     6,
+-       7,     8,     9,    10,    11,    31,    14,    14,    15,    16,
+-       4,     5,     6,     7,     8,     9,    10,    11,    33,    26,
+-      14,    15,     5,     6,    31,     8,     9,    10,    11,    31,
+-      31,    14,    15,    31,    31,    31,    31,    31,    31,   151,
+-      31,   153,   154,   155,    34,    31,     7,     6,    31,   161,
+-      37,   163,    76,    -1,    79,   116,    -1,    -1,    -1,    -1,
+-     172
++       1,    69,    70,    10,    78,    96,    97,     0,    78,    83,
++      27,    24,    13,    83,    15,    16,   107,    27,    19,    32,
++       3,    32,     3,     0,     1,    93,    94,     4,     5,     6,
++       7,     8,     9,    10,    11,    12,    13,   105,    15,    16,
++      17,    18,    19,    20,    21,    22,    23,    24,    25,    32,
++      27,    32,    27,    28,    27,    32,    31,    29,    80,    32,
++      82,    36,   136,    35,    71,    80,   136,    82,   159,    32,
++      30,     0,     1,    33,    34,     4,     5,     6,     7,     8,
++       9,    10,    11,    12,    13,   153,    15,    16,    17,    18,
++      19,    20,    21,    22,    23,    24,    25,    32,    27,   167,
++      27,    28,   103,    32,     0,     1,    32,    27,     4,     5,
++       6,     7,     8,     9,    10,    11,    12,   118,    32,    15,
++      16,    17,    18,    19,    20,    21,    22,    23,    24,    79,
++      80,    27,    82,     0,     1,     1,    32,     4,     5,     6,
++       7,     8,     9,    10,    11,    12,    27,    28,    15,    16,
++      17,    18,    19,    20,    21,    22,    23,    24,    79,    80,
++      27,    82,     0,     1,     1,    32,     4,     5,     6,     7,
++       8,     9,    10,    11,    12,    33,    34,    15,    16,    17,
++      18,    19,    20,    21,    22,    23,    24,   188,    32,    27,
++      32,     1,    32,    32,    32,     5,     6,     7,    32,     9,
++      10,    11,    12,    13,    32,    15,    16,    17,    18,    19,
++      20,    21,    32,    32,    15,    32,    32,    27,    32,    32,
++       1,    26,    32,     4,     5,     6,     7,     8,     9,    10,
++      11,    12,    33,    34,    15,    16,    17,     4,     5,     6,
++       7,     8,     9,    10,    11,    12,    27,    27,    15,    16,
++       1,    32,     5,     6,     7,    14,     9,    10,    11,    12,
++      32,    27,    15,    16,   154,    32,   156,   157,   158,    32,
++      33,    34,    15,    34,   164,    32,   166,    32,    32,    32,
++      32,    33,    34,    32,    32,   175,    32,    32,    35,     7,
++      32,    32,     6,    78,    38,    81,   119
+ };
+ 
+ /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
+    symbol of state STATE-NUM.  */
+ static const yytype_uint8 yystos[] =
+ {
+-       0,     3,    31,    37,    38,    39,    63,    81,    26,    27,
+-      79,     0,     1,     4,     5,     6,     7,     8,     9,    10,
+-      11,    14,    15,    16,    17,    18,    19,    20,    21,    22,
+-      23,    26,    31,    40,    41,    43,    44,    45,    46,    52,
+-      53,    55,    59,    61,    64,    65,    67,    69,    70,    71,
+-      80,    39,    31,    38,    81,    31,    79,    31,    79,    26,
+-      85,    31,    79,    26,    26,    26,    27,    30,    35,    83,
+-      84,    31,     1,     1,    47,    47,    56,    58,    62,    76,
+-      68,    74,    31,    31,    31,    31,    31,    31,    83,    83,
+-      32,    33,    81,    28,    34,    31,    31,     1,    12,    16,
+-      18,    19,    20,    21,    22,    24,    26,    31,    42,    48,
+-      49,    72,    73,    75,    17,    18,    19,    20,    31,    42,
+-      57,    73,    75,    41,    54,    80,    41,    55,    60,    67,
+-      80,    23,    31,    74,    77,    41,    55,    66,    67,    80,
+-      31,    42,    75,    29,    83,    83,    84,    84,    31,    31,
+-      25,    79,    78,    79,    83,    26,    84,    50,     1,    13,
+-      31,    79,    78,    26,    14,    82,    83,    82,    31,    82,
+-      82,    82,    84,    26,    31,    31,    82,    31,    82,    83,
+-      31,    31,    31,    31,    82,    34,    51,    31,    31,    31,
+-      79
++       0,     3,    32,    38,    39,    40,    64,    82,    27,    28,
++      80,     0,     1,     4,     5,     6,     7,     8,     9,    10,
++      11,    12,    15,    16,    17,    18,    19,    20,    21,    22,
++      23,    24,    27,    32,    41,    42,    44,    45,    46,    47,
++      53,    54,    56,    60,    62,    65,    66,    68,    70,    71,
++      72,    81,    40,    32,    39,    82,    32,    80,    32,    80,
++      80,    27,    86,    32,    80,    27,    27,    27,    28,    31,
++      36,    84,    85,    32,     1,     1,    48,    48,    57,    59,
++      63,    77,    69,    75,    32,    32,    32,    32,    32,    32,
++      32,    84,    84,    33,    34,    82,    29,    35,    32,    32,
++       1,    13,    17,    19,    20,    21,    22,    23,    25,    27,
++      32,    43,    49,    50,    73,    74,    76,    18,    19,    20,
++      21,    32,    43,    58,    74,    76,    42,    55,    81,    42,
++      56,    61,    68,    81,    24,    32,    75,    78,    42,    56,
++      67,    68,    81,    32,    43,    76,    30,    84,    84,    85,
++      85,    32,    32,    26,    80,    79,    80,    84,    27,    85,
++      51,     1,    14,    32,    80,    79,    27,    15,    83,    84,
++      83,    32,    83,    83,    83,    85,    27,    32,    32,    83,
++      32,    83,    84,    32,    32,    32,    32,    83,    35,    52,
++      32,    32,    32,    80
+ };
+ 
+ #define yyerrok		(yyerrstatus = 0)
+@@ -1329,7 +1331,7 @@ yydestruct (yymsg, yytype, yyvaluep)
+ 
+   switch (yytype)
+     {
+-      case 53: /* "choice_entry" */
++      case 54: /* "choice_entry" */
+ 
+ 	{
+ 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
+@@ -1339,7 +1341,7 @@ yydestruct (yymsg, yytype, yyvaluep)
+ };
+ 
+ 	break;
+-      case 59: /* "if_entry" */
++      case 60: /* "if_entry" */
+ 
+ 	{
+ 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
+@@ -1349,7 +1351,7 @@ yydestruct (yymsg, yytype, yyvaluep)
+ };
+ 
+ 	break;
+-      case 65: /* "menu_entry" */
++      case 66: /* "menu_entry" */
+ 
+ 	{
+ 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
+@@ -1930,20 +1932,28 @@ yyreduce:
+   case 84:
+ 
+     {
++	if (zconf_fexists((yyvsp[(2) - (3)].string)))
++		zconf_nextfile((yyvsp[(2) - (3)].string));
++}
++    break;
++
++  case 85:
++
++    {
+ 	menu_add_entry(NULL);
+ 	menu_add_prompt(P_COMMENT, (yyvsp[(2) - (3)].string), NULL);
+ 	printd(DEBUG_PARSE, "%s:%d:comment\n", zconf_curname(), zconf_lineno());
+ }
+     break;
+ 
+-  case 85:
++  case 86:
+ 
+     {
+ 	menu_end_entry();
+ }
+     break;
+ 
+-  case 86:
++  case 87:
+ 
+     {
+ 	printd(DEBUG_PARSE, "%s:%d:help\n", zconf_curname(), zconf_lineno());
+@@ -1951,14 +1961,14 @@ yyreduce:
+ }
+     break;
+ 
+-  case 87:
++  case 88:
+ 
+     {
+ 	current_entry->help = (yyvsp[(2) - (2)].string);
+ }
+     break;
+ 
+-  case 92:
++  case 93:
+ 
+     {
+ 	menu_add_dep((yyvsp[(3) - (4)].expr));
+@@ -1966,91 +1976,91 @@ yyreduce:
+ }
+     break;
+ 
+-  case 96:
++  case 97:
+ 
+     {
+ 	menu_add_visibility((yyvsp[(2) - (2)].expr));
+ }
+     break;
+ 
+-  case 98:
++  case 99:
+ 
+     {
+ 	menu_add_prompt(P_PROMPT, (yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].expr));
+ }
+     break;
+ 
+-  case 101:
++  case 102:
+ 
+     { (yyval.id) = (yyvsp[(1) - (2)].id); }
+     break;
+ 
+-  case 102:
++  case 103:
+ 
+     { (yyval.id) = (yyvsp[(1) - (2)].id); }
+     break;
+ 
+-  case 103:
++  case 104:
+ 
+     { (yyval.id) = (yyvsp[(1) - (2)].id); }
+     break;
+ 
+-  case 106:
++  case 107:
+ 
+     { (yyval.expr) = NULL; }
+     break;
+ 
+-  case 107:
++  case 108:
+ 
+     { (yyval.expr) = (yyvsp[(2) - (2)].expr); }
+     break;
+ 
+-  case 108:
++  case 109:
+ 
+     { (yyval.expr) = expr_alloc_symbol((yyvsp[(1) - (1)].symbol)); }
+     break;
+ 
+-  case 109:
++  case 110:
+ 
+     { (yyval.expr) = expr_alloc_comp(E_EQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
+     break;
+ 
+-  case 110:
++  case 111:
+ 
+     { (yyval.expr) = expr_alloc_comp(E_UNEQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
+     break;
+ 
+-  case 111:
++  case 112:
+ 
+     { (yyval.expr) = (yyvsp[(2) - (3)].expr); }
+     break;
+ 
+-  case 112:
++  case 113:
+ 
+     { (yyval.expr) = expr_alloc_one(E_NOT, (yyvsp[(2) - (2)].expr)); }
+     break;
+ 
+-  case 113:
++  case 114:
+ 
+     { (yyval.expr) = expr_alloc_two(E_OR, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); }
+     break;
+ 
+-  case 114:
++  case 115:
+ 
+     { (yyval.expr) = expr_alloc_two(E_AND, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); }
+     break;
+ 
+-  case 115:
++  case 116:
+ 
+     { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), 0); free((yyvsp[(1) - (1)].string)); }
+     break;
+ 
+-  case 116:
++  case 117:
+ 
+     { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), SYMBOL_CONST); free((yyvsp[(1) - (1)].string)); }
+     break;
+ 
+-  case 117:
++  case 118:
+ 
+     { (yyval.string) = NULL; }
+     break;
+diff --git a/support/kconfig/zconf.y b/support/kconfig/zconf.y
+index 08ac041..9478e78 100644
+--- a/support/kconfig/zconf.y
++++ b/support/kconfig/zconf.y
+@@ -47,6 +47,7 @@ static struct menu *current_menu, *current_entry;
+ %token <id>T_MENU
+ %token <id>T_ENDMENU
+ %token <id>T_SOURCE
++%token <id>T_MINUSSOURCE
+ %token <id>T_CHOICE
+ %token <id>T_ENDCHOICE
+ %token <id>T_COMMENT
+@@ -382,6 +383,10 @@ source_stmt: T_SOURCE prompt T_EOL
+ {
+ 	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), $2);
+ 	zconf_nextfile($2);
++} | T_MINUSSOURCE prompt T_EOL
++{
++	if (zconf_fexists($2))
++		zconf_nextfile($2);
+ };
+ 
+ /* comment entry */
+-- 
+1.9.1
+
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index e25375e..df58e83 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -7,3 +7,4 @@
 15-fix-qconf-moc-rule.patch
 16-fix-space-to-de-select-options.patch
 17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch
+18-kconfig-added-support-for-optional-file-sourcing.patch
-- 
1.9.1

---------------------------------------------------------------------
Intel Corporation SAS (French simplified joint stock company)
Registered headquarters: "Les Montalets"- 2, rue de Paris, 
92196 Meudon Cedex, France
Registration Number:  302 456 199 R.C.S. NANTERRE
Capital: 4,572,000 Euros

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
