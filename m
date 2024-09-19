Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA2FCE8D78
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 11:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6D0F40151;
	Thu, 19 Sep 2024 11:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GxRoOqw1Wvb; Thu, 19 Sep 2024 11:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2A494011A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A494011A;
	Thu, 19 Sep 2024 11:18:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4F7A1BF33B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B380A40151
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBhjrcGoc7Qe for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 11:17:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6032E4011A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6032E4011A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6032E4011A
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:17:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C2E21C0005;
 Thu, 19 Sep 2024 11:17:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1srFAT-00EBst-1n;
 Thu, 19 Sep 2024 13:17:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <Zr6uJlRPgiprr48c@waldemar-brodkorb.de>
 <12d6d1b8-f5dd-4961-bc39-7214a3e6b084@mind.be>
Date: Thu, 19 Sep 2024 13:17:49 +0200
In-Reply-To: <12d6d1b8-f5dd-4961-bc39-7214a3e6b084@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Wed, 11 Sep 2024 21:39:24
 +0200")
Message-ID: <87zfo3ki3m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/nginx: fix static build error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 16/08/2024 03:40, Waldemar Brodkorb wrote:
 >> In commit 761259c93400bc806611a242c7dc3df7ff67c231 the SSL patch was
 >> removed, without testing any static compilation.
 >> Reintroduce a small version of the original patch.
 >> Upstream does not use pkg-config, so the patch is Buildroot specific
 >> and
 >> not suitable for upstreaming.
 >> Fixes:
 >> - http://autobuild.buildroot.net/results/a85/a85b00dfe9b55607390ebacc0e4e55c7cfbace3a
 >> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

 >  Applied to master, thanks.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
