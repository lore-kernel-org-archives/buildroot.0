Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE01D743D8
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 20:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A820543355;
	Wed, 20 Nov 2024 20:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-7HeBMfu0O8; Wed, 20 Nov 2024 20:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A386544625
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A386544625;
	Wed, 20 Nov 2024 20:52:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8AD7970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C419B42F82
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UesGfZ37twtV for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 20:52:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4309240AEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4309240AEF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4309240AEF
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:52:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7C891C0006;
 Wed, 20 Nov 2024 20:52:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tDrgX-001Dzn-0b;
 Wed, 20 Nov 2024 21:52:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <f068d8afdff3043860dcd894bc5076c1b3817ea5.1727425450.git.baruch@tkos.co.il>
Date: Wed, 20 Nov 2024 21:52:25 +0100
In-Reply-To: <f068d8afdff3043860dcd894bc5076c1b3817ea5.1727425450.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Fri, 27 Sep 2024 11:24:10
 +0300")
Message-ID: <87y11dtypi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/ebtables: remove
 KERNEL_64_USERSPACE_32 workaround
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > This workaround breaks build with gcc 14.
 > Upstream developers acknowledged[1] the 32/64 compatibility issue more
 > than 3 years ago, but no proper fix has been applied. Specifically, for
 > aarch64 we don't even enable BR2_KERNEL_64_USERLAND_32, so this
 > workaround is not effective there.

 > The least we can do is make ebtables depend on
 > !BR2_KERNEL_64_USERLAND_32.

 > [1] https://lore.kernel.org/all/20210518181730.13436-1-patrickdepinguin@gmail.com/

 > Fixes:
 > http://autobuild.buildroot.net/results/680674c2b61209b505efa022a8fd9751ddc5fd47/
 > http://autobuild.buildroot.net/results/60f8f5f087111ec3f300dc7979363de5a9f64f08/

 > Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
