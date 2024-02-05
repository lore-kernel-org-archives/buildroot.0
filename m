Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C1CC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 16:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B74C660F9F;
	Mon,  5 Feb 2024 16:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B74C660F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hX7JCHZlwb0H; Mon,  5 Feb 2024 16:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 114C760F11;
	Mon,  5 Feb 2024 16:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 114C760F11
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 117B71BF2C6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B549260F11
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B549260F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zGpkfj0mvX8w for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 16:23:26 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F35560EEE
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F35560EEE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BC9620004;
 Mon,  5 Feb 2024 16:23:22 +0000 (UTC)
Date: Mon, 5 Feb 2024 17:23:21 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205172321.6c7602e4@windsurf>
In-Reply-To: <20240115211427.4291-1-fontaine.fabrice@gmail.com>
References: <20240115211427.4291-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707150202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxI0QqTadWx8U5XaGNfDC2Q94pXvzF1Ra/+MNPMOVdg=;
 b=FktrKbxmS+2ByVnF1jzTdWI8q7BEZjCCgAJZyn2I82D1Ve6+9oUv+2xRl9KfOp6LTSQKW8
 gRkpX6sBkFENqyREYnPZqkEdntBThQF1Je/9unNmayMQllOTl/ao6fXTFvX7qC6AjT52cP
 EILRzrkHaCaoKe/vLaPb99wQHzQaape7nkDAOG8zEERAalFb2TcO55Trv2DW9/mpd4SpKP
 ie6uJhZMuSSUpOlvjw4INx/huCXEDK43XacDCfOndJqUSusGCnA5DHoVPumUaAzOz1v2e+
 yZVnnTx2oGF8DocLRsdRJfiPrpOESHmeKV8tI7vDXO10gP0bp80s2ldUzPI1Hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FktrKbxm
Subject: Re: [Buildroot] [PATCH 1/1] package/leptonica: affected by gcc bug
 101737
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Jan 2024 22:14:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> leptonica is affected by gcc bug 101737 resulting in the following build
> failure since at least bump to version 1.82.0 in commit
> 81a961c545cc9f240841b75d6c21f13b334bc274:
> 
> sh4eb-buildroot-linux-gnu-gcc.br_real: internal compiler error: Segmentation fault signal terminated program cc1
> Please submit a full bug report, with preprocessed source (by using -freport-bug).
> See <http://bugs.buildroot.net/> for instructions.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f18979454399d9c728f9e017e4cc3a1b27458f5b
>  - http://autobuild.buildroot.org/results/f3c803892175b3bb2ce68e3140c879b4a4d4b302
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/leptonica/leptonica.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
