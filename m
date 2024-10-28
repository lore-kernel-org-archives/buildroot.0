Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87529D33990
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C7FA40268;
	Mon, 28 Oct 2024 14:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbOlmvFHdLNh; Mon, 28 Oct 2024 14:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AFD3402F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AFD3402F3;
	Mon, 28 Oct 2024 14:47:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BBFB4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0E54400D8
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urLbrrANja5s for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:47:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5ABF94036A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ABF94036A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5ABF94036A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:47:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 698254000C;
 Mon, 28 Oct 2024 14:47:14 +0000 (UTC)
Date: Mon, 28 Oct 2024 15:47:13 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241028154713.57a7812d@windsurf>
In-Reply-To: <20241027203857.3409990-1-bernd@kuhls.net>
References: <20241027203857.3409990-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730126834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2dl06yG29y75SioESQyOTuy17qRMuBQH9yTzHe6fSeE=;
 b=lbvFMS0QnBldlJnNEoxLgrBonPRhsqiqGqf/TxEVGVa4aQ2td1QNDIQdPBaKRvkcpL7zzb
 nXobM/hF27sjwwUYe2hlBRPeVKMPxpaUFCrt6hQOcYP6HvDRYFyhhpWLw4A0yHS9WAc3W5
 iS4Qth8g1ogXtiZgdihaR+PXOGPzX2g9/zcHeVrb9aQQrtoqTrp7DCBjStGvMdnQsRffyK
 AbYtR4DT4MZiKjot+rzJoMR4uoiLUMbCYSnEZNZDIzhWRGhtyT1iB7jnDQAo6xLc+14VZf
 KTUlw+2ekF6P8uFrChiijHndIY++fraR+zcf3ORzrDFY6dHT5Jvf2TNzTlcFJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lbvFMS0Q
Subject: Re: [Buildroot] [PATCH 1/2] package/libglfw: bump version to 3.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 27 Oct 2024 21:38:56 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch 0001 which was applied upstream:
> https://github.com/glfw/glfw/commit/2747e47393cbca2d09db56223e735bd94b21e2eb
> 
> Removed patch 0002 which is not needed anymore due to the removal of the
> dependency to wayland-protocols:
> https://github.com/glfw/glfw/commit/e8cf53cf708d025a30895dd5671b208f32af2e73
> 
> Configure option GLFW_USE_WAYLAND was replaced by GLFW_BUILD_WAYLAND
> and the option GLFW_BUILD_X11 was added:
> https://github.com/glfw/glfw/commit/56a4cb0a3a2c7a44a2fd8ab3335adf915e19d30c
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |   1 -
>  ...emove-extra-cmake-modules-dependency.patch | 125 ------------------
>  ...xt-allow-override-of-wayland-pkgdata.patch |  34 -----
>  package/libglfw/Config.in                     |   1 -
>  package/libglfw/libglfw.hash                  |   2 +-
>  package/libglfw/libglfw.mk                    |  14 +-
>  6 files changed, 9 insertions(+), 168 deletions(-)
>  delete mode 100644 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
>  delete mode 100644 package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
