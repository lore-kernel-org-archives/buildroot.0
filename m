Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB9FC25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 13:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8671281F97;
	Wed, 15 May 2024 13:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AObocgZV37NR; Wed, 15 May 2024 13:25:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AFC981EFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AFC981EFB;
	Wed, 15 May 2024 13:25:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 312311BF2C2
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 13:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E4BF607AF
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 13:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rolu-GMolFMw for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 13:25:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0606B60632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0606B60632
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0606B60632
 for <buildroot@buildroot.org>; Wed, 15 May 2024 13:25:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF128240002;
 Wed, 15 May 2024 13:25:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s7EdM-001DOs-0Z;
 Wed, 15 May 2024 15:25:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240424201033.550180-1-romain.naour@smile.fr>
Date: Wed, 15 May 2024 15:25:28 +0200
In-Reply-To: <20240424201033.550180-1-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 24 Apr 2024 22:10:33 +0200")
Message-ID: <87ttizqkaf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/testing: TestF2FS: update kernel to
 4.19.310
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

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Since the toolchain Bootlin update to 2023.11-1 [1], the arm Linux
 > kernel build is broken with binutils >= 2.41 with:

 >   arch/arm/mm/proc-v7.S: Assembler messages:
 >   arch/arm/mm/proc-v7.S:640: Error: junk at end of line, first unrecognized character is `#'

 > A similar issue has already be fixed for qemu m68k [2].

 > Bump to the latest kernel 4.19 that already include the backport
 > of 790756c7e022 ("ARM: 8933/1: replace Sun/Solaris style flag on section directive")

 > [1] 7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1
 > [2] a1ce9474e40f731f327035d8c0962abb16f00ff7

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222383

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
