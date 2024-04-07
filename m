Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B75CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 09:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5424B81FC5;
	Sun,  7 Apr 2024 09:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkXoLPzyxJd8; Sun,  7 Apr 2024 09:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49ADB81FAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49ADB81FAF;
	Sun,  7 Apr 2024 09:20:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79B1C1BF296
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 671A6404A8
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ql3dbkZJ9rqJ for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 09:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C443403E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C443403E9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C443403E9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 09:20:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ED1360004;
 Sun,  7 Apr 2024 09:20:50 +0000 (UTC)
Date: Sun, 7 Apr 2024 11:20:49 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240407112049.2552ae1c@windsurf>
In-Reply-To: <20240405164102.42353-1-bb@ti.com>
References: <20240405164102.42353-1-bb@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712481650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4tRx/QPQOOdOb3PP60CKYI5XFrL4yFx9EwNkJLG1sM=;
 b=guK3MQtVc/IbEyW0KE13bHQcYR6TvDsrUI1EM9NjHOTDiwYCYohUbb2HCd7hQJ2k6H89qS
 RUyqOwPu7TpYMBycLWUv5bEGJFtPRoPo6Sbosg+PLoCm5eB6IkVKD9ATuU3J4vvqx3MfIV
 dPFYVSWjBWuQA2ljXT92P8nmU3N7QCWJjJQsOF/h8011vjtH1l7Krxkw635yIPaYzWkzgv
 AIwQ5rgwEylBIXtU7C4aMj6WCi1mvI3Q6KuRCBRjrkxCY72BeJJkL09z93xzXA102CJYng
 QRS2FjCGMr26ddIpkU+gCR/TN3z9rI7hy4s2yNkeGRjnelsr0Z8RBpj58/mMEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=guK3MQtV
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-toolcahin: bump version to
 13.2-rel1
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
Cc: Bryan Brattlof <bb@ti.com>, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 5 Apr 2024 11:41:01 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> The arm-gnu-toolchain is used by TI's K3 generation of devices to
> compile the first stage bootloader (tiboot3.bin) which will run on the
> 32bit R5 MCU.
> 
> The 10.3-2021.10 version of this toolchain is no longer publicized as
> being downloadable (and it's fairly old) on ARM's website. Let's upgrade
> to the latest version of the toolchain ARM (13.2-rel1)
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  package/arm-gnu-toolchain/arm-gnu-toolchain.hash | 4 ++--
>  package/arm-gnu-toolchain/arm-gnu-toolchain.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
