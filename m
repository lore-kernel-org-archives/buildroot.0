Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0674FD2AB3C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 13:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE7A8605FC;
	Tue, 29 Oct 2024 13:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWFL8jZFEoUL; Tue, 29 Oct 2024 13:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4944606C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4944606C5;
	Tue, 29 Oct 2024 13:38:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AE9D112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 595F781154
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yscmBuuARIp9 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 13:38:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A35080CDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A35080CDF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A35080CDF
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:38:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FBE960006;
 Tue, 29 Oct 2024 13:38:40 +0000 (UTC)
Date: Tue, 29 Oct 2024 14:38:39 +0100
To: Scott Fan <fancp2007@gmail.com>
Message-ID: <20241029143839.0d7c0e33@windsurf>
In-Reply-To: <CAFkzVZbMnTyfy2VfrNY0Pb4-Xi=MDmuGvgyvpk-rBns3NO8N+w@mail.gmail.com>
References: <20241029044843.703796-1-fancp2007@gmail.com>
 <20241029122141.50cd82d3@windsurf>
 <CAFkzVZbMnTyfy2VfrNY0Pb4-Xi=MDmuGvgyvpk-rBns3NO8N+w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730209121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Blps4aHLeFmP77E8r2mdqYtZEkNVw+ISzkt48XcRZSI=;
 b=nn0/iD1l9/3mXBMtMPi+ChC/fuIfYM+KgeENdzkc+SEQCZyRURlJl/syyW7cXqCEyM/+W5
 IF9+CPyk9MXYcIDHS/HngmbnUOZRokIwZwEqM8qtcxOKpixwCTmQUNmxcAow/8hnHD5um7
 Mw6lY6EpodTfw/87AOwGQ37CB+y9GGpvrgilb07H+MXWUxU1W3FCKtlcLIcC3w/RB7V6LX
 plGEaCLYfrJ/WUeg7+Ryg/D54W9LWB8Bwckd3b0CyQBkbb7v5RQ2ecn5QcylS3I/rneGg2
 1L692jiUH3evkniZJkkRUtiaVBNUFZs5qTf1T3UVhRUiurq1Fn3FIhSpqRSyiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nn0/iD1l
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix typos in config
 option and help text
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Korsgaard <jacmet@uclibc.org>,
 Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 29 Oct 2024 21:34:18 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> > Thanks for spotting this. However, since this option has made its way
> > to Buildroot 2024.08, I think we have no choice but to add an entry in
> > the Config.in.legacy file for the old option name.  
> I found, no defconfig file has used this option so far.

defconfigs in Buildroot upstream are not the problem, as anyway our
upstream defconfigs are minimal so none of them will ever enable
procps-ng.

We are concerned about all the custom configurations/defconfigs that
people have created for their own projects. This is why we have
Config.in.legacy in the first place.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
