Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9062D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BBD6822DD;
	Wed,  7 Jan 2026 17:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZqbBieMzfHzg; Wed,  7 Jan 2026 17:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A156C822E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808139;
	bh=SCJ5ldV3OZayN9TvDiqURIOsbEhyaMsPqCZ06svw94I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QYGwABUrSW38fXztDK721ieUiq8ZlQY7UIKYtK5YDfSlut7YGNn8dU2P/FEpcq5DK
	 wboeWQPfZCazAHW6xg2q0MCMMTDJAXlaSNBaUF7YipXHQ1czx+7oVj/iM65FjJjVDe
	 tkFWqls8etLfYKVWrNQ57m1iPWrRRwAe5ChFhj24v/l8kEyBXL9Gxfn+YPppVgTnFt
	 LpURENinQXHOFlWgbHF3JFbil2GNd/I7iLH+35Q2P7GMWy/u16KfpEMBk3ej7riHZ4
	 guuwYaA8R34oEtpc5XZUsQEEC3b1UCWZevTcZNhsPKkZV8c/L6sJX9sPw8OD+GmTDB
	 pkyj5DQCoxETA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A156C822E8;
	Wed,  7 Jan 2026 17:48:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FFF625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71B1140CA5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKQxXJ-_shBq for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:48:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51E5840C98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51E5840C98
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51E5840C98
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 31C85B97A70C; Wed,  7 Jan 2026 18:48:43 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:48:28 +0100
Message-ID: <20260107174828.224498-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206220118.2392443-1-bernd@kuhls.net>
References: <20251206220118.2392443-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808123; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=m1H5icCd2URy/bEQkk2RM16m03PmgBAL+0izTyAR4zE=;
 b=GKjgwoUB4OJMtKMQSykpJUCzyAuxqNtm1jp9q09V3Fg1X6ADi19I3osDMgWYJfPmM3H5r6
 okCFTsdFa84DzmsL4HzyRIsxxdyqIuR2kYQx3b97JEZJY2mvAmqb3dR/zJ7ukmaFbbxt2R
 02AG20g52nsfCXuBSrvfusxzNSFZ3bRPc/L4njkTB7XCIRxc+Mj/oksm2r6s9Qk9JSzTJN
 kARdMb6VJS3/8wrDMxLS+2H6kiq/GN9OQgALOyizByS9nPW2VySKyPszkd6teSiNMWeJea
 pnqaYQg6yntOtUnPDe+n+nafEj7pjoWHK/PSA2L3P91Cg/c43/34t3hm5gcTcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=GKjgwoUB
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5enginio: update SITE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Old URL returns 404.
> 
> Fixes:
> https://autobuild.buildroot.net/results/064/0647daa54deb9df953d43b438ac05ebefb81b6ce/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/qt5/qt5enginio/qt5enginio.hash | 2 +-
>  package/qt5/qt5enginio/qt5enginio.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
> index f1ad364ca3..f268458e52 100644
> --- a/package/qt5/qt5enginio/qt5enginio.hash
> +++ b/package/qt5/qt5enginio/qt5enginio.hash
> @@ -1,4 +1,4 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtenginio-opensource-src-1.6.3.tar.xz.mirrorlist
> +# Hash from: https://download.qt.io/new_archive/qt/5.6/5.6.3/submodules/qtenginio-opensource-src-1.6.3.zip.sha256
>  sha256  d907060b355512ceb7a8c3f6980e3979c20d54320b6804303b6c5e8ed42d3912  qtenginio-opensource-src-1.6.3.tar.xz
>  
>  # Hashes for license files:
> diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
> index b74775f298..dd3f3a5d6f 100644
> --- a/package/qt5/qt5enginio/qt5enginio.mk
> +++ b/package/qt5/qt5enginio/qt5enginio.mk
> @@ -7,7 +7,7 @@
>  # Qt5Enginio does not follow Qt versioning
>  # see https://bugreports.qt.io/browse/QTBUG-50111
>  QT5ENGINIO_VERSION = 1.6.3
> -QT5ENGINIO_SITE = https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules
> +QT5ENGINIO_SITE = https://download.qt.io/new_archive/qt/5.6/5.6.3/submodules
>  QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
>  QT5ENGINIO_DEPENDENCIES = openssl
>  QT5ENGINIO_INSTALL_STAGING = YES
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
