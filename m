From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Feb 2012 10:51:12 +0100
Subject: [Buildroot] [git commit] busybox: bump 1.19.x stable version
Message-ID: <20120214095225.B256990A9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a7bd4b87390d63532b8cce619d6ed1b00b47128
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Identical to 1.19.3 + patches.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                          |    2 +-
 .../busybox-1.19.3/busybox-1.19.3-getty.patch      |   12 --------
 .../busybox-1.19.3/busybox-1.19.3-mdev.patch       |   11 -------
 .../busybox-1.19.3/busybox-1.19.3-modinfo.patch    |   10 -------
 .../busybox-1.19.3/busybox-1.19.3-wget.patch       |   29 --------------------
 5 files changed, 1 insertions(+), 63 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 4176020..c206509 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -41,7 +41,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.16.2"	if BR2_BUSYBOX_VERSION_1_16_X
 	default "1.17.4"	if BR2_BUSYBOX_VERSION_1_17_X
 	default "1.18.5"	if BR2_BUSYBOX_VERSION_1_18_X
-	default "1.19.3"	if BR2_BUSYBOX_VERSION_1_19_X
+	default "1.19.4"	if BR2_BUSYBOX_VERSION_1_19_X
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
diff --git a/package/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch b/package/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
deleted file mode 100644
index 84dad6f..0000000
--- a/package/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- busybox-1.19.3/loginutils/getty.c
-+++ busybox-1.19.3-getty/loginutils/getty.c
-@@ -271,7 +271,9 @@ static void termios_init(int speed)
- #ifdef CMSPAR
- 		| CMSPAR  /* mark or space parity */
- #endif
-+#ifdef CBAUD
- 		| CBAUD   /* (output) baud rate */
-+#endif
- #ifdef CBAUDEX
- 		| CBAUDEX /* (output) baud rate */
- #endif
diff --git a/package/busybox/busybox-1.19.3/busybox-1.19.3-mdev.patch b/package/busybox/busybox-1.19.3/busybox-1.19.3-mdev.patch
deleted file mode 100644
index 653ac35..0000000
--- a/package/busybox/busybox-1.19.3/busybox-1.19.3-mdev.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- busybox-1.19.3/util-linux/mdev.c
-+++ busybox-1.19.3-mdev/util-linux/mdev.c
-@@ -610,7 +610,7 @@ int mdev_main(int argc UNUSED_PARAM, cha
- 				int seqlen;
- 				char seqbuf[sizeof(int)*3 + 2];
- 
--				seqlen = open_read_close("mdev.seq", seqbuf, sizeof(seqbuf-1));
-+				seqlen = open_read_close("mdev.seq", seqbuf, sizeof(seqbuf) - 1);
- 				if (seqlen < 0) {
- 					seq = NULL;
- 					break;
diff --git a/package/busybox/busybox-1.19.3/busybox-1.19.3-modinfo.patch b/package/busybox/busybox-1.19.3/busybox-1.19.3-modinfo.patch
deleted file mode 100644
index 9dd5c10..0000000
--- a/package/busybox/busybox-1.19.3/busybox-1.19.3-modinfo.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- busybox-1.19.3/modutils/modinfo.c
-+++ busybox-1.19.3-modinfo/modutils/modinfo.c
-@@ -13,6 +13,7 @@
- //config:config MODINFO
- //config:	bool "modinfo"
- //config:	default y
-+//config:	select PLATFORM_LINUX
- //config:	help
- //config:	  Show information about a Linux Kernel module
- 
diff --git a/package/busybox/busybox-1.19.3/busybox-1.19.3-wget.patch b/package/busybox/busybox-1.19.3/busybox-1.19.3-wget.patch
deleted file mode 100644
index e98a506..0000000
--- a/package/busybox/busybox-1.19.3/busybox-1.19.3-wget.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- busybox-1.19.3/networking/wget.c
-+++ busybox-1.19.3-wget/networking/wget.c
-@@ -552,6 +552,7 @@ static void download_one_url(const char 
- 	FILE *dfp;                      /* socket to ftp server (data)      */
- 	char *proxy = NULL;
- 	char *fname_out_alloc;
-+	char *redirected_path = NULL;
- 	struct host_info server;
- 	struct host_info target;
- 
-@@ -794,8 +795,8 @@ However, in real world it was observed t
- 					bb_error_msg_and_die("too many redirections");
- 				fclose(sfp);
- 				if (str[0] == '/') {
--					free(target.allocated);
--					target.path = target.allocated = xstrdup(str+1);
-+					free(redirected_path);
-+					target.path = redirected_path = xstrdup(str+1);
- 					/* lsa stays the same: it's on the same server */
- 				} else {
- 					parse_url(str, &target);
-@@ -850,6 +851,7 @@ However, in real world it was observed t
- 	free(server.allocated);
- 	free(target.allocated);
- 	free(fname_out_alloc);
-+	free(redirected_path);
- }
- 
- int wget_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
