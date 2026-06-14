Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FDDCD98D2
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 10:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E55080BED;
	Sun, 14 Jun 2026 10:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3_hW7Yb0arb; Sun, 14 Jun 2026 10:11:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8AEE80C31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781431910;
	bh=wUtOVpN+/WDvVY0vwp9HyVGIFrSJbe7r7jNr1A8Dt4w=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WwhfqC62ZiS86V2CFw2ZVxFp/rbgfm8j99IOvOFZ7LVMT+5vVBlhyeHgmkfGGsDZu
	 KuS6DG9378Tx/6WvAyAd3NmBfwvggU5j+Zj0RNL1Cqx0u1l3YZdT55jkJgwRctI/bp
	 T/NGFY1d4X+PZ8um0TcXuWf5IBLDSkP3a/6rASsF5NZONgpGRrNZzr6GZloLc7sw0n
	 EmEMnYr7kjWesNYyIC1yTaBJ7iRM+LU4IvlaFkTVnsChpAto62afNnz0W5clZAi8KQ
	 UfjSpyRlp6le/r04iGxgVuTVpYZ32LPuX9+cHzchBy8Cgn/ixNXMWkIFWfUzMejxG1
	 SdkBE0kLaCmOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8AEE80C31;
	Sun, 14 Jun 2026 10:11:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 482C82EF
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 462C580C31
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zFs0zzrinCn for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 10:11:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30EA080BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30EA080BED
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30EA080BED
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:11:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1424418989; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 14 Jun 2026 10:11:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wYhoc-0000000FT1R-0iS6;
 Sun, 14 Jun 2026 12:11:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michele Comignano <mcdev@playlinux.net>, ju.o@free.fr
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260613215558.978962-1-mcdev@playlinux.net> (Michele
 Comignano's message of "Sat, 13 Jun 2026 23:55:55 +0200")
References: <20260613215558.978962-1-mcdev@playlinux.net>
Date: Sun, 14 Jun 2026 12:11:42 +0200
Message-ID: <87wlw1l9cx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=DtlHKkUP4vUsNtAJaPCtkbDxJR1H5rkxDYpIwEHKCziX/f/7AEzXthSyb6rWV/V4UCM2PZmF2u9bII60reevEzZqNfcKnNDNasKxTILR0QnpPJwlgC+e3lhWcmg+thOMdNVwjR6AuMDF5OPql3IetbMOu4ab8cXGdiYwfBBRbgpSsffBoxlEA+xFuKmUbtAarERBb3Yf+TlLSaiG3uToCK850lENUj3nrqJ3P/dtMCwPMNXlG1vck2R19yPLrZ4LpMPdhL7VdnjkzvzCp6/fFPFQskhafEzSd4RwtecpxzRqqUCTESToLgKUeSq+LA9muvN12nEUZ/L/nmMsqhMUBQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=fSyKZ/cAJ6r4l5ncE7SnvQuBt1p6/4V/GcieERGDiEE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=DtlHKkUP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michele" == Michele Comignano <mcdev@playlinux.net> writes:

 > From: Comick <mcdev@playlinux.net>
 > Upstream issues is waiting for feedback.

 > See here for details:
 > https://gitlab.xiph.org/xiph/opus/-/work_items/2397


Hmm, indeed - There is no vcvtaq_s32_f32 intrinsic in
gcc/config/arm/arm_neon.h but there is in gcc/config/aarch64/arm_neon.h
but I do not understand the finer details - Julien?


 > Signed-off-by: Michele Comignano <mcdev@playlinux.net>
 > ---
 >  ...use-vcvtaq_s32_f32-on-32-bit-systems.patch | 26 +++++++++++++++++++
 >  1 file changed, 26 insertions(+)
 >  create mode 100644 package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch

 > diff --git a/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch b/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
 > new file mode 100644
 > index 0000000000..ddd572921f
 > --- /dev/null
 > +++ b/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
 > @@ -0,0 +1,26 @@
 > +From 321532001d59367466a6a4a60f5c6f0fe5fa2176 Mon Sep 17 00:00:00 2001
 > +From: Comick <mcdev@playlinux.net>
 > +Date: Sat, 13 Jun 2026 21:48:00 +0200
 > +Subject: [PATCH] celt/arm don't use vcvtaq_s32_f32 on 32 bit systems
 > +Upstream: N/A https://gitlab.xiph.org/xiph/opus/-/work_items/2397
 > +
 > +---
 > + celt/arm/mathops_arm.h | 2 +-
 > + 1 file changed, 1 insertion(+), 1 deletion(-)
 > +
 > +diff --git a/celt/arm/mathops_arm.h b/celt/arm/mathops_arm.h
 > +index b1f9169..c612dae 100644
 > +--- a/celt/arm/mathops_arm.h
 > ++++ b/celt/arm/mathops_arm.h
 > +@@ -37,7 +37,7 @@
 > + 
 > + static inline int32x4_t vroundf(float32x4_t x)
 > + {
 > +-#  if defined(__aarch64__) || (defined(__ARM_ARCH) && __ARM_ARCH >= 8)
 > ++#  if defined(__aarch64__)
 > +     return vcvtaq_s32_f32(x);
 > + #  else
 > +     uint32x4_t sign = vandq_u32(vreinterpretq_u32_f32(x), vdupq_n_u32(0x80000000));
 > +-- 
 > +2.54.0
 > +
 > -- 

 > 2.54.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
