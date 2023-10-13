Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2524CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3B4E81364;
	Fri, 13 Oct 2023 06:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B4E81364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBy5wNTYaNOr; Fri, 13 Oct 2023 06:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD99A82211;
	Fri, 13 Oct 2023 06:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD99A82211
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C8561BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38AFC4029C
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38AFC4029C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEh5QNd_E052 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:21:16 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 327C740290
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327C740290
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0564624000A;
 Fri, 13 Oct 2023 06:21:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrBXm-006uti-5t; Fri, 13 Oct 2023 08:21:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230930102328.537070-1-thomas.petazzoni@bootlin.com>
Date: Fri, 13 Oct 2023 08:21:06 +0200
In-Reply-To: <20230930102328.537070-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sat, 30 Sep 2023 12:23:28
 +0200")
Message-ID: <87fs2f6o19.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gnu-efi: disable on mips64el
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > The gnu-efi package was enabled on mips64el by commit
 > 11b347c03ab0b38389ec11b48f63236a3b4d6547 ("package/gnu-efi: add
 > mips64el support"). However, it has been failing to build for a long
 > time, and nobody bothered fixing it:

 > gnu-efi-3.0.15//gnuefi/crt0-efi-mips64el.S:71: Error: cannot represent BFD_RELOC_16 relocation in this object file format

 > Even reverting back to gnu-efi 3.0.10, which was the version used at
 > the time of 11b347c03ab0b38389ec11b48f63236a3b4d6547, does not fix the
 > issue. We tested updating to the latest gnu-efi version, 3.0.17, and
 > the problem still exists.

 > Since EFI on MIPS is extremely niche, we don't really want to invest
 > the time to fix this issue, so let's disable it again. If someone
 > cares enough, it can be fixed and re-enabled.

 > Fixes:

 >   http://autobuild.buildroot.net/results/d5938edcf50ebb7fdcec148d73f402845079779d/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
