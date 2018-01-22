From: Steve Kenton <skenton@ou.edu>
Date: Mon, 22 Jan 2018 15:31:38 -0600
Subject: [Buildroot] [PATCH 1/1] udftools: new package
Message-ID: <20180122213138.11855-1-skenton@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steve Kenton <skenton@ou.edu>
---
Try 2: fix stupid copy paste error in Config.in
Try 3: remove duplicate/misplaced addition to master Config.in
I wish I could see these issues  when I first look the patch over - sigh
Try 4: Fixes for feedback from Thomas
I computed the hash below for the license file but I did not see any others under the package directory
so I think I must be misunderstanding where it should go from my reading of the on-line manual
# Locally computed
sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
I ran ./utils/check-package package/udftools/* and fixed up all the white space errors
But I'm not sure what to do with ./utils/test-pkg, do I need to build all 47 tools chains?
I tried ./utils/test-pkg -p udftools -c udftools.snippet (contents below) but just got errors
BR2_PACKAGE_UDFTOOLS=y

How do I proceed from there?

 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/udftools/Config.in     | 12 ++++++++++++
 package/udftools/udftools.hash |  2 ++
 package/udftools/udftools.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/udftools/Config.in
 create mode 100644 package/udftools/udftools.hash
 create mode 100644 package/udftools/udftools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 73c0231..1c5ed16 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1681,6 +1681,7 @@ F:	package/dvdrw-tools/
 F:	package/memtest86/
 F:	package/mjpegtools/
 F:	package/tovid/
+F:	package/udftools/
 F:	package/xorriso/
 
 N:	Steve Thomas <scjthm@live.com>
diff --git a/package/Config.in b/package/Config.in
index 00451f5..7b3531c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -196,6 +196,7 @@ menu "Filesystem and flash utilities"
 	source "package/squashfs/Config.in"
 	source "package/sshfs/Config.in"
 	source "package/sunxi-tools/Config.in"
+	source "package/udftools/Config.in"
 	source "package/unionfs/Config.in"
 	source "package/xfsprogs/Config.in"
 endmenu
diff --git a/package/udftools/Config.in b/package/udftools/Config.in
new file mode 100644
index 0000000..bbccd60
--- /dev/null
+++ b/package/udftools/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_UDFTOOLS
+	bool "udftools"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_READLINE
+	help
+	  Tools for creating UDF filesystems
+	  Maintained fork of the 2004 Sourcforge package
+
+	  https://github.com/pali/udftools
+
+comment "udftools needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/udftools/udftools.hash b/package/udftools/udftools.hash
new file mode 100644
index 0000000..b297edf
--- /dev/null
+++ b/package/udftools/udftools.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	67fe428d452901215cfad8049d250540c97114b1a20dd63277b91c2c4fae8292	udftools-2.0.tar.gz
diff --git a/package/udftools/udftools.mk b/package/udftools/udftools.mk
new file mode 100644
index 0000000..708fef9
--- /dev/null
+++ b/package/udftools/udftools.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# udftools
+#
+################################################################################
+
+UDFTOOLS_VERSION = 2.0
+UDFTOOLS_SITE = https://github.com/pali/udftools/releases/download/$(UDFTOOLS_VERSION)
+UDFTOOLS_LICENSE = GPL-2.0+
+UDFTOOLS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.9.0.137.gcf4c2cf
