Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7D7C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 18:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 389624057F;
	Mon, 25 Mar 2024 18:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hraQcVWpJ57Q; Mon, 25 Mar 2024 18:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CBA1405BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CBA1405BF;
	Mon, 25 Mar 2024 18:09:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB5381BF263
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5EC640BCA
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYy2eGDUQu3V for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 18:09:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C1D0540476
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1D0540476
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1D0540476
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 18:09:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44C45FF806;
 Mon, 25 Mar 2024 18:09:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rool3-0090GR-1b;
 Mon, 25 Mar 2024 19:09:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240317105529.253562-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Mar 2024 19:09:17 +0100
In-Reply-To: <20240317105529.253562-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Mar 2024 11:55:29 +0100")
Message-ID: <87r0fyb2uq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libunwind: fix libucontext
 handling
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 6ea2a27f9047696ce1c463ad55fb4a78df136954 forgot to add -lucontext
 > to LIBS resulting in the following build failure with zeromq:

 > /home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld:
 > /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib32/libunwind.so.8:
 > undefined reference to `setcontext'

 > Fixes: 6ea2a27f9047696ce1c463ad55fb4a78df136954
 >  - http://autobuild.buildroot.org/results/893defe1588b2ca03c115b59b47be3f4aed438fb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
