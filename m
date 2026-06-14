Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4198ACD98D2
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 16:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91ECC4112B;
	Sun, 14 Jun 2026 16:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaZJdvPLePVA; Sun, 14 Jun 2026 16:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A10E4110A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781456315;
	bh=UDWXjH0bv51+ob0KKUFKU26zfmqMs2YuF9dQROMLzjg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J8tMunAWNvq266rU6uff2eg8sWC3v1AGhaCWGmcREYILd7exJQrOqf9LcjZVcLInc
	 Fd9Q6M3XVH+YCpd/QP/ap7+7WpVLVbEYwhUY3y4DwXtC2+zpNTt0eQCQZPvu/lnCHy
	 7mdk/3Kmx2Oj2VO9+ScU4SMOoEFnn49CHoskqXjkH1xG5VJXJQRxMf4J3C0zKSD5/y
	 MRuGZX+5yIPk6YwiE/oAoipb6sPRDOlZ7zvMpUjndBN8bhARQ7BaclkP1Npu3o+XS7
	 2alFGe9FhQyzni1kpmFgW/+osddwlyMWJ6IGtPGM6TuB3KcKRAh+DrO0XSSEEqOGiu
	 86w0wSgHd2qzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A10E4110A;
	Sun, 14 Jun 2026 16:58:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86309DE
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 16:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 785534110A
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 16:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_DY1qh1955x for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 16:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BEA1141109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEA1141109
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEA1141109
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 16:58:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5E294B00571;
 Sun, 14 Jun 2026 18:58:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Jun 2026 18:58:24 +0200
MIME-Version: 1.0
Date: Sun, 14 Jun 2026 18:58:24 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Michele Comignano <mcdev@playlinux.net>, buildroot@buildroot.org, Bernd
 Kuhls <bernd@kuhls.net>
In-Reply-To: <87wlw1l9cx.fsf@dell.be.48ers.dk>
References: <20260613215558.978962-1-mcdev@playlinux.net>
 <87wlw1l9cx.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.16
Message-ID: <2c64e76850f28ec44af165e020424b0a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781456307;
 bh=oRvrRoyBEqO/aTCBm+chx1vV2lbdsS2dGgEv+cUYVvE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ti4baTR6kHHKhRwQG79ov47KDXUWJ2xbKB9xRVAc+krRU0rm3Eb1ONymGXc75O3Go
 iLtW2cQ1Y9NG6H2ENS0PQu7DBnF3PTd6NhEOychtklNDEO+K6Ys7gkTpuiespyC205
 dTvPWP4wdNjnQihladXja+Nn47hIPYpMOygV6nscJ0nCFzz6Ls8vfeNb7KrqFtPUNy
 EfImWdbMgVUkQHm5ZEjZdLm1pQ4b0O4I3ym/d37LTdqeMh+X0xRUvS6132kMECLF6b
 ZHhghSeDBtCTlTtNgYJJwpjv4ikyHcEdkYoUESuHpd1sT4n/CZZwvEnvTkzWpjUIal
 DFfT2zNSOymeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ti4baTR6
Subject: Re: [Buildroot] [PATCH] package/opus: don't use vcvtaq_s32_f32 on
 32 bit ARM
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, All,

On 14/06/2026 12:11, Peter Korsgaard wrote:
>>>>>> "Michele" == Michele Comignano <mcdev@playlinux.net> writes:
> 
>  > From: Comick <mcdev@playlinux.net>
>  > Upstream issues is waiting for feedback.
> 
>  > See here for details:
>  > https://gitlab.xiph.org/xiph/opus/-/work_items/2397
> 
> 
> Hmm, indeed - There is no vcvtaq_s32_f32 intrinsic in
> gcc/config/arm/arm_neon.h but there is in gcc/config/aarch64/arm_neon.h
> but I do not understand the finer details - Julien?

Armv8-A Aarch32 is in fact a superset of Armv7-A. This is why there
is few 32bit Armv8-A instructions which are not available in original
Armv7-A.

See the column "Supported architectures" in the following table:
https://arm-software.github.io/acle/neon_intrinsics/advsimd.html#conversions

vcvtaq_s32_f32 is maked "A32/A64", whereas, for example
vcvt_s32_f32 is marked "v7/A32/A64".

There is also a search engine for intrinsics available at:
https://developer.arm.com/architectures/instruction-sets/intrinsics/

>  > Signed-off-by: Michele Comignano <mcdev@playlinux.net>
>  > ---
>  >  ...use-vcvtaq_s32_f32-on-32-bit-systems.patch | 26 
> +++++++++++++++++++
>  >  1 file changed, 26 insertions(+)
>  >  create mode 100644 
> package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
> 
>  > diff --git 
> a/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch 
> b/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
>  > new file mode 100644
>  > index 0000000000..ddd572921f
>  > --- /dev/null
>  > +++ 
> b/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
>  > @@ -0,0 +1,26 @@
>  > +From 321532001d59367466a6a4a60f5c6f0fe5fa2176 Mon Sep 17 00:00:00 
> 2001
>  > +From: Comick <mcdev@playlinux.net>
>  > +Date: Sat, 13 Jun 2026 21:48:00 +0200
>  > +Subject: [PATCH] celt/arm don't use vcvtaq_s32_f32 on 32 bit 
> systems
>  > +Upstream: N/A https://gitlab.xiph.org/xiph/opus/-/work_items/2397
>  > +
>  > +---
>  > + celt/arm/mathops_arm.h | 2 +-
>  > + 1 file changed, 1 insertion(+), 1 deletion(-)
>  > +
>  > +diff --git a/celt/arm/mathops_arm.h b/celt/arm/mathops_arm.h
>  > +index b1f9169..c612dae 100644
>  > +--- a/celt/arm/mathops_arm.h
>  > ++++ b/celt/arm/mathops_arm.h
>  > +@@ -37,7 +37,7 @@
>  > +
>  > + static inline int32x4_t vroundf(float32x4_t x)
>  > + {
>  > +-#  if defined(__aarch64__) || (defined(__ARM_ARCH) && __ARM_ARCH 
> >= 8)
>  > ++#  if defined(__aarch64__)
>  > +     return vcvtaq_s32_f32(x);
>  > + #  else
>  > +     uint32x4_t sign = vandq_u32(vreinterpretq_u32_f32(x), 
> vdupq_n_u32(0x80000000));
>  > +--
>  > +2.54.0
>  > +
>  > --
> 
>  > 2.54.0
> 
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot@buildroot.org
>  > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> 
> --
> Bye, Peter Korsgaard

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
