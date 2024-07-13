Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B00C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 21:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 339428133A;
	Sat, 13 Jul 2024 21:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9NG18X-IcHI; Sat, 13 Jul 2024 21:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E3581120
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E3581120;
	Sat, 13 Jul 2024 21:05:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81C2B1BF355
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F107404BF
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJgaN5NPpiXD for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 21:05:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC82C40133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC82C40133
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC82C40133
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 21:05:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 027CF1C0002;
 Sat, 13 Jul 2024 21:05:34 +0000 (UTC)
Date: Sat, 13 Jul 2024 23:05:34 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240713230534.7a6fb008@windsurf>
In-Reply-To: <20240519091627.2195972-1-thomas@devoogdt.com>
References: <20240519091627.2195972-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720904735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofZLCOeb3CB26gQNYKpoPu+xpcMCNa+3J56+TgTntSw=;
 b=h47cDEf5SwZNreQRblCZStHZAeL6jlLRSEWr1WXY2D/wAZvl2IQNq5t7AMGwTBnn/HAKoZ
 OVXMVph8s3/wkdmxX+cbDP3+gVzNsszISLZbJq4sflOgMD6xgJ1Mid018jy6Rofyz1S2oc
 7/qVFiyyfKN/OojMjJmeN04Rv+IDZFBApwnypu8VV3YnbXpNmowALbfJGwV4mhsPsW6nKL
 Rb/BcefykuSbv1r24BI+lmb+1az3adsHiTIbuiHosTJBuyft1akcP2CkXbpPnvtoRTuuhs
 lQhSWKZJ56tnUtAgd44feUaGHOV7ys9TCGLaVGbHhLXVrY4X/J0tTR3mabCrsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h47cDEf5
Subject: Re: [Buildroot] [PATCH v4 1/2] package/x11r7/xlib_libxshmfence: fix
 build on riscv32
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
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 May 2024 11:16:26 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> In preparation to revert e39ad96136a8c340b3aea6b036024e28f14584f3,
> and (partial) 26642e4cc09666110d5105e7867579a0e48cfa09.
> 
> xshmfence_futex.h: In function 'sys_futex':
> xshmfence_futex.h:58:24: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
>    58 |         return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
>       |                        ^~~~~~~~~
>       |                        sys_futex
> 
> Fixes:
>  - https://gitlab.com/buildroot.org/buildroot/-/commit/e39ad96136a8c340b3aea6b036024e28f14584f3
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> v4: move xlib_libxshmfence to separate patch series
> ---
>  ...tex.h-fix-build-on-32-bit-architectu.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
