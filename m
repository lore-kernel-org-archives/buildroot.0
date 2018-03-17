From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Mar 2018 11:43:01 +0100
Subject: [Buildroot] [git commit] libvorbis: security bump to version 1.3.6
Message-ID: <20180317104310.17EAA836C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eca03d677448000f9c5387e8359c116508e03f79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-5146: Prevent out-of-bounds write in codebook decoding.

Drop 0001-CVE-2017-14633-Don-t-allow-for-more-than-256-channel.patch and
0002-CVE-2017-14632-vorbis_analysis_header_out-Don-t-clea.patch as they are
now upstream, and add a hash for the license file while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...633-Don-t-allow-for-more-than-256-channel.patch | 36 --------------
 ...632-vorbis_analysis_header_out-Don-t-clea.patch | 56 ----------------------
 package/libvorbis/libvorbis.hash                   |  4 +-
 package/libvorbis/libvorbis.mk                     |  2 +-
 4 files changed, 4 insertions(+), 94 deletions(-)

diff --git a/package/libvorbis/0001-CVE-2017-14633-Don-t-allow-for-more-than-256-channel.patch b/package/libvorbis/0001-CVE-2017-14633-Don-t-allow-for-more-than-256-channel.patch
deleted file mode 100644
index 416aa66ddf..0000000000
--- a/package/libvorbis/0001-CVE-2017-14633-Don-t-allow-for-more-than-256-channel.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a79ec216cd119069c68b8f3542c6a425a74ab993 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
-Date: Tue, 31 Oct 2017 18:32:46 +0100
-Subject: [PATCH] CVE-2017-14633: Don't allow for more than 256 channels
-
-Otherwise
-
- for(i=0;i<vi->channels;i++){
-      /* the encoder setup assumes that all the modes used by any
-         specific bitrate tweaking use the same floor */
-      int submap=info->chmuxlist[i];
-
-overreads later in mapping0_forward since chmuxlist is a fixed array of
-256 elements max.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/info.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/info.c b/lib/info.c
-index fe759ed..7bc4ea4 100644
---- a/lib/info.c
-+++ b/lib/info.c
-@@ -588,7 +588,7 @@ int vorbis_analysis_headerout(vorbis_dsp_state *v,
-   oggpack_buffer opb;
-   private_state *b=v->backend_state;
- 
--  if(!b||vi->channels<=0){
-+  if(!b||vi->channels<=0||vi->channels>256){
-     ret=OV_EFAULT;
-     goto err_out;
-   }
--- 
-2.11.0
-
diff --git a/package/libvorbis/0002-CVE-2017-14632-vorbis_analysis_header_out-Don-t-clea.patch b/package/libvorbis/0002-CVE-2017-14632-vorbis_analysis_header_out-Don-t-clea.patch
deleted file mode 100644
index ffb4cc92f2..0000000000
--- a/package/libvorbis/0002-CVE-2017-14632-vorbis_analysis_header_out-Don-t-clea.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From c1c2831fc7306d5fbd7bc800324efd12b28d327f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
-Date: Wed, 15 Nov 2017 18:22:59 +0100
-Subject: [PATCH] CVE-2017-14632: vorbis_analysis_header_out: Don't clear opb
- if not initialized
-
-If the number of channels is not within the allowed range
-we call oggback_writeclear altough it's not initialized yet.
-
-This fixes
-
-    =23371== Invalid free() / delete / delete[] / realloc()
-    ==23371==    at 0x4C2CE1B: free (vg_replace_malloc.c:530)
-    ==23371==    by 0x829CA31: oggpack_writeclear (in /usr/lib/x86_64-linux-gnu/libogg.so.0.8.2)
-    ==23371==    by 0x84B96EE: vorbis_analysis_headerout (info.c:652)
-    ==23371==    by 0x9FBCBCC: ??? (in /usr/lib/x86_64-linux-gnu/sox/libsox_fmt_vorbis.so)
-    ==23371==    by 0x4E524F1: ??? (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
-    ==23371==    by 0x4E52CCA: sox_open_write (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
-    ==23371==    by 0x10D82A: open_output_file (sox.c:1556)
-    ==23371==    by 0x10D82A: process (sox.c:1753)
-    ==23371==    by 0x10D82A: main (sox.c:3012)
-    ==23371==  Address 0x68768c8 is 488 bytes inside a block of size 880 alloc'd
-    ==23371==    at 0x4C2BB1F: malloc (vg_replace_malloc.c:298)
-    ==23371==    by 0x4C2DE9F: realloc (vg_replace_malloc.c:785)
-    ==23371==    by 0x4E545C2: lsx_realloc (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
-    ==23371==    by 0x9FBC9A0: ??? (in /usr/lib/x86_64-linux-gnu/sox/libsox_fmt_vorbis.so)
-    ==23371==    by 0x4E524F1: ??? (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
-    ==23371==    by 0x4E52CCA: sox_open_write (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
-    ==23371==    by 0x10D82A: open_output_file (sox.c:1556)
-    ==23371==    by 0x10D82A: process (sox.c:1753)
-    ==23371==    by 0x10D82A: main (sox.c:3012)
-
-as seen when using the testcase from CVE-2017-11333 with
-008d23b782be09c8d75ba8190b1794abd66c7121 applied. However the error was
-there before.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/info.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/info.c b/lib/info.c
-index 7bc4ea4..8d0b2ed 100644
---- a/lib/info.c
-+++ b/lib/info.c
-@@ -589,6 +589,7 @@ int vorbis_analysis_headerout(vorbis_dsp_state *v,
-   private_state *b=v->backend_state;
- 
-   if(!b||vi->channels<=0||vi->channels>256){
-+    b = NULL;
-     ret=OV_EFAULT;
-     goto err_out;
-   }
--- 
-2.11.0
-
diff --git a/package/libvorbis/libvorbis.hash b/package/libvorbis/libvorbis.hash
index e990f4d74f..15bd01f22a 100644
--- a/package/libvorbis/libvorbis.hash
+++ b/package/libvorbis/libvorbis.hash
@@ -1,2 +1,4 @@
 # From http://www.xiph.org/downloads/
-sha256 54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1 libvorbis-1.3.5.tar.xz
+sha256 af00bb5a784e7c9e69f56823de4637c350643deedaf333d0fa86ecdba6fcb415 libvorbis-1.3.6.tar.xz
+# License files, locally calculated
+sha256 29e9914e6173b7061b7d48c25e6159fc1438326738bc047cc7248abc01b271f6  COPYING
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 98ec97bfd6..ae2c1efffe 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVORBIS_VERSION = 1.3.5
+LIBVORBIS_VERSION = 1.3.6
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.xz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis
 LIBVORBIS_INSTALL_STAGING = YES
