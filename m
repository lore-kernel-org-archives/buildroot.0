Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FC8CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 21:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0083160777;
	Mon,  1 Jun 2026 21:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h97lOF-vsQQq; Mon,  1 Jun 2026 21:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12E1060778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780349088;
	bh=hTqX8E6HY1FTeIKfSLfZanbtrdXA8FF9FbjXxPmLvBA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a2ctTcAMQC0iQq54TQfi3GwRJV8AyAPisc5bjEFOEghh6Yf2oeKTMWT23c6KgRhCF
	 LSsT3Ungg63LNc7ywJvpLCJDMPFS9u2sY7CrW/ReFjGXaFp1clGR1OROA1DHN8C88U
	 a2hua5b0ddyPe5SNhL2ap04j8DB9KMUjKT7SDiG9PjCPk2eatDPma/iUXIVNRpOI28
	 j836Jo1cLoVamo3Jy0n6CkLLQv6kvA7KxvHxn59yNYvnZ+GZqynmptmsIyp8snbTXg
	 vWi32GhWdVl1bal3FMVRjF/xlla1CzcIcZQlL8vvZNSjb5i8k62fmBmTWfO0w5+su9
	 9i92fAl/6bFiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E1060778;
	Mon,  1 Jun 2026 21:24:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAF02223
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B23E40830
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAHMgpukIr8v for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 21:24:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 970EF40826
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 970EF40826
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 970EF40826
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:24:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1B71B97C77B; Mon,  1 Jun 2026 23:24:42 +0200 (CEST)
Message-ID: <76afaa08-abdd-4464-aef3-4a8c5afa4612@rnout.be>
Date: Mon, 1 Jun 2026 23:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
References: <20260601204735.888967-1-j@j-ernberg.se>
 <20260601204735.888967-6-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260601204735.888967-6-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780349083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=dIqMq/bq/mTZoihRw07HoT88BslR9htd07bQQdS6FLY=;
 b=kMc6XjQNLCszOuuKH13l0aBuiHhix4z4qMC7EHFP2Q4BPuNwTjpfroNLExKy7koLSIh4rD
 Q89TUa7eDj98FRBv25ijZfpEq5x768hYOsMQB+DrmOAHD5ZuiY4cLyZbXtyzrDntRq/dul
 6RsmoE1ECTgDT1GTZQZy3S7xStVRHNKe3dHige42iyqKr0XMKwScCp+6S0tZ2/Bmka+Dpr
 ljB9mkaGiAik/b1eHmzjM4PlstTe/g1YcoBkL/R1LqejtkydhHSRqpVnBeI31Kz6+2s/oN
 tI+ZN4HT3nmfOrxX0vqtEAAUW126tMiLl373kWjicLMEQaxfVRJ1QI3/Ek+s6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kMc6XjQN
Subject: Re: [Buildroot] [RFC PATCH 5/9] package/libcamera-apps: Only enable
 EGL if both epoxy and xlib_libX11 are selected
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



On 01/06/2026 22:47, John Ernberg wrote:
> Since release 0.2 of the rpicam-apps these dependencies have been required
> if enable_egl=True is given to meson. [1]
> 
> The dependency check was broken since commit 3fac163b9315
> ("package/libcamera-apps: bump to version 1.1.0") in early 2023.
> 
> Link: https://github.com/raspberrypi/rpicam-apps/commit/c8351a09174f143424884081a69b6dd8018f4ba3#diff-a2468a39040f9f883e5b03e1523dd4e73fd43ad9ea87f600772477b890cdd655L18-R22
> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> 
> ---
> 
> RFC: I can't figure out if this is the correct way to do this kind of check.
> ---
>   package/libcamera-apps/libcamera-apps.mk | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
> index df7be41496..eea6e98c00 100644
> --- a/package/libcamera-apps/libcamera-apps.mk
> +++ b/package/libcamera-apps/libcamera-apps.mk
> @@ -36,10 +36,8 @@ else
>   LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=disabled
>   endif
>   
> -ifeq ($(BR2_PACKAGE_XORG7),y)
> -LIBCAMERA_APPS_DEPENDENCIES += \
> -	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
> -	$(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
> +ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_XLIB_LIBX11),yyy)

  The XORG7 condition is redundant, BR2_PACKAGE_XLIB_LIBX11 can't be selected 
without it.

  Regards,
  Arnout

> +LIBCAMERA_APPS_DEPENDENCIES += libepoxy xlib_libX11
>   LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=enabled
>   else
>   LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=disabled

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
