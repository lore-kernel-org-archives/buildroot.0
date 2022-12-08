Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33CCC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 09:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B392403E7;
	Thu,  8 Dec 2022 09:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B392403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EsF9i4cb_DiI; Thu,  8 Dec 2022 09:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C97D640283;
	Thu,  8 Dec 2022 09:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C97D640283
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D019B1BF3ED
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 09:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA08761085
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 09:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA08761085
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62g2rT06s6DH for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 09:55:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39172605EC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39172605EC
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 09:55:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B248BFF81A;
 Thu,  8 Dec 2022 09:55:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p3DcV-0003bV-LJ; Thu, 08 Dec 2022 10:55:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Max Filippov <jcmvbkbc@gmail.com>
References: <20221130021821.2660112-1-jcmvbkbc@gmail.com>
Date: Thu, 08 Dec 2022 10:55:11 +0100
In-Reply-To: <20221130021821.2660112-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Tue, 29 Nov 2022 18:18:21 -0800")
Message-ID: <874ju62pa8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/elf2flt: fix text relocations on
 xtensa
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > elf2flt 2021.08 has changed endianness swapping logic for relocated
 > entries in the text segment. This broke little-endian xtensa FLAT images
 > which now fail to start with the following message:

 >   binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20)

 > Fix it by restoring old endianness swapping logic for relocated entries
 > in the text segment when building for xtensa.

 > Reported-by: Niklas Cassel <niklas.cassel@wdc.com>
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 > ---
 > I've tested a couple other prominent candidates, but it looks like
 > only xtensa has this issue. I've submitted pull request to elf2flt
 > with the patch below.

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
