Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423EFCA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 11:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D456F605AF;
	Mon,  2 Sep 2024 11:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ba5uVxyWCFT8; Mon,  2 Sep 2024 11:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E127C607DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E127C607DA;
	Mon,  2 Sep 2024 11:17:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DED071BF46D
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 11:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC7E2607DA
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 11:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hURQ6IJEp4aF for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 11:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C1D8605AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C1D8605AF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C1D8605AF
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 11:17:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8923D1BF208;
 Mon,  2 Sep 2024 11:17:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sl53y-002Ef9-0n;
 Mon, 02 Sep 2024 13:17:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240719210325.2096254-1-thomas.petazzoni@bootlin.com>
Date: Mon, 02 Sep 2024 13:17:38 +0200
In-Reply-To: <20240719210325.2096254-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 19 Jul 2024 23:03:24
 +0200")
Message-ID: <87v7zeqp7x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gcc: fix build with
 BR2_TIME_BITS_64=y
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On the architectures that supports libsanitizer (part of gcc), the
 > build is currently failing with BR2_TIME_BITS_64=y. This is because
 > some code in libsanitizer unsets _FILE_OFFSET_BITS, but building code
 > with _FILE_OFFSET_BITS unset, but _TIME_BITS set isn't legal.

 > To fix this, this commit backports two changes:

 > - One change to also unset _TIME_BITS in
 >   sanitizer_platform_limits_posix.cpp. This change is upstream in
 >   LLVM, and already part of GCC 14.x, so we only bringing it to GCC
 >   12.x and GCC 13.x.

 > - A second change doing the same modification, but in
 >   sanitizer_procmaps_solaris.cpp, which as crazy as it might sound,
 >   also gets compiled on Linux platforms (but to basically an empty
 >   file). This change has been submitted upstream to both LLVM and gcc.

 > Notes:

 >  - the special PowerPC SPE version of GCC cannot be affected, as only
 >    uClibc-ng is used for this architecture, and uClibc-ng doesn't use
 >    _TIME_BITS=64 (but now default to 64-bit time_t on 32-bit
 >    architectures, like musl does).

 >  - the special ARC version doesn't need patching because libsanitizer
 >    doesn't support the ARC architecture, so it doesn't get built

 > Fixes:

 >   http://autobuild.buildroot.net/results/ff2dbfdabf0bb6a0d82ea8a80122ab97fd75bd3f/
 >   https://gitlab.com/buildroot.org/buildroot/-/issues/16

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
