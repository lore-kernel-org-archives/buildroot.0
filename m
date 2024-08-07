Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CE1C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 08:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B49F80BAE;
	Wed,  7 Aug 2024 08:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tt0jY1tIDBaX; Wed,  7 Aug 2024 08:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75AB280D1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75AB280D1F;
	Wed,  7 Aug 2024 08:51:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7461BF329
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 08:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0963B60705
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 08:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSVwMb4r2tyh for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 08:51:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1CE6606AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1CE6606AA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1CE6606AA
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 08:51:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB35F240009;
 Wed,  7 Aug 2024 08:51:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbcNo-001aun-1U;
 Wed, 07 Aug 2024 10:51:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <ZNkWXvyVT1DnVHG0@waldemar-brodkorb.de>
 <fc53aba5-aca9-4fd6-96f1-906708e59b4c@mind.be>
Date: Wed, 07 Aug 2024 10:51:00 +0200
In-Reply-To: <fc53aba5-aca9-4fd6-96f1-906708e59b4c@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Fri, 12 Jul 2024 21:44:14
 +0200")
Message-ID: <87y158ogwb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/ntpsec: fix compile issue for some
 toolchains
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

 > On 13/08/2023 19:43, Waldemar Brodkorb wrote:
 >> Ntpsec unconditionally uses PIE to compile code.
 >> This breaks compilation for at least microblaze-uclibc and
 >> m68k-uclibc toolchains.

 >  Also, in Buildroot we anyway have BR2_PIC_PIE to handle this
 >  appropriately according to toolchain capabilities.

 >> It would be better to add a configure option to allow to disable pie
 >> support,
 >> but this is something for an waf expert.
 >> When accepted, should be backported to older releases of Buildroot.
 >> Fixes:
 >> - http://autobuild.buildroot.net/results/77f/77f4e4065874d022a2ae98d82508242f551e224c
 >> - http://autobuild.buildroot.net/results/e45/e45b65f2aa323df075d54ff43b0401b5ac7c6eb5
 >> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

 >  Applied to master, thanks.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
