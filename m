Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0E3C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7285841E68;
	Tue,  6 Feb 2024 10:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7285841E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TrUrVk78REGm; Tue,  6 Feb 2024 10:28:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D476641E73;
	Tue,  6 Feb 2024 10:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D476641E73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DDE51BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5849382167
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GY-oXHZXy6KE for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5638B8213A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5638B8213A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5638B8213A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:27:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C78860007;
 Tue,  6 Feb 2024 10:27:22 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:27:21 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206112721.7ba51303@windsurf>
In-Reply-To: <20240109071001.4022321-1-james.hilliard1@gmail.com>
References: <20240109071001.4022321-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IKEfxLdyk/OoXXan8K8VHKUdtAuF2g3i0vvwYzjZV5Q=;
 b=Hzx5bANTIby/RiUUhgjA1EHKqhi408q1YC6K3yxg63QVNkwPV4aUsIQ15JxSrdthvAM1C8
 xybh9k/UUsOOXzamo40C+DM3frnKxkS2e5u0+EhNVXKQ1jdlMq8uqWf/cHMBiuNOADSLiE
 hwDKxePZlPOU7zi6Nu1OP8ValTMDwGW7t+hu3DV/hOlt6Uk5g25iyrETpw9ICx1I5t1pLd
 F/sCNt0LA3Sr3mjexydr+KwWuta7uA/27SBzf//qtEFnzmBG36cLj1i/sKkl7IvrvcnK2n
 +JAjPecco0LruHvbACGVOilZrJ2ik4kRA/+n5ozWwqDy8YobYPtJDD50neFk7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hzx5bANT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dominate: bump to
 version 2.9.1
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

On Tue,  9 Jan 2024 00:10:01 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-dominate/python-dominate.hash | 4 ++--
>  package/python-dominate/python-dominate.mk   | 4 ++--
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
