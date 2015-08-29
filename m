From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 23:12:48 +0200
Subject: [Buildroot] [git commit branch/next] package/sp-oops-extract: new
	package
Message-ID: <20150829211401.162C281D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22212f15e43e5f274c8c0ad33957a346ccb99cf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A tool for extracting OOPS/panic logs from MTD.

Tested using arm-buildroot-linux-gnueabihf toolchain.

[Thomas:
 - use sp-oops-extract instead of sp_oops_extract as the Config.in
   prompt and in the .mk file comment
 - remove @ in front of the build and install commands.
 - use $(TARGET_CONFIGURE_OPTS) instead of manually passing CC, AR,
   LD, CFLAGS and LDFLAGS.]

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 ...the-Makefile-more-cross-compiler-friendly.patch |   22 ++++++++++++++++++++
 package/sp-oops-extract/Config.in                  |    6 +++++
 package/sp-oops-extract/sp-oops-extract.hash       |    2 +
 package/sp-oops-extract/sp-oops-extract.mk         |   22 ++++++++++++++++++++
 5 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ed0eb98..c6244b7 100644
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
index 0000000..d4e0252
--- /dev/null
+++ b/package/sp-oops-extract/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SP_OOPS_EXTRACT
+	bool "sp-oops-extract"
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
index 0000000..5882431
--- /dev/null
+++ b/package/sp-oops-extract/sp-oops-extract.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# sp-oops-extract
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
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define SP_OOPS_EXTRACT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install \
+		DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
