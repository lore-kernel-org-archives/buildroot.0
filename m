Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0906AD2E9D0
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 10:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CA0680CB3;
	Mon, 11 Nov 2024 10:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0n9TbGgSZrV; Mon, 11 Nov 2024 10:05:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D5180C64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93D5180C64;
	Mon, 11 Nov 2024 10:05:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BB6F6C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BB35402F2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkwehAzMGa_F for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 10:05:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72D6E4028E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72D6E4028E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72D6E4028E
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:05:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D15DD1C0009;
 Mon, 11 Nov 2024 10:05:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tARIJ-008jof-0g;
 Mon, 11 Nov 2024 11:05:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Petr Vorel <petr.vorel@gmail.com>,
 linux-amarula@amarulasolutions.com
References: <20240919140113.17482-1-dario.binacchi@amarulasolutions.com>
Date: Mon, 11 Nov 2024 11:05:15 +0100
In-Reply-To: <20240919140113.17482-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Thu, 19 Sep 2024 16:01:13 +0200")
Message-ID: <87bjymcch0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: fix building error
 using designated initializers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > This patch fixes the following error:
 > arpd.c:442:17: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
 >   442 |                 NULL,   0,

 > The analysis of socket.h [1] containing the msghdr structure shows that
 > it has been modified with the addition of padding fields, which cause
 > the compilation error:

 > struct msghdr {
 > 	void *msg_name;
 > 	socklen_t msg_namelen;
 > 	struct iovec *msg_iov;
 > #if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __BIG_ENDIAN
 > 	int __pad1;
 > #endif
 > 	int msg_iovlen;
 > #if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __LITTLE_ENDIAN
 > 	int __pad1;
 > #endif
 > 	void *msg_control;
 > #if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __BIG_ENDIAN
 > 	int __pad2;
 > #endif
 > 	socklen_t msg_controllen;
 > #if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __LITTLE_ENDIAN
 > 	int __pad2;
 > #endif
 > 	int msg_flags;
 > };

 > The use of designated initializers allows the issue to be fixed.

 > [1] iproute2/host/mips64-buildroot-linux-musl/sysroot/usr/include/sys/socket.h

 > Fixes:
 > - http://autobuild.buildroot.org/results/e4cdfa38ae9578992f1c0ff5c4edae3cc0836e3c

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
