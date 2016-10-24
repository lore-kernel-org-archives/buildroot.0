From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 23:43:18 +0200
Subject: [Buildroot] [git commit] Revert "firejail: new package"
Message-ID: <20161024214335.B20BC81D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63ed0574e50cea85c3cc203c7e9cc999d28ea845
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 8a5224415ceb61e5340e4dd92028b37ce57ca849. It was
kept applied by mistake.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 -
 package/firejail/Config.in     | 12 ------------
 package/firejail/firejail.hash |  2 --
 package/firejail/firejail.mk   | 24 ------------------------
 4 files changed, 39 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index be20478..9399f63 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1710,7 +1710,6 @@ menu "System tools"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
 	source "package/emlog/Config.in"
-	source "package/firejail/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
diff --git a/package/firejail/Config.in b/package/firejail/Config.in
deleted file mode 100644
index 8b5b66a..0000000
--- a/package/firejail/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_FIREJAIL
-	bool "firejail"
-	help
-	  Firejail is a SUID program that reduces the risk of security
-	  breaches by restricting the running environment of untrusted
-	  applications using Linux namespaces and seccomp-bpf. It
-	  allows a process and all its descendants to have their own
-	  private view of the globally shared kernel resources, such
-	  as the network stack, process table, mount table.
-
-	  https://firejail.wordpress.com/
-
diff --git a/package/firejail/firejail.hash b/package/firejail/firejail.hash
deleted file mode 100644
index dc2eb80..0000000
--- a/package/firejail/firejail.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://download.sourceforge.net/firejail/firejail-0.9.42.asc
-sha256 4f3bceee973b84fdf13a5d5ab0060d140ecc8e42c19c945e7fb93f0fd8499b47  firejail-0.9.42.tar.xz
diff --git a/package/firejail/firejail.mk b/package/firejail/firejail.mk
deleted file mode 100644
index ec02ea4..0000000
--- a/package/firejail/firejail.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# firejail
-#
-################################################################################
-
-FIREJAIL_VERSION = 0.9.42
-FIREJAIL_SITE = http://download.sourceforge.net/firejail
-FIREJAIL_SOURCE = firejail-$(FIREJAIL_VERSION).tar.xz
-FIREJAIL_LICENSE = GPLv2
-FIREJAIL_LICENSE_FILES = COPYING
-FIREJAIL_CONF_OPTS = \
-	--enable-bind \
-	--enable-busybox-workaround \
-	--enable-file-transfer \
-	--enable-network \
-	--enable-seccomp \
-	--enable-userns
-
-define FIREJAIL_PERMISSIONS
-	/usr/bin/firejail f 4755 0 0 - - - - -
-endef
-
-$(eval $(autotools-package))
