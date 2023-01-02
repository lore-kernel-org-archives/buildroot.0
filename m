Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3C2C4167B
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 07:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5004E81A39;
	Mon,  2 Jan 2023 07:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5004E81A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h0V5pr8dztGR; Mon,  2 Jan 2023 07:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92FA58143D;
	Mon,  2 Jan 2023 07:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92FA58143D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 178891BF3E0
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 07:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E77FA400D0
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 07:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E77FA400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kE61Yknzn4OH for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 07:26:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83963400B8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83963400B8
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 07:26:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 52BC62000A;
 Mon,  2 Jan 2023 07:25:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pCFCm-000ude-6F; Mon, 02 Jan 2023 08:25:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Tan En De <ende.tan@starfivetech.com>
References: <20221224044616.3909215-1-ende.tan@starfivetech.com>
Date: Mon, 02 Jan 2023 08:25:56 +0100
In-Reply-To: <20221224044616.3909215-1-ende.tan@starfivetech.com> (Tan En De's
 message of "Sat, 24 Dec 2022 12:46:16 +0800")
Message-ID: <87bknhcs8r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [1/1] package/libkcapi: Fix symver build error on
 non-ELF platforms
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
Cc: Stephan Mueller <smueller@chronox.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Tan" == Tan En De <ende.tan@starfivetech.com> writes:

 > The following error is observed on Microblaze [1] build:
 > ```
 > error: symver is only supported on ELF platforms
 > ```
 > due to using __attribute__((symver)) on non-ELF platform.
 > So, revert to using .symver in such case.

 > [1]: http://autobuild.buildroot.net/results/447/4470efb5a078c0e368f6bd4f5ec455eea5eeebb5/build-end.log

 > Upstream status: commit f630ed1f807e26de04b3a5dfd7f1b39d1c5cb642
 > https://github.com/smuellerDD/libkcapi/pull/147

 > Signed-off-by: Tan En De <ende.tan@starfivetech.com>
 > Signed-off-by: Stephan Mueller <smueller@chronox.de>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
