From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jul 2011 22:11:09 +0200
Subject: [Buildroot] [git commit] uboot-mkimage: use correct host
	compiler/flags
Message-ID: <20110710201144.AA6658A422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b819c32f8830676433764eb2fd7af6851bb5034
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As used elswwhere in BR.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...t-mkimage-2011.03-hostcflags-override-fix.patch |   29 ++++++++++++++++++++
 package/uboot-mkimage/uboot-mkimage.mk             |    5 ++-
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 package/uboot-mkimage/uboot-mkimage-2011.03-hostcflags-override-fix.patch

diff --git a/package/uboot-mkimage/uboot-mkimage-2011.03-hostcflags-override-fix.patch b/package/uboot-mkimage/uboot-mkimage-2011.03-hostcflags-override-fix.patch
new file mode 100644
index 0000000..0202eda
--- /dev/null
+++ b/package/uboot-mkimage/uboot-mkimage-2011.03-hostcflags-override-fix.patch
@@ -0,0 +1,29 @@
+[PATCH] Fix tools build with custom HOSTCFLAGS
+
+We always need to append HOSTCPPFLAGS, even if HOSTCFLAGS have been
+overridden on the cmdline.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ config.mk |    6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+Index: u-boot-2011.03/config.mk
+===================================================================
+--- u-boot-2011.03.orig/config.mk
++++ u-boot-2011.03/config.mk
+@@ -46,10 +46,12 @@
+ 
+ #########################################################################
+ 
+-HOSTCFLAGS	= -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer \
+-		  $(HOSTCPPFLAGS)
++HOSTCFLAGS	= -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
+ HOSTSTRIP	= strip
+ 
++# append CPPFLAGS even if CFLAGS has been overridden on cmdline
++override HOSTCFLAGS += $(HOSTCPPFLAGS)
++
+ #
+ # Mac OS X / Darwin's C preprocessor is Apple specific.  It
+ # generates numerous errors and warnings.  We want to bypass it
diff --git a/package/uboot-mkimage/uboot-mkimage.mk b/package/uboot-mkimage/uboot-mkimage.mk
index 055348c..b8f2ee5 100644
--- a/package/uboot-mkimage/uboot-mkimage.mk
+++ b/package/uboot-mkimage/uboot-mkimage.mk
@@ -4,8 +4,9 @@ UBOOT_MKIMAGE_SITE    = ftp://ftp.denx.de/pub/u-boot
 
 define HOST_UBOOT_MKIMAGE_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
-		CROSS_COMPILE="$(TARGET_CROSS)" \
-		ARCH=$(U_BOOT_ARCH) 		\
+		HOSTCC="$(HOSTCC)"		\
+		HOSTCFLAGS="$(HOST_CFLAGS)"	\
+		HOSTLDFLAGS="$(HOST_LDFLAGS)"	\
 		tools
 endef
 
-- 
1.7.3.4
