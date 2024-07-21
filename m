Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10131C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF2DA60808;
	Sun, 21 Jul 2024 16:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Oqcyd3bDS96; Sun, 21 Jul 2024 16:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A9F560815
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A9F560815;
	Sun, 21 Jul 2024 16:33:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7B481BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B190F40301
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9swX-jY3aVV6 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:32:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8992440308
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8992440308
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8992440308
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:32:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CACD6240003;
 Sun, 21 Jul 2024 16:32:56 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:32:56 +0200
To: Saeed Kazemi <kazemi.ms@gmail.com>
Message-ID: <20240721183256.7b07b263@windsurf>
In-Reply-To: <20240721115112.2041723-1-kazemi.ms@gmail.com>
References: <20240721115112.2041723-1-kazemi.ms@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwVVzAxjus3pO6M4rBtaDtu3EkIpevPnrYy+HXNidxc=;
 b=mWznK0l4wtRmSBj7I6aIcMOJhMzPI3TH36I/VGNxKz9f4l8iYAsytMP90vtiM9/Hy73SYR
 O+6QUwMXwTmWYP3ljp0MFW1NPe0MId1gE1dGwzcuWruvwL1lsjVfr9dH5aP3CMKkGbVOnJ
 k2bqt60ygaR9ox7RNBWv8B7WvxiAi+9zyE6kqT+VW00LQVmZ8cIXGU9rhIjw04ToMEHd8M
 CBKV1EuhTsIrocXrPnz0btArNDcs/Xc1jZlxrsekMZZ6eBnZtzBaHM02DXFsGCcH1e8pWc
 V2K7Soru6GduuYuD7ApvNbYwRWQZYJze8ocad9WfXykulpp+vRnBd+UgdigvxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mWznK0l4
Subject: Re: [Buildroot] [PATCH 1/1] package/mxt-app: bump to version 1.38
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

On Sun, 21 Jul 2024 13:51:12 +0200
Saeed Kazemi <kazemi.ms@gmail.com> wrote:

> Release notes:
> https://github.com/atmel-maxtouch/mxt-app/releases/tag/v1.38
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
> ---
>  package/mxt-app/mxt-app.hash | 2 +-
>  package/mxt-app/mxt-app.mk   | 2 +-
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
