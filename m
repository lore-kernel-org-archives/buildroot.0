Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276DFE7E368
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5387F608A1;
	Fri,  3 Apr 2026 10:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YqIi9cgxVwh; Fri,  3 Apr 2026 10:27:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12F3A608B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212073;
	bh=Kuc7rK7OMNVhR2FDTES6pRSwD4JqCO8FDyx9ZLhgv0c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZOUcvtE0NLV8boH1CYzv4Qcaxjwv0OSJDltOGtEFUSLN78eQrIJkMyTb7WN6iahli
	 uuPcGRrPcJ+LliwbF8ujqBoEagiMY16QvI6imC+7XB9ksg11K6IvSGVAzGS7OQxX/6
	 WCMVu5n1rVheOW7rZGIZooa8sbZJAUcxvgBfVTvkjbQ+sBEc7p0Xl0fwQnu6bQR+Ne
	 ylb0TSDh2WC/xA9J2J0CKh2e5Zi7kIBejnRERbY+LADJIVQ+CuK7s1MO/OB37XSuYE
	 20NqDhvW5R1DU7uR5UW2DIk6lwC5r/JhSszbqdMb98NDCw+4pmqQ+tmqBRgmLBuilE
	 2A/h5jTgKhD2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F3A608B1;
	Fri,  3 Apr 2026 10:27:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CC1C1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E6E6608B1
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3Kl3CYe2gW5 for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:27:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B0F6606BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B0F6606BF
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B0F6606BF
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso23946825e9.3
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212069; x=1775816869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k2tsS0w4qy5R2TqFkljXEljKuVB88EOJ38D1LNYdfSM=;
 b=ATfrxkF3z2ElUABbwGyaM9uLi2RAMzpoZzSFJsV92G4GAd5e6T9G8Azc/SHFrqHI1Z
 wCWWGzwSiNzyubh1fq90hZn1xEN+hQNMp5Pl1PtgVEjzOxKdESkoZtnI8RHAsndN/O88
 1IcDYphqbId/eJ2QJlT+UHBfGhXAzMwY1jt6UZSf9PclBYMNX2WCZr3WeAsOZW0taB3q
 KApUYalwcSOnwqL8RUxQof+aK53Bsx6RBT3pcbfDqweKX1VHHHFGoQX+BfVCd35GsdXM
 iMVFDzj3XE1nmKoCMmHC8lXIjVaHjiukmCqpiDMmwtMk0QzQl66yGX770yzKnWKKPYKK
 c8dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfxHRFtoaB5qj+u5hgD6+uCPSkwAS1kv4qd7WdXGGESsBuyNXYSUtXLDT5Iy6fWMy4muEIu4nz1KA=@buildroot.org
X-Gm-Message-State: AOJu0YwMxROSn8g/GKE4nHjlKq9dpPcH50+h+YGtIa3iE01YhpYYDuuk
 QnppbLJgO9NT9ZVQ24FFdyBq5gJmTd2p54KBtKVD+ixf+7YCdFWyC5CyJ0C8Ip+n6A4=
X-Gm-Gg: ATEYQzwimuAkHDoS4/aSPtBmnQiyx9v8+qfo2QkwDhboPETLXHh2XiB0ffAmgKO7UjU
 nn4T8W+xBl65uH4ozf99lB2ffEhkMXdgsrYKO+Jagchn1N3bREIN8jfQ3ZPOIfKs5LFwbO0poAh
 R1J2xbRxyrK0tbtnrO3PsRwRKz8eIFN7W1+6bC3ipqNzJsUrMW0JoxlgW4KImqykpR91EPTQzoi
 B0iSII+aYI03nCcuuaPQEO6Ayf0GhXXFsSR3bkg2oh2bHs0U1eP9e+FOKZjqF5NJwXt8g48aeUR
 ZYy07gsMxYQEQ937XBtjrhyuZoD2MmTfhsRrGCUCyP1hLq9u1DDWSmJ6oQ2TFapPR7c5pjw33qG
 QSuyyVwBZY8d4uL2UMFMD9+EM+U4uYQ/tDhma7jX6guqorazoygBLcvPWKh33oQV2Q3AOOnshnU
 90FvKIH9zLsgLWBvdR
X-Received: by 2002:a05:600c:c056:b0:488:8b99:54a1 with SMTP id
 5b1f17b1804b1-488998f14d5mr26122475e9.28.1775212068848; 
 Fri, 03 Apr 2026 03:27:48 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48899eb50cfsm16141405e9.32.2026.04.03.03.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:27:48 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:27:47 +0200
Message-ID: <20260403102747.209831-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227210616.46FC385517@busybox.osuosl.org>
References: <20260227210616.46FC385517@busybox.osuosl.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212069; x=1775816869; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k2tsS0w4qy5R2TqFkljXEljKuVB88EOJ38D1LNYdfSM=;
 b=WRPIScraIXtvTBPRqasxWHpsHsNTvDed7QYsbxMdpMW2te4feFeILQyovw9tMJRFP3
 ctR19YDoXID+xGz7PBKPMn6wdAoAdJRlTY5ldGkyellqlUAGLa3mHLgZu2ro5Y5gyIOS
 wjrYlVDmOYtXaX1aS8UyBgUl2cEttQAkL9j0p595fYDAHqArc3z+MZGPlriyZFPq1Gxh
 zc8Vgv6FZlFDlCvm2pJ90jrKXPTOGEfuMfDny/vAM8UnL+GyuLRWHjqGU5GSpT7editw
 hRsnQNAAgmH4Ydu/LYmLXIpSGxWgbVVa1hBJ3aJ7bPbWC6g61JSHQZoH6WVMq8Etvz5g
 L0Hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WRPIScra
Subject: Re: [Buildroot] [git commit] package/bind: security bump to version
 9.18.46
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
> commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9702cf6ca3d55ba385f315b46def79ac2ffaece0
> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
> 
> Release notes:
> https://ftp.isc.org/isc/bind9/9.18.46/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.18.46/doc/arm/html/changelog.html
> 
> Fixes bug:
> GL #5751
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5751
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x. Thanks

> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 2e6ab4e043..4671eab985 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.18.45/bind-9.18.45.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.18.46/bind-9.18.46.tar.xz.asc
>  # with key D99CCEAF879747014F038D63182E23579462EFAA
> -sha256  096ec94c10bc9d2ba686325660a615962d0fd6529429149acfcfb7daefaf2421  bind-9.18.45.tar.xz
> +sha256  6b59f0de30c6901cce783007d06f7dd717ec3aa74b5bb5cc5159f93f0be4fc1d  bind-9.18.46.tar.xz
>  sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 1b71bcbf66..e58dcda34d 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.18.45
> +BIND_VERSION = 9.18.46
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
