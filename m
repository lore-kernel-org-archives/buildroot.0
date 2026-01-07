Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197A1D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6E02410DF;
	Wed,  7 Jan 2026 17:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCj0AQMu1Ovc; Wed,  7 Jan 2026 17:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C6C6410C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808556;
	bh=XDA3VXhhmDGgCASTjyOsQ6NX+jeCTMGKC6Ip2SbqrFM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hMH48T9RMJjOEA9952aOXxEZPvaVDziHLl9xDikbJvJMpzItXKYcDqi8Mmg1mAvoI
	 XX569AL8QiDJ4HEc8b7K8qLDuctPBouVw3JvjY3GjpYM46Y3D/tCridB/8ZmBYz+g/
	 Xc7dsG2m1eadVM86S7UN/bJA7SB8WruSDhSd26ra9xbJaSACXKjC0ASF1y66NeSInt
	 6faBy87caQwdmuVW14Puo6sRhWBYZSoU2Jt4Lu1NIR+ykpX4Q0C7Yw7nXQ4574nPSn
	 H9nYBhKRqGRxT5AesJzI8Ywue/E+pPG6BkV+RLjFa959mh7wlH39IcFHZbjJiSCul6
	 L+SX07uDePipw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C6C6410C2;
	Wed,  7 Jan 2026 17:55:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A81A125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FD41807B0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b541uL8SsMcJ for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84A5580799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A5580799
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84A5580799
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 76351B97A704; Wed,  7 Jan 2026 18:55:50 +0100 (CET)
To: Peter Seiderer <ps.report@gmx.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:48 +0100
Message-ID: <20260107175549.230448-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218201147.2617551-2-ps.report@gmx.net>
References: <20251218201147.2617551-2-ps.report@gmx.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808550; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=RPFpSa1y14oGuM3bk8p+oIkcASWWP0vJspTq0tB4QtA=;
 b=fmU00w49yQt9yUHe/douaSFoIiu006Z/n5LIYEmr1h/y+p5iYBFBKdgtNBR9zvQhvPRK5g
 UW5eZu07FPB3LyM++5SXKOBNcYilfSwwNCS0uwTbqG1u9XI3Ylo67xZAzerPWteIMnbbjP
 evfh1G/yA0UPvvRHLA9a2+p/a+tFTPI+AQCLZGKNJEr3jVcEb0UMgwhakRrHMZp4nzqXb+
 qJK/ilDY+CdATK43r/UshEoLYB2CHoAaattCu88c8+A7AK0ZQ5b3f3/Ps9S3UBgSRIRziS
 ZdFhKWTwMMtrLQwb1SwTY6MnHqxpiYOLNAN24lOLTrNQKKiEBfUYSdq+HvRRnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fmU00w49
Subject: Re: [Buildroot] [PATCH v1 2/2] package/rpi-firmware: bump version
 to 063bcab
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
> Version 063bcab matches with kernel 6.12.61
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.11.x. Thanks

> ---
>  package/rpi-firmware/rpi-firmware.hash | 2 +-
>  package/rpi-firmware/rpi-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index 0645d6ad77..4dd8aa9a26 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  6c1b017867c3a51e606859f1cd50df61b94af311577583b6b2a113d11131ee93  rpi-firmware-95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93.tar.gz
> +sha256  812cb64617d6ffbc76f9b8dce8237b31159a1216b31845faec1bb75b6b6b291f  rpi-firmware-063bcab6c8a90efb0d19f69d88cbbc7ec79cab68.tar.gz
>  sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index d0b6abcc6f..3318e9a0c1 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # Please keep in sync with configs/raspberrypi*_deconfig
> -RPI_FIRMWARE_VERSION = 95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93
> +RPI_FIRMWARE_VERSION = 063bcab6c8a90efb0d19f69d88cbbc7ec79cab68
>  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>  RPI_FIRMWARE_LICENSE = BSD-3-Clause
>  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
