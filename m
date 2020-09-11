From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 22:22:46 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/minidlna: fix
 build with gcc 10
Message-ID: <20200911201727.1731C88183@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1e0848aefd21fb2313ad7b730fc9a22c442fa57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
 - http://autobuild.buildroot.org/results/8754bb4f7d749f999d5f8ddfec587470ceec4476

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9e31511d645a5665c84a4df53df0ba894456cc91)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minidlna/0001-fix-build-with-gcc-10.patch | 49 +++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/minidlna/0001-fix-build-with-gcc-10.patch b/package/minidlna/0001-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..521d17f0ca
--- /dev/null
+++ b/package/minidlna/0001-fix-build-with-gcc-10.patch
@@ -0,0 +1,49 @@
+From 90e88764f0fb3d981cd0c3cfd07d63323cc64090 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 1 Sep 2020 22:55:24 +0200
+Subject: [PATCH] fix build with gcc 10
+
+Define setjmp_buffer as static to avoid the following build failure with
+gcc 10 (which defaults to -fno-common):
+
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: image_utils.o:(.bss+0x0): multiple definition of `setjmp_buffer'; metadata.o:(.bss+0x0): first defined here
+collect2: error: ld returned 1 exit status
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8754bb4f7d749f999d5f8ddfec587470ceec4476
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ image_utils.c | 2 +-
+ metadata.c    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/image_utils.c b/image_utils.c
+index 24cfd08..e8d9635 100644
+--- a/image_utils.c
++++ b/image_utils.c
+@@ -190,7 +190,7 @@ jpeg_memory_src(j_decompress_ptr cinfo, const unsigned char * buffer, size_t buf
+ 	src->pub.bytes_in_buffer = bufsize;
+ }
+ 
+-jmp_buf setjmp_buffer;
++static jmp_buf setjmp_buffer;
+ /* Don't exit on error like libjpeg likes to do */
+ static void
+ libjpeg_error_handler(j_common_ptr cinfo)
+diff --git a/metadata.c b/metadata.c
+index 9cd86dc..4781db7 100644
+--- a/metadata.c
++++ b/metadata.c
+@@ -502,7 +502,7 @@ GetAudioMetadata(const char *path, const char *name)
+ }
+ 
+ /* For libjpeg error handling */
+-jmp_buf setjmp_buffer;
++static jmp_buf setjmp_buffer;
+ static void
+ libjpeg_error_handler(j_common_ptr cinfo)
+ {
+-- 
+2.28.0
+
