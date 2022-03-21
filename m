Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DDEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 13:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8509414CE;
	Mon, 21 Mar 2022 13:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NN_hojEMUFhM; Mon, 21 Mar 2022 13:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE1D14136B;
	Mon, 21 Mar 2022 13:09:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57FB01BF282
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 13:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 522D840227
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 13:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mvNLOIFxYYbd for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 13:09:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FE364018A
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 13:09:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9C28B847BB; Mon, 21 Mar 2022 13:00:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 13:59:56 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c1c068c11aa05aef561bbcc3b00abb5d5a43bcca
X-Git-Newrev: 79f90ac0d352001d36053e7ac3e8a1936a9daab9
X-Patchwork-Hint: ignore
Message-Id: <20220321130035.9C28B847BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/wavpack: fix
 CVE-2021-44269
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=79f90ac0d352001d36053e7ac3e8a1936a9daab9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

An out of bounds read was found in Wavpack 5.4.0 in processing *.WAV
files. This issue triggered in function WavpackPackSamples of file
src/pack_utils.c, tainted variable cnt is too large, that makes pointer
sptr read beyond heap bound.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a9bff8a0b0f68f070a5ae0e94cbffefb9b455b26)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nitize-DSD-file-types-for-invalid-lengths.patch | 42 ++++++++++++++++++++++
 package/wavpack/wavpack.mk                         |  3 ++
 2 files changed, 45 insertions(+)

diff --git a/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch b/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
new file mode 100644
index 0000000000..76c1e81674
--- /dev/null
+++ b/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
@@ -0,0 +1,42 @@
+From 773f9d0803c6888ae7d5391878d7337f24216f4a Mon Sep 17 00:00:00 2001
+From: David Bryant <david@wavpack.com>
+Date: Tue, 23 Nov 2021 13:14:35 -0800
+Subject: [PATCH] issue #110: sanitize DSD file types for invalid lengths
+
+[Retrieved from:
+https://github.com/dbry/WavPack/commit/773f9d0803c6888ae7d5391878d7337f24216f4a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ cli/dsdiff.c | 6 ++++++
+ cli/dsf.c    | 1 +
+ 2 files changed, 7 insertions(+)
+
+diff --git a/cli/dsdiff.c b/cli/dsdiff.c
+index d7adb6a..5bdcae3 100644
+--- a/cli/dsdiff.c
++++ b/cli/dsdiff.c
+@@ -278,6 +278,12 @@ int ParseDsdiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
+             }
+ 
+             total_samples = dff_chunk_header.ckDataSize / config->num_channels;
++
++            if (total_samples <= 0 || total_samples > MAX_WAVPACK_SAMPLES) {
++                error_line ("%s is not a valid .DFF file!", infilename);
++                return WAVPACK_SOFT_ERROR;
++            }
++
+             break;
+         }
+         else {          // just copy unknown chunks to output file
+diff --git a/cli/dsf.c b/cli/dsf.c
+index e1d7973..dddd488 100644
+--- a/cli/dsf.c
++++ b/cli/dsf.c
+@@ -113,6 +113,7 @@ int ParseDsfHeaderConfig (FILE *infile, char *infilename, char *fourcc, WavpackC
+ 
+     if (format_chunk.ckSize != sizeof (DSFFormatChunk) || format_chunk.formatVersion != 1 ||
+         format_chunk.formatID != 0 || format_chunk.blockSize != DSF_BLOCKSIZE || format_chunk.reserved ||
++        format_chunk.sampleCount <= 0 || format_chunk.sampleCount > MAX_WAVPACK_SAMPLES * 8 ||
+         (format_chunk.bitsPerSample != 1 && format_chunk.bitsPerSample != 8) ||
+         format_chunk.numChannels < 1 || format_chunk.numChannels > 6 ||
+         format_chunk.chanType < 1 || format_chunk.chanType > NUM_CHAN_TYPES) {
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index 485ab9b2ae..2e0438ac80 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -14,6 +14,9 @@ WAVPACK_LICENSE = BSD-3-Clause
 WAVPACK_LICENSE_FILES = COPYING
 WAVPACK_CPE_ID_VENDOR = wavpack
 
+# 0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
+WAVPACK_IGNORE_CVES += CVE-2021-44269
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WAVPACK_CONF_OPTS += LIBS=-liconv
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
