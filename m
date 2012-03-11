From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 15:00:31 +0100
Subject: [Buildroot] [git commit] New package minicom
Message-ID: <20120311143002.8937290D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=608e6af167bd692611c9f60efe4f57dadc8b7fd7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix whitespace and deps (wchar, ncurses, only iconv if !locale)]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/minicom/Config.in  |   14 ++++++++++++++
 package/minicom/minicom.mk |   18 ++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 41cbb8c..c582f8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -197,6 +197,7 @@ source "package/lvm2/Config.in"
 source "package/makedevs/Config.in"
 source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
+source "package/minicom/Config.in"
 source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
diff --git a/package/minicom/Config.in b/package/minicom/Config.in
new file mode 100644
index 0000000..a8a2635
--- /dev/null
+++ b/package/minicom/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_MINICOM
+	bool "minicom"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_NCURSES
+	help
+	  Minicom is a menu driven communications program.
+	  It emulates ANSI and VT102 terminals. It has a
+	  dialing directory and auto zmodem download.
+
+	  http://alioth.debian.org/projects/minicom
+
+comment "minicom requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
new file mode 100644
index 0000000..cb09b83
--- /dev/null
+++ b/package/minicom/minicom.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# minicom
+#
+#############################################################
+MINICOM_VERSION = 2.6
+MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
+MINICOM_SITE = http://alioth.debian.org/frs/download.php/3689/
+
+# pkg-config is only used to check for liblockdev, which we don't have
+# in BR, so instead of adding host-pkg-config as a dependency, simply
+# make sure the host version isn't used so we don't end up with problems
+# if people have liblockdev1-dev installed
+MINICOM_CONF_ENV = PKG_CONFIG=/bin/false
+
+MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv)
+
+$(eval $(call AUTOTARGETS))
