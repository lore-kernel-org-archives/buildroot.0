From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Jun 2020 13:43:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: Fix FTBFS with gcc10
Message-ID: <20200627114314.2391692-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bug was reported upstream:
https://sourceforge.net/p/minidlna/patches/182/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/0001-fix-gcc10-ftbfs.patch | 35 +++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/minidlna/0001-fix-gcc10-ftbfs.patch

diff --git a/package/minidlna/0001-fix-gcc10-ftbfs.patch b/package/minidlna/0001-fix-gcc10-ftbfs.patch
new file mode 100644
index 0000000000..02397890c9
--- /dev/null
+++ b/package/minidlna/0001-fix-gcc10-ftbfs.patch
@@ -0,0 +1,35 @@
+Fix FTBFS with gcc10
+
+Downloaded from
+https://sources.debian.org/src/minidlna/1.2.1+dfsg-2/debian/patches/14-fix-gcc10-ftbfs.patch/
+
+Fixes https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=957541
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/metadata.c
++++ b/metadata.c
+@@ -484,12 +484,12 @@
+ }
+ 
+ /* For libjpeg error handling */
+-jmp_buf setjmp_buffer;
++jmp_buf metadata_setjmp_buffer;
+ static void
+ libjpeg_error_handler(j_common_ptr cinfo)
+ {
+ 	cinfo->err->output_message (cinfo);
+-	longjmp(setjmp_buffer, 1);
++	longjmp(metadata_setjmp_buffer, 1);
+ 	return;
+ }
+ 
+@@ -613,7 +613,7 @@
+ 			cinfo.err = jpeg_std_error(&jerr);
+ 			jerr.error_exit = libjpeg_error_handler;
+ 			jpeg_create_decompress(&cinfo);
+-			if( setjmp(setjmp_buffer) )
++			if( setjmp(metadata_setjmp_buffer) )
+ 				goto error;
+ 			jpeg_stdio_src(&cinfo, infile);
+ 			jpeg_read_header(&cinfo, TRUE);
-- 
2.26.2
