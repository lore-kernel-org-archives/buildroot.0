Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC56DCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6DCE84578;
	Fri, 15 May 2026 17:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwG0toHyATrv; Fri, 15 May 2026 17:46:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBB6084553
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867163;
	bh=/vfkD5tLfUv8SxvSxDfAIx23qHCwFkFwDt2X4K7+Em0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=amvLiwml8zcQyV0HUSlE8bnti46pvGzxcIPKqurdkQqAzPmLrJEUiCQYtttUOkcEk
	 dyGIPpyUEt3tx7D10o0Nx9eLtkXjUM8XMe16FqkbiRLPlnw6b57LPJ6/AU6IAVQUeo
	 /GyH56JgEZ372ZNs7Ed5xCtovdjfiWeExiq2cPeiYW6un39ajg3CN76DFNwNIpDtaX
	 hSpQJJjH8ubJD6jHjY2aZabf1BS38SgU2fi+mzZVY9MqodWxHAxxB63aw852IFu91L
	 b1P4EQqPw6gsnJVkKBue+4MH8Wm+BLoHNwohLsvd5oKlpjG3BKYDsoP8OhJ4jdJcuV
	 zX9N7LyIU3/1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB6084553;
	Fri, 15 May 2026 17:46:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C167323F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B310641D63
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0TjJGgtZhEW for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF76C41D27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF76C41D27
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF76C41D27
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43d75312379so802038f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867158; x=1779471958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xEKmXgd6KZ3h+e3VxEXsGGcod0gLgIm4l/AFk6Y6uGs=;
 b=l80Ntwtdwrsf7jdiM1UmkY/wMcgA2VheHqltXYRXJ5klW1Zh2r3OpnEVQha0iYAsAL
 +R3sYZUJQ0gmLYl9QOB78Y7RaafLbN2tFX8T87cQXdfEjHIz7bQ4C5bYpN/OAmIEyAGl
 BYiQ+lM28mK6P8gbhPt/pp02DyJ1lgf38oNGuLNGWr5VMzjGbw8TWeP9lWEENlMGpzcW
 HR9zLeW2N9d27Lwhy9dK5+cn2xbU5GxwnCFMDIWFv+zv0gIbN/4nhsbIMrON72SRyF/l
 orUw/TBKkkXpudgjh9fsuaOvaTRyz6/p+G+HO3PVBLy4pPXJEkmecztR3Kh1XTvCRb63
 e30Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Si+wPn/nU7fQrWEdbFy+9JYNN3VFlVaAeoxvQtU+EOsFRpoI/7NuvIHQsbl6nAAWB4eMCYm2zWCc=@buildroot.org
X-Gm-Message-State: AOJu0Yy/2rpZ+LyTEOegJ2yqYcQbg17lH0rEzKLGbHObkfjsWbJVba+F
 kQz2ENaHJE//WGu4OaC/0aIp5xV3jjAgdZkN7dMWsWQAXs7TWZ2iW18d/2wv2cWg5EgmUs+D8DE
 ZqX/e
X-Gm-Gg: Acq92OE/49F5lfE9wdFM64ZxhLgnJkZnOnPoJJKuAkiQeOoaheNUlbX8sTCMZDJBYWj
 zp5n4PWk7rQOYarX3SoYO33YrLitAKtmz77wO9ODUmScBZyQ79MG5p3q2KR0wCdYKvAWc2j6O3L
 eW9PbvYyeQcQAsBtzx4bE5SzrDfkpxDsDCiyZyBfPFwKqib9TqTuSGTPvQ+0lEXFbIELDYG5i/L
 3QfnSeBwmNFxsIPcwQGg17p4S6IpXMPisuYw+DzRNOQcYv0YeGSZKX5wRUzhUk9uto3v2HgVebs
 VIxlafAY3pMDaC+cNy4O/n/0iwDwG1zvV7rMVIj/pUScHdpRiPNDpk0bahn080PHa88azkuymq1
 v3qLI77HluvCwFJc1PMhKcFJtQFht0y2Xa1uJN3hfuY3zS0vYpdRDIvgFwW5VizpAINqfox+D9I
 7bdneYw+WeFJ6W3OCtheIjp01rZyWuPk/WaStQFQBaOcbT6HvZugit3RE=
X-Received: by 2002:a5d:5850:0:b0:452:f380:5508 with SMTP id
 ffacd0b85a97d-45e5b681925mr7378870f8f.0.1778867157674; 
 Fri, 15 May 2026 10:45:57 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec39ff1sm16706518f8f.10.2026.05.15.10.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:45:57 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:45:57 +0200
Message-ID: <20260515174557.529191-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501002320.1761716-3-fiona.klute@gmx.de>
References: <20260501002320.1761716-3-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867158; x=1779471958; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xEKmXgd6KZ3h+e3VxEXsGGcod0gLgIm4l/AFk6Y6uGs=;
 b=UegyrRQ8OxDiI31I/7mDjmBbX9dKxOMInwenYMpDOC0JN+YHqMpg4JEhIe9n/+AVuu
 je4OGxYM7PhSIQldHQc68SUPpikc2ggkPLYmf/whVlqXpJqcLRte7nKFQS/2EM4xb5eo
 L5lhvg0GGdYXFGseGzGdti+HyGxTJGMBehCv+Wi0uLlKDNe7kCD+V4XIzr1VvozYOg4C
 tiV8lzrssi5/ZpHZq7alTg4ndZXS4ZUkiQe4FrPZw8ASVOycmrW/bP/yKWt0WOEF4i8y
 yGflD8ilL/rpCIEZkkkOJx3MXlWMC5866mCPXz9iRl12A4ycb+3RNT51wR7y/OqV7CLX
 eQ5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UegyrRQ8
Subject: Re: [Buildroot] [PATCH 3/3] package/eudev: fix install with
 BR2_ROOTFS_MERGED_BIN=y
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
> Eudev install creates a symlink from $(sbindir)/udevadm to
> $(bindir)/udevadm if sbindir and bindir are different [1].
> Unfortunately the check considers only the configured values as
> strings and does not resolve symlinks. This means that in a merged-bin
> setup with sbindir=/sbin (symlink to /usr/sbin, which is a symlink to
> /usr/bin) and bindir=/usr/bin the /usr/bin/udevadm binary gets
> overwritten with a link to itself.
> 
> Set sbindir according to the merge setup to avoid the problem, bindir
> defaults to /usr/bin in any case.
> 
> [1] https://github.com/eudev-project/eudev/blob/9e7c4e744b9e7813af9acee64b5e8549ea1fbaa3/src/udev/Makefile.am#L139-L140
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2026.02.x. Thanks

> ---
>  package/eudev/eudev.mk | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 1a56cfd2f0..3c22b13d86 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -12,7 +12,6 @@ EUDEV_INSTALL_STAGING = YES
>  
>  EUDEV_CONF_OPTS = \
>  	--disable-manpages \
> -	--sbindir=/sbin \
>  	--libexecdir=/lib \
>  	--enable-kmod \
>  	--enable-blkid
> @@ -21,8 +20,14 @@ EUDEV_CONF_OPTS = \
>  EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
>  EUDEV_PROVIDES = udev
>  
> -ifeq ($(BR2_ROOTFS_MERGED_USR),)
> -EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
> +ifeq ($(BR2_ROOTFS_MERGED_USR),y)
> +ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
> +EUDEV_CONF_OPTS += --sbindir=/usr/bin
> +else
> +EUDEV_CONF_OPTS += --sbindir=/usr/sbin
> +endif
> +else
> +EUDEV_CONF_OPTS += --sbindir=/sbin --with-rootlibdir=/lib --enable-split-usr
>  endif
>  
>  ifeq ($(BR2_PACKAGE_EUDEV_MODULE_LOADING),y)
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
