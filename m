Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053F7C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C41824055F;
	Sat, 20 Jul 2024 21:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eykgebWfzl8D; Sat, 20 Jul 2024 21:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A4DA405D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A4DA405D5;
	Sat, 20 Jul 2024 21:12:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A29DF1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9074340373
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YvA8T2D5Lkhz for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:12:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EE2940151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EE2940151
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EE2940151
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:12:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5D1FC0002;
 Sat, 20 Jul 2024 21:12:30 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:12:29 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720231229.19eae67b@windsurf>
In-Reply-To: <20240720144831.1085523-1-fontaine.fabrice@gmail.com>
References: <20240720144831.1085523-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmkOur11BU6U6IwMFt+Ha4wgBLjxW5KgNx7jvX6TlCc=;
 b=j6niF0RNNtKor0NjU6nEez25oKoCYk1KZQKHmK4FuaeGFIUjg0J2sgvhgkOLiLIv/shcZ+
 sdRCXh2DzaSOb1H/nKtmFe+60hOXeJ1VcykHURXO448ohVk1A7MBTiiDHQve+dvMoBRKrs
 CqORm6s0hQ3Cr7zo/8dt4UtoTmqq2OgO2uyUFV7I3IMCL7d6AJObOVEtgdpNatLtioq2zV
 VdpsqxGe9ilcaTIwCAQCkghi7ab7PIJsoNXrBneK0ZASx2R+bBw1vOB8D8ySb/HBgb07Wu
 2finl39RuFWIY3vXDiJkVJeFqqpDtuzt8Ze10ENkBwtZSyS5Vs5gjgmtEUxYTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j6niF0RN
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: disable -Werror
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

On Sat, 20 Jul 2024 16:48:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable -Werror to avoid the following build failure raised since switch
> to meson-package in commit 37dded43ae681e8319d7b76f9a612c71991467a9:
> 
> ../stlinkv3_spi.c: In function 'stlinkv3_spi_init':
> ../stlinkv3_spi.c:508:12: error: 'stlinkv3_handle' may be used uninitialized [-Werror=maybe-uninitialized]
>   508 |         if (!stlinkv3_handle) {
>       |            ^
> ../stlinkv3_spi.c:485:31: note: 'stlinkv3_handle' was declared here
>   485 |         libusb_device_handle *stlinkv3_handle;
>       |                               ^~~~~~~~~~~~~~~
> 
> Fixes: 37dded43ae681e8319d7b76f9a612c71991467a9
>  - http://autobuild.buildroot.org/results/eecabbdd0d21344991379a57e605845e73ef679e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/flashrom/flashrom.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

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
