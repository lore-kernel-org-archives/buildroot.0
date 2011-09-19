From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:53:09 +0200
Subject: [Buildroot] [PATCH 06/21] package: add configuration option to
	specify a local override file
In-Reply-To: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b45b4f098a174b4ed14211cef942daf57020262b.1316464690.git.thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
