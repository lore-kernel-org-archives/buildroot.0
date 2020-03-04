From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Mar 2020 23:21:02 +0100
Subject: [Buildroot] [PATCH 1/2] package/libsndfile: fix CVE-2018-19758
Message-ID: <20200304222103.1029879-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a heap-based buffer over-read at wav.c in wav_write_header in
libsndfile 1.0.28 that will cause a denial of service.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...004-src-wav.c-Fix-heap-read-overflow.patch | 35 +++++++++++++++++++
 package/libsndfile/libsndfile.mk              |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 package/libsndfile/0004-src-wav.c-Fix-heap-read-overflow.patch

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
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 19c3184961..7be822b875 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -20,6 +20,8 @@ LIBSNDFILE_IGNORE_CVES += \
 	CVE-2018-19661 CVE-2018-19662
 # disputed, https://github.com/erikd/libsndfile/issues/398
 LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
+# 0004-src-wav.c-Fix-heap-read-overflow.patch
+LIBSNDFILE_IGNORE_CVES += CVE-2018-19758
 
 LIBSNDFILE_CONF_OPTS = \
 	--disable-sqlite \
-- 
2.25.0
