Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BD3C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 20:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D380B810B7;
	Mon, 22 Jul 2024 20:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XYA7qpcdLII; Mon, 22 Jul 2024 20:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECEAF810C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECEAF810C5;
	Mon, 22 Jul 2024 20:22:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70AFB1BF296
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AE5160666
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYcpBtExrYoo for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 20:22:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6913060652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6913060652
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6913060652
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 20:22:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A621C1C0003;
 Mon, 22 Jul 2024 20:21:58 +0000 (UTC)
Date: Mon, 22 Jul 2024 22:21:56 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20240722222156.4959aec7@windsurf>
In-Reply-To: <20240509231050.5365ecf0@windsurf>
References: <20240509204218.77779-1-fontaine.fabrice@gmail.com>
 <20240509231050.5365ecf0@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721679718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hxKLQTExZt5B7CEWZv2i5oz0sNPUc3A5GToBKVUEB0A=;
 b=plRIf4JiXYdUNJR1JGfQuKLLpkoq88WqP9nWFKbNtTOSYkMGgtpyJgGYL7jRj+ME5L9bQq
 NLcMYY+FLinwK9z622tXmfYcqVU2aJt9QmNvhvyD9WAB60z8VsxgJ7GvkAQ2UE+HHkRCx/
 cajlMeJHdshPrRDjz5BJOz5ucT32ulp7FVOZyGkg3re4JEH5OLKeZjRwwQMG6V8kuwHhtf
 vUYBkw6CP6p5WtPVAqbjaBG6FVitT3b7myZwxOoUcpQG8jP0w6Q/HGNcthkGMhMAMI2GVo
 jHtab1MDQjxdHAvWpZfmk283TEPD57zazpxh1Tas1SCTF/wdDGPZfulR/7fwKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=plRIf4Ji
Subject: Re: [Buildroot] [PATCH 1/1] package/libp11: fix enginesdir
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Thu, 9 May 2024 23:10:50 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> > -# pkg-config returns a libcrypto enginesdir prefixed with the sysroot,
> > -# so let's rip it out.  
> 
> Well, this workaround was here for a reason. Since when it is no longer
> needed?

Ping on the above question :-)

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
