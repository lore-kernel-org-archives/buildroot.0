Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98081C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61B57606D3;
	Fri,  2 Aug 2024 21:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yK1herIA_iJp; Fri,  2 Aug 2024 21:36:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74CEC612F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74CEC612F9;
	Fri,  2 Aug 2024 21:36:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 422B21BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9E9A40374
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQXp0K4NhE6v for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:35:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89EA0403AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89EA0403AE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89EA0403AE
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:35:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E2F11BF203;
 Fri,  2 Aug 2024 21:35:57 +0000 (UTC)
Date: Fri, 2 Aug 2024 23:35:56 +0200
To: <yann.morin@orange.com>
Message-ID: <20240802233556.7bfe9dcd@windsurf>
In-Reply-To: <cover.1720535037.git.yann.morin@orange.com>
References: <cover.1720535037.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722634557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgpYq6xFR38bsVXiZiRPIW86v2k0Om+5jLJ+RtKw5t4=;
 b=oLhui3DB84SEHujonDBpZPJH6sasMNBydxIpsepcqLnLWuS01LnXxwDQKRz4OVDz+mdj3B
 3MQOlDCLnSpJmSMQ3T5cqYK4Ck5qQj7egZm2rgeydqE1Z76Kl7EY/dQtnzVwR4TtpLyuRW
 zCSKZCJRhmsQTbwKTw7f+/VKjfJqJ9Z1sRVGMfoWnAVAB1Ba1RdpYMMif7PXDhyEuWVILO
 /q7npZOWyd+XXZ/MTvlGCg9lyMZV5CrlxUd6Xsv+ITarkHdBLw8qKLHY1eot2h41CrL7e5
 pWoruQc0yCkItkX/rCL9Ew3JJk9qOsHogETymCya9+UsGwsAOhLrNKpWuQNUzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oLhui3DB
Subject: Re: [Buildroot] [PATCH 0/5] package/gpsd: make the package more
 modular
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 9 Jul 2024 16:23:58 +0200
<yann.morin@orange.com> wrote:

> Yann E. MORIN (5):
>       package/gpsd: condition python stuff to the proper kconfig option
>       package/gpsd: fix comment about wchar requirement
>       package/gpsd: move python option later
>       package/gpsd: add option to enable clients
>       package/gpsd: add option to enable/disable the daemon

Thanks a lot! Series applied.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
