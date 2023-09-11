Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94765EE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 09:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED2E14021E;
	Mon, 11 Sep 2023 09:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED2E14021E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xus4IyQKFK6K; Mon, 11 Sep 2023 09:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7D440121;
	Mon, 11 Sep 2023 09:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D7D440121
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 041121BF20D
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 09:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEDED60E34
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 09:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEDED60E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WD32zmFyOhay for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 09:34:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E12DA60C0C
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 09:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E12DA60C0C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F4BAFF811;
 Mon, 11 Sep 2023 09:33:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfdIs-00EcI2-EY; Mon, 11 Sep 2023 11:33:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230604163535.1102239-1-alexander.sverdlin@gmail.com>
 <20230807221454.0e0eb258@windsurf>
Date: Mon, 11 Sep 2023 11:33:58 +0200
In-Reply-To: <20230807221454.0e0eb258@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 7 Aug 2023 22:14:54 +0200")
Message-ID: <87h6o1caux.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gcc: Disable libsanitizer on
 arm920t/thumb
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sun,  4 Jun 2023 18:35:35 +0200
 > Alexander Sverdlin <alexander.sverdlin@gmail.com> wrote:

 >> libsanitizer is broken for Thumb1, sanitizer_linux.cc contains
 >> unconditional "ldr ip, [sp], #8", which causes:
 >> 
 >> ....s: Assembler messages:
 >> ....s:4190: Error: lo register required -- `ldr ip,[sp],#8'
 >> 
 >> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
 >> ---
 >> package/gcc/gcc.mk | 8 ++++++++
 >> 1 file changed, 8 insertions(+)

 > Sorry for the long delay, this is absolutely correct. I've only added a
 > reference to an autobuilder issue fixed by this commit in the commit
 > log. Thanks!

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
