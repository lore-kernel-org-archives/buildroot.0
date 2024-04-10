Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F4DCD1284
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8769A60EDF;
	Wed, 10 Apr 2024 21:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXkPn0xrNDrX; Wed, 10 Apr 2024 21:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A655B60EE8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A655B60EE8;
	Wed, 10 Apr 2024 21:46:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8CDC1BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5E478211E
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJRAoVS6VqwP for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:46:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C12E28211D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C12E28211D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C12E28211D
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:46:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CFBE1BF203;
 Wed, 10 Apr 2024 21:46:14 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:46:13 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240410234613.205a7b78@windsurf>
In-Reply-To: <20240326225031.224022-3-giulio.benetti@benettiengineering.com>
References: <20240326225031.224022-1-giulio.benetti@benettiengineering.com>
 <20240326225031.224022-3-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712785574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QyHzjoJtwD86+9bg+56XSTEQUHbI+9u6f0q+g+usZKk=;
 b=Bz2Erawempt235Hrh5mxwvBtlBd2D1fH1NDohFo3V2fM3wS3BbwFL6SY+OlBDPRuQpzq97
 Ju/xS7c2NBProwKSMRMdG+O0MvfsAvvhhJKcWuBrjfScv8cP3GU/u0XrLjAPMMCKB3H80u
 wxkvasjRpiCjyCvSOgcZov6rd0ZsOzc+qgDf1fOZ/uQfVUFJtvwmQY+CZpVHPlgkvDEOX3
 bntHEsPwdEHPJXhl+UkjzRc68huHPaY0Syp4nGXb0LCW29N0TaLcvAMluJP4SU3LuqDhyc
 cJtyVfkktMrKsL/PnEdklBa8fIPga8bubUims54+Km0zDe+hA7fR0cjjWw12Tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bz2Erawe
Subject: Re: [Buildroot] [PATCH] package/libblockdev: bump to version 3.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Mar 2024 23:50:31 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libblockdev/libblockdev.hash | 2 +-
>  package/libblockdev/libblockdev.mk   | 2 +-
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
