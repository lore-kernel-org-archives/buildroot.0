Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8433C3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32AAA40731;
	Sat, 27 Jul 2024 14:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmJoqrxB87ou; Sat, 27 Jul 2024 14:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B05407AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2B05407AA;
	Sat, 27 Jul 2024 14:13:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E05EF1BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D77A7407AA
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id up_v-shgV0GH for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:13:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 62AF840731
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62AF840731
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62AF840731
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:13:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8247EC0002;
 Sat, 27 Jul 2024 14:13:17 +0000 (UTC)
Date: Sat, 27 Jul 2024 16:13:16 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240727161316.4d066c54@windsurf>
In-Reply-To: <20240727094029.2609733-1-dario.binacchi@amarulasolutions.com>
References: <20240727094029.2609733-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722089597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fIDX6xaVUKhxSRXzzb5lNM/vupT56HEv0RB2XCjXhcQ=;
 b=l8dY6OJGLQHrRWdh8tUaR4nFQLrWE3c6P/k1HuAc/dCsirZhXfIj50rfkAfpwMhi0+7hQQ
 9PYBnzJyUVCLZiLUN5jOpo+pjVs/6AHwpyUyjCbNvR8GeqVeMl1EzJSGdIZH5FdgcHwVd9
 a7TVkQ7TG/Pect28Az3vRfrfXQt1j1/e3CsRmx89PcmsraTb23QN3oj5a9V/rqPUokUnFV
 h0KgqAILDM5nxNnkqAtrA5ZPBT/LAJxVJ8kKbwmL5L3ctXwwHaqfdRhrnrSq3tV6qhM+zo
 AW94ZBFBX6TXaihv7b7JibvbIp8NY5rSKjFqaQynuJLTHHGuxokNCmBE2BON0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l8dY6OJG
Subject: Re: [Buildroot] [PATCH 1/1] package/ntpsec: fix build on xtensa
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

Hello Dario,

On Sat, 27 Jul 2024 11:40:29 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Fix the following build failure on xtensa:
> 
> Waf: Entering directory `/home/buildroot/instance-0/output-1/build/ntpsec-1.2.3/build/host'
> [1/2] Processing ntpd/ntp_parser.y
> [2/2] Compiling build/host/ntpd/ntp_parser.tab.c
> gcc: error: unrecognized command-line option '-mlongcalls'
> gcc: error: unrecognized command-line option '-mauto-litpools'

Thanks for the patch, but I'm pretty sure this is not the right fix.
You can see from the error message above that what is happening here is
that those flags, which are target CFLAGS, are passed to the host
compiler "gcc".

So your patch is not correct in several ways:

 - It will not solve the problem of other target CFLAGS used for other
   CPU architectures, which are also not supported by the host gcc
   compiler

 - It drops those target CFLAGS from the build of target code, which is
   not correct, as if some flags are present, there's a good reason for
   that.

So, the correct fix is to look in more details into the ntpsec build
system, and make sure it doesn't use target CFLAGS when building host
code.

Could you have a look into this?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
