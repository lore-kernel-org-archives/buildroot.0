From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Mar 2010 15:14:56 +0100
Subject: [Buildroot] [git commit master] kernel-headers: get rid of ancient
	2.6.26 version
Message-ID: <20100315141648.E92BF7764D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fb0e64d5100e54658d8f70969b62d9e689fc5064
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And remove the -rt support we had for that version.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |   11 ----
 .../kernel-headers/kernel-headers-new.makefile     |   15 -----
 .../linux-2.6.26.8-unifdef-getline.patch           |   56 --------------------
 3 files changed, 0 insertions(+), 82 deletions(-)
 delete mode 100644 toolchain/kernel-headers/linux-2.6.26.8-unifdef-getline.patch

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index f2844ed..3df93b9 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -16,10 +16,6 @@ choice
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_6_26
-		depends on BR2_DEPRECATED
-		bool "Linux 2.6.26.x kernel headers"
-
 	config BR2_KERNEL_HEADERS_2_6_27
 		depends on BR2_DEPRECATED
 		bool "Linux 2.6.27.x kernel headers"
@@ -54,12 +50,6 @@ choice
 		bool "Local Linux snapshot (linux-2.6.tar.bz2)"
 endchoice
 
-config BR2_KERNEL_HEADERS_RT
-	bool "use realtime (-rt) kernel patches"
-	depends on BR2_KERNEL_HEADERS_2_6_26
-	help
-	  Apply Ingo's realtime extensions to linux
-
 config BR2_DEFAULT_KERNEL_VERSION
 	string "linux version"
 	depends on BR2_KERNEL_HEADERS_VERSION
@@ -69,7 +59,6 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
 	default "2.6.27.45"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
diff --git a/toolchain/kernel-headers/kernel-headers-new.makefile b/toolchain/kernel-headers/kernel-headers-new.makefile
index d0a3f2a..d063d29 100644
--- a/toolchain/kernel-headers/kernel-headers-new.makefile
+++ b/toolchain/kernel-headers/kernel-headers-new.makefile
@@ -23,20 +23,8 @@ LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOLCHAIN_DIR)/linux
 
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.26.8")
-LINUX_RT_VERSION:=rt16
-endif
-
 LINUX_HEADERS_DEPENDS:=
 
-ifeq ($(BR2_KERNEL_HEADERS_RT),y)
-LINUX_RT_SOURCE:=patch-$(LINUX_HEADERS_VERSION)-$(LINUX_RT_VERSION)
-LINUX_RT_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/projects/rt
-LINUX_HEADERS_DEPENDS+=$(DL_DIR)/$(LINUX_RT_SOURCE)
-$(DL_DIR)/$(LINUX_RT_SOURCE):
-	$(call DOWNLOAD,$(LINUX_RT_SITE),$(LINUX_RT_SOURCE))
-endif
-
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	@echo "*** Using kernel-headers generated from kernel source"
 	rm -rf $(LINUX_HEADERS_DIR)
@@ -47,9 +35,6 @@ $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
-ifeq ($(BR2_KERNEL_HEADERS_RT),y)
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) $(DL_DIR) $(LINUX_RT_SOURCE)
-endif
 ifneq ($(KERNEL_HEADERS_PATCH_DIR),)
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
diff --git a/toolchain/kernel-headers/linux-2.6.26.8-unifdef-getline.patch b/toolchain/kernel-headers/linux-2.6.26.8-unifdef-getline.patch
deleted file mode 100644
index f4a4820..0000000
--- a/toolchain/kernel-headers/linux-2.6.26.8-unifdef-getline.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From d15bd1067b1fcb2b7250d22bc0c7c7fea0b759f7 Mon Sep 17 00:00:00 2001
-From: Justin P. Mattock <justinmattock@gmail.com>
-Date: Sat, 7 Mar 2009 13:31:29 +0100
-Subject: [PATCH] kbuild: fix C libary confusion in unifdef.c due to getline()
-
-This fixes an error when compiling the kernel.
-
-  CHK     include/linux/version.h
-  HOSTCC  scripts/unifdef
-scripts/unifdef.c:209: error: conflicting types for 'getline'
-/usr/include/stdio.h:651: note: previous declaration of 'getline' was here
-make[1]: *** [scripts/unifdef] Error 1
-make: *** [__headers] Error 2
-
-Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>
-Cc:  Frederic Weisbecker <fweisbec@gmail.com>
-Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
-Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
----
- scripts/unifdef.c |    6 +++---
- 1 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/scripts/unifdef.c b/scripts/unifdef.c
-index 552025e..05a31a6 100644
---- a/scripts/unifdef.c
-+++ b/scripts/unifdef.c
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
--- 
-1.6.3.3
-
-- 
1.6.3.3
