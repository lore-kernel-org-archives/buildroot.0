Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9839DC4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 22:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 605BF4069D;
	Mon, 12 Feb 2024 22:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2DOKLR-EfE7h; Mon, 12 Feb 2024 22:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D03CC406F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D03CC406F1;
	Mon, 12 Feb 2024 22:00:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 805E81BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E5DE60A43
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id embrw-KM5S1l for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 22:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 544F060900
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 544F060900
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 544F060900
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 22:00:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 137AC60003;
 Mon, 12 Feb 2024 22:00:27 +0000 (UTC)
Date: Mon, 12 Feb 2024 23:00:27 +0100
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240212230027.227104e1@windsurf>
In-Reply-To: <20240119170651.641923-1-festevam@gmail.com>
References: <20240119170651.641923-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707775228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZPtox9OfCXyi9+cqtEUnsQgxSREu994OtcAxpy4ZJQ=;
 b=Zs5khiBj31qPDJJCyTVJYn7dXJfbD/4EO3EWh/nEY9SP2y1kpMRLpclhhjVwB8wLm10DKy
 VPNwUNwIC4WIw+3ogrOI8fOnpCun3+RIGeq2zOT27xWAVSIxgUZ9LlejFjX68Kgok7AmQq
 zEAymzu2rqoHq6yqrYXhbO2B3kCqxuJ2le0epes9BVMrEEIWNHybSn5Xc+iHFXrc0nI4sn
 jeworLfGRB6fey7dEqVpa4jN/MxM38H64aK6rxOVXLGZP6a/guCaSYU88D7nICvL0JBU+Q
 EqhGzt57dQUcRlRQxPMrperLWy89ew0aDCS/jHLD9jgsab7kffR0ST7sGcSctA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zs5khiBj
Subject: Re: [Buildroot] [PATCH] configs/wandboard: Update U-Boot and kernel
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

On Fri, 19 Jan 2024 14:06:51 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Update U-Boot to version 2024.01 and kernel to 6.6.12.
> 
> In kernel 6.6 the arm32 i.MX device trees were placed into the
> nxp/imx kernel directory, so adapt accordingly.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/wandboard_defconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

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
