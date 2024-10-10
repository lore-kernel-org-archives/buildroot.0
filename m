Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF987D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7362241429;
	Thu, 10 Oct 2024 21:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 606u-_LNHan3; Thu, 10 Oct 2024 21:36:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74DF941407
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74DF941407;
	Thu, 10 Oct 2024 21:36:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 147F01BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10913412CC
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAbE-t0GmtGz for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBB03412C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB03412C4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBB03412C4
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CDC240002;
 Thu, 10 Oct 2024 21:36:22 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:33:57 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233357.6c07ad72@windsurf>
In-Reply-To: <20241009151923.3773324-1-james.hilliard1@gmail.com>
References: <20241009151923.3773324-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGHDG7NRO7c7FFhVboCrRWUKw1MWp8va/1h5A2ci2ho=;
 b=epZK0v7f8INOdj6JpOccvLW4A5ATuGUDI1A6IQQ9Wi7bLXwEWUcZHrF5LBAdkLEidBu/pN
 E+Y9z3p/SsDSIvDxKOazy1P/dN+9eC+zkNFojeqvoH3/YBxKiGocIl4MyGhNqLsgkKzFi+
 o2dIJGiE8gRo5YeNqc8LXu3BICXfcRasPlEYCz9FGJwA/NsV7wqudBTJHrMg2xKZjGB10s
 lM2WCoOecCZS5QF4axr7Gh9suw6TQRkwizOp3WfweTuNBR/TvaziKciixQk87VY55DwjeZ
 CJjxAhc/Eoq478RodFnyhm0eH98k7tX5XYS7u4t6ChT9h8OSp2Iyzm6DWezNKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=epZK0v7f
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohappyeyeballs: bump
 to version 2.4.3
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

On Wed,  9 Oct 2024 09:19:23 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash | 4 ++--
>  package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
