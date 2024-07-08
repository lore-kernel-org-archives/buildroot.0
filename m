Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3795C3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5FA4608F3;
	Mon,  8 Jul 2024 20:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGdl0bVOhcSx; Mon,  8 Jul 2024 20:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4978608F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4978608F6;
	Mon,  8 Jul 2024 20:31:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90F391BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C5E98126B
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id al0DM57xBqS2 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:31:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71FB18126A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71FB18126A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71FB18126A
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:31:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B490A1C0003;
 Mon,  8 Jul 2024 20:31:11 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:31:10 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240708223110.54e5a026@windsurf>
In-Reply-To: <20240707210500.2274543-1-james.hilliard1@gmail.com>
References: <20240707210500.2274543-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ViOXBSRE9JyTULZTmCxbSnroUi/lOg4cWBnv8HjOt+4=;
 b=Fh1mKzbBxXvxWmY+IwZB7ChkN77XaSsCBd3ECX28UDumRYDVJi4+HSEJMyb7Jc8Z8kNp/9
 IXMLgyBdcjoheM+g6dBrfrddujfiJoBf4Hki52peTHOy060V0zQAQVmuWxVPLLUCMclR0+
 +5yVV3hrMlYq09fF5BW+v9XsSf/SBQPwcA4VkdqSKQ/LwqClHGdSxSYg2CW/cUi8LoRmBT
 EpJEbpIUsx4q+zNcQjvn0ClLGd+Wf1uwjcoH60KQIiGKbylgK7b/wi3MNpP/B07EmALnfm
 AksMme6+3F+6IJAz5D0syRBXB2x25xamXZKsvT+4tZ13ZHkDgZ8zEQszGTPxmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fh1mKzbB
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyproject-hooks: bump to
 version 1.1.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sun,  7 Jul 2024 15:05:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Note LICENSE file is missing from this release but license has not
> changed.
> 
> This will be fixed in the next release:
> https://github.com/pypa/pyproject-hooks/commit/dfb13356a4a4bb24ae7060a45362d3b4d52ef0bf

Then, I'd say let's wait until the next release, or alternatively add a
patch re-adding the LICENSE file. A LICENSE file going away from a
package is a serious regression.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
