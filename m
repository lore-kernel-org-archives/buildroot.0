Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877B3C43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B742610C5;
	Fri, 26 Jun 2026 14:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnfWAlYAXC3Y; Fri, 26 Jun 2026 14:56:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E5EF610B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485776;
	bh=QQUNvWrh71uKdZu7m7Hg9AnNzxJw7xYD63JjoB4yJBY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kCwmKFualJ+69G9x8VMFH0ivvu2UeiKW7i0dCXyqC04ktCwl0IX3WMkCgGW7Ze3A3
	 xI+zzK3FPtsc+uyhzgmfizMHikwm3Wm0wxM6hmFJ9MYDarKRJZ8NI+uSYm5pgB9271
	 YqVNXiEmmPQdiTiZIVN0bJRJc2ycYUiXlvJSMYdphi8VVSTGdQRsW1PCmlBAgfDNup
	 6uBk+bETuGaZ4xpTmIwLe3tLJ2yEYJcrf1v8W0slFeHOGmNFrx23jDxGbqXziW1ZCp
	 EvLP3pn/D3RfQrizi5X2UAAy2muN4pNqQSXQHsfqeRA79qf4mOLvd0RRds0B1dA7JO
	 RCpylYYo4Nc3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E5EF610B1;
	Fri, 26 Jun 2026 14:56:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96E6B231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C986411CD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQdkBCOkWNjE for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 686A5411C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 686A5411C2
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 686A5411C2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:07 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4926bd21aa1so7174825e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485765; x=1783090565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YA10B1YkVjQB8mPFGDiGWfEn37EnkkVC3d81dY+y4Qw=;
 b=RyhATky8T+JqRqVSZk+XwYmj1XePPJiDGZv49KGDRYcdFIjWqax1vYcoEY2SpJgdxu
 gEU5vLDB5KqaWLA6amSLBGIW3VQK9O/OR1UQFIVUtG6iUNuJ6UBH/y782ffkxLOwAJSs
 /B9ppDL+JEcbuPrZcf9iNbDV7+HfCCOgqEvBCEexMkfZW9XID1yDXJI4PnkXA1dv0P6P
 NG88i+x23FOXRH5+bo3mPIdXSLyhJlPD/qeylrBCYuMzPt/jLr7gak9Q3NiKdmxw/eX0
 TMrYFiAj9HfSlas/3wf2DWR/BO/YJwsJbqmUG54d9kJmPYabklLbkkoCj10Hth1DM54z
 lJzQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+QpFdsUQlKTqkxKztGd5Iyd5mU2TLmUNcp/Mw/YE4A1l4MmspZKV3jMOTdE/erFG2WLezQ9Awr+ew=@buildroot.org
X-Gm-Message-State: AOJu0YzMvasERzRcSXkCE/K94N8GHzy9KBAB2M83qoWhk/0eKRgix0gk
 WYgU/99/WCOZ/cwc0ftUjapkhH84G0JvbQiBmoLAc8Vlh1mQIE/uPb50R5QcJFg7zBI=
X-Gm-Gg: AfdE7cmaBR0WCNhe+Z40wJPOCZyiFYXn8BBTvnqIj+AL7EHigwW9WW8oCiiIU9A5jTZ
 OEan6dXXIuiaxrU2rSH+JIp7l8L6Sd6VwILHxiuT9y2uxI5avy3zgxMygyGNSioSKLE7NZDEuyJ
 mcHgiyYKiJ+pFpVy+QMBlICkOITOvSup8SEFlu1l+2NjLn6aQCp6aaMFPqdzXuY3nGCWaEfQHyk
 WdKukNuM0zh0oUj3T5dv0kscVTdopAh1s7FilIYgUqtRCdMdX/HSaVGRDfeDpmeo3WjpDQDL/D7
 N/8l94+jnSnzLQmOm4l0sG914sx5xFuYbWPxTW014LURhly2LlskQAJKAd4JJ5W39LBMEXXZS/D
 Q8NI0bt7OsZQBedtzrCYIuxTG64ZpmUPjZySNuaZM4w61yUtRTKLpX/ORXmU/OZC8g2P6JK+VJv
 MRKAE5
X-Received: by 2002:a05:600c:3b19:b0:490:3c15:7146 with SMTP id
 5b1f17b1804b1-4926687e6eamr114929645e9.19.1782485765195; 
 Fri, 26 Jun 2026 07:56:05 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee0189esm26650015f8f.9.2026.06.26.07.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:04 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:04 +0200
Message-ID: <20260626145604.343756-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618075958.1072765-1-giulio.benetti@benettiengineering.com>
References: <20260618075958.1072765-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485765; x=1783090565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YA10B1YkVjQB8mPFGDiGWfEn37EnkkVC3d81dY+y4Qw=;
 b=UwB/fD19w3fikEMMxz1OEmk6kGWr4xK3IM0IGki8pmSNA+IFl1cftTrS0/6ApmssmL
 IP7HWEEp6xgIR9mmw5i8WKk7sGC8XgCeCx3CXAtl3SbUC7u3pqP9sy+em3VfuuxDPKyH
 eM9GCOo0yAGvdP7tHwhuEJTokx+UhAvBs+1kWz4funnT0b6GKNq/vpFB+uq9CAvv/m13
 WMr5HsB1O3VVyB+h9LOIu/tq2zCPQFMh2yhWuRYHiqu+20a46ooJD0i48eNYvuiOvPAn
 KQe720qE4bkcGlG9GnV59056rbt2C+RHr88HwP/DqTuKUw8tosMZz16cgiz1IUSfYEnS
 osyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UwB/fD19
Subject: Re: [Buildroot] [PATCH] package/bind: security bump to version
 9.18.50
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
> https://ftp.isc.org/isc/bind9/9.18.50/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.18.50/doc/arm/html/changelog.html
> 
> Security fix:
> GL #5934
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5934
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index b719012de7..766540ee22 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.18.49/bind-9.18.49.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.18.50/bind-9.18.50.tar.xz.asc
>  # with key D99CCEAF879747014F038D63182E23579462EFAA
> -sha256  c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24  bind-9.18.49.tar.xz
> +sha256  a24f93be94712a8c11752294410f2f8a2510ec7fdc931d207fc61cdf30e54f4d  bind-9.18.50.tar.xz
>  sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 6c0d2f8a03..54870bfa4e 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.18.49
> +BIND_VERSION = 9.18.50
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
