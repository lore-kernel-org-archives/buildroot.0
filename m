From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Mar 2020 16:42:47 +0100
Subject: [Buildroot] [git commit] package/libsndfile: fix CVE-2019-3832
Message-ID: <20200305153448.2CA848F3D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3426b37ebb2e8eee94375f58ea63992f0651cbb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was discovered the fix for CVE-2018-19758 (libsndfile) was not
complete and still allows a read beyond the limits of a buffer in
wav_write_header() function in wav.c. A local attacker may use this flaw
to make the application crash.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rite_header-don-t-read-past-the-array-end.patch | 33 ++++++++++++++++++++++
 package/libsndfile/libsndfile.mk                   |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/package/libsndfile/0005-wav_write_header-don-t-read-past-the-array-end.patch b/package/libsndfile/0005-wav_write_header-don-t-read-past-the-array-end.patch
new file mode 100644
index 0000000000..e958517808
--- /dev/null
+++ b/package/libsndfile/0005-wav_write_header-don-t-read-past-the-array-end.patch
@@ -0,0 +1,33 @@
+From 6d7ce94c020cc720a6b28719d1a7879181790008 Mon Sep 17 00:00:00 2001
+From: Emilio Pozuelo Monfort <pochu27@gmail.com>
+Date: Tue, 5 Mar 2019 11:27:17 +0100
+Subject: [PATCH] wav_write_header: don't read past the array end
+
+If loop_count is bigger than the array, truncate it to the array
+length (and not to 32k).
+
+CVE-2019-3832
+[Retrieved from:
+https://github.com/erikd/libsndfile/commit/6d7ce94c020cc720a6b28719d1a7879181790008]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/wav.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/wav.c b/src/wav.c
+index 5c825f2a..104bd0a7 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -1146,8 +1146,10 @@ wav_write_header (SF_PRIVATE *psf, int calc_length)
+ 		psf_binheader_writef (psf, "44", BHW4 (0), BHW4 (0)) ; /* SMTPE format */
+ 		psf_binheader_writef (psf, "44", BHW4 (psf->instrument->loop_count), BHW4 (0)) ;
+ 
+-		/* Loop count is signed 16 bit number so we limit it range to something sensible. */
+-		psf->instrument->loop_count &= 0x7fff ;
++		/* Make sure we don't read past the loops array end. */
++		if (psf->instrument->loop_count > ARRAY_LEN (psf->instrument->loops))
++			psf->instrument->loop_count = ARRAY_LEN (psf->instrument->loops) ;
++
+ 		for (tmp = 0 ; tmp < psf->instrument->loop_count ; tmp++)
+ 		{	int type ;
+ 
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 7be822b875..63d9a521e6 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -22,6 +22,8 @@ LIBSNDFILE_IGNORE_CVES += \
 LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
 # 0004-src-wav.c-Fix-heap-read-overflow.patch
 LIBSNDFILE_IGNORE_CVES += CVE-2018-19758
+# 0005-wav_write_header-don-t-read-past-the-array-end.patch
+LIBSNDFILE_IGNORE_CVES += CVE-2019-3832
 
 LIBSNDFILE_CONF_OPTS = \
 	--disable-sqlite \
