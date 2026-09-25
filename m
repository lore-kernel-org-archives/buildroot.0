Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52027C98326
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B47F810D1;
	Fri, 25 Sep 2026 14:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbcmD7WKt0ll; Fri, 25 Sep 2026 14:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3E6C6811AE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347509;
	b=PtvBCnpvz9DvXKiJKcUF4bptSFeDoBiXRfRukGBEw7mys4BkssHXOcafzrbw9a7Y1eqK
	 Col8V7KaSVoZdcF8s9ZSxFelZ6cq8J5m1skbeBFJM4RLo+Yf4OrJVWjIs07WuU34CXPPl
	 EzXZ35G4JxnpZSoniUdalA/GzSezb9M7d1UenTs8voa1rdh+0BB/ywS7L9CsEOVu9Tcsg
	 uWFV1uIjFBGKBsXLTo5ecPtQ1apeo2UBAJUvM89IbchAqxajq92DlJYBPnF+zdXRsLgTK
	 Vr2yVaBZruQsdaC3yBE3kNiFqMCt0++u0YwX+Lpy51dVe6waP3/IMZn6pM9GHMyImWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347509;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=E6wrIRwiHMMT/A8QB+gs+5M4hbvln5z++jinZNvlMek=;
	b=nmcpZpsAfv7DOzpU2zV9tYEPI/wkApQcbPPFRu+F4x5vBQyu83xUh/WcFJ284lFM5b46
	 ov4oxlw8h0HB4xLqye7cBbx88HovOdh9HAvSN1uXS2+i/ESeaai5oJ1XHCsR3puwCTLt+
	 CxDCzymezIxMrChIt7HcoQ15P1otx/49FzQkU2H28VwOggBTADviUXJCZm8HrYh42NC0L
	 D3JJxSOky77nc6wLOEkVazsMgGQElckLlv1VUmIXTWiHcQWhJqAXInSWbQdKHSucr0WWf
	 5x2jRdR9wz3rAlV6BtF3/K7qB1IlJJsesUy23TFEA/ZdlV3lYoxsAuPb/7i3FsPJXRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347509;
	bh=E6wrIRwiHMMT/A8QB+gs+5M4hbvln5z++jinZNvlMek=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GUZ5ioQxZ3FqH4U4Q1H6egPmrMYxmW0YR5tjymPfq8Zyt7GzApQgjCDatyrMR8ZFx
	 ORZ5ygvLM4OESBBSM0QZM9HqxDU2+N+796fEaugdAjipMgzsMQrNAk8I+3zwp4eKGS
	 O3jM1T+YgfwkwiKf8Wcq2YVj8FQCgsGQP/p3MCZr5AwRK2/ggIBkzc++zGq56T5cSv
	 apL6wfDkbfXAmyhQlYKbGl1jS8jTFw1NZ96YNs89VDwrn+xzsbVwETfzqxYrJma5zj
	 I0FtbmuYPKRGyhD86Tl7q/dg5jIyyBJ6ALaABz4X/R4v1ougAUexH5wlI5QmHUjzYm
	 BK8Lruh7MB/Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E6C6811AE;
	Fri, 25 Sep 2026 14:45:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 846AF332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7654440790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MT9YFddVr4Xo for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7AB4740BD4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347503;
 b=Ud6MmpDD+JBRBp6Xh03pVewWavnCux6MwOYJSv26IOLdtoI54kwQR+4H2YkItN27Zlzn
 YWJsoFH1F9Og0VHV060Uz5wXe3fO4HbEN0hZ9sW4oRElU5pzIGIVpNhSbURx+IMBoYzqf
 8MEa1Sq4Z4AkgLVMAQnrKghizkioxOULl5vJWaRU7+nIDfG6Kc7YdaMdwuUKPazhglsfR
 e7ceLyejhRi6AgjZCmU4nGkJFYrJrhxF3nFswgqu5z+Lw3SSgwffYl+VGaM5aHmNlCeg5
 uliwC3GrzhlfAdJq4Wgdc+ZgLKRnOGPyEYsUy1sBIXaIO6gmTQC1T6L987e2YY/qbww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347503;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ermURpj7nQMsN6hixtG/OMAiNZqabbiVDoaCmuIzwHg=;
 b=nhxUHcmTmEekReDsey23UlH76StN/kCKB1MeXNyG/CAqo1Vo+0ef+NPhXJuwqHd6PWVw
 IGyOxuQKYnmqXE/JIjtYxFp/xmHKYbLp2D1WKsrGZ5NWvLrNPPiYcaTGmWOq8yrBZ9eyw
 4kQ08ix3jIeW2lT4uTPInpilZJ+ORMJa8c1a8qIGAroB6Ezjf47R0wICh257bZsd/2IZP
 P1HgzpLMW6EYoIDYA9yycJFwp72xADU44nLJwhIzPe5+heE/wBkHr0W8gzBqeIjchwPmN
 NUiiTBo2JhbvD9QZdgpfisYzGvvDHLA7ouiWF24/Xpq2yU06YUGvyWbZCiaE96fxl4A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ldk4WCj3; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AB4740BD4
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:03 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912e2406so5158735e9.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347501; x=1790952301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ermURpj7nQMsN6hixtG/OMAiNZqabbiVDoaCmuIzwHg=;
 b=f/LcLPOaDa218+y4OB0EdmyTzGRjMqKdVVeqK9N1gfKJ8OvX/jLNBQOi4yRVNoFYSF
 pwHD4etKtYJN643XGQRs7271Y58EdDdd/zok0D2vBIZ/2h1HOxMv/VCJWD9XwEfb0hlp
 FZ7uKyZgSKLHrlSXEpWFRTYhvon56NAKpkS7+dNAYaA0USvZ5b5pXURs5SN0yx2LO09E
 aeEvWAYFVHAdEePhZOEDYt8CpTT9L3EeP7R/wLn2wHZXOvcyQfc2Sj4zeZsC5mJgESMI
 LsukrRctHKMGizewhOa0sMCIpVgH1l1bFrU6kMb/huZtN0RhjWqdTG7pdVTjI1POe5EH
 VJZQ==
X-Gm-Message-State: AFuF++lMJxxQrCwVRo84ThNZKMPTUOqbs2MGFx0IzYA/KQZF6DqdvybJ
 TFy1XYtcl1gyChXBzSwoM1nh/v5+2GHPEWzYDveYhOGdZXnkVqMCnl+R+jXVYD6XytKFSbGS+CS
 di4WWMabudw==
X-Gm-Gg: AYBFou0sl2q0qIHHLEmZaKh3K4uX+ws3frqXQNGJMuPOJDqvq7gOS7B2+QUFImA7NGw
 oyXr+VSshFRYt/CcFyN8+vCU/Ch1nDqFjZBHp1HP1ZamIiu0XWGt7uKSVKq9ponI4TNrCACgUEx
 +WaDNYMblTGK1jn15EAavav+NyGd2RvP35eXT0Yp7/ZemezN/nPXUbKp1OI4ZnGx2p5cakNWxcP
 kXQoRmN9RuCK8cUuti/2aA5EKT+ZEB7GvCcUL1Dpc5AgZawmXJLHjYZUX8BTbVbccUDBlOkYgS1
 vp2bzwn0iLvnxsk118tlHJFRTuDN9LKyrqEC0+zu41mvsYlIdhyLgRQ9rY6Uv7XtIJlU5SEwPzl
 kXe/lp5vQapEwJ2EAIM8AcsW6Ca1pBAb275+V4ao19i9tubqNEw46cKBpTXJeqKcR+2XH/npB2O
 nkBnG6iO2E2ZHS2yMjqnbiQu3gI+k/1KlXl3R6uwSG7D00OIF9X67zcmF6UaF57d9HCmEelbmt7
 d3eGtxOnS0OI+iszH/NC438iOAPIC8LCYPlWE5VtQ==
X-Received: by 2002:a05:600c:3b01:b0:49f:ce79:7a8d with SMTP id
 5b1f17b1804b1-49fe670b3e3mr107552715e9.17.1790347501298; 
 Fri, 25 Sep 2026 07:45:01 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fef60cc72sm46454985e9.3.2026.09.25.07.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:00 -0700 (PDT)
To: buildroot@buildroot.org,
	Michael Nosthoff <buildroot@heine.tech>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:57 +0200
Message-ID: <20260925144500.4097068-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915074215.620475-2-buildroot@heine.tech>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: propagate gst1-libav
 architecture dependency
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA selects BR2_PACKAGE_GST1_LIBAV, which
> depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS, but doesn't propagate
> this dependency. In practice, there is no issue, as webkitgtk is only
> available on a subset of CPU architectures, while
> BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS makes ffmpeg available on pretty much
> all CPU architectures, except Cortex-M, m68k coldfire, and some
> specific cases of OpenRISC, which are not supported by webkitgtk.
> 
> But for the sake of having correct dependency propagation, let's fix
> this.
> 
> The other packages selected by BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA have
> dependencies that are already handled at the top-level
> BR2_PACKAGE_WPEWEBKIT option.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Acked-by: Adrian Perez de Castro <aperez@igalia.com>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> 
> this is a 1:1 copy of da906556371ca3728b05ea4f33402891288cc027 which does
> the same for webkitgtk.
> 
> ---
>  package/wpewebkit/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 03e9eaf59e..4a747a22c9 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -87,6 +87,7 @@ comment "sandboxing supports needs a toolchain w/ headers >= 3.17"
>  
>  config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
>  	bool "multimedia support"
> +	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # gst1-libav
>  	select BR2_PACKAGE_GSTREAMER1
>  	select BR2_PACKAGE_GST1_PLUGINS_BAD
>  	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
