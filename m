Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE8DC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 22:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FB674206A;
	Mon,  8 Jan 2024 22:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FB674206A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id isNzrnM-PLPN; Mon,  8 Jan 2024 22:07:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D5BC42068;
	Mon,  8 Jan 2024 22:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D5BC42068
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0A71BF421
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25939419BC
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25939419BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgybdpOiSHoD for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 22:07:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4796419B6
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 22:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4796419B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DD5084C78; Mon,  8 Jan 2024 22:07:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 Jan 2024 22:56:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30cc84d8994964883c9bd3ff002a1764e78c2521
X-Git-Newrev: 620bd7220a6e30eb8bdcc346a4584783d45953e1
X-Patchwork-Hint: ignore
Message-Id: <20240108220724.9DD5084C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liquid-dsp: fix x86 builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=620bd7220a6e30eb8bdcc346a4584783d45953e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HAVE_{MMX,SSE2,...} are not defined if ax_cv_have_{i}_cpu_ext is not set
resulting in the following build failure raised since bump to version
1.5.0 in commit c2aaa0fbe2fdf6e599c68169aa7b2e55237190c7 and
https://github.com/jgaeddert/liquid-dsp/commit/02c4e8b99b11d9f1615b8840f243b08a85b86563:

src/dotprod/src/dotprod_cccf.sse.c: In function 'dotprod_cccf_execute_sse':
src/dotprod/src/dotprod_cccf.sse.c:258:5: error: unknown type name '__m128'; did you mean '__int128'?
  258 |     __m128 v;   // input vector
      |     ^~~~~~
      |     __int128

or

src/dotprod/src/dotprod_cccf.mmx.c: In function 'dotprod_cccf_execute_mmx':
src/dotprod/src/dotprod_cccf.mmx.c:262:5: error: unknown type name '__m128'; did you mean '__int128'?
  262 |     __m128 v;   // input vector
      |     ^~~~~~
      |     __int128

While at it, add AVX2 support

Fixes:
 - http://autobuild.buildroot.org/results/738ce9d3dc74ec165391f21256c955e5524f1632
 - http://autobuild.buildroot.org/results/a2d150c724ab6787aeabaf31f65116f802e8584e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/liquid-dsp/liquid-dsp.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index eb4cda67a5..ce4cd5a7a7 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -13,13 +13,23 @@ LIQUID_DSP_AUTORECONF = YES
 
 LIQUID_DSP_CONF_ENV = \
 	ax_cv_have_mmx_ext=$(if $(BR2_X86_CPU_HAS_MMX),yes,no) \
+	ax_cv_have_mmx_cpu_ext=$(if $(BR2_X86_CPU_HAS_MMX),yes,no) \
 	ax_cv_have_sse_ext=$(if $(BR2_X86_CPU_HAS_SSE),yes,no) \
+	ax_cv_have_sse_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE),yes,no) \
 	ax_cv_have_sse2_ext=$(if $(BR2_X86_CPU_HAS_SSE2),yes,no) \
+	ax_cv_have_sse2_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE2),yes,no) \
 	ax_cv_have_sse3_ext=$(if $(BR2_X86_CPU_HAS_SSE3),yes,no) \
+	ax_cv_have_sse3_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE3),yes,no) \
 	ax_cv_have_ssse3_ext=$(if $(BR2_X86_CPU_HAS_SSSE3),yes,no) \
+	ax_cv_have_ssse3_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSSE3),yes,no) \
 	ax_cv_have_sse41_ext=$(if $(BR2_X86_CPU_HAS_SSE4),yes,no) \
+	ax_cv_have_sse41_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE4),yes,no) \
 	ax_cv_have_sse42_ext=$(if $(BR2_X86_CPU_HAS_SSE42),yes,no) \
-	ax_cv_have_avx_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no)
+	ax_cv_have_sse42_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE42),yes,no) \
+	ax_cv_have_avx_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no) \
+	ax_cv_have_avx_cpu_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no) \
+	ax_cv_have_avx2_ext=$(if $(BR2_X86_CPU_HAS_AVX2),yes,no) \
+	ax_cv_have_avx2_cpu_ext=$(if $(BR2_X86_CPU_HAS_AVX2),yes,no)
 
 LIQUID_DSP_CFLAGS = $(TARGET_CFLAGS)
 LIQUID_DSP_LDFLAGS = $(TARGET_LDFLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
