Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1DACD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 897D26164D;
	Fri, 15 May 2026 13:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTR4uzkAQTF5; Fri, 15 May 2026 13:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6DD96165C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852064;
	bh=TCPZo3SQ/wnkSaSrYVHyQKOxw5jtl5mzbE+YjmaSKVM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nINXtwOlE7WuKzsnuEkHl43n4XZwHBHxvI7rSXuctliJlbGH5xPGG5uQJel3GMte9
	 GlooySwoK4K4p+njH7hKEwlA4H3WL4l+91cUREz9urEVHE3HNXQqy6lOT2/v90vYx8
	 ctaBPB/ire5bwCv+OlXtWXMdwAb1q8G+NW2lMIljdPfxR1RwV55ILkvfdTxMT7R9CP
	 8DY9Ix+JDB7zCzKwCJFVd6qMJJGBTOBt6keYncqgPfAa1fwMN8pNK8XwfVNVQaWUOG
	 mRhodUr3UgDJ9GBo92NyP0osJAF742wR8N0SkZOqX6s5zPTEmsWyisg5JgrXFTDuI5
	 kum3/77VxU7nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6DD96165C;
	Fri, 15 May 2026 13:34:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B22636F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58B8761658
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kR7bsn8H_Svm for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BF7161649
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BF7161649
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BF7161649
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:18 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso82658375e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852056; x=1779456856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z1O9noyavVHtOX2X32KmiLEylbpxk3SnwUoo2pl6Kv8=;
 b=lsMlFOHr0CP6Ez6dcV8G+loLhMaD06NUvOqCEuNu0lA5fZdS2kWiB/OoI+w5DYgUDu
 1c9Pb78to0os2Asd1C7hAUZRZ83Nhs698CPzObdfWvhnZUPOEIDatp/jbSVYoy52/LL/
 XwfroagjVM8WtchzEvlKOcBUqb0sRbJJoJNbommryCFApB6iGcQ+csAwTnMldOM9QR3a
 JDXIHYRitQlKsMZX3ifaz3I0+boIBOOXe+reqKzvu1xV0YZQHrnfdCuaNdCcLBq9602b
 I6x8sn2XyhSicdKoi00NvUOK6DlkCKNGkR7fBfnfblVcaRcYKSsRYfH2T1e68rd+7RQI
 U2Fw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qc4G0xDk7sw/d6BhafHktaomH+CfUxR54oHL1goqyeGBaPbU0jFMYgSF3BBWS8jRhmFTic3dYjHU=@buildroot.org
X-Gm-Message-State: AOJu0YzCi/W8ga9/7qz/xYT1zg1DIDL1v8JHPjhosQdXIt/4WKrZrrFJ
 RG+0XQ7XOMb0UW8Q6EEPBSSsmY6wQj/OIEWNMmkOgoJ/YUUqt1XFbDmZX5/rxvlJTeT+/kEhuGb
 7610n
X-Gm-Gg: Acq92OE+P641Q6aY2Ycg60ThyFHY/dzGFdbfIw/mVkrueHxJy5vfalspiq1ntMdK7L6
 Sb+HFU3OcQFhYYyZioB/d6Sk0qWPvEu7A768RhNWq2zYl+Zqfz/qFM2s3oIaAzJAATlMzyaei97
 u86N/PtLXZIMwLH9u0r1ZCoGc4CGm8ar3zH4gPEcPMEal8GZuJuETYhHUDAHruWqaMrhiDrURV0
 Il2NW+i9ThlShcpA4Az90XtCpIuAWwxNM+10/Ok/f/MzNMhEMy4Ng0Lb/DnFRJ+D4iGjcW+JLp9
 iHUj6fwZvkOn2CSZud35TzdL5y0hfDdaPodWsL5rSjIPdSTXmOKKI5TJgd+j+L1CgNMwsZJHgv8
 yTmiQbizd6Y31yNpz8Ry6jKbm+mj4ZrFn0pWJNhgXZZMU5WaoRwSommkPdc5QiViupHYJNGtnnU
 PWegv69KXQDmDKZBJ7wi9sDardkCz3vYKEtKux46HpsPexAlgNJaAJVsY=
X-Received: by 2002:a05:600c:a00f:b0:48a:5301:bb5c with SMTP id
 5b1f17b1804b1-48fe63263dfmr56573775e9.16.1778852056215; 
 Fri, 15 May 2026 06:34:16 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe222bsm11932931f8f.27.2026.05.15.06.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:15 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:15 +0200
Message-ID: <20260515133415.316667-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430183544.2362642-1-bernd@kuhls.net>
References: <20260430183544.2362642-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852056; x=1779456856; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z1O9noyavVHtOX2X32KmiLEylbpxk3SnwUoo2pl6Kv8=;
 b=iNXESOijeldeCbK7B6Z0Gnw0Ylm95zvXHv0yjVJ7Cn03Mp56Xm/AEj3d0SuJmGicGR
 vYzA1va5vawWoJoG9ZccvLZaIXtsqY/hEglhENw0g/oN8z9KvY8wrF5S8jYaoKJ8iIkl
 gmrocwTsBT6ZodReJ1/sCwmJGQTxI6lr7CtDAn4suqXLTE4tOFPPxQyZSZDeog8kqm1t
 i8+MHkIN+aJzI0nrMkU8GBMWbnVm7IjKoJgVo/IMzIfTsxaLLYn0oHfbHNLhHMjL5gfh
 +GxVwDOv70FfHXdh+Q5D3X5IdOl4pQlrxKA+rJeV+YN5JwqJhbaerDnIoMoL5jf9uYLx
 6bJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iNXESOij
Subject: Re: [Buildroot] [PATCH 1/2] package/libpjsip: enable parallel builds
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
> Parallel builds were disabled in 2016 by buildroot commit
> 781ce19d746efb6a5408b4d50b30626784eff324.
> 
> In 2020 upstream added two commits which fix parallel builds
> https://github.com/pjsip/pjproject/commit/ddf48e2045fa155ef5242d9d7dcec27f8c5ed873
> https://github.com/pjsip/pjproject/commit/78683646c8bc670ec730a42494e075f671a08e28
> to version 2.11 which was added to buildroot with commit
> 2c7ad667ec4a25226848baba809e492ca0ff06da.
> 
> Tested with -j100.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libpjsip/libpjsip.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 8cea8e3abc..38adeff626 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -13,7 +13,6 @@ LIBPJSIP_LICENSE_FILES = COPYING
>  LIBPJSIP_CPE_ID_VENDOR = teluu
>  LIBPJSIP_CPE_ID_PRODUCT = pjsip
>  LIBPJSIP_INSTALL_STAGING = YES
> -LIBPJSIP_MAKE = $(MAKE1)
>  
>  LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
>  
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
