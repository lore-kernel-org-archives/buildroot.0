Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820B3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 08:55:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D1EB60ED8
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 08:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D1EB60ED8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355E1607DC;
	Mon, 20 Sep 2021 08:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eJYwfYDrPqUM; Mon, 20 Sep 2021 08:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93375607CF;
	Mon, 20 Sep 2021 08:55:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 168A51BF403
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 08:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 051C54036B
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 08:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZGkT4nbFbMi for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 08:55:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CA22400A4
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 08:55:33 +0000 (UTC)
Received: from [147.173.65.159] (pulsar.grenoble.cnrs.fr [147.173.65.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id EBC9CC105C
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 10:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1632128130;
 bh=xGMpI8wrBpoSUF4JnMiOPuROQaxmiB9nYXXD5KjvgDE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=AdnUXeWnYoQ4fUjb+rXG8/0DFuifh525Q8WwNe6u6sKfZtwGhfj8T3vv/nYYeHJ8W
 BV7sYjcLyvTJvxSWDP0dHsEezhnH1RaKPB6LvxVcshugIM6e5rTHj56mDwal5g1Akj
 A5riNffmBBFQ4aU+AQC2/7wqqofKdL85UGGXSoSXnl5nWK1MZTyInzycGqiKGGje/3
 d00mmwdukeU4wTbl23uZ1Zy9AoQcDv7nTxVe3maFpqWKkoSoUaIxeeH2mT046sBn1S
 u8MvMr2A104OVpB2G6bHzLiP9CAdPLVbnPcUXtL7IACmXBubt6eEpJBL8Wl74rPYdI
 IS0d6/dIgr5Rg==
To: buildroot@buildroot.org
References: <20210919141053.3afc7389@windsurf>
 <d2a735d1-aadb-2c28-72f3-babef83448cc@grenoble.cnrs.fr>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <11632800-793a-6d2d-8ee4-0182092c8f35@grenoble.cnrs.fr>
Date: Mon, 20 Sep 2021 10:55:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d2a735d1-aadb-2c28-72f3-babef83448cc@grenoble.cnrs.fr>
Content-Language: en-US
Subject: Re: [Buildroot] Issue with capture of emulator output in runtime
 test infra
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello!

Yesterday I wrote:
> Is it just a coincidence that the line got wrapped at exactly 80
> columns [...]

I think I found where the spurious line break comes from. Busybox's
lineedit library has a trick to work around the VT100's automargin
feature.[1] When a character is printed on the last column of the
terminal, lineedit adds a carriage return in order to force the cursor
to the next line:

		/* we go to the next line */
#if HACK_FOR_WRONG_WIDTH
		/* This works better if our idea of term width is wrong
		 * and it is actually wider (often happens on serial lines).
		 * Printing CR,LF *forces* cursor to next line.
		 * OTOH if terminal width is correct AND terminal does NOT
		 * have automargin (IOW: it is moving cursor to next line
		 * by itself (which is wrong for VT-10x terminals)),
		 * this will break things: there will be one extra empty line */
		puts("\r"); /* + implicit '\n' */

There doesn't seem to be a way to override this behavior, but we could
make busybox believe our terminal is ultra wide. Busybox gets its idea
of the terminal width from the kernel, via the TIOCGWINSZ ioctl[2]. The
kernel within the emulator may not be able to know the host's terminal
width, in which case setting the dimensions attribute in pexpect.spawn()
may not have any effect. We can, however, override the terminal width
using the "COLUMNS" environment variable[3], but beware that values
larger than 29999 are ignored.

Regards,

Edgar.

[1] https://git.busybox.net/busybox/tree/libbb/lineedit.c?h=1_33_1#n402
[2] https://git.busybox.net/busybox/tree/libbb/xfuncs.c?h=1_33_1#n263
[3] https://git.busybox.net/busybox/tree/libbb/xfuncs.c?h=1_33_1#n235
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
