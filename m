Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDF9C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 21:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AFA140BFC;
	Mon, 31 Jul 2023 21:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AFA140BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYlCsYI3VJl9; Mon, 31 Jul 2023 21:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FA68408B0;
	Mon, 31 Jul 2023 21:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FA68408B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ABC81BF3A1
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09F0240BAB
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09F0240BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRnt1TydAb4o for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 21:52:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC55C40189
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 21:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC55C40189
Received: by mail.gandi.net (Postfix) with ESMTPSA id 906D6E0006;
 Mon, 31 Jul 2023 21:52:37 +0000 (UTC)
Date: Mon, 31 Jul 2023 23:52:36 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230731235236.60ddc54a@windsurf>
In-Reply-To: <20230731201422.13543-1-dalang@gmx.at>
References: <20230731201422.13543-1-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690840357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCz1X6+rQxGG6OUTzE0cUGeweYkPtdYwrtUDFLdO9pQ=;
 b=PjVVL+mucdaMoSvZhHEXgU0acXxDzcYG4FJbqHRncjupMQyQRDqZc9oj2/CLcFUsqDndG2
 5zSms9WVmBnXFGw5Xzr3RfhIF1XuK0G44lIPpx0TubiCe5lp50gV7msJrZKXqJ3yWcMBo4
 e86SVd5IeK31/vLKVpKtGFyyfY/3WV9U2c44uFP6x5KXuG80e82/wzLqQakdYndBzhrCGe
 /4xc23gBRztliQCGeJf2GHmsP8+rb3UETiPTS0P1YKkzeFbAjaWXXiIqp/4P8YI36l1LWJ
 hqFyI4E4O/4X7kVfCztrcY67ikpIRFV7i6pSCIqwnoz5V/OHn/owIsCxqxJDEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PjVVL+mu
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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

Hello Daniel,

On Mon, 31 Jul 2023 22:14:20 +0200
Daniel Lang <dalang@gmx.at> wrote:

> The currently used feed is deprecated and will be retired by NVD in
> September 2023 [0].
> The new API returns up to 2000 CVEs every 5 seconds (without API key) [1].
> Instead of request individual years as with the feed, one can specify
> two timestamps are range. Any CVE changed in this time is returned.
> Therefore every single CVE is stored in a seperate JSON file.
> All fields returned by the API are saved for future use.
> This results in over 200000 files grouped by year with ~800MiB total.
> 
> [0]: https://nvd.nist.gov/General/News/change-timeline
> [1]: https://nvd.nist.gov/developers/start-here
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Wow, thanks for working on this! Is the storing of 200k files workable,
or do we need to consider some other option like a local sqlite
database or something?

Another question: did you do a run of "make pkg-stats" before and after
your patch to compare the results in terms of CVEs reported for each
Buildroot package?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
