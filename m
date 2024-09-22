Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A97CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0440A80D15;
	Sun, 22 Sep 2024 10:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nh4qA7TAl_Yy; Sun, 22 Sep 2024 10:10:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2951780E72
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2951780E72;
	Sun, 22 Sep 2024 10:10:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F1731BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D98F40252
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHfD-OadtJhg for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:10:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8E5840236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8E5840236
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8E5840236
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:10:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E0CF1C0003;
 Sun, 22 Sep 2024 10:10:10 +0000 (UTC)
Date: Sun, 22 Sep 2024 12:10:08 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240922121008.40e2a470@windsurf>
In-Reply-To: <20240922092312.2061358-6-dario.binacchi@amarulasolutions.com>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
 <20240922092312.2061358-6-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726999812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dshowf6QUX0dgubM0OzVkOjvkZEqIViRhv7TsOz6J3M=;
 b=hdylj9XcIeTwXP14eCLgObEy9pXuOKAfZyEPcuuuK06vY/eFIKQJTNMh1ZHf7BENuJ/cll
 bMkEMXDxwHzRYBUYYWCSk5SPpiIqgo99d6dUQXCujobKkEun8eSwxSjKNSM2L/eRr1GJka
 SOtckzWFU8kJzXSRvcq36IE8o2pbQA/PQ7HaTNg248LqzoJltcu4mKO+jWaBvmMz3I562/
 1RB3ZKvz3HxPK/3W1b0mP0jCWhM1HGa8xJQSN2YD9fcvco6LvsoLEoPR0LOIqkZScEAnPp
 kdotptQzdrp4c7BwvFbXjgcpaKRhfr16ZI0XCDHF/+bKnSszq8Su0M0Joc+bKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hdylj9Xc
Subject: Re: [Buildroot] [PATCH v2 5/9] boot/uboot: pass -mno-fdpic if FDPIC
 is enabled
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
Cc: Romain Naour <romain.naour@gmail.com>, yann.morin.1998@free.fr,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 linux-amarula@amarulasolutions.com,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 22 Sep 2024 11:23:08 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
> 
> If the FDPIC ABI is enabled by default in the toolchain, it must be
> explicitly disabled when building U-Boot.
> 
> Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

This patch and PATCH 6/9 which does the same for the Linux package makes me wonder what is the right approach, and I am not fully clear.

Indeed, we already have some logic in the toolchain-wrapper to pass or
not pass certain flags when we're building U-Boot or the kernel.

However, in this case, FDPIC is enabled by default, and the wrapper
would have to disable FDPIC when building U-Boot/Linux, which isn't
what the wrapper is doing today. So I'm a bit unsure on what's the best
approach between what you're proposing, and handling things in the
wrapper. Perhaps we need to try what you proposed, and see if it works
well for all use-cases.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
