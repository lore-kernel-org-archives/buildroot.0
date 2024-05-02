Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191CDC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA96D4173A;
	Thu,  2 May 2024 16:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a18NSt37cOnD; Thu,  2 May 2024 16:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 456D54175A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 456D54175A;
	Thu,  2 May 2024 16:31:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64DCB1BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50B30822D5
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LO-6GZwXQE6f for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1FE1B822C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FE1B822C6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FE1B822C6
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:31:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54C0BC0003;
 Thu,  2 May 2024 16:30:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2ZKk-00ArRB-2d;
 Thu, 02 May 2024 18:30:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sen Hastings <sen@hastings.org>
References: <20240305093334.2233237-1-sen@hastings.org>
Date: Thu, 02 May 2024 18:30:58 +0200
In-Reply-To: <20240305093334.2233237-1-sen@hastings.org> (Sen Hastings's
 message of "Tue, 5 Mar 2024 01:33:34 -0800")
Message-ID: <87bk5o5g71.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] support/scripts/pkg-stats:
 fix/improve git hash sorting
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

>>>>> "Sen" == Sen Hastings <sen@hastings.org> writes:

 > sortGrid()'s handling of git hashes and other large hex numbers
 > has been inconsistent, they can be detected as strings or numbers
 > depending on what type of character they start with.
 > This patch fixes the behaviour by using a regex to capture everything
 > that looks like a big hex number and treat it as a string.
 > This means when you sort by current version ascending all the version
 > strings with big hex numbers should show up first, sorted 0-9,a-f.

 > First we check for a string length >= 39, and then apply a regex
 > to return an array with every char from that string that matched
 > the regex. If the length of this array is still >= 39 we can assume
 > we are looking at something containing a git hash.

 > The reason why the length is defined as ">= 39" and not "40" or
 > "39 or 40" is twofold:

 > Firstly, 39 was chosen as a minimum to match stuff with 39 char git
 > hashes, like the rockchip-mali package.

 > Secondly, there is no max because we actually want to catch not
 > just explicitly git hashes, but any verson string with big gnarly
 > hex numbers in it.
 > Stuff like: "1.4.2-168-ged3039cdbeeb28fc0011c3585d8f7dfb91038292"

 > Why? Well, the idea is less about git hashes and sorting
 > and more about grouping similarly formatted version strings.

 > It would be impossble (or at least annoyingly complicated) and of
 > dubious utility to get a real sequential sort out of the
 > current version column, so the attempt here is to at the very
 > least collect all the similarly formatted things together.

 > This isn't perfect, but it's a (arguably) more useful sorted
 > output than before.

 > A demo is available here:
 > https://sen-h.codeberg.page/pkg-stats-demos/@pages/fix-improve-git-hash-sorting.html

 > Signed-off-by: Sen Hastings <sen@hastings.org>
 > ---
 > Changes v1 -> v2:
 >   - more detailed commit log (requested by Yann E. MORIN)

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
