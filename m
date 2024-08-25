Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B53C5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 13:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D3B0402D6;
	Sun, 25 Aug 2024 13:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXTu6hQQO0o7; Sun, 25 Aug 2024 13:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1991402E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1991402E0;
	Sun, 25 Aug 2024 13:08:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30DB71BF4E6
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EBE64013C
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-EG84xdAQDD for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 13:08:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C43194004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C43194004A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C43194004A
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 13:08:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6132CE0002;
 Sun, 25 Aug 2024 13:08:06 +0000 (UTC)
Date: Sun, 25 Aug 2024 15:08:05 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240825150805.569f0339@windsurf>
In-Reply-To: <20240824204148.1436407-1-festevam@gmail.com>
References: <20240824204148.1436407-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724591286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdsmaOL01VdsrWZ0ITAHqmWVbfgIFgueeR/HbryF7Ps=;
 b=OAQopw6ANuW52kD5gc3cgVSUJoDmet1C6rpkdzMX596z2o8VIko8+J4Zd78mtare8DEzWo
 W0eNoOzNTTrsxBlJ5lzLus+BkVKnePD9bODNk/LtxEgNFLjLdKWjp+NH8MqCtuuXwsQU9a
 8oYW1MNDXH1D2TV0PNU7mxrvrJdCltNsvGhqrfgu363aat0zqA2qNc0ZZ3vzTOc61JkOao
 vamVGOrr/68Pl6scGEU0gMoy3V9W4shEdwk/xgi56Yk73w3simGkliK6b+h5K2Fwqsn8Mg
 aLcM54wKG+hBypaDneZW9wlXIk/pHGrfVSro7/B0acIQ7U40Mvfgsp1VgG9hNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OAQopw6A
Subject: Re: [Buildroot] [PATCH] configs/imx6-sabreauto: update U-Boot and
 kernel
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

On Sat, 24 Aug 2024 17:41:48 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Update to U-Boot 2024.07 and kernel 6.6.47 versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx6-sabreauto_defconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
