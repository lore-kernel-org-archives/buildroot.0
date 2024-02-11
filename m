Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1ECC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0987F4025D;
	Sun, 11 Feb 2024 15:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97Imzxj45W-5; Sun, 11 Feb 2024 15:10:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D000D403CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D000D403CA;
	Sun, 11 Feb 2024 15:10:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 129201BF403
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DD1381ED7
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQ26ODZ6j1Ah for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:10:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA3F481EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA3F481EBE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA3F481EBE
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:10:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3CCEC0005;
 Sun, 11 Feb 2024 15:09:59 +0000 (UTC)
Date: Sun, 11 Feb 2024 16:09:58 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240211160958.40721d40@windsurf>
In-Reply-To: <20240211145446.270865-1-bernd@kuhls.net>
References: <20240211145446.270865-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707664199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gcNMBGb4VRfQef/s2hFny3IC+AI2dhdO2xShtVey2ik=;
 b=NpP50axgYWrg7pG6lkmRFNbiP52ZoBe8Og+1qZW16XzIgheJZ8AOtAlVdxMtHP8JcN+wh+
 Uvc21gikUp43zVxefhYK4hdS2xbS9+YwxI4E0kJ6XKDp/HyvPdRRze7DraI4O2kFbbxxn2
 vs7c4j08Pb7cuj0x3SKJeTBFc7TRB0qD8tkltpsu2woOXkIAWogSrF0CtG1sLjPTspr5Bd
 sNFNtPpZQPA00Ulflo0fl2B4Qo6tyH0An3OV26t35E4hRomuqqQzTY8VYrDOgKLGZsEVzO
 xeTK/FoMsemNyYtWEUh7opVKAGbu754vcTXwbCMjG3H5rpmnXxghR/xn3Ye2GQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NpP50axg
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Feb 2024 15:54:46 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://curl.se/changes.html#8_6_0
> 
> Removed patch which was included in upstream release.
> 
> Updated license hash due to copyright year bump:
> https://github.com/curl/curl/commit/57cc70e559aa065426021e22e2af8166af6084f6
> 
> Added configure options for optional libpsl support due to upstream
> commit which throws an error during configure when libpsl is missing and
> --without-libpsl was not used:
> https://github.com/curl/curl/commit/2998874bb61ac6ef3b72d6a61467cd2aaf6e53ea
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...nutls-fix-build-with-disable-verbose.patch | 60 -------------------
>  package/libcurl/libcurl.hash                  |  6 +-
>  package/libcurl/libcurl.mk                    |  9 ++-
>  3 files changed, 11 insertions(+), 64 deletions(-)
>  delete mode 100644 package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
