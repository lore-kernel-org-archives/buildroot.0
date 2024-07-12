Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2A3C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2AE9415EA;
	Fri, 12 Jul 2024 10:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyY4zWfTFteu; Fri, 12 Jul 2024 10:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD204151A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BD204151A;
	Fri, 12 Jul 2024 10:03:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 710ED1BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CE668460A
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2WnUuOyz8Iw for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:03:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 650DC845ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 650DC845ED
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 650DC845ED
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:03:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 467FB2000C;
 Fri, 12 Jul 2024 10:03:38 +0000 (UTC)
Date: Fri, 12 Jul 2024 12:03:27 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712120327.428410ec@windsurf>
In-Reply-To: <20240625211847.1419944-10-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-10-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720778622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1CfKIstyJsVnIQujE9cptGnjZGt1pYeFtnVrNPtY8g=;
 b=b96GP33Hu4sxhbP8KrIzfud0/c+hRzzgzhfpgoaJXHHU/5iuExowuXYLZAq0mYBk8gLpl1
 gvuaLHlNf5W2dY25VjU088Pf6D2Px7KdvzFNnpkZUrEQgbhS+5fagf1fDIxI2k+Te1wks1
 kMDw4tgPel4m3ij5gGqaVeE7kRlJBZu3ZFZZbCtWtxuFSUSBJcZAN0+VAnS64on/Pr+Pv2
 UO2AeJxzzWcPACwJBfA4+VovQOrIppBDuZcmErvI2zR6st2X5GAXQJnleyZOIJKNjx0xsl
 P8Cr9OB/9vPtr8196lEduoeKXeTTwRAMngOAWgB2qSdlraEIgI7pQiWO0+GTfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b96GP33H
Subject: Re: [Buildroot] [PATCH v9 10/14] package/qt6/qt6websockets: new
 package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Jun 2024 23:18:34 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
> Changes v8 -> v9:
>   - bump version from 6.7.1 to 6.7.2
>   - update hash

Applied to master after fixing the licensing information:

QT6WEBSOCKETS_LICENSE = \
	LGPL-3.0 or GPL-2.0 or GPL-3.0, \
	BSD-3-Clause (examples), \
	GPL-3.0 (tests)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
