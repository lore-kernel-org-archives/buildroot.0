From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 22:19:08 +0200
Subject: [Buildroot] [git commit] package: add configuration option to
	specify a local override file
Message-ID: <20110930063208.A16338DC07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee0246e1e1d83f41985489c85dfef07098a2026d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The user can now create a custom local override file to override the
source directory for various packages.

An example override file:

 ZLIB_OVERRIDE_SRCDIR = /tmp/zlib
 STRACE_OVERRIDE_SRCDIR = /opt/strace-4.5.20

would tell Buildroot to use the zlib and strace source code from the
specified directories, instead of download, extracting and patching
the code has done usually by Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |   10 ++++++++++
 Makefile  |    7 +++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index 2fce9d7..3aa3ad8 100644
--- a/Config.in
+++ b/Config.in
@@ -334,6 +334,16 @@ config BR2_HAVE_DEVFILES
 	  Install headers and static libraries in the
 	  target filesystem
 
+config BR2_PACKAGE_OVERRIDE_FILE
+	string "location of a package override file"
+	default "$(TOPDIR)/local.mk"
+	help
+	  A package override file is a short makefile that contains
+	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR,
+	  which allows to tell Buildroot to use an existing directory
+	  as the source directory for a particular package. See the
+	  Buildroot documentation for more details on this feature.
+
 endmenu
 
 source "toolchain/Config.in"
diff --git a/Makefile b/Makefile
index a20d3e2..8525b7d 100644
--- a/Makefile
+++ b/Makefile
@@ -309,6 +309,13 @@ else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
 include toolchain/toolchain-crosstool-ng.mk
 endif
 
+# Include the package override file if one has been provided in the
+# configuration.
+PACKAGE_OVERRIDE_FILE=$(call qstrip,$(BR2_PACKAGE_OVERRIDE_FILE))
+ifneq ($(PACKAGE_OVERRIDE_FILE),)
+-include $(PACKAGE_OVERRIDE_FILE)
+endif
+
 include package/*/*.mk
 
 include boot/common.mk
