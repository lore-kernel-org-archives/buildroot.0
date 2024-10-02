Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEB6CF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0937041402;
	Wed,  2 Oct 2024 21:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vY8fTJAj5okV; Wed,  2 Oct 2024 21:03:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7034B43056
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7034B43056;
	Wed,  2 Oct 2024 21:03:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5CA1BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DD7E41C3F
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bG9Xx4Fr5cju for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:03:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E36AF43041
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E36AF43041
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E36AF43041
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:03:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1B6EE0003;
 Wed,  2 Oct 2024 21:03:25 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:03:25 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241002230325.10acaec7@windsurf>
In-Reply-To: <20240926221912.212859-1-james.hilliard1@gmail.com>
References: <20240926221912.212859-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727903006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w21deYcF4hyboorbD6mZZ1VfXuteunhVaw4rvgk9yqU=;
 b=SQI8nSNZB1qDdezmi0JfytQUwvVXYSyFcnkfZwydvS8RNSBFXMrIE//1w7U5VZzFP+bBGO
 KmNAhPWDLrRt/1+McN5dTJVk0m32yHvErRLtgyo6J3b/3LPFOzciXlB5RcuLc8dkxEwnmt
 jGNaIbQePvRFsowRPGX2N4N3t5AQnSOQLNN25oDekCHSK5/FmFh7JWo2DREQNf7KuaFbc7
 R9Cw0rzhT7UeDUorEfkLy/XiM3pyva2mLF8gcJe9K3wNZ6a+a9veGNFKU/RFsbsepUSAPp
 XTSH8aYYTJ+aOqCr9C8NFfAv4IbdbyU2Cl7mRDoj+FFtVWyznB7JPBpsMLByMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SQI8nSNZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version
 5.10.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 26 Sep 2024 16:19:12 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to TCL license added and reformatting:
> https://github.com/ultrajson/ultrajson/commit/54497bd58386c1630dc0333f65b40157e285c329
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-ujson/python-ujson.hash | 6 +++---
>  package/python-ujson/python-ujson.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
