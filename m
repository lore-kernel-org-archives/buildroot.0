From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 12:39:24 +0100
Subject: [Buildroot] [git commit master] uclibc: get rid of avr32 special
	version since upstream works
Message-ID: <20091215113952.82EA877803@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4e813d99f98f5abc578bf56e5feffdfb34beedc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/uClibc/Config.in                         |   12 +-------
 ...uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch |   29 --------------------
 toolchain/uClibc/uclibc.mk                         |    2 -
 3 files changed, 1 insertions(+), 42 deletions(-)
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index cc7dcd1..16708a6 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -5,8 +5,7 @@ comment "uClibc Options"
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_30_1 if !BR2_avr32
-	default BR2_UCLIBC_VERSION_0_9_30_AVR32_2_1_5 if BR2_avr32
+	default BR2_UCLIBC_VERSION_0_9_30_1
 	help
 	  Select the version of uClibc you wish to use.
 
@@ -21,20 +20,13 @@ choice
 		bool "uClibc 0.9.29"
 
 	config BR2_UCLIBC_VERSION_0_9_30
-		depends on !BR2_avr32
 		depends on BR2_RECENT || BR2_DEPRECATED
 		bool "uClibc 0.9.30"
 
-	config BR2_UCLIBC_VERSION_0_9_30_AVR32_2_1_5
-		depends on BR2_avr32
-		bool "uClibc 0.9.30-avr32-2.1.5"
-
 	config BR2_UCLIBC_VERSION_0_9_30_1
-		depends on !BR2_avr32
 		bool "uClibc 0.9.30.1"
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
-		depends on !BR2_avr32
 		bool "daily snapshot"
 
 endchoice
@@ -52,7 +44,6 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.29		if BR2_UCLIBC_VERSION_0_9_29
 	default 0.9.30		if BR2_UCLIBC_VERSION_0_9_30
 	default 0.9.30.1	if BR2_UCLIBC_VERSION_0_9_30_1
-	default 0.9.30-avr32-2.1.5 if BR2_UCLIBC_VERSION_0_9_30_AVR32_2_1_5
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
@@ -61,7 +52,6 @@ config BR2_UCLIBC_CONFIG
 	default "toolchain/uClibc/uClibc-0.9.29.config" if BR2_UCLIBC_VERSION_0_9_29
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30_1
-	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30_AVR32_2_1_5
 	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
 	help
 	  Some people may wish to use their own modified uClibc configuration
diff --git a/toolchain/uClibc/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch b/toolchain/uClibc/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch
deleted file mode 100644
index eb88884..0000000
--- a/toolchain/uClibc/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- uClibc-0.9.30.1.orig/extra/scripts/unifdef.c
-+++ uClibc-0.9.30.1/extra/scripts/unifdef.c
-@@ -206,7 +206,7 @@ static void             done(void);
- static void             error(const char *);
- static int              findsym(const char *);
- static void             flushline(bool);
--static Linetype         getline(void);
-+static Linetype         get_line(void);
- static Linetype         ifeval(const char **);
- static void             ignoreoff(void);
- static void             ignoreon(void);
-@@ -512,7 +512,7 @@ process(void)
- 
- 	for (;;) {
- 		linenum++;
--		lineval = getline();
-+		lineval = get_line();
- 		trans_table[ifstate[depth]][lineval]();
- 		debug("process %s -> %s depth %d",
- 		    linetype_name[lineval],
-@@ -526,7 +526,7 @@ process(void)
-  * help from skipcomment().
-  */
- static Linetype
--getline(void)
-+get_line(void)
- {
- 	const char *cp;
- 	int cursym;
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index f742d4e..7cd9acf 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -16,8 +16,6 @@ UCLIBC_VERSION:=$(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
-else ifeq ($(findstring avr32,$(UCLIBC_VERSION)),avr32)
-UCLIBC_SITE:=ftp://www.at91.com/pub/buildroot/
 else
 UCLIBC_SITE:=http://www.uclibc.org/downloads
 endif
-- 
1.6.3.3
