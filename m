Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D36CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A62D40B17;
	Fri, 16 Oct 2026 15:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id magN0fTAeSgV; Fri, 16 Oct 2026 15:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F2FD740C47
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163167;
	b=powWuA4OCYEPQTJNjT8CbznZrL6Z9BS+gq46gbLa16xfS4dUL96HevcdysUkLaI9x6vg
	 c5/iGBljfmrmX4Iu99SvzJOpUk6Jl1EkHkuUu2i5FqYdys034tcoK2JKuJ9VpohDh53Zb
	 TesCA2oamq6sk2qk+Z6NBeHtgHnCS0UUVKwXsKPIg3/e4Fl7eYVNu4Zt4IAE+IdtFsjbO
	 kINz6Vm9dPF8HcdNpOvvEj+hRT647t+1MgjMlfnRIjgKtPbPY6ZsdQgnEw5/gQwhmoT97
	 NmSNiwEmamyNqD4UtWnTmY7Voz+6714Gr/BLhoi0r4vE22ef3AxBbOy9Vb+E1ndO8mQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3vechoClie7FCjlzhTM5ALncwYdIcbyp59wOtbbOiq4=;
	b=kB4BRjbjfOl3v+9uQUNp5eA268yetl7aILar9o/H9O4APp0fism04gCtF+5wnLXqhWYv
	 xJRz7FygT8aHlkwXyoUgj3fCaLz/g0JhRkpAtc5ARPhPja69XRC1PeLJgNbsON1a6bD+6
	 O4pQkXB5lTkxBTLyeZU8Lcfs69mYZUoCfHzcAVM1VMwPYA6NS4DrLvTJY0wK4fb2ewatl
	 h43ccc03SU6EcIb9Ucvs7i+Bko8tfEPOufQ7L/IwFiWzXBz1x0La6/j3kH9DN4a20ETrI
	 rEc/M84mHfw1C6T2TuQ5gC7X/65CtuUG8cauTn6gGJIpnzRLIf1lmJ8JXLpwVy2zkzQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163167;
	bh=3vechoClie7FCjlzhTM5ALncwYdIcbyp59wOtbbOiq4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K4KqxvMexIiGazPWw0a6uwuw9zIjjX2D4DxVm4d4uvSFsGRCZQHkTmUn96YqhUYcp
	 0iBXdTXLc67AeesJcMZhFsgvT/ewd3esjUqzyY9mNzM3y3xr9vGZysnuO2dqPmvgZV
	 7q+rLLdsf43E/SmYQOMqfknvNt95CXVQjMYvqR/uCZ+CssoGjqAwrPzYll9HxKCeO6
	 g7Z01dTdmCeKlFbd+9umpr8NHY3n5nc6EKx/O15z8nFaOWLWzjzZv/z7hIDLK/i5ch
	 I5t0qBhmVQ+uyET6DE6yewvP7y/ywQNGXF+LL5pyv8ubideJ+Ulm3Fop5k9fefHeYi
	 FiUFeiX92mxLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2FD740C47;
	Fri, 16 Oct 2026 15:06:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19DDB7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BFC281759
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0KDQMLKTVDD for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E1E2A8175E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163163;
 b=S7KWsaweEAwrishMcezvx9SiNCygLWGTS31gJQrYGgFbUr2BL2wmwPN2inrS0/kP/bt7
 lW0o82VzLJcuzhDDC1VS5j3fp7e2vCJt+bwXm+MobsZTQtq/21Llon7e6IEi0J6ZoOtuu
 bdMluuaPeTsOxYN1od9HvgmtctoYye7KEiAMORoSaQAZcGpfahcI3ILtw8N7eEy+xQHR5
 XNKe2Rl+94J+H6clkDw97R8AnR4oTvmPAbncJQ3dUf/0xXjmnjdVHKsRO3h0stzXsPC8P
 1gU2nDX5ikCKAR/wPaxzeFUtae7l6P4pA9RIop4VAIDwjaNy9b6rZ7HmBQHrWdddiRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163163;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=b8262iiwY7bkq8LVyP3sqg6i0RhM0BtZHrZmSrwObdI=;
 b=rmER6fdXKqv3J3gBiy9u+YyjPnpaBJjVfXmTeHaVsRjPlOMe8eUagonQUgk0lYLapSpR
 iyvOcyDwmPxR6O3keSE8aKfsra64Fp7opUVhmPwyQfBymr3vXgfetKZugRmQx/fYb6UFD
 9Kb8bu4FW42CiAXkVggGIX9m5zvYEAJLgpBeTjUDEqP0rrbeSQy7ZzI74j99YXOM4WPIN
 1fLbUFuWl/c7OcGIHxD2M0qPnUqQv+0fhHRZt6HFnOSDMe5bHBqcTClWcEEXZ3eyVe3Cn
 bua6R2t4mtZ0F16/92s42n7MOc9q6aFQ63KkKA7nJ6u0WcB7ysL9PjiO2VS6GJbbQqg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Xak8tuKP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1E2A8175E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso335945e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163161; x=1792767961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=b8262iiwY7bkq8LVyP3sqg6i0RhM0BtZHrZmSrwObdI=;
 b=JoE8WQQAR3LiXKYtCdgtxLkc8ESj+KN0+FUIKEmouOV5eLZH8NynQbEwetykuh7+mS
 75OT32FJgQxoGmkBWVDxEj4Bu+oKfqMs28kNC4In0emiZQ9q9vVo/cafuVBzr8EI+oWc
 bl9N8cXOntjXNLqHPe6rAijpKJ+iab9dpA77keClE4xciL8uYVyVnk78m414vCXVOfvz
 bc2FS95LQyBH4QGNoMlZDm5LXhQi2q8/SF7WG8FuXbHiQ6z7e8ToB7lRkBiZ/HafVP7u
 ab7xv699nOEQddr7l2bXpWqpzTxtEWaVXjqaUt8ZMrad5u4J+qMJQlQx2DUsMH94YmXA
 hfHQ==
X-Gm-Message-State: AFq9FYJyq1lPvHwxFROHEn+DcHwyKKosqOxewPHYDoFsomS8uYqIR2HL
 G5br1NHfK/+06MuBoD2qY8kyWWfLQ43BPMr2kNOkvlh533mEMLEncHOlj2FfIUR41rl3vo7hO/Q
 WS2jyKc0=
X-Gm-Gg: AYBFou3G7B+UsvzsF7JbrlSgfjSEyWBkGLaOLun/JQZCaTxoRPg14Ry3a1IZfNO4rOw
 XO5QewNfEBUdwKeZjg2CJNBUiRQ1vMEEgxDUcdexvQhDZbpH02Wk59nzerArHNvs+JWsfpdzHgP
 TNfj/sRswhPB/hTKkphM431lWC5jjP0epulYmxl0oNETOQHstie/eUMDk16Edcdtp9pUtg22fJQ
 hoKndwClcKMP5Tvqm+GaxaElKTqsnkX26lQyXUO+B386yHbfJdxd6kt0PM1A/i9cFuxQxWAhwcE
 Ah0mF0jdJ8VYXv9uxDtKOS2Kt2UXHKIJug47r673xo/oiNCJv3K3NFODfPmdhk6asPK0Zj5P+2R
 sAhvYjO5CHK/d7thschYmXVE4K6aQXZUQEafsDWml3H5qIfU0F+9eFglI6aPSF8SzWNjEXIKab5
 NZ3dMg/akWhN5lGIiFdSoX8peBT1e14Q272D3jT0abSrNRUDnqn+ULg5tvqUY2t91N6Z5zGhA4i
 7tvYr1iHWOU55DUSg84RPfRQsA1vVS3KX5TGf6b2g==
X-Received: by 2002:a05:600c:19cc:b0:4a1:70da:3350 with SMTP id
 5b1f17b1804b1-4a1d762386fmr1377215e9.32.1792163160785; 
 Fri, 16 Oct 2026 08:06:00 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8a81587sm127848575e9.1.2026.10.16.08.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:00 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:57 +0200
Message-ID: <20261016150559.75709-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009143448.1559850-1-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/shadowsocks-libev: update the site
 URL to shadowsocks-c
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
> The upstream repository was renamed from shadowsocks-libev to
> shadowsocks-c. GitHub still redirects the old URL, but the README names
> shadowsocks/shadowsocks-c as the canonical repository.
> 
> The v3.3.6 tag points to the same commit in the renamed repository, so
> the tarball and its hash are unchanged.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2026.08.x. Thanks

> ---
>  package/shadowsocks-libev/Config.in            | 2 +-
>  package/shadowsocks-libev/shadowsocks-libev.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
> index b5be19f939..939bf5d2bc 100644
> --- a/package/shadowsocks-libev/Config.in
> +++ b/package/shadowsocks-libev/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
>  	  Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
>  	  embedded devices and low-end boxes.
>  
> -	  https://github.com/shadowsocks/shadowsocks-libev
> +	  https://github.com/shadowsocks/shadowsocks-c
>  
>  config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
>  	bool "connmarktos support in ss-server"
> diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
> index 778daf37b9..75c0d58be1 100644
> --- a/package/shadowsocks-libev/shadowsocks-libev.mk
> +++ b/package/shadowsocks-libev/shadowsocks-libev.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  SHADOWSOCKS_LIBEV_VERSION = v3.3.6
> -SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev.git
> +SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-c.git
>  SHADOWSOCKS_LIBEV_SITE_METHOD = git
>  SHADOWSOCKS_LIBEV_GIT_SUBMODULES = YES
>  SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
