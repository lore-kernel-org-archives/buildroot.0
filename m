Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2ACC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E54A60A44;
	Mon,  6 May 2024 20:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOUnjMnmqrS6; Mon,  6 May 2024 20:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6421A60A48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6421A60A48;
	Mon,  6 May 2024 20:51:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E17111BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9DB3406D1
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-o4fbL6jJz2 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:51:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6C7D406CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C7D406CF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6C7D406CF
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:51:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABD49C0003;
 Mon,  6 May 2024 20:51:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s45J6-003jHr-0W;
 Mon, 06 May 2024 22:51:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240327162319.149021-1-romain.naour@smile.fr>
Date: Mon, 06 May 2024 22:51:32 +0200
In-Reply-To: <20240327162319.149021-1-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 27 Mar 2024 17:23:19 +0100")
Message-ID: <878r0mzmsr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/testing: TestFileCapabilities:
 update kernel to 4.19.310
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
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6414160106 (TestFileCapabilities)

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
