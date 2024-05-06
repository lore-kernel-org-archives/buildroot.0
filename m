Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243C5C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB4AD608EF;
	Mon,  6 May 2024 20:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAqz-42ir4rU; Mon,  6 May 2024 20:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB047608F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB047608F1;
	Mon,  6 May 2024 20:40:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 588021BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5119140217
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id si45dlzmYtzb for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1386840108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1386840108
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1386840108
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:40:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7308A240003;
 Mon,  6 May 2024 20:40:55 +0000 (UTC)
Date: Mon, 6 May 2024 22:40:54 +0200
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <20240506224054.218238be@windsurf>
In-Reply-To: <20240502045518.4875-3-dm.chestnykh@gmail.com>
References: <20240502045518.4875-1-dm.chestnykh@gmail.com>
 <20240502045518.4875-3-dm.chestnykh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715028055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=436z0G8Spg8uI+clDQKwVO8XyOD9wx1HIubrWSPKNyg=;
 b=dSDaIoXtKxW9zBEAC397W7gPpFEP3iLxn0a2JINiyzckI4JFNxZQeD6btuClv+vNbrjL0c
 u9btOi+7SJWM904wTOHXtpR43zw8QMUjfzm7knBzbfLB1aGvCXF2KArWz/AnRaNBnEy93d
 vjjANy3KAxEGB0NlttLQp4yLi24CHczSLLjBDMRzLbwMP+icg9O6L/XuI6Wh24PWafhpHE
 gybch1AK3TQHHCTpSN57gLazklfD7vERMtrJoQRaDuOIUT5y7ykt/SnI/L7Tfpg+Yt5yq/
 M1iYr0LkrGgUUt0DX3lqre5Y5b5RsE2P3i4Cr6IDe68jiGrEBzodeBzH2RVAxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dSDaIoXt
Subject: Re: [Buildroot] [PATCH v2 3/3] configs/qemu_sparc_ss10_defconfig:
 Re-introduce.
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

Hello,

On Thu,  2 May 2024 07:55:18 +0300
Dmitry Chestnykh <dm.chestnykh@gmail.com> wrote:

> With uClibc-ng-1.0.48 we can restore this config
> because uClibc-ng was provided the fix for SPARC.
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>

Could you confirm that the instructions in
board/qemu/sparc-ss10/readme.txt are still valid?

Also, could you in this same commit add yourself in the DEVELOPERS file
for this defconfig and the board/qemu/sparc-ss10/ ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
