From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 22:31:17 +0100
Subject: [Buildroot] [git commit] gptfdisk: add support for building and
	install cgdisk
Message-ID: <20130310213208.791AF9AFA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20a60679c463ef1ec83a870358a2114c1b9babd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition to the command-line tool gdisk and the interactive tool
sgdisk, gptfdisk also provides a ncurses based tool, cgdisk. This
commit adds support for building and installing this tool.

[Peter: Update gdisk autoselection logic to consider cgdisk as well]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gptfdisk/Config.in   |   11 ++++++++++-
 package/gptfdisk/gptfdisk.mk |    4 ++++
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index 0d7e358..28b20df 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_GPTFDISK
 	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_GPTFDISK_GDISK if !BR2_PACKAGE_GPTFDISK_SGDISK
+	select BR2_PACKAGE_GPTFDISK_GDISK if \
+	       !(BR2_PACKAGE_GPTFDISK_SGDISK || BR2_PACKAGE_GPTFDISK_CGDISK)
 	help
 	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
 	  text-mode partitioning tool that works on Globally Unique Identifier
@@ -31,5 +32,13 @@ config BR2_PACKAGE_GPTFDISK_SGDISK
 	  /usr/sbin/sgdisk which is named after the traditional MBR based
 	  sfdisk tool albeit with an entirely different option syntax.
 
+config BR2_PACKAGE_GPTFDISK_CGDISK
+	bool "ncurses cgdisk"
+	depends on BR2_PACKAGE_GPTFDISK
+	select BR2_PACKAGE_NCURSES
+	help
+	  Install the ncurses-based GUID partition table (GPT)
+	  manipulator /usr/sbin/cgdisk.
+
 comment "gptfdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled"
 	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 0478041..15ec842 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -9,11 +9,15 @@ GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 
 GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_GDISK) += gdisk
 GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_SGDISK) += sgdisk
+GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_CGDISK) += cgdisk
 
 GPTFDISK_DEPENDENCIES += util-linux
 ifeq ($(BR2_PACKAGE_GPTFDISK_SGDISK),y)
     GPTFDISK_DEPENDENCIES += popt
 endif
+ifeq ($(BR2_PACKAGE_GPTFDISK_CGDISK),y)
+    GPTFDISK_DEPENDENCIES += ncurses
+endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
     GPTFDISK_DEPENDENCIES += icu
