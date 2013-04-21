From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:33:11 +0200
Subject: [Buildroot] [git commit] support/kconfig: use kconfig-provided way
	of setting the CONFIG_ prefix
Message-ID: <20130421213525.C30779B7A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b58bf60b519353e983e372f5627d639e7cc72a7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's now been a while since it has been possible to build the kconfig
parser to understand a prefix other than CONFIG_, and even no prefix
at all, by setting the CONFIG_ macro (#define) at biuld time.

Just use that, insted of patching, it will make it easier for us in the
future.

Our patches have been refreshed at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/kconfig/Makefile.br                        |    2 +-
 support/kconfig/confdata.c                         |   35 ++--
 support/kconfig/lkc.h                              |    2 +-
 support/kconfig/menu.c                             |    2 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   |   25 +++-
 .../patches/03-change-config-option-prefix.patch   |  172 --------------------
 .../patches/09-implement-kconfig-probability.patch |    4 +-
 support/kconfig/patches/10-br-build-system.patch   |    2 +-
 .../patches/14-support-out-of-tree-config.patch    |   14 +-
 support/kconfig/patches/series                     |    1 -
 10 files changed, 54 insertions(+), 205 deletions(-)

diff --git a/support/kconfig/Makefile.br b/support/kconfig/Makefile.br
index 2f8b6ba..41c5ce1 100644
--- a/support/kconfig/Makefile.br
+++ b/support/kconfig/Makefile.br
@@ -19,7 +19,7 @@ host-cxxmulti := $(foreach m,$(__hostprogs),\
 host-cobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-objs))))
 host-cxxobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-cxxobjs))))
 
-HOST_EXTRACFLAGS += -I$(obj)
+HOST_EXTRACFLAGS += -I$(obj) -DCONFIG_=\"\"
 
 $(host-csingle): %: %.c
 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< -o $(obj)/$@
diff --git a/support/kconfig/confdata.c b/support/kconfig/confdata.c
index b7df92f..43f08fa 100644
--- a/support/kconfig/confdata.c
+++ b/support/kconfig/confdata.c
@@ -13,7 +13,6 @@
 #include <string.h>
 #include <time.h>
 #include <unistd.h>
-#include <libgen.h>
 
 #include "lkc.h"
 
@@ -308,20 +307,20 @@ load:
 		if (line[0] == '#') {
 			if (memcmp(line + 2, CONFIG_, strlen(CONFIG_)))
 				continue;
-			p = strchr(line + 2, ' ');
+			p = strchr(line + 2 + strlen(CONFIG_), ' ');
 			if (!p)
 				continue;
 			*p++ = 0;
 			if (strncmp(p, "is not set", 10))
 				continue;
 			if (def == S_DEF_USER) {
-				sym = sym_find(line + 2);
+				sym = sym_find(line + 2 + strlen(CONFIG_));
 				if (!sym) {
 					sym_add_change_count(1);
 					goto setsym;
 				}
 			} else {
-				sym = sym_lookup(line + 2, 0);
+				sym = sym_lookup(line + 2 + strlen(CONFIG_), 0);
 				if (sym->type == S_UNKNOWN)
 					sym->type = S_BOOLEAN;
 			}
@@ -337,8 +336,8 @@ load:
 			default:
 				;
 			}
-		} else if (isupper(line[0])) {
-			p = strchr(line, '=');
+		} else if (memcmp(line, CONFIG_, strlen(CONFIG_)) == 0) {
+			p = strchr(line + strlen(CONFIG_), '=');
 			if (!p)
 				continue;
 			*p++ = 0;
@@ -349,13 +348,13 @@ load:
 					*p2 = 0;
 			}
 			if (def == S_DEF_USER) {
-				sym = sym_find(line);
+				sym = sym_find(line + strlen(CONFIG_));
 				if (!sym) {
 					sym_add_change_count(1);
 					goto setsym;
 				}
 			} else {
-				sym = sym_lookup(line, 0);
+				sym = sym_lookup(line + strlen(CONFIG_), 0);
 				if (sym->type == S_UNKNOWN)
 					sym->type = S_OTHER;
 			}
@@ -483,8 +482,8 @@ kconfig_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
 			bool skip_unset = (arg != NULL);
 
 			if (!skip_unset)
-				fprintf(fp, "# %s is not set\n",
-				    sym->name);
+				fprintf(fp, "# %s%s is not set\n",
+				    CONFIG_, sym->name);
 			return;
 		}
 		break;
@@ -492,7 +491,7 @@ kconfig_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
 		break;
 	}
 
-	fprintf(fp, "%s=%s\n", sym->name, value);
+	fprintf(fp, "%s%s=%s\n", CONFIG_, sym->name, value);
 }
 
 static void
@@ -542,8 +541,8 @@ header_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
 			suffix = "_MODULE";
 			/* fall through */
 		default:
-			fprintf(fp, "#define %s%s 1\n",
-			    sym->name, suffix);
+			fprintf(fp, "#define %s%s%s 1\n",
+			    CONFIG_, sym->name, suffix);
 		}
 		break;
 	}
@@ -552,14 +551,14 @@ header_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
 
 		if (value[0] != '0' || (value[1] != 'x' && value[1] != 'X'))
 			prefix = "0x";
-		fprintf(fp, "#define %s %s%s\n",
-		    sym->name, prefix, value);
+		fprintf(fp, "#define %s%s %s%s\n",
+		    CONFIG_, sym->name, prefix, value);
 		break;
 	}
 	case S_STRING:
 	case S_INT:
-		fprintf(fp, "#define %s %s\n",
-		    sym->name, value);
+		fprintf(fp, "#define %s%s %s\n",
+		    CONFIG_, sym->name, value);
 		break;
 	default:
 		break;
@@ -605,7 +604,7 @@ tristate_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg
 {
 
 	if (sym->type == S_TRISTATE && *value != 'n')
-		fprintf(fp, "%s=%c\n", sym->name, (char)toupper(*value));
+		fprintf(fp, "%s%s=%c\n", CONFIG_, sym->name, (char)toupper(*value));
 }
 
 static struct conf_printer tristate_printer_cb =
diff --git a/support/kconfig/lkc.h b/support/kconfig/lkc.h
index eeb6a90..f8aee5f 100644
--- a/support/kconfig/lkc.h
+++ b/support/kconfig/lkc.h
@@ -37,7 +37,7 @@ extern "C" {
 #define N_(text) (text)
 
 #ifndef CONFIG_
-#define CONFIG_ "BR2_"
+#define CONFIG_ "CONFIG_"
 #endif
 static inline const char *CONFIG_prefix(void)
 {
diff --git a/support/kconfig/menu.c b/support/kconfig/menu.c
index 06a9364..f3bffa3 100644
--- a/support/kconfig/menu.c
+++ b/support/kconfig/menu.c
@@ -635,7 +635,7 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help)
 
 	if (menu_has_help(menu)) {
 		if (sym->name)
-			str_printf(help, "%s:\n\n", sym->name);
+			str_printf(help, "%s%s:\n\n", CONFIG_, sym->name);
 		help_text = menu_get_help(menu);
 	}
 	str_printf(help, "%s\n", _(help_text));
diff --git a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
index f28131c..d7206a0 100644
--- a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
@@ -1,9 +1,10 @@
 ---
+ confdata.c          |    4 ++--
  gconf.glade         |    2 +-
  mconf.c             |    4 ++--
  zconf.tab.c_shipped |    2 +-
  zconf.y             |    2 +-
- 4 files changed, 5 insertions(+), 5 deletions(-)
+ 5 files changed, 7 insertions(+), 7 deletions(-)
 
 Index: b/gconf.glade
 ===================================================================
@@ -60,3 +61,25 @@ Index: b/zconf.y
  
  	if (getenv("ZCONF_DEBUG"))
  		zconfdebug = 1;
+Index: b/confdata.c
+===================================================================
+--- a/confdata.c
++++ b/confdata.c
+@@ -25,7 +26,7 @@
+ static const char *conf_filename;
+ static int conf_lineno, conf_warnings, conf_unsaved;
+ 
+-const char conf_defname[] = "arch/$ARCH/defconfig";
++const char conf_defname[] = ".defconfig";
+ 
+ static void conf_warning(const char *fmt, ...)
+ {
+@@ -63,7 +64,7 @@
+ 
+ const char *conf_get_configname(void)
+ {
+-	char *name = getenv("KCONFIG_CONFIG");
++	char *name = getenv("BUILDROOT_CONFIG");
+ 
+ 	return name ? name : ".config";
+ }
diff --git a/support/kconfig/patches/03-change-config-option-prefix.patch b/support/kconfig/patches/03-change-config-option-prefix.patch
deleted file mode 100644
index 0644ab0..0000000
--- a/support/kconfig/patches/03-change-config-option-prefix.patch
+++ /dev/null
@@ -1,172 +0,0 @@
----
- confdata.c |   57 +++++++++++++++++++++++++++++----------------------------
- lkc.h      |    2 +-
- menu.c     |    2 +-
- 3 files changed, 31 insertions(+), 30 deletions(-)
-
-Index: b/confdata.c
-===================================================================
---- a/confdata.c
-+++ b/confdata.c
-@@ -13,6 +13,7 @@
- #include <string.h>
- #include <time.h>
- #include <unistd.h>
-+#include <libgen.h>
- 
- #include "lkc.h"
- 
-@@ -25,7 +26,7 @@
- static const char *conf_filename;
- static int conf_lineno, conf_warnings, conf_unsaved;
- 
--const char conf_defname[] = "arch/$ARCH/defconfig";
-+const char conf_defname[] = ".defconfig";
- 
- static void conf_warning(const char *fmt, ...)
- {
-@@ -63,7 +64,7 @@
- 
- const char *conf_get_configname(void)
- {
--	char *name = getenv("KCONFIG_CONFIG");
-+	char *name = getenv("BUILDROOT_CONFIG");
- 
- 	return name ? name : ".config";
- }
-@@ -309,20 +310,20 @@
- 		if (line[0] == '#') {
- 			if (memcmp(line + 2, CONFIG_, strlen(CONFIG_)))
- 				continue;
--			p = strchr(line + 2 + strlen(CONFIG_), ' ');
-+			p = strchr(line + 2, ' ');
- 			if (!p)
- 				continue;
- 			*p++ = 0;
- 			if (strncmp(p, "is not set", 10))
- 				continue;
- 			if (def == S_DEF_USER) {
--				sym = sym_find(line + 2 + strlen(CONFIG_));
-+				sym = sym_find(line + 2);
- 				if (!sym) {
- 					sym_add_change_count(1);
- 					goto setsym;
- 				}
- 			} else {
--				sym = sym_lookup(line + 2 + strlen(CONFIG_), 0);
-+				sym = sym_lookup(line + 2, 0);
- 				if (sym->type == S_UNKNOWN)
- 					sym->type = S_BOOLEAN;
- 			}
-@@ -338,8 +339,8 @@
- 			default:
- 				;
- 			}
--		} else if (memcmp(line, CONFIG_, strlen(CONFIG_)) == 0) {
--			p = strchr(line + strlen(CONFIG_), '=');
-+		} else if (isupper(line[0])) {
-+			p = strchr(line, '=');
- 			if (!p)
- 				continue;
- 			*p++ = 0;
-@@ -350,13 +351,13 @@
- 					*p2 = 0;
- 			}
- 			if (def == S_DEF_USER) {
--				sym = sym_find(line + strlen(CONFIG_));
-+				sym = sym_find(line);
- 				if (!sym) {
- 					sym_add_change_count(1);
- 					goto setsym;
- 				}
- 			} else {
--				sym = sym_lookup(line + strlen(CONFIG_), 0);
-+				sym = sym_lookup(line, 0);
- 				if (sym->type == S_UNKNOWN)
- 					sym->type = S_OTHER;
- 			}
-@@ -484,8 +485,8 @@
- 			bool skip_unset = (arg != NULL);
- 
- 			if (!skip_unset)
--				fprintf(fp, "# %s%s is not set\n",
--				    CONFIG_, sym->name);
-+				fprintf(fp, "# %s is not set\n",
-+				    sym->name);
- 			return;
- 		}
- 		break;
-@@ -493,7 +494,7 @@
- 		break;
- 	}
- 
--	fprintf(fp, "%s%s=%s\n", CONFIG_, sym->name, value);
-+	fprintf(fp, "%s=%s\n", sym->name, value);
- }
- 
- static void
-@@ -543,8 +544,8 @@
- 			suffix = "_MODULE";
- 			/* fall through */
- 		default:
--			fprintf(fp, "#define %s%s%s 1\n",
--			    CONFIG_, sym->name, suffix);
-+			fprintf(fp, "#define %s%s 1\n",
-+			    sym->name, suffix);
- 		}
- 		break;
- 	}
-@@ -553,14 +554,14 @@
- 
- 		if (value[0] != '0' || (value[1] != 'x' && value[1] != 'X'))
- 			prefix = "0x";
--		fprintf(fp, "#define %s%s %s%s\n",
--		    CONFIG_, sym->name, prefix, value);
-+		fprintf(fp, "#define %s %s%s\n",
-+		    sym->name, prefix, value);
- 		break;
- 	}
- 	case S_STRING:
- 	case S_INT:
--		fprintf(fp, "#define %s%s %s\n",
--		    CONFIG_, sym->name, value);
-+		fprintf(fp, "#define %s %s\n",
-+		    sym->name, value);
- 		break;
- 	default:
- 		break;
-@@ -606,7 +607,7 @@
- {
- 
- 	if (sym->type == S_TRISTATE && *value != 'n')
--		fprintf(fp, "%s%s=%c\n", CONFIG_, sym->name, (char)toupper(*value));
-+		fprintf(fp, "%s=%c\n", sym->name, (char)toupper(*value));
- }
- 
- static struct conf_printer tristate_printer_cb =
-Index: b/lkc.h
-===================================================================
---- a/lkc.h
-+++ b/lkc.h
-@@ -37,7 +37,7 @@
- #define N_(text) (text)
- 
- #ifndef CONFIG_
--#define CONFIG_ "CONFIG_"
-+#define CONFIG_ "BR2_"
- #endif
- static inline const char *CONFIG_prefix(void)
- {
-Index: b/menu.c
-===================================================================
---- a/menu.c
-+++ b/menu.c
-@@ -635,7 +635,7 @@
- 
- 	if (menu_has_help(menu)) {
- 		if (sym->name)
--			str_printf(help, "%s%s:\n\n", CONFIG_, sym->name);
-+			str_printf(help, "%s:\n\n", sym->name);
- 		help_text = menu_get_help(menu);
- 	}
- 	str_printf(help, "%s\n", _(help_text));
diff --git a/support/kconfig/patches/09-implement-kconfig-probability.patch b/support/kconfig/patches/09-implement-kconfig-probability.patch
index 72e2a25..45fa251 100644
--- a/support/kconfig/patches/09-implement-kconfig-probability.patch
+++ b/support/kconfig/patches/09-implement-kconfig-probability.patch
@@ -6,7 +6,7 @@ Index: b/confdata.c
 ===================================================================
 --- a/confdata.c
 +++ b/confdata.c
-@@ -1107,7 +1107,16 @@
+@@ -1106,7 +1106,16 @@
  void conf_set_all_new_symbols(enum conf_def_mode mode)
  {
  	struct symbol *sym, *csym;
@@ -24,7 +24,7 @@ Index: b/confdata.c
  
  	for_all_symbols(i, sym) {
  		if (sym_has_value(sym))
-@@ -1126,8 +1135,15 @@
+@@ -1125,8 +1134,15 @@
  				sym->def[S_DEF_USER].tri = no;
  				break;
  			case def_random:
diff --git a/support/kconfig/patches/10-br-build-system.patch b/support/kconfig/patches/10-br-build-system.patch
index a877318..be6fda0 100644
--- a/support/kconfig/patches/10-br-build-system.patch
+++ b/support/kconfig/patches/10-br-build-system.patch
@@ -29,7 +29,7 @@ Index: b/Makefile.br
 +host-cobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-objs))))
 +host-cxxobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-cxxobjs))))
 +
-+HOST_EXTRACFLAGS += -I$(obj)
++HOST_EXTRACFLAGS += -I$(obj) -DCONFIG_=\"\"
 +
 +$(host-csingle): %: %.c
 +	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< -o $(obj)/$@
diff --git a/support/kconfig/patches/14-support-out-of-tree-config.patch b/support/kconfig/patches/14-support-out-of-tree-config.patch
index 318d0dd..9e3f93d 100644
--- a/support/kconfig/patches/14-support-out-of-tree-config.patch
+++ b/support/kconfig/patches/14-support-out-of-tree-config.patch
@@ -20,7 +20,7 @@ Index: b/confdata.c
 ===================================================================
 --- a/confdata.c
 +++ b/confdata.c
-@@ -71,9 +71,7 @@
+@@ -70,9 +70,7 @@
  
  const char *conf_get_autoconfig_name(void)
  {
@@ -31,7 +31,7 @@ Index: b/confdata.c
  }
  
  static char *conf_expand_value(const char *in)
-@@ -738,6 +736,9 @@
+@@ -737,6 +735,9 @@
  	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
  	char *env;
  
@@ -41,7 +41,7 @@ Index: b/confdata.c
  	dirname[0] = 0;
  	if (name && name[0]) {
  		struct stat st;
-@@ -832,6 +833,7 @@
+@@ -831,6 +832,7 @@
  {
  	const char *name;
  	char path[PATH_MAX+1];
@@ -49,7 +49,7 @@ Index: b/confdata.c
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -840,8 +842,20 @@
+@@ -839,8 +841,20 @@
  	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
@@ -72,7 +72,7 @@ Index: b/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -934,9 +948,11 @@
+@@ -933,9 +947,11 @@
  		close(fd);
  	}
  out:
@@ -87,7 +87,7 @@ Index: b/confdata.c
  	return res;
  }
  
-@@ -946,25 +962,38 @@
+@@ -945,25 +961,38 @@
  	const char *name;
  	FILE *out, *tristate, *out_h;
  	int i;
@@ -130,7 +130,7 @@ Index: b/confdata.c
  	if (!out_h) {
  		fclose(out);
  		fclose(tristate);
-@@ -996,19 +1025,22 @@
+@@ -995,19 +1024,22 @@
  	name = getenv("KCONFIG_AUTOHEADER");
  	if (!name)
  		name = "include/generated/autoconf.h";
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index 2d0e991..523e652 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -1,6 +1,5 @@
 01-kconfig-kernel-to-buildroot.patch
 02-cpp-comments-to-c-comments.patch
-03-change-config-option-prefix.patch
 06-br-build-system-integration.patch
 09-implement-kconfig-probability.patch
 10-br-build-system.patch
