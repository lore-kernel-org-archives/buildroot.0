Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6A4FA373E
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 17:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3994402FE;
	Wed, 26 Oct 2022 17:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3994402FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3i3BBkxwb3Dp; Wed, 26 Oct 2022 17:54:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 142E9405CE;
	Wed, 26 Oct 2022 17:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 142E9405CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C10C71BF36F
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 17:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C8C240273
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 17:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C8C240273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6nc-elMqNl8Z for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 17:54:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA246400CF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA246400CF
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 17:54:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 7703820007;
 Wed, 26 Oct 2022 17:54:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 19:54:29 +0200
Message-Id: <20221026175430.3927965-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666806875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PzAVgbVcwKkdVVoRthjYGuxGVRwR83dHlaxuV1zx5vs=;
 b=UgNpRaWjGBC8p2G5acWPYXqYsMxDc0PWsRBdUlqFg7yc4kRCgimc3EFq34mqrHeQYtsRnI
 Hhpl7uAwfpVGrvfAhosmdjIXlaBGj0SnSDlTfX22j65ubLU+Z5FGvIu3u1fEO5UB93r3Jb
 jviRAUwfIyjXMgofkeLLZrl6ID8Qz2hqQYevEuC2hlEcGZ03M3BBbz0vA97GnWl4vSQnti
 XmwjuuFJ39ruqjG1VJLR2hBFkpEYcQ+HbcAavoVzZffRu4FM7msw5rS2YO6C37KuDB2PQk
 UJ7+a8iaFiEX4qKsHnqXzBmcwSY/KXOftlRhihDAh07qBety0XxxhJbZkT9mbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UgNpRaWj
Subject: [Buildroot] [PATCH] package/binutils: prevent selecting 2.37 for
 AVX512 systems
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support for the AVX512FP16 instructions was added in binutils
2.38. See the binutils 2.38 releases notes [0] that state:

    X86:
    [...]
      * Add support for Intel AVX512_FP16 instructions.

[0] https://sourceware.org/pipermail/binutils/2022-February/119721.html

It turns out that when building GCC 12.x, some of these AVX512FP16
instructions are now used, and therefore when binutils < 2.38 is used,
the build fails as the assembler does not recognize those
instructions:

/tmp/ccChzL2g.s: Assembler messages:
/tmp/ccChzL2g.s:20: Error: no such instruction: `vmovw 24(%esp),%xmm2'
/tmp/ccChzL2g.s:21: Error: no such instruction: `vmovw 28(%esp),%xmm3'
/tmp/ccChzL2g.s:22: Error: no such instruction: `vmovw 32(%esp),%xmm4'
/tmp/ccChzL2g.s:23: Error: no such instruction: `vmovw 36(%esp),%xmm5'
/tmp/ccChzL2g.s:30: Error: no such instruction: `vcvtsh2ss %xmm2,%xmm6,%xmm6'
/tmp/ccChzL2g.s:36: Error: no such instruction: `vcvtsh2ss %xmm3,%xmm6,%xmm6'
/tmp/ccChzL2g.s:42: Error: no such instruction: `vcvtsh2ss %xmm4,%xmm7,%xmm7'
/tmp/ccChzL2g.s:48: Error: no such instruction: `vcvtsh2ss %xmm5,%xmm1,%xmm1'
/tmp/ccChzL2g.s:80: Error: no such instruction: `vcvtss2sh (%esp),%xmm1,%xmm1'
/tmp/ccChzL2g.s:96: Error: no such instruction: `vcvtss2sh (%esp),%xmm0,%xmm0'
/tmp/ccChzL2g.s:100: Error: no such instruction: `vucomish %xmm1,%xmm1'
/tmp/ccChzL2g.s:103: Error: no such instruction: `vucomish %xmm0,%xmm0'
/tmp/ccChzL2g.s:122: Error: no such instruction: `vucomish %xmm2,%xmm2'

The same issue does not occur with GCC 11.x, but nothing prevents
other packages than GCC to use those instructions, so the problem
really lies on the binutils side missing the support for those
instructions.

Also, in Buildroot, we do not distinguish AVX512 in general from
AVX512FP16 specifically, so our only option is to make binutils 2.37
unavailable for AVX512 systems even if some of them perhaps don't
support AVX512FP16 anyway. This seems like a reasonable trade-off, as
binutils 2.38 is anyway already the default in Buildroot, and
AVX512-capable systems are fairly recent, and therefore using a recent
binutils version should not be a problem on these platforms.

Fixes:

  http://autobuild.buildroot.net/results/eb6e28c934654e6d714973415a2fb452f9580279/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 51802db043..5dd2af2f9c 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -14,6 +14,9 @@ choice
 
 config BR2_BINUTILS_VERSION_2_37_X
 	bool "binutils 2.37"
+	# AVX512FP16 instructions were not supported before binutils
+	# 2.38
+	depends on !BR2_X86_CPU_HAS_AVX512
 
 config BR2_BINUTILS_VERSION_2_38_X
 	bool "binutils 2.38"
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
