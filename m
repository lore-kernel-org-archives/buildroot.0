Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C59E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E6CD60E48;
	Thu, 19 Feb 2026 17:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MrkcLrx_FhVG; Thu, 19 Feb 2026 17:26:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07AE161179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521995;
	bh=mTJgV+ZaOLJB2lvJ2VUA1lxOXCXI3Yzq5RxeTQX2roU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IeZvy2n8d4T+K3+k5I732l2CpGRke/vVbeMlaxpr14uP2h+s6YQS4orhzcXhL7Vzt
	 jOYq+88bf9nQIpzwFmgCvSdkxD4pg3kdAAkGMLpHbz89iy9/z88NXZS8bL02jC/5HY
	 LUIo2FMQ+zXMiJw/82vJq5HUdiWmYaI92UN3pj4v7cZRstWRuWXkGVzNCXoz/JlDnJ
	 yr/flewOjqVNilYJ4mYtDGPX3sxyAJXAuK70YHaOV+Hc1O1R9kaR8xeN/CdRWY8FlE
	 B2IRMlIK52H1TLSbhZVepvqdBbnyfnkGPDpgk0u5EYeCJjQDQUowhLzT0lRomhtdXn
	 RGJHMqP8NJvEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07AE161179;
	Thu, 19 Feb 2026 17:26:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F006B206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E21994083B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVsG-h7Net2t for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD8C8403E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD8C8403E5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD8C8403E5
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:30 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso10754235e9.3
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521989; x=1772126789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xXdDZ1aM7OsQNjuuafMjgu4EofrsowmS4ZeoVh06MeY=;
 b=B8Mol6LrxdndRtyl/fBl5KwZDKZsmfjUlKoroA/A1IQ6ymGzFoAZ1fU5+HPFfRpZ6t
 o9EBi1YYcFPZIVWthLPzyAEKZiXPVGGo18tQ+VrryMZ+Eo3PUpBCHZnkxk6VKfHJIlAm
 j8sfQ/MtoomdK6Vaya8MhX0T0/BAB1ztH/pPVo/xuQ/GbLkLKYHYgJoEU+DuYTX0XDzR
 V0o0ZBIONxT8R5lFXdNlIYWlllt4fOevgNRXRLpjtjGM8QbSp8nIsItqC0k4p00d1o5b
 CvNtyE6AODGJ/LtLsO7CnNugLVuV00Fp1qb3Lh5mPMK7oKftqXDYzJtRZqeGhVnapm7J
 szXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5QLugX1GuYn1avBQJPTyrAvz37TLYd9n1BYw5Iv9cZcT+oBa5B2n5lD86muNFvnFJnn8jTMOZnRk=@buildroot.org
X-Gm-Message-State: AOJu0YyDO18oGhSAS470sDwLrPunyGkkPWmPczvkCkFpQMN1I9fXJITK
 28glFlzXWA4uVTqPmFOv7wfdC9ddBOmyBvAnPTrzy7IkTlHKFYybpG1kFF1jiUwxJY4=
X-Gm-Gg: AZuq6aI2rRZ1n/h3/7KhgiVnLmwutwHjlOOZUFnJM0zATJUVnDVbP7mfdAlwosOvel4
 zn/tQ01GCKXUykeltZ05C5pZGHejUbLKc9U/rvN00CgvsSgVKoFJ4FgU+Jxp+Hoy1VU9GUtE0V1
 2L3X5ONusbUp5atzhkk6tnK1BRqDdhzeUis2sx7QSjg/0vuBDtlTvpKwFAq+vliGi7vuURf/d1h
 +ZtLKpUW/DV2qj2MNGFkgCwGHiDgxJRe6snbgiEfvhooKfOpsapCnUfgJRdtDubm7GYuA4rFZvh
 n2n4okFiPGY+0nOxE/v2Jnv572VepAqWNiQx3cSJMkXnvRk/f+bYIWMwVYkExukfWr2cBEz79H8
 Yo7HpvBVNCLMCZgNFH7FDJbeKel2zMcsCiwekHmoSwqHYYlgpJmx8yFiMVyCkNN/cqfozQ+2OQD
 zTgKWM6SmbfPUkbKk=
X-Received: by 2002:a05:600d:108:20b0:483:80b0:b245 with SMTP id
 5b1f17b1804b1-48380b0b344mr239111195e9.9.1771521988652; 
 Thu, 19 Feb 2026 09:26:28 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31d1b0esm18207285e9.11.2026.02.19.09.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:28 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:27 +0100
Message-ID: <20260219172627.340687-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209203212.3837393-1-bernd@kuhls.net>
References: <20260209203212.3837393-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521989; x=1772126789; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xXdDZ1aM7OsQNjuuafMjgu4EofrsowmS4ZeoVh06MeY=;
 b=b7f1Bk551MTWztZMJVPXiukJUa3yisi+mh9X2CruhljcyIezLY6O54l8f83TwS389k
 4StMzMwi8Hm0Kfp11N2w8F5kKrsZTWs4GZhQ/09JIneZ01kDlVWP3GVPBzrZ1vdCYKiF
 Wn5NyvBJOqvPSg2FAs94gWOLgeuk7ezsT+uISMda3/eqI0ivUvIeoQvXXLQtdVrODoJA
 v5OPJH1AYLwjETpmzev2d1biTlOgx8QeEr7CjkTnMTUsgmPhoJHn1Mj1wM+OsBM6McPz
 yWDwlxMBoFAdvDlmunFNIJ00Yf9I+/a7qBf7AERE1869sL/qX3qWFZueDph7ULpCYdt5
 TTKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b7f1Bk55
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2026.02.04
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
> https://lists.infradead.org/pipermail/wireless-regdb/2026-February/001830.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/wireless-regdb/wireless-regdb.hash | 2 +-
>  package/wireless-regdb/wireless-regdb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
> index 4b2c67965f..39fc1a78d5 100644
> --- a/package/wireless-regdb/wireless-regdb.hash
> +++ b/package/wireless-regdb/wireless-regdb.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
> -sha256  d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3  wireless-regdb-2025.10.07.tar.xz
> +sha256  0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6  wireless-regdb-2026.02.04.tar.xz
>  # Locally computed
>  sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index 055238be5e..31bc9e9a22 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRELESS_REGDB_VERSION = 2025.10.07
> +WIRELESS_REGDB_VERSION = 2026.02.04
>  WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
>  WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
>  WIRELESS_REGDB_LICENSE = ISC
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
