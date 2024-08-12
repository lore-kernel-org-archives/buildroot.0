Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60230C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 13:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B9BB4014F;
	Mon, 12 Aug 2024 13:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hk__gA_66-bl; Mon, 12 Aug 2024 13:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1542C40319
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1542C40319;
	Mon, 12 Aug 2024 13:03:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 994B21BF301
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84538811CC
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wF431Wt7i285 for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 13:03:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 541CA811D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 541CA811D1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 541CA811D1
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 13:03:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EB1DFF805;
 Mon, 12 Aug 2024 13:03:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sdUhr-007B8W-00;
 Mon, 12 Aug 2024 15:03:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Steffen Persvold <spersvold@gmail.com>
References: <20240627103457.28001-1-spersvold@gmail.com>
Date: Mon, 12 Aug 2024 15:03:26 +0200
In-Reply-To: <20240627103457.28001-1-spersvold@gmail.com> (Steffen Persvold's
 message of "Thu, 27 Jun 2024 12:34:57 +0200")
Message-ID: <87frr9ki5d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/directfb: enable on riscv32 again
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

>>>>> "Steffen" == Steffen Persvold <spersvold@gmail.com> writes:

 > Newer 32bit architectures like RISCV32 and ARC are using 64bit time_t
 > from the get go unlike other 32bit architectures, therefore aliasing
 > __NR_futex to __NR_futex_time64 avoids the build error mentioned
 > in cb6fd050.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c0f4168575fa85af933539441eea95a3b10dac91

 > Signed-off-by: Steffen Persvold <spersvold@gmail.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
