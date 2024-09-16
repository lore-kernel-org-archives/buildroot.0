Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D7FC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 08:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AA6F80C95;
	Mon, 16 Sep 2024 08:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DiD_3RHY_WkR; Mon, 16 Sep 2024 08:32:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 949E780C98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 949E780C98;
	Mon, 16 Sep 2024 08:32:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FAEB1BF311
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CD0F40AD8
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sskvcsgo1CTj for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 08:31:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47FA240159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47FA240159
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47FA240159
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:31:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F34EF40006;
 Mon, 16 Sep 2024 08:31:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sq797-008roR-1H;
 Mon, 16 Sep 2024 10:31:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240811141356.1201929-1-ju.o@free.fr>
Date: Mon, 16 Sep 2024 10:31:44 +0200
In-Reply-To: <20240811141356.1201929-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 11 Aug 2024 16:13:56 +0200")
Message-ID: <87tteguhhr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpg-error: needs MMU
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > libgpg-error imported code using fork() in commit [1] and enabled it
 > soon after in [2]. Those commits were first included in libgpg-error
 > version 1.28.

 > For reference, the libgpg-error Buildroot package was updated to that
 > version in commit [3].

 > When Buildroot configuration has no MMU support (e.g. BR2_USE_MMU is
 > not set), libgpg-error fails to build with error:

 >     /build/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./.libs/libgpg-error.a(libgpg_error_la-spawn-posix.o): in function '_gpgrt_process_spawn':
 >     spawn-posix.c:(.text+0x630): undefined reference to 'fork'

 > This issue can be observed with the command:

 >     utils/test-pkg -a -p libgpg-error

 > It will show few build failures:

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
