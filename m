Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191C3C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D163060D9C;
	Fri, 25 Sep 2026 14:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbXoDv8MMFIi; Fri, 25 Sep 2026 14:45:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7E33F60DA6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347503;
	b=Jd/OQzpf4aQ3SMOdmD2XrvIMwHkjOKIEoag3QWQUOeEsyjIU207qJ0C2MY9jSwQ2e67A
	 o19w4zprh9OyEcz5fX/Q0jk+ChbW6RWvMxrxlv2IdJ5QK9Dj/0ShYMFKpu+bZoHwHtCge
	 aORM1iRK/3iZ3LnMFFx4xkEfxRH0Aljy1u/QV4A9lrHrHz/FBLJbLyw6OIDiSHcGFoUQB
	 ZrTAzNSgqBWTzr2VPLgE5OROiRnDcMjj1F7KoahGlrgbCiA6IN0HQvduDcrDppRmBEQpZ
	 flvvgFPnPV9YnQE5WE1Ae08mPX/gZ/P3fXhkEboGJaN2cIEdCEsLbGwHq6tdiJCZ/kQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347503;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gmXbQViSskgr66KrGpukGqih5W3WcHfy0WrUkZ/GLTA=;
	b=sJLk2xFS+ftEFCIRvGC81uOnso2G1/XVyzQPBjegzIQ3Wr7j5YlTq/N9Dv3CH6qX6CHA
	 WHarViprOEwA+0S/S7Zothow8iwPlbmXfJSWaFiF++PJB3P0dNsvJazRDtbEf42z6MwY0
	 ttZp97iIdEoGbJAyLHk4PEvRhg94nvpMPg/bUNLFl/c7nGCtYB28LMEKQ8T0dDBvg4g01
	 auK8s+JKImE6x8nKJRqO81w3ydD+xpX6Z2eMnF5TyNrynjnAOmQ0HGBKDNn4/7LTrynBf
	 nYTjLAdHmUsXr52si6wKHGxoiaqqXbIAaVbq5s4ofzayxvJqBZ4kQVsRzQ28duY9ymw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347503;
	bh=gmXbQViSskgr66KrGpukGqih5W3WcHfy0WrUkZ/GLTA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gfgWnw4WRt6L1e9pFYikf+wm0e6aqmlEvAWH7vNY7DplmzBYKOGQOVjKvJEugO86m
	 yZ1lVic2FITXg9lpyaPPf4tnw6YDJINql5HgBH7ctbTrK9DpoP8+kZdzRpIU3Tc40x
	 IoHIFHikN/m5PX4Io4Ehoh8YF3DXBPa+J4vi5UKkfGtupaQKCddrDhYq5WL/4fmvuY
	 5uvaUieeqlIAxe7CofinGC1g8DHY1dcja09Z/SnYI98o1qAYgpA+pJznrOpR+NMclC
	 k1D6oYKcsah8826K5p7KPze3IdjZBlPbe3kbnBr+FH8SYbe3zShWaaNU+/c5mJgU1q
	 MjrVUuPu+BLeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E33F60DA6;
	Fri, 25 Sep 2026 14:45:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17719332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1148E60D95
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUY-FJBfG8Q8 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 26FE460D7A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347500;
 b=RgT6lSNYR3ieAQU2Z4MFuqpmjM3ioDOnfHqYxfuKrk5Ai+vyj+2PXe8YVohRdrw5zucK
 mLtRirS+SgHRuSXYbw9WQjX148EB9BoALGl12I19+eAUwdQcRBeSb08r6UEkg17MkPvr2
 woWxOVXcRCpE1hRWO0Rj94fn8IyxIWvKpNpExO2g3nX8OkSE1Mq1WSROVZsy8R6nZbhlp
 QJD9XxBF2w5fmatMnGSw34iVG6ltSS0FEK04dvMzYwgYehesj5hOAwxDBRNvlB4GBQn+N
 j/tVoQ8WCbJMp++nfrnpx+MZIUk6w/xhVwKwfPRb2P9m5jAlSQMXi4hFO3+C+bXV+ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347500;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=OIeguZZbFTpXk7IbNjViQ6jWFQfeigAV2hYu2KK7Mcg=;
 b=R2NhLK0M+SaxNGuprP4bJguXVm0BMrnZhHvWvo+vH40Z83bUYRl3DoGMYRMlx+AOdkg/
 1ZhSDn9ZvsbzN8wcYMfMdOpgRf0ABxEk+ilntvjDH8EJBL7WF8Tspt+fqkkxdVX2YuU7b
 F+nQcmMnlhWA7Ka1qwCbYFFQ/ir0rm5rjML4puUBnNVlfEZnXW261v9DLb3yRS9OlX00n
 hXO5M0WlE5XECUIU/iHBuCpTMbVl4ZdNpP8Kdao7hriX2tgjbJ+zja12h4iGFHOenIVra
 TUqtskCYXqq7oBaMCSCVXQQRPNEdMmGyO/DqD7MlPzXBVqJFZmiexYr9NOjUwBZXTYA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FXpRuHFy; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26FE460D7A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:59 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-4885a1480a2so551988f8f.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347497; x=1790952297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OIeguZZbFTpXk7IbNjViQ6jWFQfeigAV2hYu2KK7Mcg=;
 b=kgUvlURk94vkec3hlrUe7wL1Yfy/eGUQfKRlEiUvmB/9YyuL86j85aLq9Cf/LxTjrK
 P79rOhv5XqfnLeahcvo+FYgyHODb/I5nMFuj4VC4hDmMlMWr0A2CQ6vgXrIaPUx0BbU0
 xXVqn2XO1YtuoagEXLis7kHulVqggzChtowy9Jn8CM3RkSVSL/kBIZ4cyvGk7tq1jhEJ
 nk8TuhlFa7pSf86U9ShOpM+h6nHhpdhmgC6L1lMaZ5JpTplv56bhcx1lqCrQbO262IDS
 QXBdGXsJoXiz5TtTKLaI0V3Pf90xD5G3Rhyinkho1Zo4T7f3qplG10/sfYwLx9FqvS6U
 wTTA==
X-Gm-Message-State: AFuF++k4AUyq/08bxyAx2UotqZk7BL0Boo1CvPbIuxvZFSXM2OcjSAYy
 ClCaVR+bko6EEMDG0oHhOQ/c4F4mz/+6NxQsBA047gJ8UIpobYJB6RLEZ8ejCu9v3tA+UuTqS5A
 pCMolgZO6RQ==
X-Gm-Gg: AYBFou1hr9DTX+GnWQLUp+CsJxqQ3EP5L/UxxojsURalputbg4Y/nncyP6pr4ysz+Z/
 4CFCalQsDD/zS66i33NpOUA/bCQ8uFY8N1NvJGFkZcVTstxsWa5krbWq5W/Dfk+/VkhFf9mN1F9
 3I0DQBPxmd/rSwkA9zaqwBPjMUafAAx0fGb2j3KlK2c05pCf8eYz9o/OCA+zvKA19IxYkj97pCv
 KpBRjT7E6KjzrItXWFnTbEgJqeyYqbfVpWCFSMgBB3Kpg7WmY6AhQCa+anAwu6g73gwor2iywwl
 yzflXicouNzbr0QxzywB10nIaF4VevkKGLpIaTZpzkwTadLgSLV2a1otLZDAPv+4mHqjv331u1B
 xc2sF+FVFHaodgyMozY6Gnx9y02jbA4IYp6Og5/2aE63Z8r6oTjT7wuTwsEbZJvNLvK8MwGEyyG
 VsRPokol03X1WLWEQubefyZyzKHiTL6oU+nnWSgK5ZxLgd2wlVQUx67Y1hss5uQ4N8Xv+3rDrIP
 eHhy/lFGrzn48Zu8mqy7HDPV6D4QkeVgQtI19fXCg==
X-Received: by 2002:a05:6000:1a8d:b0:487:279d:3b4b with SMTP id
 ffacd0b85a97d-4887172030fmr10906905f8f.53.1790347497618; 
 Fri, 25 Sep 2026 07:44:57 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a354d57sm7238975f8f.14.2026.09.25.07.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:57 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:54 +0200
Message-ID: <20260925144456.4096971-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260914221145.1858079-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rpi-rgb-led-matrix: propagate
 BR2_PACKAGE_GRAPHICSMAGICK dependency
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
> BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER selects
> BR2_PACKAGE_GRAPHICSMAGICK, but did not propagate its BR2_USE_MMU
> dependency. This issue exists since the package was introduced in
> commit e821078031e14df69e5142f23e9cb7b5a1ea0e77.
> 
> It fixes the following Kconfig warning:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_GRAPHICSMAGICK
>   Depends on [n]: BR2_USE_MMU [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER [=y] && BR2_PACKAGE_RPI_RGB_LED_MATRIX [=y]
> 
> which occurs when you configure an ARM noMMU FDPIC toolchain (because
> we have noMMU, but shared libraries, so rpi-rgb-led-matrix can be
> enabled).
> 
> Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 ("package/rpi-rgb-led-matrix: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/rpi-rgb-led-matrix/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rpi-rgb-led-matrix/Config.in b/package/rpi-rgb-led-matrix/Config.in
> index ca945a92af..5088af3bf1 100644
> --- a/package/rpi-rgb-led-matrix/Config.in
> +++ b/package/rpi-rgb-led-matrix/Config.in
> @@ -16,6 +16,7 @@ if BR2_PACKAGE_RPI_RGB_LED_MATRIX
>  
>  config BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER
>  	bool "Build led-image-viewer"
> +	depends on BR2_USE_MMU
>  	select BR2_PACKAGE_GRAPHICSMAGICK
>  	help
>  	  The image viewer reads all kinds of image formats,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
