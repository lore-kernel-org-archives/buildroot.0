From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 08:43:28 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/faad2: add
 upstream security fixes
Message-ID: <20190707064151.C6E448A581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ffc00c6b89ffdf2f079e451165387b08ba7718c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

CVE-2018-20194: Stack buffer overflow on invalid input

CVE-2018-20362: Null pointer dereference when processing crafted AAC
input

Add two more crash fixes from upstream.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7f4dde33185f820fa37195cc9ab3bc0f4e45b9af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-check-for-syntax-element-inconsistencies.patch | 64 +++++++++++++++++++
 ...sbr_hfadj-sanitize-frequency-band-borders.patch | 71 ++++++++++++++++++++++
 .../faad2/0003-Fix-a-couple-buffer-overflows.patch | 50 +++++++++++++++
 ...h-to-prevent-crash-on-SCE-followed-by-CPE.patch | 54 ++++++++++++++++
 4 files changed, 239 insertions(+)

diff --git a/package/faad2/0001-syntax.c-check-for-syntax-element-inconsistencies.patch b/package/faad2/0001-syntax.c-check-for-syntax-element-inconsistencies.patch
new file mode 100644
index 0000000000..de97dbbaf0
--- /dev/null
+++ b/package/faad2/0001-syntax.c-check-for-syntax-element-inconsistencies.patch
@@ -0,0 +1,64 @@
+From 466b01d504d7e45f1e9169ac90b3e34ab94aed14 Mon Sep 17 00:00:00 2001
+From: Hugo Lefeuvre <hle@debian.org>
+Date: Mon, 25 Feb 2019 10:49:03 +0100
+Subject: [PATCH] syntax.c: check for syntax element inconsistencies
+
+Implicit channel mapping reconfiguration is explicitely forbidden by
+ISO/IEC 13818-7:2006 (8.5.3.3). Decoders should be able to detect such
+files and reject them. FAAD2 does not perform any kind of checks
+regarding this.
+
+This leads to security vulnerabilities when processing crafted AAC
+files performing such reconfigurations.
+
+Add checks to decode_sce_lfe and decode_cpe to make sure such
+inconsistencies are detected as early as possible.
+
+These checks first read hDecoder->frame: if this is not the first
+frame then we make sure that the syntax element at the same position
+in the previous frame also had element_id id_syn_ele. If not, return
+21 as this is a fatal file structure issue.
+
+This patch addresses CVE-2018-20362 (fixes #26) and possibly other
+related issues.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 466b01d504d7
+
+ libfaad/syntax.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/libfaad/syntax.c b/libfaad/syntax.c
+index f8e808c269c0..e7fb11381e46 100644
+--- a/libfaad/syntax.c
++++ b/libfaad/syntax.c
+@@ -344,6 +344,12 @@ static void decode_sce_lfe(NeAACDecStruct *hDecoder,
+        can become 2 when some form of Parametric Stereo coding is used
+     */
+ 
++    if (hDecoder->frame && hDecoder->element_id[hDecoder->fr_ch_ele] != id_syn_ele) {
++        /* element inconsistency */
++        hInfo->error = 21;
++        return;
++    }
++
+     /* save the syntax element id */
+     hDecoder->element_id[hDecoder->fr_ch_ele] = id_syn_ele;
+ 
+@@ -395,6 +401,12 @@ static void decode_cpe(NeAACDecStruct *hDecoder, NeAACDecFrameInfo *hInfo, bitfi
+         return;
+     }
+ 
++    if (hDecoder->frame && hDecoder->element_id[hDecoder->fr_ch_ele] != id_syn_ele) {
++        /* element inconsistency */
++        hInfo->error = 21;
++        return;
++    }
++
+     /* save the syntax element id */
+     hDecoder->element_id[hDecoder->fr_ch_ele] = id_syn_ele;
+ 
+-- 
+2.20.1
+
diff --git a/package/faad2/0002-sbr_hfadj-sanitize-frequency-band-borders.patch b/package/faad2/0002-sbr_hfadj-sanitize-frequency-band-borders.patch
new file mode 100644
index 0000000000..9c580f9339
--- /dev/null
+++ b/package/faad2/0002-sbr_hfadj-sanitize-frequency-band-borders.patch
@@ -0,0 +1,71 @@
+From 6b4a7cde30f2e2cb03e78ef476cc73179cfffda3 Mon Sep 17 00:00:00 2001
+From: Hugo Lefeuvre <hle@debian.org>
+Date: Thu, 11 Apr 2019 09:34:07 +0200
+Subject: [PATCH] sbr_hfadj: sanitize frequency band borders
+
+user passed f_table_lim contains frequency band borders. Frequency
+bands are groups of consecutive QMF channels. This means that their
+bounds, as provided by f_table_lim, should never exceed MAX_M (maximum
+number of QMF channels). c.f. ISO/IEC 14496-3:2001
+
+FAAD2 does not verify this, leading to security issues when
+processing files defining f_table_lim with values > MAX_M.
+
+This patch sanitizes the values of f_table_lim so that they can be safely
+used as index for Q_M_lim and G_lim arrays.
+
+Fixes #21 (CVE-2018-20194).
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 6b4a7cde30f2e
+
+ libfaad/sbr_hfadj.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/libfaad/sbr_hfadj.c b/libfaad/sbr_hfadj.c
+index 3f310b8190d7..dda1ce8e249b 100644
+--- a/libfaad/sbr_hfadj.c
++++ b/libfaad/sbr_hfadj.c
+@@ -485,6 +485,12 @@ static void calculate_gain(sbr_info *sbr, sbr_hfadj_info *adj, uint8_t ch)
+             ml1 = sbr->f_table_lim[sbr->bs_limiter_bands][k];
+             ml2 = sbr->f_table_lim[sbr->bs_limiter_bands][k+1];
+ 
++            if (ml1 > MAX_M)
++                ml1 = MAX_M;
++
++            if (ml2 > MAX_M)
++                ml2 = MAX_M;
++
+ 
+             /* calculate the accumulated E_orig and E_curr over the limiter band */
+             for (m = ml1; m < ml2; m++)
+@@ -949,6 +955,12 @@ static void calculate_gain(sbr_info *sbr, sbr_hfadj_info *adj, uint8_t ch)
+             ml1 = sbr->f_table_lim[sbr->bs_limiter_bands][k];
+             ml2 = sbr->f_table_lim[sbr->bs_limiter_bands][k+1];
+ 
++            if (ml1 > MAX_M)
++                ml1 = MAX_M;
++
++            if (ml2 > MAX_M)
++                ml2 = MAX_M;
++
+ 
+             /* calculate the accumulated E_orig and E_curr over the limiter band */
+             for (m = ml1; m < ml2; m++)
+@@ -1193,6 +1205,12 @@ static void calculate_gain(sbr_info *sbr, sbr_hfadj_info *adj, uint8_t ch)
+             ml1 = sbr->f_table_lim[sbr->bs_limiter_bands][k];
+             ml2 = sbr->f_table_lim[sbr->bs_limiter_bands][k+1];
+ 
++            if (ml1 > MAX_M)
++                ml1 = MAX_M;
++
++            if (ml2 > MAX_M)
++                ml2 = MAX_M;
++
+ 
+             /* calculate the accumulated E_orig and E_curr over the limiter band */
+             for (m = ml1; m < ml2; m++)
+-- 
+2.20.1
+
diff --git a/package/faad2/0003-Fix-a-couple-buffer-overflows.patch b/package/faad2/0003-Fix-a-couple-buffer-overflows.patch
new file mode 100644
index 0000000000..6ae7608771
--- /dev/null
+++ b/package/faad2/0003-Fix-a-couple-buffer-overflows.patch
@@ -0,0 +1,50 @@
+From 942c3e0aee748ea6fe97cb2c1aa5893225316174 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Mon, 10 Jun 2019 13:58:40 +0200
+Subject: [PATCH] Fix a couple buffer overflows
+
+https://hackerone.com/reports/502816
+https://hackerone.com/reports/507858
+
+https://github.com/videolan/vlc/blob/master/contrib/src/faad2/faad2-fix-overflows.patch
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 942c3e0aee748ea6
+
+ libfaad/bits.c   | 5 ++++-
+ libfaad/syntax.c | 2 ++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libfaad/bits.c b/libfaad/bits.c
+index dc14d7a03952..4c0de24a5d9c 100644
+--- a/libfaad/bits.c
++++ b/libfaad/bits.c
+@@ -167,7 +167,10 @@ void faad_resetbits(bitfile *ld, int bits)
+     int words = bits >> 5;
+     int remainder = bits & 0x1F;
+ 
+-    ld->bytes_left = ld->buffer_size - words*4;
++    if (ld->buffer_size < words * 4)
++        ld->bytes_left = 0;
++    else
++        ld->bytes_left = ld->buffer_size - words*4;
+ 
+     if (ld->bytes_left >= 4)
+     {
+diff --git a/libfaad/syntax.c b/libfaad/syntax.c
+index e7fb11381e46..c9925435dbd0 100644
+--- a/libfaad/syntax.c
++++ b/libfaad/syntax.c
+@@ -2304,6 +2304,8 @@ static uint8_t excluded_channels(bitfile *ld, drc_info *drc)
+     while ((drc->additional_excluded_chns[n-1] = faad_get1bit(ld
+         DEBUGVAR(1,104,"excluded_channels(): additional_excluded_chns"))) == 1)
+     {
++        if (i >= MAX_CHANNELS - num_excl_chan - 7)
++            return n;
+         for (i = num_excl_chan; i < num_excl_chan+7; i++)
+         {
+             drc->exclude_mask[i] = faad_get1bit(ld
+-- 
+2.20.1
+
diff --git a/package/faad2/0004-add-patch-to-prevent-crash-on-SCE-followed-by-CPE.patch b/package/faad2/0004-add-patch-to-prevent-crash-on-SCE-followed-by-CPE.patch
new file mode 100644
index 0000000000..b759b037e0
--- /dev/null
+++ b/package/faad2/0004-add-patch-to-prevent-crash-on-SCE-followed-by-CPE.patch
@@ -0,0 +1,54 @@
+From f1f8e002622196de3aa650163e5dc2888ebc7a63 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Mon, 10 Jun 2019 13:59:49 +0200
+Subject: [PATCH] add patch to prevent crash on SCE followed by CPE
+
+hDecoder->element_alloced denotes whether or not we have allocated memory for
+usage in terms of the specified channel element. Given that it previously only
+had two states (1 meaning allocated, and 0 meaning not allocated), it would not
+allocate enough memory for parsing a CPE it if is preceeded by a SCE (and
+therefor crash).
+
+These changes fixes the issue by making sure that we allocate additional memory
+if so is necessary, and the set of values for hDecoder->element_alloced[n] is
+now:
+
+ 0 = nothing allocated
+ 1 = allocated enough for SCE
+ 2 = allocated enough for CPE
+
+All branches that depend on hDecoder->element_alloced[n] prior to this patch
+only checks if the value is, or is not, zero. The added state, 2, is therefor
+correctly handled automatically.
+
+https://github.com/videolan/vlc/blob/master/contrib/src/faad2/faad2-fix-cpe-reconstruction.patch
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit f1f8e002622196d
+ libfaad/specrec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libfaad/specrec.c b/libfaad/specrec.c
+index 9797d6e79468..0e72207fc9c0 100644
+--- a/libfaad/specrec.c
++++ b/libfaad/specrec.c
+@@ -1109,13 +1109,13 @@ uint8_t reconstruct_channel_pair(NeAACDecStruct *hDecoder, ic_stream *ics1, ic_s
+ #ifdef PROFILE
+     int64_t count = faad_get_ts();
+ #endif
+-    if (hDecoder->element_alloced[hDecoder->fr_ch_ele] == 0)
++    if (hDecoder->element_alloced[hDecoder->fr_ch_ele] != 2)
+     {
+         retval = allocate_channel_pair(hDecoder, cpe->channel, (uint8_t)cpe->paired_channel);
+         if (retval > 0)
+             return retval;
+ 
+-        hDecoder->element_alloced[hDecoder->fr_ch_ele] = 1;
++        hDecoder->element_alloced[hDecoder->fr_ch_ele] = 2;
+     }
+ 
+     /* dequantisation and scaling */
+-- 
+2.20.1
+
