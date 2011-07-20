From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 07:52:02 +0200
Subject: [Buildroot] [PATCH 03/12] package: add configuration option to
	specify a local override file
In-Reply-To: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
Message-ID: <804eb8923dadda1d63e4c26c9a90fd82fc8ad448.1311141087.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The user can now create a custom local override file to override the
source directory for various packages.

An example override file:

 ZLIB_OVERRIDE_SRCDIR = /tmp/zlib
 STRACE_OVERRIDE_SRCDIR = /opt/strace-4.5.20

would tell Buildroot to use the zlib and strace source code from the
specified directories, instead of download, extracting and patching
the code has done usually by Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |   10 ++++++++++
 Makefile  |    7 +++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index a67c08d..784f4ef 100644
--- a/Config.in
+++ b/Config.in
@@ -327,6 +327,16 @@ config BR2_HAVE_DEVFILES
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
index 20dd707..e7b2729 100644
--- a/Makefile
+++ b/Makefile
@@ -308,6 +308,13 @@ else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
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
-- 
1.7.4.1
