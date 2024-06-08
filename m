Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D43DC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 08:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE00A413A9;
	Sat,  8 Jun 2024 08:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ex_etZxaF8jE; Sat,  8 Jun 2024 08:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFC9942742
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC9942742;
	Sat,  8 Jun 2024 08:13:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9842B1BF421
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 08:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83BF584950
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 08:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWnfvYa3695C for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 08:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 65B3B8494A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65B3B8494A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65B3B8494A
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 08:13:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31D3E20004;
 Sat,  8 Jun 2024 08:12:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFrC4-00GY5s-1d;
 Sat, 08 Jun 2024 10:12:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240511181352.1712489-1-dario.binacchi@amarulasolutions.com>
Date: Sat, 08 Jun 2024 10:12:56 +0200
In-Reply-To: <20240511181352.1712489-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Sat, 11 May 2024 20:13:52 +0200")
Message-ID: <87frtn97jr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/sscep: fix linking error with
 musl-libc
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > The patch fixes the following linking failure:
 > /home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld:
 > /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o):
 > in function `getopt':
 > getopt.c:(.text.getopt+0x0): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here
 > /home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld:
 > /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o):(.data.optind+0x0):
 > multiple definition of `optind'; src/getopt.o:(.data+0x0): first
 > defined here

 > Fixes:
 > - http://autobuild.buildroot.net/results/d5b1b4e5e9d9c8eca5e75c345db4d1f3f0cd84ed

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
