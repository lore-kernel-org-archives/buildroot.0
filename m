From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:45:29 +0100
Subject: [Buildroot] [PATCH v2 7/8] gptfdisk: add support for building and
	install cgdisk
In-Reply-To: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362689131-1479-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition to the command-line tool gdisk and the interactive tool
sgdisk, gptfdisk also provides a ncurses based tool, cgdisk. This
commit adds support for building and installing this tool.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gptfdisk/Config.in   |    8 ++++++++
 package/gptfdisk/gptfdisk.mk |    4 ++++
 2 files changed, 12 insertions(+)

diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index 0d7e358..1cdd8eb 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -31,5 +31,13 @@ config BR2_PACKAGE_GPTFDISK_SGDISK
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
index 884edf4..63010d8 100644
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
-- 
1.7.9.5
