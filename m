Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC3ECD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08EA584558;
	Fri, 15 May 2026 17:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nz6zjVVOJIeP; Fri, 15 May 2026 17:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03CFD84683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867215;
	bh=CNbu7H62y5O7X5h3/eUcG/6L0ASayU7/8tQFdLE6cA4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N6Kll7xdXnN7jGe2uO/FOMlHVouRm/MV4hCDi2SV1U8kbXEJ3YoIw6GCYhS2kYvmt
	 DI0MJEXB6sMJW5NBJYnJA4y627WbFFG20svzrUutt95fZL9ufr0WGDdZu+73WypnKG
	 g0MYO5m3mCBjfGJoLihXf5Jlc7YSgwSBeyQ+TtnT4VVR65pzjRX93shmP6MJmWprx1
	 BG+XD5idtx8X+aSaiboktBuvtyLnGF0EhNvumqQYaUUkHLc4jUychPEgdmdNkm2MaB
	 g1zf3eS/GNBd+B2frlENvSynUBjK06JaiSm4cTpTbAZuSk40ZfirZGzqdHT+P8l6EM
	 WCDG1kjhcZDvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03CFD84683;
	Fri, 15 May 2026 17:46:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE4CE23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A449140FAD
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxAYflstdzA0 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D81E40FA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D81E40FA4
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D81E40FA4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48d146705b4so860875e9.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867202; x=1779472002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JcsTDF2ZJs643JE2aquN3x6HC/5iGBuEOzQGDk8s/6w=;
 b=nwfWPpnaiPrVrkOxncYegnlNIuqU/J9KT+f2ETUuOvKLF9VXb0DynYKWg7uCqlccec
 Q1g0JjJY3hwq90Wj2/GFzyeHAI+6SoQsa9xyP/pAw/G8VQD+VFD/aG1Xqcnf4o+J3jLI
 Lne7m2u4+zca5zwaq/M+yCfVt9C/dvRotfaaIDOXcLboYtm+mlGUAc8sfjM83HntE5Eh
 wwhQuph+Z/2FEA6XfMskokyLGq42/thm4HUmQ2qSUJf6onSk9z/HtdWwjxmdgGHWP6vH
 wv0zy4vfxXHUywNBzt1ZtvyTigGowoVjEWa8UWOpJDUpbAGo2wsTugToJ4nSV9kPfQOU
 xYpw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ucpSVZiyHWDdF6viRJlQAMhv/MaMLN48v5a/Yt0nX1XwXxGMTwoEVGBr/xbHloeN6UqX+vcHjseo=@buildroot.org
X-Gm-Message-State: AOJu0YzMFPseRdScuLfOWi6Nw9f8i19JD3WLzvj/R8FzrRG+07pdp7Xh
 VszUAcdrLYfFXkjNXXpHv4JPom+ViN8L8SLgjZsCt9rdEadB2vjD6Ms/0POpvKOzIP3TJWM7e74
 NYSCm
X-Gm-Gg: Acq92OFPsJr46yD0gqbdnnaWFaxgsIKn9nsGmXKwiAAQQ1ppXcby80OxFStoT46KPdF
 ACpYjxTTyOuwL/8NMXw2NVa/EGsWyo+TDD6GpAkZhO9epvvaw8OAL6z9Zh5WCcm+Etx7y1QBKM8
 j0jlcgacA4SNhS11xiFAqcBNTm6186ZxWeCj0/v8Ye6Sy3wAdufXNTD8ZxwMUav2N9qR9zzUIUE
 dMRGKbbSEIUKHuHqcxBR4vxqCmnJZCGgcJ43mAuYhPKNTfl6kBGNKutsjGqda6ZdmDCVsYbmDLG
 6qMfjP2iSHCyfXSuQIgtSkr3suTr8HjJNPuTZk7o7kBY0ZCVza6uAEatDStJcn6IvZqTHbM3Qhq
 /E9wNkebQ/erZ8TzN/ZxJOYDZwxj6OJI6cgpARK6vbR25WRB6lgUAnEqse/qKmFEoRe1Yuo6rvE
 GDgPb1zG8qDcUGrsoF58HrgmsDTgLHBfq8f4xfQoyb7lya
X-Received: by 2002:a05:600c:a08e:b0:48f:e230:2a23 with SMTP id
 5b1f17b1804b1-48fe661ee60mr72152815e9.30.1778867202303; 
 Fri, 15 May 2026 10:46:42 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4862209sm76873355e9.0.2026.05.15.10.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:42 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:41 +0200
Message-ID: <20260515174641.530469-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503232504.3712616-1-fiona.klute@gmx.de>
References: <20260503232504.3712616-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867202; x=1779472002; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JcsTDF2ZJs643JE2aquN3x6HC/5iGBuEOzQGDk8s/6w=;
 b=Y+KStFGG9vxbgjtD2XbB109Kqu3RO23fuXHPF03+gY0Ke7KlytR8g3bxQGJzerCMqt
 dUMwPzwgBMCNdNwWCHx9zfUio1Uz3io6IlVZnfINnvF9vQvAiyNC+Ec/kBnpR2DcdGZG
 IUqtLmXoW1XNOOXagTbIS3jPHwVT9ybVZE4o9PQXiGP2Alb0SR6GNk5crtzdXdDk43ay
 t2easwvXYihZ40J6dJnCWTVQkw5AG00Bbloo0kBqclEdKhHEMyUWcv5Khi8W3Dk+Q7wZ
 3NLkv061/NE614LR5OoVMxXJJMHmt+FhwEFCDECW6KFh6PnSQ4jQazhHSXlqkvpfhD16
 6L4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y+KStFGG
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: explicitly configure
 PID file directory
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
> OpenSSH checks during ./configure if the default location /var/run
> exists on the build host, and defaults to ${sysconfdir} if not
> (/etc/ssh in Buildroot), leading to confusing errors. This can break
> e.g. in a sandbox with its own mount namespace where there is no
> reason to create a /var.
> 
> Explicitly setting --with-pid-dir=/var/run overrides either default,
> and only logs a warning if /var/run does not exist.
> 
> [1] https://github.com/openssh/openssh-portable/blob/5fa60ae0d2ed3fc441f54c9349afbd63b6301929/configure.ac#L5568-L5576
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> I'd actually prefer --with-pid-dir=/run, but /var/run is what
> check-package expects in init scripts so I'm sticking to that (even if
> one is a symlink to the other).
> 
>  package/openssh/openssh.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 607af7456d..8f46d886dc 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -20,6 +20,7 @@ OPENSSH_CONF_ENV = \
>  OPENSSH_CPE_ID_VENDOR = openbsd
>  OPENSSH_CONF_OPTS = \
>  	--sysconfdir=/etc/ssh \
> +	--with-pid-dir=/var/run \
>  	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
>  	$(if $(BR2_PACKAGE_OPENSSH_SANDBOX),--with-sandbox,--without-sandbox) \
>  	--disable-lastlog \
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
