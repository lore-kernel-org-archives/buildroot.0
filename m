Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151B5C49EA1
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 18:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD1FD40382;
	Sat,  3 Aug 2024 18:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfNwm-5ZPa-g; Sat,  3 Aug 2024 18:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C9D640386
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C9D640386;
	Sat,  3 Aug 2024 18:24:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D699C1BF364
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3F6340386
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJ_-weNa-9pQ for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 18:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8120E40382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8120E40382
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8120E40382
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 18:24:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FDAB1BF203;
 Sat,  3 Aug 2024 18:24:19 +0000 (UTC)
Date: Sat, 3 Aug 2024 20:24:18 +0200
To: Chris Dimich <cdimich2188@gmail.com>
Message-ID: <20240803202418.73eca908@windsurf>
In-Reply-To: <20240611180207.2138847-9-cdimich2188@gmail.com>
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
 <20240611180207.2138847-9-cdimich2188@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722709459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqFuXRvIWWYt5PN4DRQPFqfqqau6ZWA0n0KRZl1biAY=;
 b=Rf0dk8LjEKLNDGvcTdSBO2uwCgGOZZhcuJRLpc60ymjmD5ZorFTe34YVEbhU+dDMimWcur
 c4UJ9k/Pa1oAAMZ6BN9TA22fPwLlOvgK5iVEBLDdEzH5TZw2Qy9/V+/ZeZeZVfnz4bcboG
 K+td3Ot82Wvyhat3pO0xq0Mj3ON6/JTVenT651tmeWpfFg9+ZPPraG/J1Ni2ozecpTDxOQ
 AphiOIwodH4/gVack+z/SE6sqOZ+T++KCVSfmS//ypdAPI3O3cMqIzoQkhDBcn1qvSH7vC
 gEfA9+hiCPij34Q8ERuMXIX2fZCG8907aDhZNyMYt6W1MJglTmUOeMrkNxrVlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rf0dk8Lj
Subject: Re: [Buildroot] [PATCH 8/8] configs/nitrogen93: new defconfig
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

On Tue, 11 Jun 2024 11:02:07 -0700
Chris Dimich <cdimich2188@gmail.com> wrote:

> More details on the platform here:
> 
> https://www.ezurio.com/system-on-module/nxp-imx9/nitrogen93-smarc
> 
> Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
> ---
>  configs/nitrogen93_defconfig | 60 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 configs/nitrogen93_defconfig

Could you please apply the same comments as the ones made on PATCH 7/8 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
