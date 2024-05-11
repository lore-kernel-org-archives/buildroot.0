Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D34C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 07:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3029B6060E;
	Sat, 11 May 2024 07:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtC1JSYYGJDo; Sat, 11 May 2024 07:09:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3400660813
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3400660813;
	Sat, 11 May 2024 07:09:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EAEF1BF47E
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7658D40BAD
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwOJla0GAa-j for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 07:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1DE65400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DE65400F9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DE65400F9
 for <buildroot@buildroot.org>; Sat, 11 May 2024 07:09:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DD5AE0003;
 Sat, 11 May 2024 07:09:09 +0000 (UTC)
Date: Sat, 11 May 2024 09:09:08 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240511090908.72d6179e@windsurf>
In-Reply-To: <20240221230117.1688400-1-fontaine.fabrice@gmail.com>
References: <20240221230117.1688400-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715411349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aK2wrCifdJVOMQaxquvAtchxxAYjP0Xhu5LPU6OBQcY=;
 b=IYgvxPtLey3M0v2ur6Bu9jtRyPeOFqMzgEzte/KcUIelCquNuhPiJ9+Rxt/m2BScazlkmX
 vZLPtdN+y4Hlyz/SUQoDe/Aj1PFoMhJkjnB9uqnsQA9UPEjq1TWftPDqNQCg/mvxl77ZUM
 b2NQSn7fzh7R/FvoOdBMIpnb+35w5d8rHbBeirOAGLv7wuug0gAHWT0HnZqJM7zQUeYIqy
 DwAglGCrlHvlfYv+LKDF0ngdRVU8pAxpg+QBsyjW7GmZZSvzAWTzchELGUIMS1fh9onX3Y
 9SIZztpS4PLILl3KncSSkT04sTT5U9vaizALaweZg2ecMmnNWeeBs4cSrJ0Xjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IYgvxPtL
Subject: Re: [Buildroot] [PATCH 1/1] package/udpxy: bump to version 1.0-25.1
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
Cc: David Bachelart <david.bachelart@bbright.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Thu, 22 Feb 2024 00:01:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch site to get latest release
> - Set ALL_CFLAGS to drop -Werror
> - Update hash of README (changes not related to license)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/udpxy/Config.in  |  2 +-
>  package/udpxy/udpxy.hash |  4 ++--
>  package/udpxy/udpxy.mk   | 12 ++++++------
>  3 files changed, 9 insertions(+), 9 deletions(-)

I've applied to master, but to be honest, this project looks "weird".
The previous home page at http://www.udpxy.com/ doesn't look like the
home page of a project. The Github README says:

   udpxy has not been extended or supported for 4+ years, having been
   replaced by Gigapxy - a superior enterprise-oriented product.
   Please see more info at <http://gigapxy.com>, thank you.

There's a page at http://gigapxy.com/udpxy-en.html, which also says:

  udpxy has been around since 2008, it is included in the firmware of
  many IPTV-enabled routers. However, its development has been on hold
  since 2012, with most of the effort routed toward enterprise-grade
  products, such as Gigapxy, RoWAN, GigA+ and GigaTools.

And http://gigapxy.com/ itself indeed promotes Gigapxy, which is not
open-source.

Also, everything under a chipmunk/ subdir in the Github repo looks
"odd" as well.

We also have no entry in the DEVELOPERS file for this package. It was
added in 2017 by David Bachelart.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
