From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:26:11 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libsndfile: fix
 CVE-2018-19758
Message-ID: <20200315101351.3E36280FA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4c2c690402f41a13515c8d3c02ed6395a2cc14d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

There is a heap-based buffer over-read at wav.c in wav_write_header in
libsndfile 1.0.28 that will cause a denial of service.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 27acdca7ee5493cc5cbd7fcf272606da43cfa896)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-src-wav.c-Fix-heap-read-overflow.patch    | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libsndfile/0004-src-wav.c-Fix-heap-read-overflow.patch b/package/libsndfile/0004-src-wav.c-Fix-heap-read-overflow.patch
new file mode 100644
index 0000000000..2e730ca3fa
--- /dev/null
+++ b/package/libsndfile/0004-src-wav.c-Fix-heap-read-overflow.patch
@@ -0,0 +1,35 @@
+From 42132c543358cee9f7c3e9e9b15bb6c1063a608e Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Tue, 1 Jan 2019 20:11:46 +1100
+Subject: [PATCH] src/wav.c: Fix heap read overflow
+
+This is CVE-2018-19758.
+
+Closes: https://github.com/erikd/libsndfile/issues/435
+[Retrieved (and backported) from:
+https://github.com/erikd/libsndfile/commit/42132c543358cee9f7c3e9e9b15bb6c1063a608e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/wav.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/wav.c b/src/wav.c
+index 9d71aadb..5c825f2a 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -1,5 +1,5 @@
+ /*
+-** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
++** Copyright (C) 1999-2019 Erik de Castro Lopo <erikd@mega-nerd.com>
+ ** Copyright (C) 2004-2005 David Viens <davidv@plogue.com>
+ **
+ ** This program is free software; you can redistribute it and/or modify
+@@ -1146,6 +1146,8 @@ wav_write_header (SF_PRIVATE *psf, int calc_length)
+ 		psf_binheader_writef (psf, "44", BHW4 (0), BHW4 (0)) ; /* SMTPE format */
+ 		psf_binheader_writef (psf, "44", BHW4 (psf->instrument->loop_count), BHW4 (0)) ;
+ 
++		/* Loop count is signed 16 bit number so we limit it range to something sensible. */
++		psf->instrument->loop_count &= 0x7fff ;
+ 		for (tmp = 0 ; tmp < psf->instrument->loop_count ; tmp++)
+ 		{	int type ;
+ 
