Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698C9C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2342581434;
	Wed,  7 Aug 2024 20:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFYcix9t-H0Y; Wed,  7 Aug 2024 20:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 259258143C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 259258143C;
	Wed,  7 Aug 2024 20:19:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 086201BF308
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E778840570
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c104czA-0i1y for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B65340675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B65340675
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B65340675
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:19:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92B1820002;
 Wed,  7 Aug 2024 20:19:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbn7r-002r3T-2v;
 Wed, 07 Aug 2024 22:19:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240520095205.81575-1-ju.o@free.fr>
Date: Wed, 07 Aug 2024 22:19:15 +0200
In-Reply-To: <20240520095205.81575-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 20 May 2024 11:52:05 +0200")
Message-ID: <87r0b0m6gs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: fix build with host make
 >= 4.4
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > When build host has a many CPUs (more that 20) and GNU Make 4.4
 > (included for example in Fedora 40), fwts can randomly fail to build.

 > This commit adds a package patch to fix the issue.

 > Fixes:

 >     mv: cannot stat 'dtcompilerparser.tab.c': No such file or directory
 >     mv: cannot stat 'prparser.tab.c': No such file or directory

 > See also:
 > https://github.com/fwts/fwts/issues/7

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Note: this patch is a follow up of:
 > https://patchwork.ozlabs.org/project/buildroot/patch/20240420132251.1349622-1-ju.o@free.fr/
 > This new patch allows to keep the parallel build and also fix the issue.
 > This is why it is not marked as v2. I marked the old proposal as "Rejected".
 > ---

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
