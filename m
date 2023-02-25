Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52021C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F406440B4D;
	Sat, 25 Feb 2023 09:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F406440B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGomu4UKbrUw; Sat, 25 Feb 2023 09:52:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C3E140915;
	Sat, 25 Feb 2023 09:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C3E140915
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F29C21BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D999081EE3
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D999081EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nEiJKsZ99BdD for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:52:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9415B81ED4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9415B81ED4
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:52:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C2E35FF803;
 Sat, 25 Feb 2023 09:52:11 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:52:10 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230225105210.248b646a@windsurf>
In-Reply-To: <20230223125612.3156012-1-thomas.devoogdt@barco.com>
References: <CACXRmJhC6PHB4HJbj3rYQyoH=xSY6Ua_V8-+57G7LrL4gcGBPw@mail.gmail.com>
 <20230223125612.3156012-1-thomas.devoogdt@barco.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yQuef2GMX84Y1rChBsyVD5nKpIqtq+9/sL0VS9uIB0=;
 b=GqXcZyTaBPsInf9O/2YpJnHoOdLyTbH3cQBPAA9z7Jhg0EnLfYTi5PWwCZFd1Wy0eTGhQS
 zhzTouYDFtO8WvC1YZhdIpsdn+kcQxcVNjIdDWqme3qxGFVLso7WZzmQEn9ufbWsU/7q6k
 x3E2rNPSxaeXY89VXHleQMucclozZ43tk/sBeoESXuWaTw62M0Ys0J+5SQFG53aHFyu1Tb
 YdGwHDA7rYDs5MLmuJMsT6e+Pbc+k63gKMKA1+T0Gudw6Zp5G58jK2c+KBfv0LdggB7jgG
 MD/t1J0fqsT7DreBggOAt2+x4ZUm9/+JAASwqECzgw09qGFXx4iAHI5g5UxXZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GqXcZyTa
Subject: Re: [Buildroot] [PATCH v4 4/4] package/libgtk3: fix
 update-icon-cache on empty directory
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Thu, 23 Feb 2023 13:56:12 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> If both, hicolor-icon-theme (selected by libgtk3-demo) and
> adwaita-icon-theme is not selected, then the /usr/share/icons
> folder is empty, causing find to fail.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Thanks for this work on gtk!

Could you please always resend complete series, even if only one patch
is changed? Otherwise, it's super confusing. We see just PATCH 4/4 in
version 4, and we wonder if the other patches (1/4, 2/4, 3/4) were lost.

> @@ -146,6 +146,7 @@ endef
>  # Create icon-theme.cache for each of the icon directories/themes
>  # It's not strictly necessary but speeds up lookups
>  define LIBGTK3_UPDATE_ICON_CACHE
> +[ ! -d $(TARGET_DIR)/usr/share/icons ] || \

Indentation is not correct, this line should be indented with one tab.

>  	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
>  		-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
>  endef

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
