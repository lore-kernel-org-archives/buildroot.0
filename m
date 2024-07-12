Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C45C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0C57419A0;
	Fri, 12 Jul 2024 14:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ye0J_5F1hyL1; Fri, 12 Jul 2024 14:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2544419A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2544419A3;
	Fri, 12 Jul 2024 14:37:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46E4A1BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 328AF84665
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7q8xNn4DEF1p for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5D8384664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5D8384664
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5D8384664
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:37:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C165960005;
 Fri, 12 Jul 2024 14:37:23 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:37:23 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712163723.66dc0132@windsurf>
In-Reply-To: <20240611141216.1211627-1-roy.kollen.svendsen@gmail.com>
References: <20240611141216.1211627-1-roy.kollen.svendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+tByve3nr+Ux9zBCABnvtOm44WxdgGJCwPF3dglFmU=;
 b=U4DStP6m/U2xqU/yOlbsT7ZTpjgAcyXbimqqZTg9ZyPvAoqZ0IQt4WVGBBj3O2YXVr8bWi
 LrcuF+URhZaRRi6/gwoQXz+T3IGU/cgCwz286TqPHfFZPGaH61/y9+ROt38YRqnXDYPJ03
 SLhJU1H7EUldrZI+2V83pIldah2mxacd39f3S82O1Vr/xDbZjbro07belhqWrG8sXmfOH5
 WVTiFEByeK5G2PitwS48Dvrpgy4Ea+HehJeaI06fDOtgEjfQsyRWgmPAX9Ppv/t4MckgYU
 VW/DrYDDKjLFPKEi6y6wJ6Qruf9FFAMkvV6gpt5JLdqfC0Taz/RJ4tXfKUdI1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U4DStP6m
Subject: Re: [Buildroot] [PATCH] package/qt5: bump packages to lateste kde
 submodule versions
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@gmail.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jun 2024 16:12:16 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Bump qt5 packages to latest submodule versions from:
> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15

Thanks for this update! The qt5webengine was missing an update in its
hash file, so I fixed this up and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
