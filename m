Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFB6C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3329580B13;
	Mon,  6 May 2024 20:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWc5O9KFCCqg; Mon,  6 May 2024 20:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49A2F80B1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49A2F80B1F;
	Mon,  6 May 2024 20:13:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E7BC1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A54880B11
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9brW7XeB2NF for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:13:43 +0000 (UTC)
X-Greylist: delayed 4139 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 06 May 2024 20:13:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BEB680A6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BEB680A6B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BEB680A6B
 for <buildroot@busybox.net>; Mon,  6 May 2024 20:13:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86C941C0002;
 Mon,  6 May 2024 20:13:41 +0000 (UTC)
Date: Mon, 6 May 2024 22:13:40 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240506221340.5167483b@windsurf>
In-Reply-To: <20240506200858.30197-1-francois.perrad@gadz.org>
References: <20240506200858.30197-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715026421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJ82vReJjJif/qVSxqK09Rn7XNj1P98zmO2AUUO3OeI=;
 b=QJxNRGC1EXm0es70hO3pTPilcWKcIrBKWFdNrVBG7no+oIn5jYICItQPsB8S/+H5Alr0ch
 5eGnSUH2ZlijERfkl2Bg+h1Eco74EkJIY27lxVECW5KMgoRFWHZ8HbTMPCGpN5ATJvNc9m
 mv6qP59hagiAVskZO2DeD3hsRbZDPR40lpRJNzv4jEagRiHgwFZi+L9Y+nzaO7pNW5XCz7
 2BTc22mASE0JEIUuaRlN6x2SewIB75DR/f9vfYQ4ShOCMyI3peMI/kcVMPzdNzM2ExpDsC
 lCvjKpDp0CZMe0QjxXr4odYhzV3MjMG8vsPjgHfgjt5TYPxOFbgzPvG7folQsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QJxNRGC1
Subject: Re: [Buildroot] [PATCH v2 1/3] configs/olimex_imx233_olinuxino:
 bump Linux and U-Boot
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 May 2024 22:08:56 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  configs/olimex_imx233_olinuxino_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
