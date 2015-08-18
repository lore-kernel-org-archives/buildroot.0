From: Doug Kehn <rdkehn@yahoo.com>
Date: Tue, 18 Aug 2015 16:17:52 -0500
Subject: [Buildroot] [PATCH 1/1] package/sp-oops-extract: new package
Message-ID: <1439932672-2138-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A tool for extracting OOPS/panic logs from MTD.

Tested using arm-buildroot-linux-gnueabihf toolchain.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/Config.in                                  |  1 +
 ...the-Makefile-more-cross-compiler-friendly.patch | 22 ++++++++++++++++++
 package/sp-oops-extract/Config.in                  |  6 +++++
 package/sp-oops-extract/sp-oops-extract.hash       |  2 ++
 package/sp-oops-extract/sp-oops-extract.mk         | 27 ++++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 package/sp-oops-extract/0001-Make-the-Makefile-more-cross-compiler-friendly.patch
 create mode 100644 package/sp-oops-extract/Config.in
 create mode 100644 package/sp-oops-extract/sp-oops-extract.hash
 create mode 100644 package/sp-oops-extract/sp-oops-extract.mk

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..aa86f9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -173,6 +173,7 @@ menu "Filesystem and flash utilities"
 	source "package/ntfs-3g/Config.in"
 	source "package/simicsfs/Config.in"
 	source "package/squashfs/Config.in"
+	source "package/sp-oops-extract/Config.in"
 	source "package/sshfs/Config.in"
 	source "package/sunxi-tools/Config.in"
 	source "package/unionfs/Config.in"
diff --git a/package/sp-oops-extract/0001-Make-the-Makefile-more-cross-compiler-friendly.patch b/package/sp-oops-extract/0001-Make-the-Makefile-more-cross-compiler-friendly.patch
new file mode 100644
index 0000000..67153c2
--- /dev/null
+++ b/package/sp-oops-extract/0001-Make-the-Makefile-more-cross-compiler-friendly.patch
@@ -0,0 +1,22 @@
+Fetch from: https://github.com/Schischu/ptxdist_sh/tree/master/patches/sp-oops-extract-0.0.7
+
+From: Bernhard Walle <walle@corscience.de>
+Date: Wed, 21 Mar 2012 15:55:06 +0100
+Subject: [PATCH] Make the Makefile more cross-compiler friendly
+
+Signed-off-by: Bernhard Walle <walle@corscience.de>
+---
+ src/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index cf5b550..e05eb1f 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -9,4 +9,4 @@ distclean: clean
+ 	$(RM) $(TARGETS)
+ 		
+ sp-oops-extract: oopslog.c
+-	gcc -Wall -s -o $@ $^
++	$(CC) $(LDFLAGS) $(CPPFLAGS) $(CFLAGS) -Wall -o $@ $^
+
diff --git a/package/sp-oops-extract/Config.in b/package/sp-oops-extract/Config.in
new file mode 100644
index 0000000..463ae14
--- /dev/null
+++ b/package/sp-oops-extract/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SP_OOPS_EXTRACT
+	bool "sp_oops_extract"
+	help
+	  A tool for extracting OOPS/panic logs from MTD.
+
+	  http://maemo.org/packages/view/sp-oops-extract/
diff --git a/package/sp-oops-extract/sp-oops-extract.hash b/package/sp-oops-extract/sp-oops-extract.hash
new file mode 100644
index 0000000..835bfe8
--- /dev/null
+++ b/package/sp-oops-extract/sp-oops-extract.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 85601a569af1f4584db75fad21d3a70e377ce12d1bccad7dbe1112abd3b43d93 sp-oops-extract_0.0.7-1.tar.gz
diff --git a/package/sp-oops-extract/sp-oops-extract.mk b/package/sp-oops-extract/sp-oops-extract.mk
new file mode 100644
index 0000000..d871717
--- /dev/null
+++ b/package/sp-oops-extract/sp-oops-extract.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# sp_oops_extract
+#
+################################################################################
+
+SP_OOPS_EXTRACT_VERSION = 0.0.7-1
+SP_OOPS_EXTRACT_SITE = http://repository.maemo.org/pool/maemo5.0/free/s/sp-oops-extract/
+SP_OOPS_EXTRACT_SOURCE = sp-oops-extract_$(SP_OOPS_EXTRACT_VERSION).tar.gz
+SP_OOPS_EXTRACT_LICENSE = GPLv2
+SP_OOPS_EXTRACT_LICENSE_FILES = COPYING
+
+define SP_OOPS_EXTRACT_BUILD_CMDS
+	@ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" \
+		AR="$(TARGET_AR)" \
+		LD="$(TARGET_LD)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)"
+endef
+
+define SP_OOPS_EXTRACT_INSTALL_TARGET_CMDS
+	@ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install \
+		DESTDIR="$(TARGET_DIR)"
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
