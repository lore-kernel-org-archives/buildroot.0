From: Fabio Estevam <festevam@gmail.com>
Date: Tue,  6 Jul 2021 19:59:46 -0300
Subject: [Buildroot] [PATCH] package/swupdate: bump to version 2021.04
Message-ID: <20210706225946.38252-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 2021.04:
https://github.com/sbabic/swupdate/releases/tag/2021.04

Regenerated swupdate.config by doing:

make swupdate-menuconfig
make swupdate-update-config

Remove the two patches as they have already been upstreamed.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 ...rce-kernel-to-reread-partition-table.patch | 32 ------------
 ...-Shellscript-stops-before-completing.patch | 52 -------------------
 package/swupdate/swupdate.config              | 25 ++++-----
 package/swupdate/swupdate.hash                |  2 +-
 package/swupdate/swupdate.mk                  |  2 +-
 5 files changed, 15 insertions(+), 98 deletions(-)
 delete mode 100644 package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch
 delete mode 100644 package/swupdate/0002-Shellscript-stops-before-completing.patch

diff --git a/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch b/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch
deleted file mode 100644
index 5964d1b96f89..000000000000
--- a/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 305a7a5a74a612801d9df2b2efc86dd952b8c4e7 Mon Sep 17 00:00:00 2001
-From: Stefano Babic <sbabic@denx.de>
-Date: Tue, 9 Jun 2020 13:58:06 +0000
-Subject: [PATCH] diskpart: force kernel to reread partition table
-
-After writing a partition table to disk, the kernel should be informed
-(like the partconf tool does), else it is not possible to install images
-in the new created partitions.
-
-Signed-off-by: Stefano Babic <sbabic@denx.de>
-Signed-off-by: Joris Offouga <offougajoris@gmail.com>
----
- handlers/diskpart_handler.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/handlers/diskpart_handler.c b/handlers/diskpart_handler.c
-index 16adc17..372412b 100644
---- a/handlers/diskpart_handler.c
-+++ b/handlers/diskpart_handler.c
-@@ -273,7 +273,8 @@ static int diskpart(struct img_type *img,
- 	/*
- 	 * Everything done, write into disk
- 	 */
--	ret = fdisk_write_disklabel(cxt);
-+	ret = fdisk_write_disklabel(cxt) |
-+		fdisk_reread_partition_table(cxt);
- 
- handler_exit:
- 	if (fdisk_deassign_device(cxt, 0))
--- 
-2.25.1
-
diff --git a/package/swupdate/0002-Shellscript-stops-before-completing.patch b/package/swupdate/0002-Shellscript-stops-before-completing.patch
deleted file mode 100644
index d91438893b2c..000000000000
--- a/package/swupdate/0002-Shellscript-stops-before-completing.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From bd08e45d7b25f06da2fc6dc824146b471db5f1f4 Mon Sep 17 00:00:00 2001
-From: Stefano Babic <sbabic@denx.de>
-Date: Tue, 16 Jun 2020 10:29:55 +0200
-Subject: [PATCH] Shellscript stops before completing
-
-Commit 8fb94d7 reworks the way shell script are called, redirecting
-stdout and stderr to SWUpdate. A shell script runs then in a child
-process. Under some circumstances, SWUpdate closes the forked process
-before the child process completes.
-
-Be sure that the child process has terminated before to go on.
-
-Signed-off-by: Stefano Babic <sbabic@denx.de>
-Reported-by: Piotr Piwko <piotr.piwko@gmail.com>
-Tested-by: Piotr Piwko <piotr.piwko@gmail.com>
-Signed-off-by: Joris Offouga <offougajoris@gmail.com>
----
- core/pctl.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/core/pctl.c b/core/pctl.c
-index 8b1c667..01ad540 100644
---- a/core/pctl.c
-+++ b/core/pctl.c
-@@ -263,6 +263,7 @@ int run_system_cmd(const char *cmd)
- 		}
- 	} else {
- 		int fds[2];
-+		pid_t w;
- 
- 		close(stdoutpipe[PIPE_WRITE]);
- 		close(stderrpipe[PIPE_WRITE]);
-@@ -276,7 +277,6 @@ int run_system_cmd(const char *cmd)
- 		 * and from stderr (of the child process) as ERROR
- 		 */
- 		do {
--			pid_t w;
- 			int n1 = 0;
- 			struct timeval tv;
- 			fd_set readfds;
-@@ -373,7 +373,7 @@ int run_system_cmd(const char *cmd)
- 					}
- 				}
- 			} while (ret > 0 && n1 > 0);
--		} while (!WIFEXITED(wstatus));
-+		} while (w != process_id);
- 
- 		close(stdoutpipe[PIPE_READ]);
- 		close(stderrpipe[PIPE_READ]);
--- 
-2.25.1
-
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index a6b7a749483d..edbbace8879d 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -2,7 +2,6 @@
 # Automatically generated file; DO NOT EDIT.
 # Swupdate Configuration
 #
-CONFIG_HAVE_DOT_CONFIG=y
 
 #
 # Swupdate Settings
@@ -24,7 +23,6 @@ CONFIG_SW_VERSIONS_FILE="/etc/sw-versions"
 #
 CONFIG_SOCKET_CTRL_PATH="/tmp/sockinstctrl"
 CONFIG_SOCKET_PROGRESS_PATH="/tmp/swupdateprog"
-CONFIG_SOCKET_REMOTE_HANDLER_DIRECTORY="/tmp/"
 
 #
 # MTD support needs libmtd
@@ -54,13 +52,16 @@ CONFIG_EXTRA_LDLIBS=""
 #
 # EFI Boot Guard needs libebgenv and libz
 #
-CONFIG_BOOTLOADER_NONE=y
-# CONFIG_BOOTLOADER_GRUB is not set
 
 #
-# U-Boot support needs libubootenv, libz
+# U-Boot support needs libubootenv and libz
 #
+CONFIG_BOOTLOADER_NONE=y
+# CONFIG_BOOTLOADER_GRUB is not set
+CONFIG_UPDATE_STATE_CHOICE_NONE=y
+# CONFIG_UPDATE_STATE_CHOICE_BOOTLOADER is not set
 CONFIG_SSL_IMPL_NONE=y
+# CONFIG_SSL_IMPL_WOLFSSL is not set
 
 #
 # Image downloading support needs libcurl
@@ -77,7 +78,10 @@ CONFIG_SSL_IMPL_NONE=y
 #
 # Image encryption needs an SSL implementation
 #
-# CONFIG_SURICATTA is not set
+
+#
+# Suricatta daemon support needs libcurl
+#
 CONFIG_WEBSERVER=y
 CONFIG_MONGOOSE=y
 CONFIG_MONGOOSEIPV6=y
@@ -105,6 +109,7 @@ CONFIG_PARSERROOT=""
 # ubivol support needs libubi
 #
 # CONFIG_DISKPART is not set
+# CONFIG_UNIQUEUUID is not set
 CONFIG_RAW=y
 # CONFIG_RDIFFHANDLER is not set
 # CONFIG_SHELLSCRIPTHANDLER is not set
@@ -118,15 +123,11 @@ CONFIG_RAW=y
 #
 
 #
-# swuforward handler needs json-c and curl
-#
-
-#
-# SWU forwarder requires libcurl
+# swuforward handler needs json-c and libcurl
 #
 
 #
-# swuforward handler needs json-c and curl
+# swuforward handler needs websockets and uriparser
 #
 # CONFIG_BOOTLOADERHANDLER is not set
 
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 40f978d2257a..3a0852d39b31 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  132df2ff1ad41c7aabd0fbef6a23d28607cbd5cad52aab050c4822977a107486  swupdate-2020.04.tar.gz
+sha256  5afe78ae94e869bcb911d8592251641cdab80096d8e5149d483054ea49f9aab8  swupdate-2021.04.tar.gz
 sha256  43492b377cf2fb67942d1dd231146bd4e6578646ad13ef289297c9dd75cbc478  Licenses/Exceptions
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index d96a0c2e07ea..cbb3c18ec254 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2020.04
+SWUPDATE_VERSION = 2021.04
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0+ with OpenSSL exception, LGPL-2.1+, MIT
 SWUPDATE_LICENSE_FILES = Licenses/Exceptions Licenses/gpl-2.0.txt \
-- 
2.25.1
