Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF06C98324
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C2881442;
	Thu, 24 Sep 2026 18:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CI256qy8ZelY; Thu, 24 Sep 2026 18:59:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B452181403
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276355;
	b=qLtzN7lDC5GAwh5vUzuxWHXWPn896yhFbNWtV/h30z7wN7rnSywxH9h6Kebeqor5HqjU
	 xxd39NalPeueplMDjlI3I14AhZ6kaEvmBhCJvbrO7Fe8LMmGydJdWQ1BrcyUtTgSsf04e
	 N6+BGWQZv5taQWZH7KFEhdRlM3tMTfdxQkbQrhGLXFswN6BZQYFi+Bb1+tOI4Fd/jfkxq
	 4M/nNQwUwkhUTGM6/jrRwoaTnLLWasmPxiK4wwijyc5/W54VXPmRmfz7WkGeYKwigfnfU
	 yWZeB1c6gdmyTTAuqvacOAXBh1Q5LuMBbmXOWwsLncqKhAAJa4m5lAvSKwuTcUJb9Jg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276355;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=l3W5AY+6KAnVZAaSCXgX3fXBtjNtu+2yy4/AbDbFMOA=;
	b=aZXzoEMhVOKXoTT9PpwkxxXwtDQo+uUs5anOC0rx579cFolQMeU2ayUe/lLJYjVNEuOr
	 xtzVW0dfkirETuemYF3INFL6fgE6GkPqrkloaSOf36sY930Y2zd791vMwAzTXMdZinLLJ
	 NepolyMojszAIUMW1o6HLtCFcXp1az6sgR+6wKOGdUW3Me1e5PHZrfdcAlan8By0haP9Y
	 weU+fYSR+vN+2Mxgq1xqkEFl/IPL7S+cRwxHs7mRCJdlp9jdcsLzUbxUNybRPp+NS8lk2
	 bii6dsoVLQHEsK8ADCFETWmbR339QZCHtlLfBcTCs4NAbYO7iR5PJX1eNaroscVQLdA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276355;
	bh=l3W5AY+6KAnVZAaSCXgX3fXBtjNtu+2yy4/AbDbFMOA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mkHAvWXP0V4Se+eKaoKUdIxbKZMFi0fcqNT3CNFL60VHJHdZmSZg3R74B7jVGpQgT
	 UPiR8IUF2qaYj9706422A03iaBnlWtMdNLpV136TcEq/voTNwtdbxv59wYQNHItqss
	 HyC4RwB9c46oi3ihe/pP94IHk/ZoncDZgt2zhXX6pf/kp6W4LyDFFyZFEZ3WFf1m4l
	 P2rN4pKUuvV7Y2ZnEVq5rJ1ZT4mWmGFYcM5g3gDVPpW9cXw75ls5cDrfOqN8TuHiZ9
	 yQwBB9mMcaBc2bmnC9RTFbn/g/fgvTK9aYb9UuPpmwjtog9KpQ8OC9BfdRqILZOOYb
	 puSK7pKYEMCSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B452181403;
	Thu, 24 Sep 2026 18:59:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A393332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 979A3404D5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLUMmeOROxpY for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C99EF4017A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=qZc3AUjSAZYE1Dqcg/1H+w5N3gMDvgou1VVgsNVxrdfZ6DkhI9jWzaJFT+7tNmPArvta
 ooq1LX4vb12zEcUXsc5wyyTlErIftUNXYEglX6BDfNtTn5YBvLtDdOYxOnRNIIFlD96sM
 cRovUa9MOxteA8IZDREDpktoiot0s3OAN6fgYE6d3tRmuaZmsSSRdf2BoRPevfz1xXGLb
 Vc6ZUL4z42fTm4q21/yLMzK72ydTB+sMa0nOBW/huCs9+SOARfTv3G4U0sT3SobfMipyf
 SQcYjRCbO63S1Ma7UdnOisdw1Xr8dglkulPPIRaY7eJ6eNKheD+ZQ4FJZO21c5a4L6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=f1r9Gr4KDjnjRNBr5X7ArNdtos76npXu4Ng/hjS5Ivo=;
 b=DNBFekIGZUM2HGtb4RxTiGdRi3RtArPIcHg5NGxjyZ4PgM8eReiIhMWMDNByyp9RSrCz
 Ormi3hw6nBeuH62Jn0YZwExepHhKKYQJRh5xH/rH+JIhZrH7eHvBsDWXWF9ytqE9l7mvx
 drOLuOSDujXUR5sX183yg7rIXNzkqw4JKn7CEc5W4jRhdsicY6LIvYpjXQ5lExBvPbd2d
 WjGiamQBE5GpUoO/geAgbtYpJAlZkwySWyzWyDSIqgLrOJbG31YPKM2CTPqDPAgKtAnZ5
 evpZ2NvWEMGWw/He6CYumQfyWIW+gYHGN1/GFS3d9GfE+gxLb4PxGmbUTJOciMGKXFw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C99EF4017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D384982D9; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:19:03 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 07b358a53963fee0b8cb52e8eb51ea503cb8c24b
X-Git-Newrev: 672e27ec30a4cf4a911ec4fe8bf657eb37509b17
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.6D384982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] arch/Config.in.x86: add
 BR2_X86_CPU_HAS_XOP
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8237450351842916999=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8237450351842916999==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/672e27ec30a4cf4a911ec4fe8bf657eb37509b17
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The AMD Bulldozer family (bdver1 to bdver4, i.e. bulldozer, piledriver,
steamroller and excavator) is the only x86 family implementing the XOP
instruction set, together with the equally Bulldozer-specific FMA4 and
LWP extensions, and TBM starting with bdver2. All of them were dropped
again with Zen.

This can be verified with:

  $ gcc -march=bdver1 -Q --help=target | grep -E '\-m(xop|fma4|tbm|lwp)'
    -mfma4      [enabled]
    -mlwp       [enabled]
    -mtbm       [disabled]
    -mxop       [enabled]

  $ gcc -march=bdver2 -Q --help=target | grep -E '\-m(xop|fma4|tbm|lwp)'
    -mfma4      [enabled]
    -mlwp       [enabled]
    -mtbm       [enabled]
    -mxop       [enabled]

with bdver3 and bdver4 behaving like bdver2.

Add a hidden BR2_X86_CPU_HAS_XOP capability symbol and select it from
those four CPU variants, so that packages which cannot cope with this
instruction set can depend on it, instead of listing the CPU variants
one by one. The first user is host-qemu, whose TCG engine does not
implement XOP.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f91407f0120ac4f3a8d9ea647f1bd44030654f7b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 arch/Config.in.x86 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 3c4a725360..51b157409f 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -20,6 +20,14 @@ config BR2_X86_CPU_HAS_AVX
 config BR2_X86_CPU_HAS_AVX2
 	bool
 
+# BR2_X86_CPU_HAS_XOP is selected by the AMD Bulldozer family (bdver1
+# to bdver4), which is the only family implementing XOP. On those CPUs,
+# gcc also enables the equally Bulldozer-specific FMA4 and LWP
+# extensions (and TBM starting with bdver2). Those extensions were
+# dropped again with Zen.
+config BR2_X86_CPU_HAS_XOP
+	bool
+
 # BR2_X86_CPU_HAS_AVX512 implies the following AVX512 extensions:
 #   AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL
 # This subset is common to Intel Xeon (excl Xeon Phi), AMD Zen 4, and
@@ -604,6 +612,7 @@ config BR2_x86_bulldozer
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 config BR2_x86_piledriver
 	bool "piledriver"
 	select BR2_X86_CPU_HAS_MMX
@@ -613,6 +622,7 @@ config BR2_x86_piledriver
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 config BR2_x86_steamroller
 	bool "steamroller"
 	select BR2_X86_CPU_HAS_MMX
@@ -622,6 +632,7 @@ config BR2_x86_steamroller
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_XOP
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 config BR2_x86_excavator
 	bool "excavator"
@@ -634,6 +645,7 @@ config BR2_x86_excavator
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_XOP
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_zen
 	bool "zen"

--===============8237450351842916999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8237450351842916999==--
