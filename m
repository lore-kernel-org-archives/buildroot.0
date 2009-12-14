From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:19:17 +0100
Subject: [Buildroot] [git commit master] uclibc: add avr32 special version
Message-ID: <20091214232053.2E75477796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3a24927a0e6f041a018085b5a7fc50312001fddc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 * Add a new 0.9.30-avr32-2.1.5 version of uClibc in Config.in

 * Add a patch for 0.9.20-avr32-2.1.5

 * Select a different UCLIBC_SITE for avr32 versions in uclibc.mk

 * Add the LINKRELAX=y configuration option to the uClibc .config file
   in uclibc.mk

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/uClibc/Config.in                         |   10 +++++-
 ...uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch |   29 ++++++++++++++++++++
 toolchain/uClibc/uclibc.mk                         |    8 +++++-
 3 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index d0486ab..c0ec220 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -5,7 +5,8 @@ comment "uClibc Options"
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_30_1
+	default BR2_UCLIBC_VERSION_0_9_30_1 if !BR2_avr32
+	default BR2_UCLIBC_VERSION_0_9_30_AVR32_2_1_5 if BR2_avr32
 	help
 	  Select the version of uClibc you wish to use.
 
@@ -22,7 +23,10 @@ choice
 	config BR2_UCLIBC_VERSION_0_9_30
 		depends on BR2_RECENT || BR2_DEPRECATED
 		bool "uClibc 0.9.30"
-		depends on BR2_EXT_UCLIBC_VERSION_0_9_30
+
+	config BR2_UCLIBC_VERSION_0_9_30_AVR32_2_1_5
+		depends on BR2_avr32
+		bool "uClibc 0.9.30-avr32-2.1.5"
 
 	config BR2_UCLIBC_VERSION_0_9_30_1
 		bool "uClibc 0.9.30.1"
@@ -47,6 +51,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.29		if BR2_UCLIBC_VERSION_0_9_29
 	default 0.9.30		if BR2_UCLIBC_VERSION_0_9_30
 	default 0.9.30.1	if BR2_UCLIBC_VERSION_0_9_30_1
+	default 0.9.30-avr32-2.1.5 if BR2_UCLIBC_VERSION_0_9_30_AVR32_2_1_5
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
@@ -55,6 +60,7 @@ config BR2_UCLIBC_CONFIG
 	default "toolchain/uClibc/uClibc-0.9.29.config" if BR2_UCLIBC_VERSION_0_9_29
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30_1
+	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30_AVR32_2_1_5
 	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
 	help
 	  Some people may wish to use their own modified uClibc configuration
diff --git a/toolchain/uClibc/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch b/toolchain/uClibc/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch
new file mode 100644
index 0000000..eb88884
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch
@@ -0,0 +1,29 @@
+--- uClibc-0.9.30.1.orig/extra/scripts/unifdef.c
++++ uClibc-0.9.30.1/extra/scripts/unifdef.c
+@@ -206,7 +206,7 @@ static void             done(void);
+ static void             error(const char *);
+ static int              findsym(const char *);
+ static void             flushline(bool);
+-static Linetype         getline(void);
++static Linetype         get_line(void);
+ static Linetype         ifeval(const char **);
+ static void             ignoreoff(void);
+ static void             ignoreon(void);
+@@ -512,7 +512,7 @@ process(void)
+ 
+ 	for (;;) {
+ 		linenum++;
+-		lineval = getline();
++		lineval = get_line();
+ 		trans_table[ifstate[depth]][lineval]();
+ 		debug("process %s -> %s depth %d",
+ 		    linetype_name[lineval],
+@@ -526,7 +526,7 @@ process(void)
+  * help from skipcomment().
+  */
+ static Linetype
+-getline(void)
++get_line(void)
+ {
+ 	const char *cp;
+ 	int cursym;
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 62fc40b..67601b1 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -19,9 +19,12 @@ UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
 UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc
-else
+else ifeq ($(findstring avr32,$(UCLIBC_VERSION)),avr32)
+UCLIBC_SITE:=ftp://www.at91.com/pub/buildroot/
 UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
+else
 UCLIBC_SITE:=http://www.uclibc.org/downloads
+UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),y)
 UCLIBC_SITE:=$(VENDOR_SITE)
 endif
@@ -257,6 +260,9 @@ else
 	/bin/echo "# CONFIG_E500 is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 endif
+ifeq ($(UCLIBC_TARGET_ARCH),avr32)
+	/bin/echo "LINKRELAX=y" >> $(UCLIBC_DIR)/.oldconfig
+endif
 ifneq ($(UCLIBC_TARGET_ENDIAN),)
 	# The above doesn't work for me, so redo
 	$(SED) 's/.*\(ARCH_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not set/g' \
-- 
1.6.3.3
