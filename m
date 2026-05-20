Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EE3CD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5CA483F06;
	Wed, 20 May 2026 19:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0VrUTTlJR4o; Wed, 20 May 2026 19:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8E1483EFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779306268;
	bh=Vy+p8ie9s2sC6S4rxvvGShkcobeFjXCRiEXhbjxLvP0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sblZlIiD9dOiEwLOwBME/UsZjz/cZolFWWQFQXPkrjljqsHDzI+x1eofgFXZs+Z1S
	 GiiAtmNGEaHgP387dUhVbYN5Xl2/93LpvPwSepoTb8dU2s1rv7sLOTFUv3xywaocxt
	 kx99IZchqGTORghrwgG9EwysXLVyeBGSb1XIwLtBvs31SVidDr1ASV5EJWFE0A3i8X
	 3aeekQwtp8R5PbhdAaSVOFC2UrusTYqFl/QH9mhRWLys3MzfwvBIt21mQxJ0ZuK2Dl
	 Mmv9Ds3duScN1aVBFj6g0xJbiKWt3wEmYYkRtzA1HWri8nyiKT6QkMiwunb0N1I8g2
	 ZYhQs7JU2LqZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8E1483EFE;
	Wed, 20 May 2026 19:44:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A5E61B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3087C40CCF
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5p-6VwWANTT6 for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:44:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D21B40218
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D21B40218
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D21B40218
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:44:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2C6A8B97C45F; Wed, 20 May 2026 21:44:22 +0200 (CEST)
Message-ID: <e9ff792e-eca4-4c55-b7dc-cab9f8dd624a@rnout.be>
Date: Wed, 20 May 2026 21:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
References: <20260519223932.1034317-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260519223932.1034317-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779306262; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=c3M4rWu9zAQmr2yzXanhfV7BjqmwQF30gEaSXJJQVH4=;
 b=Sqp8U2BZ3qNvqZGNtdO1sfGfKsHtUDWgqyIvGY+t34oj+Z3hTx4gFv3BOFmGz8oNRaA0X0
 V7raIYGx4bE5T6phVmqciv+FNZp27kCd5eRuVn9mjKZ25G36Xed2dpCsdNTb2btWe5nOjk
 s1Vziwhx2YXMkSlydgY10JOt8YL/nnC+csJo7uTN4myL5j+dRzVH9L1jaW0FerqCxawVnX
 lRHZZeTeWeEeEuntuGLHlrOzBMqi8aR4c8KCgLACWpG2pN0b39g8UjR3uruj2OoUz7g/CW
 YZm6jTwAGBE58ChR7QuNLXud9EPUOAeL9VyVJJ9ZQjKttZeIRoXnK2YcVReFfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Sqp8U2BZ
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: fix build with Weston 15
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/05/2026 00:39, James Hilliard wrote:
> The current cog release only supports weston protocols up to weston 14
> 
> When weston was bumped to version 15 in
> 2e6b2b82d5301977cf2f59adfd633d8774830f69 it broke building cog.
> 
> Backport a patch adding weston 15 support to cog.
> 
> Fixes: No usable weston-protocols dependency found
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-Add-support-for-weston-15-protocols.patch | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 package/cog/0001-Add-support-for-weston-15-protocols.patch
> 
> diff --git a/package/cog/0001-Add-support-for-weston-15-protocols.patch b/package/cog/0001-Add-support-for-weston-15-protocols.patch
> new file mode 100644
> index 0000000000..c737ae6a66
> --- /dev/null
> +++ b/package/cog/0001-Add-support-for-weston-15-protocols.patch
> @@ -0,0 +1,29 @@
> +From b59d3a3c0feceecb10f0376ac2695d9466c9ecf6 Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Tue, 1 Oct 2024 10:24:56 -0600
> +Subject: [PATCH] Add support for weston 15 protocols
> +
> +Weston 14 was released recently and the weston development branch is
> +now using libweston-15-protocols.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +Upstream: https://github.com/Igalia/cog/commit/b59d3a3c0feceecb10f0376ac2695d9466c9ecf6
> +---
> + platform/wayland/meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
> +index 74215f0..dad47a6 100644
> +--- a/platform/wayland/meson.build
> ++++ b/platform/wayland/meson.build
> +@@ -49,6 +49,7 @@ wayland_protocols_path = wayland_protocols_dep.get_variable(pkgconfig: 'pkgdatad
> +
> + if wayland_platform_weston_protocols.length() > 0
> +     foreach weston_dep_name : [
> ++            'libweston-15-protocols',
> +             'libweston-14-protocols',
> +             'libweston-13-protocols',
> +             'libweston-12-protocols',
> +--
> +2.53.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
