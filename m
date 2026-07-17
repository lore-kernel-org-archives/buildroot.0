Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB91C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 252FB81107;
	Fri, 17 Jul 2026 15:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yecb3yJsSQss; Fri, 17 Jul 2026 15:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B05F8110B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303224;
	bh=Dl0EAy+77UY6jbyi3LGXxt6g349sG2Pmaz5uI5wQ4AA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fos6F4rfS3uv+Iz/ZSqKzvCJUQXRuvpPn7h6IlDFbzjnkqtSjf9TXfHPYMomHFiji
	 rob756AzcyBO34zF3rjUnRTvgd+S6HOAph8oEFXR8Zu/1pH2tIjB3W5k52xidhF7FE
	 axZVsvgRhbvea9MVOWxuf8PBjALHzV3c78qQUOkqrMVqO976RDaPHqWjMgKBjO4qER
	 SzrQCbWdr5Q3kg0jKLZoA1u8QGNLVtByRBrOnyhiHBzC8M5YKHMafcexolK32KOLpm
	 18SawHpsgMYb9GC4JrMSoOBnITcY1WGvguK/SBrA4T6A/W6uvgsmw3AXGzHpnHCog3
	 76+3ZdX2bnndA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B05F8110B;
	Fri, 17 Jul 2026 15:47:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A505136E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C2FC6065E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFtmPE3Oellb for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 885DC60732
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 885DC60732
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 885DC60732
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:46:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-493c19bad03so62715745e9.2
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303216; x=1784908016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fxsjBSTTwpmuZGo/e9MGnbC/l3fQp3wr7xrVo5g/Haw=;
 b=sAQjq4ph8oW9Ez/lAv1jvOEpKm54g68DZExvJ4QVFDzXbHyGKpswpQVFVUT6VfudBG
 2fH0RyBvdyS1A1KAIBgqQyEwYDHQFuhtQOXWTj60UN1Vx7trqgjzI9IRHVJ3B7bl6LGO
 WyLxsOPvqJwG4f+pvhQ8a3Kl3+GYs93+5i1kDos206PGKO4NdyUpPQK3zoaDiOnt2/Dt
 W6n21Jw1oc4yTl5g40BZTXNkWun0R/GoVNH9GT92Tn8Bmb9Sg9mij5zaLsXA5V/BcJ2k
 fNc3Kuw6CnVGDW88YqXCfD4HMzfh1KVQPtu6vBGhAXsghCIrcH2ejA4av/s1ZSLDwS/w
 Fkgg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr86s3oWFDcxMHxqSJi1imBzyQX/fOd2pQFc2xmZvz/Z1UbUEHwQGAoGfZ3ZYaEgeA65tox1Y6NpR8=@buildroot.org
X-Gm-Message-State: AOJu0YxPG+S9fqJJoXov8KiTD4iVt+nHsUwlC76QS5Dvq1/ZB/XgQ1lv
 B27jaGSZ/CSGfXZySjTIoAiJbye5lXbMoHNMOHoWC3sgC8Gq9FVHmg5xTqtim8yjw0w=
X-Gm-Gg: AfdE7clKCDxDcA6zOKBDokpoq1fkN3Z74Jvn4codHJJf/rD2SVci835Zn7GKMWRtkgi
 P93fN1y4D/GYJeyfwngMyUtbPCspcVXgdwRh8ds8s/et5QRabmLfacZm3gnOmCAOUmaJ9VQmuqF
 2/xNw0WXWS/tXZPJ+Hm9kma7nV+CyxwY7xLKvjiEPdMK23J7V60AB3VN5BhIsstMp8znVYZnyiV
 CwnnERrw4oEa43x8DfW7TxydUpSuxYLOtJVKBhYjaYhFkzyzT8FQK/LkL6HoNwxmAnlIb4Of4Xr
 /WapYx2C+m7408TYRGuqDlce3k8WLpEVhxCpVnm+qNsZ08Mco/OBjtzhCSMNsSORgnDIjKTCcOs
 r5bsOb2KWMRx8X08tgKe+HLcA6WJUpqT6mGULhqyUqbWY7UBMVam847qCEGPLYLqThq16IaU=
X-Received: by 2002:a05:600c:3586:b0:495:3f68:699b with SMTP id
 5b1f17b1804b1-4954a3f3173mr37098355e9.9.1784303215853; 
 Fri, 17 Jul 2026 08:46:55 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ed2313sm4382187f8f.23.2026.07.17.08.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:46:55 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:46:55 +0200
Message-ID: <20260717154655.191182-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260305210950.3471974-2-bernd@kuhls.net>
References: <20260305210950.3471974-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303216; x=1784908016; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fxsjBSTTwpmuZGo/e9MGnbC/l3fQp3wr7xrVo5g/Haw=;
 b=KEK8FBSw1HSywtaGDNqfzWie5lBjDMs9Zps8O+yoDYL15JT61MPvS5o2VV+E7kM6L5
 BXW3hk3LyA9hEgdBhNW5sQ3F+m3e4zWBmly+ba5xiOpP4aJXY2Hr6kiEio3Xrzj8gYpp
 XoRnykh6rkjqAAReqR21jzdkCf/pISnu1BlSMStu18PKB36p3Qd57KwTVBXBPeSGDp5/
 g0hLhaRBxpFeKLOjClBqAjHNTK9wL9K2WgBQZNoFeaTTxubEI4eRRONfazg3Mbrzw1l6
 ZJxpRbNeXMlx4Jy/fCg/D2CGucggBTiUauMOju8NGbkulXTu+Z4ArpK/Piodxh+nzhce
 0OHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KEK8FBSw
Subject: Re: [Buildroot] [PATCH v2 01/14] package/socat: bump version to
 1.8.1.1
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
> http://www.dest-unreach.org/socat/
> 
> 2026-02-12: Socat version 1.8.1.1 has been released.
>  It fixes compilation with glibc 2.43, xio-netlink.c for Musl, and a few
>  minor bugs, see file CHANGES
> 
> 2025-12-08: Socat version 1.8.1.0 has been released. It fixes a couple
>  of minor issues and provides new address types TEXT and STALL and a few
>  new address options.
> 
> Rebased patch 0001 due to upstream commit
> https://repo.or.cz/socat.git/commitdiff/2cc1f11d02928e7eca9560506dfc6e97a0ac92e3
> 
> Updated hash of README, used as license file, due to version bumps:
> https://repo.or.cz/socat.git/history/HEAD:/README
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Applied to 2025.02.x. Thanks

> ---
>  package/socat/0001-no-documentation.patch | 4 +++-
>  package/socat/socat.hash                  | 6 +++---
>  package/socat/socat.mk                    | 2 +-
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/package/socat/0001-no-documentation.patch b/package/socat/0001-no-documentation.patch
> index 5dbce0576e..13e9e503f2 100644
> --- a/package/socat/0001-no-documentation.patch
> +++ b/package/socat/0001-no-documentation.patch
> @@ -12,6 +12,8 @@ Upstream: N/A
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  [baruch: update for 1.8.0.0 and 1.8.0.3; git patch format]
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +[Bernd: rebase on 1.8.1.1]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   Makefile.in | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> @@ -22,7 +24,7 @@ index c01b1a4a2306..fd89acb06f3c 100644
>  +++ b/Makefile.in
>  @@ -82,7 +82,7 @@ SHFILES = socat-chain.sh socat-mux.sh socat-broker.sh \
>   TESTFILES = test.sh socks4echo.sh proxyecho.sh readline-test.sh \
> - 	proxy.sh socks4a-echo.sh socks5server-echo.sh
> + 	proxy.sh socks4a-echo.sh socks5server-echo.sh socks5server-auth.sh
>   
>  -all: progs doc
>  +all: progs
> diff --git a/package/socat/socat.hash b/package/socat/socat.hash
> index b1c3d3cd11..3a4eec60c1 100644
> --- a/package/socat/socat.hash
> +++ b/package/socat/socat.hash
> @@ -1,8 +1,8 @@
>  # From http://www.dest-unreach.org/socat/download.md5sum
> -md5  8ef0bc4f602636797917f8574c3b249e  socat-1.8.0.3.tar.bz2
> +md5  5456f0f0c5d4505b68edcb10e23ef128  socat-1.8.1.1.tar.bz2
>  # From http://www.dest-unreach.org/socat/download.sha256sum
> -sha256  01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095  socat-1.8.0.3.tar.bz2
> +sha256  5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b  socat-1.8.1.1.tar.bz2
>  # Locally calculated
> -sha256  f51653b61cf2516c39e8f2edefc11604d0f9d14f0c6ae988bef228a1f0283ad2  README
> +sha256  86e46422f9381b386bd2eb6606f9d6c3ff479f905660d0f318c571292ab304b8  README
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index 69f8f40452..3d40540599 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SOCAT_VERSION = 1.8.0.3
> +SOCAT_VERSION = 1.8.1.1
>  SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
>  SOCAT_SITE = http://www.dest-unreach.org/socat/download
>  SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
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
