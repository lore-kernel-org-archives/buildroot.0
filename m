Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E134C52D6D
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 13:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AD7B40232;
	Mon,  5 Aug 2024 13:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfNCx0hW10Nx; Mon,  5 Aug 2024 13:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA4EF40238
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA4EF40238;
	Mon,  5 Aug 2024 13:45:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 424101BF334
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CEB4605F7
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sroJFfYGCkT6 for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 13:45:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9656A6059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9656A6059D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9656A6059D
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 13:45:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2ECC60009;
 Mon,  5 Aug 2024 13:45:35 +0000 (UTC)
Date: Mon, 5 Aug 2024 15:45:34 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240805154530.6ecb6d7f@windsurf>
In-Reply-To: <20240805161948.GB3474121@igalia.com>
References: <20240522091608.3659847-1-aperez@igalia.com>
 <20240522091608.3659847-4-aperez@igalia.com>
 <20240712230553.23f75095@windsurf>
 <20240805161948.GB3474121@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722865536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zamnXt7OV7GbQ9LhZCxSVwxoZtqXCJFxhEo/uW4OlIo=;
 b=kER7zwgH5zE/2a6Uic7vMAwrSMrTZM0bRsjBH1RmohAeCBsYAyg6G3B5Ms9oSZIz+LZCLX
 qJqE7wawQl6hAxbh6obTAZjdN2oUNCBneVeO+xXQ0i5dD9K9RqMVBgh6O2RMgAbTgOn8L7
 fHRVwjLzShxQPvT9eFH4H7ppfYkJMibEHXixT2HPsuwr+e7gPIi3yCZYMknMCAfm5T6SQ8
 HJsY0GKNr2dVqIkae1+hjRlixafh4nn+0sciV00wSOMhfJnBnbERaJHZDIAEhbde1Cc66W
 fSdnJj2y4DeQ7hlBnzMJu5uyTxQtKqfHxqWKqLuxMgyFA21oerhnDwfLCygMQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kER7zwgH
Subject: Re: [Buildroot] [PATCH 3/4] package/libavif: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adrian,

On Mon, 5 Aug 2024 16:19:48 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> (Coming back slowly from being one month AFK, sorry for the delay replying.)

Hope you had a good time AFK :-)

> Ouch, when I started writing the package I thought "will fill this later,
> let's figure out how to build first" and then completely forgot to update
> the empty variable. Thanks!

Ah ah :-)

> On a related note, I submitted a version bump for libavif earlier today:
> 
>   https://patchwork.ozlabs.org/project/buildroot/patch/20240805115224.3473431-1-aperez@igalia.com/

I'll reply to it, it has another license issue :-)

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
