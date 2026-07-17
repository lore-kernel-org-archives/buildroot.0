Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B50DC4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3746F40845;
	Fri, 17 Jul 2026 15:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgFrIT0DkZgq; Fri, 17 Jul 2026 15:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 366EA409C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303221;
	bh=bi9Su6E3jabdsRvaWLkdNM1wurxKilA171X1X/L+Xg0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AuNw5bTthzpthgUpkXF91/mbMe3gltWPDGhiL2A1E63aZfx6ZeLSsFOkDGLcCtBnt
	 i1FsQBbFgxsNkKzBBLBPy8tgTidZJfbsqYFaG/2tTZ8NZzRrExTXgDtw3YhBpUI9w1
	 bvaNu1R/p7FKJju2y1z/2yhHqEH5C0iMvjVx886eYgrQabZdoQZZd3aGxQ6o5Iw28S
	 /Ovo0+qvcsCwau1QqE5T9MW2ckywoG6i230VtQTtmFcmKC0n/qNu62mNrFrfNaO6cT
	 y903WhcWaXD2rE2duzc/gUayYfnJ/hzgpcLHrPZ7kxYi4yHGXjKU1PwECuFo0knZK9
	 ezxxszk8jt/VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 366EA409C4;
	Fri, 17 Jul 2026 15:47:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1CB41F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D380360AC6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhUVQvKWxdOe for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CACA6065E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CACA6065E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CACA6065E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:46:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so1539505e9.0
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303215; x=1784908015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eVCrFlLAR3qKXE4Ob0XH1/FFzXamKuN7t0TILD89iQQ=;
 b=kRYVUBdfIl3qFSXTQsyQ9TTnth5z9KlkjUPG4rSUYKaFHNy1JFFAphE5E1Y2Lcn4Ag
 GGo6/57dhFH3flxDSUx0SsatHPG6j+fzYt0ma7v+5BoJQWoQWScULoVsmv3qQA9981K8
 IQiH+8h7eqB4NVOKOW2TdHk8i+Ruidl/ckQEH26ymeBRTiH4UbjtMlbR4SV8p5zuWeTR
 yBJHevlwmgI3jKZCNbk1abrEtBYECgiilda2c+vdOl4qRkyrq3GZjyOoQmkzOfBTUTBt
 4Y2BjmO4axee7UKCvGCBJVmYAV/2Inq+TLBIeKqKzwn6L8H0JgGNjqfa9uuwTSQDefP8
 /UaQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr5g5a7f6juSMQIv8Pe3UacJPuRXVyopdTFYbwTH0NHB6WYDvrlrIFHcGeevO2EDbnyjyOnGVlL7Kk=@buildroot.org
X-Gm-Message-State: AOJu0Yw0YVFepODm+sQvTLGYH7yk4JzZnFHCj8OYFhD6FwWxKi0bxYzL
 PiCKBuvjAq61Kx3ob60zQXnd7eznw3BZIiPnsUz/Lyji8MEuOwo4r3TzQDseZz/8uvo/CLoOUJR
 7XGT5
X-Gm-Gg: AfdE7cnMGOAl5uJQTA70VLZwfOUh/HrPcgxFyyxfPQCujr1MVXjNwizOWduofuLHPoN
 vvs47o+PwK05QdwI+yLgeZasxCdxkLJYb4FaP/c015Xg4+nwjmZlr14kpo0MrJmOj86PpiF1ZU1
 Y8IJB/SIstw1V9m7TteTejWlHVgpCOUhw6fQBMgKDx59QIo4AstewF+5Uql7tdlB8c68HaBjMTN
 AI10AFzXV/6hK8IYTPW71l1efmh1lqiJir2W2rt3itQMBB7A/ow54pTYZl9lLr+lrHXVhYMPibL
 oGjn00sIj6H1URcYvbv0QSSB2mjx6USh6HCq/FeBTYxWkOWgzWVhUuDeC7vQZQBy9xW7mN2F+Fx
 TVGmDvuIEoUubzAgaf7JKk57uX5vqP8vJbq8aiE2PWlnz+JqxO9jytxwdWdwSFO9xG59Diew=
X-Received: by 2002:a05:600c:4505:b0:493:f176:dc69 with SMTP id
 5b1f17b1804b1-4954a413087mr38410235e9.37.1784303214991; 
 Fri, 17 Jul 2026 08:46:54 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e49469sm4617297f8f.7.2026.07.17.08.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:46:54 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:46:54 +0200
Message-ID: <20260717154654.191127-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260112082950.2528445-64-bernd@kuhls.net>
References: <20260112082950.2528445-64-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303215; x=1784908015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eVCrFlLAR3qKXE4Ob0XH1/FFzXamKuN7t0TILD89iQQ=;
 b=cQqMXco/gZI4mLQu/T9DClCNhfw4TZSvqpSHEAe+nuZ7E77DCfte6FwJtGopCZ1eCR
 DR2fFRZ3um7L1uFBwfQXqYUEuOpMjVAIG/xhbS5qTVgfoA5JQxXhGxygtxwOdS4YAKlE
 DK2IH7S2/oV3gTvSGQ6RQ7Rc1Cf8aNZMNNcaX3pqablmIFUhMjT1HNzRQIWle+GJFarq
 zGseaPV+1BEXol6YNL35KVnsDRE+67Ga9pDi+734mX/7yLzGcwDZdthMldFHRuHoOul5
 /UNNlVCPnp93AXFdTA/7YGX0805fIMBPEagZM7YiGq/rXeyToAmCe9MaWT9WO5ToXSHW
 gsQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cQqMXco/
Subject: Re: [Buildroot] [PATCH 064/102] package/x11r7/xlib_libXfont2: bump
 version to 2.0.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://lists.x.org/archives/xorg-announce/2024-August/003523.html
> 
> Updated license hash due to upstream commit:
> https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/a3a85df9a65a5185bdbd47823f336c4cb3fa14c3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 8 ++++----
>  package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
> index f2ae5925f8..4f50b2dbd2 100644
> --- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
> +++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2022-August/003203.html
> -sha256  74ca20017eb0fb3f56d8d5e60685f560fc85e5ff3d84c61c4cb891e40c27aef4  libXfont2-2.0.6.tar.xz
> -sha512  24d6baeef8dc2ca2730925c6b790a97f4a3f46ea7b4d908555e7df29cee6e27b63d638b50c88dd30c853cecff7d9b079402cb617f4498f96410c5770b8815cbd  libXfont2-2.0.6.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2024-August/003523.html
> +sha256  8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb  libXfont2-2.0.7.tar.xz
> +sha512  f703127df5d5b1093c9b73e019153ed7799523573d52e61d344209f0acfd4df42e11be12bdd1880479c47c2b70de581a4f2ef74e199e9b1ac438f426593d56b0  libXfont2-2.0.7.tar.xz
>  # Locally calculated
> -sha256  97e413bb4962bbb5773085cd5405502bf1d4eadeaf98ff5be015eacacc840462  COPYING
> +sha256  3b1047f0d45584973866a40e3eedc74aea4c6ac636960d650ae05af603e6d1a8  COPYING
> diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> index 7f90f67046..c95f6c6395 100644
> --- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> +++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XLIB_LIBXFONT2_VERSION = 2.0.6
> +XLIB_LIBXFONT2_VERSION = 2.0.7
>  XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
>  XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
>  XLIB_LIBXFONT2_LICENSE = MIT
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
