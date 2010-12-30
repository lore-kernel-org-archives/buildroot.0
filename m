From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 Dec 2010 08:45:29 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: 1.18.1 fixes for bzip2
	and cpio
Message-ID: <20101230074907.210C78EE2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bd891474cc9f15c5105124fac6f25b6adf86536f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.18.1/busybox-1.18.1-bzip2.patch      |   40 ++++++++++++++++++++
 .../busybox-1.18.1/busybox-1.18.1-cpio.patch       |   20 ++++++++++
 2 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch
 create mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch

diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch
new file mode 100644
index 0000000..cffa194
--- /dev/null
+++ b/package/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch
@@ -0,0 +1,40 @@
+diff -urpN busybox-1.18.1/archival/bzip2.c busybox-1.18.1-bzip2/archival/bzip2.c
+--- busybox-1.18.1/archival/bzip2.c	2010-12-20 01:41:26.000000000 +0100
++++ busybox-1.18.1-bzip2/archival/bzip2.c	2010-12-30 04:43:11.000000000 +0100
+@@ -128,10 +128,12 @@ IF_DESKTOP(long long) int FAST_FUNC comp
+ 			break;
+ 	}
+ 
+-#if ENABLE_FEATURE_CLEAN_UP
++	/* Can't be conditional on ENABLE_FEATURE_CLEAN_UP -
++	 * we are called repeatedly
++	 */
+ 	BZ2_bzCompressEnd(strm);
+ 	free(iobuf);
+-#endif
++
+ 	return total;
+ }
+ 
+diff -urpN busybox-1.18.1/archival/libarchive/bz/bzlib.c busybox-1.18.1-bzip2/archival/libarchive/bz/bzlib.c
+--- busybox-1.18.1/archival/libarchive/bz/bzlib.c	2010-12-20 01:41:26.000000000 +0100
++++ busybox-1.18.1-bzip2/archival/libarchive/bz/bzlib.c	2010-12-30 04:43:11.000000000 +0100
+@@ -361,7 +361,6 @@ int BZ2_bzCompress(bz_stream *strm, int 
+ 
+ 
+ /*---------------------------------------------------*/
+-#if ENABLE_FEATURE_CLEAN_UP
+ static
+ void BZ2_bzCompressEnd(bz_stream *strm)
+ {
+@@ -372,9 +371,8 @@ void BZ2_bzCompressEnd(bz_stream *strm)
+ 	free(s->arr2);
+ 	free(s->ftab);
+ 	free(s->crc32table);
+-	free(strm->state);
++	free(s);
+ }
+-#endif
+ 
+ 
+ /*---------------------------------------------------*/
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch
new file mode 100644
index 0000000..135f809
--- /dev/null
+++ b/package/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch
@@ -0,0 +1,20 @@
+diff -urpN busybox-1.18.1/archival/cpio.c busybox-1.18.1-cpio/archival/cpio.c
+--- busybox-1.18.1/archival/cpio.c	2010-12-20 01:41:26.000000000 +0100
++++ busybox-1.18.1-cpio/archival/cpio.c	2010-12-26 02:26:38.000000000 +0100
+@@ -308,16 +308,12 @@ int cpio_main(int argc UNUSED_PARAM, cha
+ 	/* -L makes sense only with -o or -p */
+ 
+ #if !ENABLE_FEATURE_CPIO_O
+-	/* no parameters */
+-	opt_complementary = "=0";
+ 	opt = getopt32(argv, OPTION_STR, &cpio_filename);
+ 	argv += optind;
+ 	if (opt & CPIO_OPT_FILE) { /* -F */
+ 		xmove_fd(xopen(cpio_filename, O_RDONLY), STDIN_FILENO);
+ 	}
+ #else
+-	/* _exactly_ one parameter for -p, thus <= 1 param if -p is allowed */
+-	opt_complementary = ENABLE_FEATURE_CPIO_P ? "?1" : "=0";
+ 	opt = getopt32(argv, OPTION_STR "oH:" IF_FEATURE_CPIO_P("p"), &cpio_filename, &cpio_fmt);
+ 	argv += optind;
+ 	if ((opt & (CPIO_OPT_FILE|CPIO_OPT_CREATE)) == CPIO_OPT_FILE) { /* -F without -o */
-- 
1.7.2.2
