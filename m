Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4302EE7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E72EB610E3;
	Fri,  3 Apr 2026 10:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cD7CfvULdyml; Fri,  3 Apr 2026 10:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D005610F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212097;
	bh=0yCyFkE44qNkilo/xpK+IlGBnfqNeZemcj4uf5/jsoQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bQ68hJuqrYh0b4/SiCCxP/xkJ2lcykOxC5TSZ+LgXlpO8bdsepj63PpcVwa9rodZH
	 uYggfdmtku/IQ3md1OPHSQEOuIiNmP7WhKgR7AC+WOKXMsdxH5LRJwXdvOPMu2Q7GC
	 JQuRPyMedl2+HzoXEEigDY/Zan/ox1FmJpo1Sx4vBDAqGLskXPsn2xa0PPKlqw3qKM
	 rPg+gSDmIzMBDaUEzxqK07vLTxAgbyJN8lFhnrJ9IDuTVWw7uby938OWABjqK3skty
	 55xX6RGfGFB30Jpv3RxYVCp0//KDiBmlcA24CxrcMOQlyKjU/j4nBi5ydXYihn0VRE
	 IBgCcg9Scd6Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D005610F6;
	Fri,  3 Apr 2026 10:28:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C90E1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DFE360EFC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGIpjVxqIHzr for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37C50610EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37C50610EE
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37C50610EE
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43d03db7f87so965401f8f.3
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212091; x=1775816891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eZQo0CqiFnfe0q3+9oS9ojKEdMatvszwfMKi3NiduDM=;
 b=lZMLp7aZ9M6gvyI/97Seg1GLkwGtKbkv4c2fIv7vFGAB6eSqmu2caLtd4Yh/0RUrEo
 wl8QkRQLl9uRsfV/nlZlZU+GW9wkZ6CDe/FwjMwvJARgOcrqiO8xPVqbBKX+lH1N9C1O
 5brMkX74WxX5haEQyr928f/tJQfWq555XsTx8/HNFYfhEy8f4p39cDPcFIgkJm0yC5lX
 /d7yXji7A5SNUWs6GaROCnpZgk7KI9BVmihNVaT8aZZ/crcNIVLMmsZipBd+NafWwEQa
 Ag+f/xmXkCr2FApzSjrE+1ibZbkkQFYR/clG2LvQi2F/9gcVcPKp/UTEzSqjmeTHzsLM
 QZQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGJOqgvs5oKi0+QZnGAS05noY/Hu2Sg7ZyQIDUH1izZVbpIfdmmMRzcCDSG99/GnVHddXsCVU4xAA=@buildroot.org
X-Gm-Message-State: AOJu0YzaElp/uIjCM3U0uxGjyCYkUx/Yob/F9uFRU9Y3jEEAmWa6aTPH
 MJqXQU86GpuyVYEiP+xiHppTuIWWmfHbxFdsVZSWibwizzCs/OV9+VLl4/WeOOi3Xi0=
X-Gm-Gg: AeBDiesc4fbC04VEFDbU7a102lhwi42n58R3+kyiAbRJz44zTFxD8Hx3TM2yLhP0r/q
 99v6koLcWsC6DV4y72+6nKhDEwYF6j69SeFcB/qb9d6phEbmPEs2yeJ3FD0qgAS5Yky7V97KIfY
 BveI3GcgMNcBQdb3m1hIQvW7VJ3jL0mdUv90vDf+w8rtLGuwAbGiuGT5PXZ5Auzg56moabDIztr
 VpjzJq2284v4rToII4pxBvc28jt7xHhmqpYhAJpLGI504Rcsn3lkGyHchV9vVhsluGOIsmWbteC
 n3UjkJ4nat2O5zR2u5VAWk1RbDv6vYeHBEO67VvyQXXH/Q5cYhT0wdQVXwLV/C6lTbRp1NIkL9v
 2rnrjqjXQXn9oHwRcevfWVSVqFZeH823Xq+JT5a+ns7z9iwq+OILai+TY2eYhIngVnddfcPgyRr
 GK82z0Jn3d236xH5mI
X-Received: by 2002:a05:6000:1448:b0:43c:fdd9:1890 with SMTP id
 ffacd0b85a97d-43d2930ff27mr3249244f8f.51.1775212091228; 
 Fri, 03 Apr 2026 03:28:11 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d29bbsm15523644f8f.21.2026.04.03.03.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:10 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:10 +0200
Message-ID: <20260403102810.210409-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325180122.2974279-1-giulio.benetti@benettiengineering.com>
References: <20260325180122.2974279-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212091; x=1775816891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZQo0CqiFnfe0q3+9oS9ojKEdMatvszwfMKi3NiduDM=;
 b=PDfoYPgHyzm4T5k4Kz6ZRz70ac12OfX/xGIBRZCmMCMKXxVUuHAkZeosskkmMq/pe8
 joF8whRJ2gHAi5oa3U+johmaSV/xlFm9VqqtPpX2PmSa3U25RWbT1Ae2NpY5OLd/S/Cl
 uX8Ho9A4Q3SGOLcYVX6CHhQkKIAwlLQQlxqUyz9ukuTGKJDS4Yz77ZUjrMLUFkBhRKtG
 gLJf3gs/BX1SuBtqcS/FaAZL1vbghtsbdhYyJnjYeWgY56okMqBRCuJoIwTDrnBpXsC4
 lYdzgIG4Xmq1DCDKw5JQrYVyg5D6Elf3xMYC6AVovTxQ0BC/qSYnDhbGRZbM0Jqsitv1
 ZRZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PDfoYPgH
Subject: Re: [Buildroot] [PATCH] package/bind: security bump to version
 9.18.47
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
> Release notes:
> https://ftp.isc.org/isc/bind9/9.18.47/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.18.47/doc/arm/html/changelog.html
> 
> Fixes CVE-2026-1519.
> 
> Fixes bug:
> GL #5708
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5708
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> NOTE: GL #5708 link is reported in changelog.html but it's broken
> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 4671eab985..09d35a3698 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.18.46/bind-9.18.46.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.18.47/bind-9.18.47.tar.xz.asc
>  # with key D99CCEAF879747014F038D63182E23579462EFAA
> -sha256  6b59f0de30c6901cce783007d06f7dd717ec3aa74b5bb5cc5159f93f0be4fc1d  bind-9.18.46.tar.xz
> +sha256  9d544ba013decd1ee60e3c99d5548dd21aaaf5db96205dfc8623f39f061f14be  bind-9.18.47.tar.xz
>  sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index e58dcda34d..b889f922b6 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.18.46
> +BIND_VERSION = 9.18.47
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
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
