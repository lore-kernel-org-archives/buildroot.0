From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 08:29:10 +0100
Subject: [Buildroot] [git commit] package/faad2: bump to version 2.9.1
Message-ID: <20200113072331.728928160A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e779197e2d6e875b05323bc9be735781069985f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to github to get latest release
- Remove all patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-check-for-syntax-element-inconsistencies.patch | 64 -------------------
 ...sbr_hfadj-sanitize-frequency-band-borders.patch | 71 ----------------------
 .../faad2/0003-Fix-a-couple-buffer-overflows.patch | 50 ---------------
 ...h-to-prevent-crash-on-SCE-followed-by-CPE.patch | 54 ----------------
 package/faad2/faad2.hash                           |  5 +-
 package/faad2/faad2.mk                             |  7 ++-
 6 files changed, 5 insertions(+), 246 deletions(-)

diff --git a/package/faad2/0001-syntax.c-check-for-syntax-element-inconsistencies.patch b/package/faad2/0001-syntax.c-check-for-syntax-element-inconsistencies.patch
deleted file mode 100644
index de97dbbaf0..0000000000
--- a/package/faad2/0001-syntax.c-check-for-syntax-element-inconsistencies.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 466b01d504d7e45f1e9169ac90b3e34ab94aed14 Mon Sep 17 00:00:00 2001
-From: Hugo Lefeuvre <hle@debian.org>
-Date: Mon, 25 Feb 2019 10:49:03 +0100
-Subject: [PATCH] syntax.c: check for syntax element inconsistencies
-
-Implicit channel mapping reconfiguration is explicitely forbidden by
-ISO/IEC 13818-7:2006 (8.5.3.3). Decoders should be able to detect such
-files and reject them. FAAD2 does not perform any kind of checks
-regarding this.
-
-This leads to security vulnerabilities when processing crafted AAC
-files performing such reconfigurations.
-
-Add checks to decode_sce_lfe and decode_cpe to make sure such
-inconsistencies are detected as early as possible.
-
-These checks first read hDecoder->frame: if this is not the first
-frame then we make sure that the syntax element at the same position
-in the previous frame also had element_id id_syn_ele. If not, return
-21 as this is a fatal file structure issue.
-
-This patch addresses CVE-2018-20362 (fixes #26) and possibly other
-related issues.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 466b01d504d7
-
- libfaad/syntax.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/libfaad/syntax.c b/libfaad/syntax.c
-index f8e808c269c0..e7fb11381e46 100644
---- a/libfaad/syntax.c
-+++ b/libfaad/syntax.c
-@@ -344,6 +344,12 @@ static void decode_sce_lfe(NeAACDecStruct *hDecoder,
-        can become 2 when some form of Parametric Stereo coding is used
-     */
- 
-+    if (hDecoder->frame && hDecoder->element_id[hDecoder->fr_ch_ele] != id_syn_ele) {
-+        /* element inconsistency */
-+        hInfo->error = 21;
-+        return;
-+    }
-+
-     /* save the syntax element id */
-     hDecoder->element_id[hDecoder->fr_ch_ele] = id_syn_ele;
- 
-@@ -395,6 +401,12 @@ static void decode_cpe(NeAACDecStruct *hDecoder, NeAACDecFrameInfo *hInfo, bitfi
-         return;
-     }
- 
-+    if (hDecoder->frame && hDecoder->element_id[hDecoder->fr_ch_ele] != id_syn_ele) {
-+        /* element inconsistency */
-+        hInfo->error = 21;
-+        return;
-+    }
-+
-     /* save the syntax element id */
-     hDecoder->element_id[hDecoder->fr_ch_ele] = id_syn_ele;
- 
--- 
-2.20.1
-
diff --git a/package/faad2/0002-sbr_hfadj-sanitize-frequency-band-borders.patch b/package/faad2/0002-sbr_hfadj-sanitize-frequency-band-borders.patch
deleted file mode 100644
index 9c580f9339..0000000000
--- a/package/faad2/0002-sbr_hfadj-sanitize-frequency-band-borders.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 6b4a7cde30f2e2cb03e78ef476cc73179cfffda3 Mon Sep 17 00:00:00 2001
-From: Hugo Lefeuvre <hle@debian.org>
-Date: Thu, 11 Apr 2019 09:34:07 +0200
-Subject: [PATCH] sbr_hfadj: sanitize frequency band borders
-
-user passed f_table_lim contains frequency band borders. Frequency
-bands are groups of consecutive QMF channels. This means that their
-bounds, as provided by f_table_lim, should never exceed MAX_M (maximum
-number of QMF channels). c.f. ISO/IEC 14496-3:2001
-
-FAAD2 does not verify this, leading to security issues when
-processing files defining f_table_lim with values > MAX_M.
-
-This patch sanitizes the values of f_table_lim so that they can be safely
-used as index for Q_M_lim and G_lim arrays.
-
-Fixes #21 (CVE-2018-20194).
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 6b4a7cde30f2e
-
- libfaad/sbr_hfadj.c | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/libfaad/sbr_hfadj.c b/libfaad/sbr_hfadj.c
-index 3f310b8190d7..dda1ce8e249b 100644
---- a/libfaad/sbr_hfadj.c
-+++ b/libfaad/sbr_hfadj.c
-@@ -485,6 +485,12 @@ static void calculate_gain(sbr_info *sbr, sbr_hfadj_info *adj, uint8_t ch)
-             ml1 = sbr->f_table_lim[sbr->bs_limiter_bands][k];
-             ml2 = sbr->f_table_lim[sbr->bs_limiter_bands][k+1];
- 
-+            if (ml1 > MAX_M)
-+                ml1 = MAX_M;
-+
-+            if (ml2 > MAX_M)
-+                ml2 = MAX_M;
-+
- 
-             /* calculate the accumulated E_orig and E_curr over the limiter band */
-             for (m = ml1; m < ml2; m++)
-@@ -949,6 +955,12 @@ static void calculate_gain(sbr_info *sbr, sbr_hfadj_info *adj, uint8_t ch)
-             ml1 = sbr->f_table_lim[sbr->bs_limiter_bands][k];
-             ml2 = sbr->f_table_lim[sbr->bs_limiter_bands][k+1];
- 
-+            if (ml1 > MAX_M)
-+                ml1 = MAX_M;
-+
-+            if (ml2 > MAX_M)
-+                ml2 = MAX_M;
-+
- 
-             /* calculate the accumulated E_orig and E_curr over the limiter band */
-             for (m = ml1; m < ml2; m++)
-@@ -1193,6 +1205,12 @@ static void calculate_gain(sbr_info *sbr, sbr_hfadj_info *adj, uint8_t ch)
-             ml1 = sbr->f_table_lim[sbr->bs_limiter_bands][k];
-             ml2 = sbr->f_table_lim[sbr->bs_limiter_bands][k+1];
- 
-+            if (ml1 > MAX_M)
-+                ml1 = MAX_M;
-+
-+            if (ml2 > MAX_M)
-+                ml2 = MAX_M;
-+
- 
-             /* calculate the accumulated E_orig and E_curr over the limiter band */
-             for (m = ml1; m < ml2; m++)
--- 
-2.20.1
-
diff --git a/package/faad2/0003-Fix-a-couple-buffer-overflows.patch b/package/faad2/0003-Fix-a-couple-buffer-overflows.patch
deleted file mode 100644
index 6ae7608771..0000000000
--- a/package/faad2/0003-Fix-a-couple-buffer-overflows.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 942c3e0aee748ea6fe97cb2c1aa5893225316174 Mon Sep 17 00:00:00 2001
-From: Fabian Greffrath <fabian@greffrath.com>
-Date: Mon, 10 Jun 2019 13:58:40 +0200
-Subject: [PATCH] Fix a couple buffer overflows
-
-https://hackerone.com/reports/502816
-https://hackerone.com/reports/507858
-
-https://github.com/videolan/vlc/blob/master/contrib/src/faad2/faad2-fix-overflows.patch
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 942c3e0aee748ea6
-
- libfaad/bits.c   | 5 ++++-
- libfaad/syntax.c | 2 ++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/libfaad/bits.c b/libfaad/bits.c
-index dc14d7a03952..4c0de24a5d9c 100644
---- a/libfaad/bits.c
-+++ b/libfaad/bits.c
-@@ -167,7 +167,10 @@ void faad_resetbits(bitfile *ld, int bits)
-     int words = bits >> 5;
-     int remainder = bits & 0x1F;
- 
--    ld->bytes_left = ld->buffer_size - words*4;
-+    if (ld->buffer_size < words * 4)
-+        ld->bytes_left = 0;
-+    else
-+        ld->bytes_left = ld->buffer_size - words*4;
- 
-     if (ld->bytes_left >= 4)
-     {
-diff --git a/libfaad/syntax.c b/libfaad/syntax.c
-index e7fb11381e46..c9925435dbd0 100644
---- a/libfaad/syntax.c
-+++ b/libfaad/syntax.c
-@@ -2304,6 +2304,8 @@ static uint8_t excluded_channels(bitfile *ld, drc_info *drc)
-     while ((drc->additional_excluded_chns[n-1] = faad_get1bit(ld
-         DEBUGVAR(1,104,"excluded_channels(): additional_excluded_chns"))) == 1)
-     {
-+        if (i >= MAX_CHANNELS - num_excl_chan - 7)
-+            return n;
-         for (i = num_excl_chan; i < num_excl_chan+7; i++)
-         {
-             drc->exclude_mask[i] = faad_get1bit(ld
--- 
-2.20.1
-
diff --git a/package/faad2/0004-add-patch-to-prevent-crash-on-SCE-followed-by-CPE.patch b/package/faad2/0004-add-patch-to-prevent-crash-on-SCE-followed-by-CPE.patch
deleted file mode 100644
index b759b037e0..0000000000
--- a/package/faad2/0004-add-patch-to-prevent-crash-on-SCE-followed-by-CPE.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From f1f8e002622196de3aa650163e5dc2888ebc7a63 Mon Sep 17 00:00:00 2001
-From: Fabian Greffrath <fabian@greffrath.com>
-Date: Mon, 10 Jun 2019 13:59:49 +0200
-Subject: [PATCH] add patch to prevent crash on SCE followed by CPE
-
-hDecoder->element_alloced denotes whether or not we have allocated memory for
-usage in terms of the specified channel element. Given that it previously only
-had two states (1 meaning allocated, and 0 meaning not allocated), it would not
-allocate enough memory for parsing a CPE it if is preceeded by a SCE (and
-therefor crash).
-
-These changes fixes the issue by making sure that we allocate additional memory
-if so is necessary, and the set of values for hDecoder->element_alloced[n] is
-now:
-
- 0 = nothing allocated
- 1 = allocated enough for SCE
- 2 = allocated enough for CPE
-
-All branches that depend on hDecoder->element_alloced[n] prior to this patch
-only checks if the value is, or is not, zero. The added state, 2, is therefor
-correctly handled automatically.
-
-https://github.com/videolan/vlc/blob/master/contrib/src/faad2/faad2-fix-cpe-reconstruction.patch
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit f1f8e002622196d
- libfaad/specrec.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libfaad/specrec.c b/libfaad/specrec.c
-index 9797d6e79468..0e72207fc9c0 100644
---- a/libfaad/specrec.c
-+++ b/libfaad/specrec.c
-@@ -1109,13 +1109,13 @@ uint8_t reconstruct_channel_pair(NeAACDecStruct *hDecoder, ic_stream *ics1, ic_s
- #ifdef PROFILE
-     int64_t count = faad_get_ts();
- #endif
--    if (hDecoder->element_alloced[hDecoder->fr_ch_ele] == 0)
-+    if (hDecoder->element_alloced[hDecoder->fr_ch_ele] != 2)
-     {
-         retval = allocate_channel_pair(hDecoder, cpe->channel, (uint8_t)cpe->paired_channel);
-         if (retval > 0)
-             return retval;
- 
--        hDecoder->element_alloced[hDecoder->fr_ch_ele] = 1;
-+        hDecoder->element_alloced[hDecoder->fr_ch_ele] = 2;
-     }
- 
-     /* dequantisation and scaling */
--- 
-2.20.1
-
diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
index 2c6acee3d7..1a03bc9b7b 100644
--- a/package/faad2/faad2.hash
+++ b/package/faad2/faad2.hash
@@ -1,6 +1,3 @@
-# From http://sourceforge.net/projects/faac/files/faad2-src/faad2-2.8.0/ (used by upstream):
-md5	28f6116efdbe9378269f8a6221767d1f  faad2-2.8.8.tar.gz
-sha1	0d49c516d4a83c39053a9bd214fddba72cbc34ad  faad2-2.8.8.tar.gz
 # Locally computed
-sha256  985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d  faad2-2.8.8.tar.gz
+sha256  7fa33cff76abdda5a220ca5de0b2e05a77354f3b97f735193c2940224898aa9a  faad2-2.9.1.tar.gz
 sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 27daadfc12..9ec9d8f52c 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-FAAD2_VERSION_MAJOR = 2.8
-FAAD2_VERSION = $(FAAD2_VERSION_MAJOR).8
-FAAD2_SITE = http://downloads.sourceforge.net/project/faac/faad2-src/faad2-$(FAAD2_VERSION_MAJOR).0
+FAAD2_VERSION = 2.9.1
+FAAD2_SITE = $(call github,knik0,faad2,$(subst .,_,$(FAAD2_VERSION)))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
 # frontend/faad calls frexp()
 FAAD2_CONF_ENV = LIBS=-lm
 FAAD2_INSTALL_STAGING = YES
+# From git
+FAAD2_AUTORECONF = YES
 
 $(eval $(autotools-package))
