Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B206C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7A1F60885;
	Wed, 10 Jul 2024 21:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKYZ6BarGNMl; Wed, 10 Jul 2024 21:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C86E560E80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C86E560E80;
	Wed, 10 Jul 2024 21:07:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 622891BF5E6
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AF0E81948
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tN35O78k3RBF for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56515817F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56515817F2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56515817F2
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:07:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65AF040002;
 Wed, 10 Jul 2024 21:07:46 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:07:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240710230745.4661b500@windsurf>
In-Reply-To: <20240710205508.79739-1-bernd@kuhls.net>
References: <20240710205508.79739-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720645666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMbwpku6sALcxQM1CWGGUT3Cb8K7rH58igNCARBl/Lc=;
 b=Jxk/WmraFQQHqHrZWkfMZ91OZ3Ai474JRSmi1iZHWSaSjl2MvW1sa4qXsdE8bWD5STsITV
 liwsRH+5IpLSSBvgg+9b0Z6hfB+UR85O81mOQT+6MIDMC/APhY4PyCY+SgsvPCs5tXlVuc
 vrJblx9vqvcr+YrX76w5sU/uT68PFRhVbSsZS1TItWzceEHwjxQ8IFG3EyLvXgzQ3G3ska
 BeJ55Mi3KuSl3yRMPn6Q0s4GOpAb88cDFgzUBydx8O57wY9x2bNYxt1Ys4tkGHvQGu+N/v
 3C9knQqZVw1h3OfwTKuhqu/nkuKmOvI3LVAEjbzQhgMjyt5Hxr12qDKc0A6Gxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jxk/Wmra
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-gmmlib: bump version to
 22.4.1
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Jul 2024 22:55:08 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/intel-gmmlib/intel-gmmlib.hash | 2 +-
>  package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
