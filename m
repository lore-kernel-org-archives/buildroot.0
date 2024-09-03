Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A481CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6232605FD;
	Tue,  3 Sep 2024 20:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6P90P4Uipz9; Tue,  3 Sep 2024 20:25:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1585F60663
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1585F60663;
	Tue,  3 Sep 2024 20:25:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38EB91BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3302340198
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcfN6xO6B4Cw for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:24:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0155340112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0155340112
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0155340112
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:24:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54E10FF803;
 Tue,  3 Sep 2024 20:24:56 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:24:55 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20240903222455.2e13a895@windsurf>
In-Reply-To: <20240903160038.19535-1-nicolas.cavallari@green-communications.fr>
References: <20240903160038.19535-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725395096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TIsRkUhtDonVjPrPihmMDxu2ZY+kRELkpJIrBw8sOrI=;
 b=PsbK03j/iRuVvZ1ADqJuPv8kCVDBLVhpqoroHoqzkok+3BCADVLyZz4qOE+gapmseVs0mR
 C/I7tInLxIHrSK05gYcXPofeSyQwcx5mp/isYitobnb3mHuKUs/Bln44qMTYS03z3PSPIo
 zJTb2nCJ+pYY5702Vs+8B6DHckY7Qn7dFJa2zF8xIyegJ0+UJavAztOgwkSL1EpAycpGaX
 6x4Y05bBzjwvFjQnya4uro9K9pQ83JeStVbpjbDJHxvd1cdL9EgsKw32UIAMwFcJ1pIjR0
 BQCBnvMyVewGoZnIG0yeRUkuOxFiIFyq4e9lhh2TBvIqiyedbs7kEmvkdcNVXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PsbK03j/
Subject: Re: [Buildroot] [PATCH 1/2] DEVELOPERS: add bluez-alsa to myself
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

On Tue,  3 Sep 2024 18:00:30 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> ---
>  DEVELOPERS | 1 +

We need your Signed-off-by line in the patch.

>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 570f4ff115..b56b2c8d68 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2476,6 +2476,7 @@ F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
>  
>  N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>  F:	package/libgit2/
> +F:	package/bluez-alsa/

Alphabetic ordering :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
