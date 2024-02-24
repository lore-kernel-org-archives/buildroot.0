Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B87C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 17:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09DA96073C;
	Sat, 24 Feb 2024 17:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pFnEGSrkQMOS; Sat, 24 Feb 2024 17:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 296C460749
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 296C460749;
	Sat, 24 Feb 2024 17:13:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F141B1BF2C4
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 17:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC6B840739
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 17:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCLvB6O44fJs for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 17:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F6CD40707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F6CD40707
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F6CD40707
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 17:12:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE8A6C0004;
 Sat, 24 Feb 2024 17:12:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rdva2-00DZrV-2r;
 Sat, 24 Feb 2024 18:12:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240218210735.50128-1-fontaine.fabrice@gmail.com>
Date: Sat, 24 Feb 2024 18:12:54 +0100
In-Reply-To: <20240218210735.50128-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Feb 2024 22:07:35 +0100")
Message-ID: <87sf1hu6p5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tio: needs threads
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > tio needs threads since version 2.4 and
 > https://github.com/tio/tio/commit/93e6efc00153e625e4ceb8a51e01b324247d312a
 > resulting in the following build failure since bump to version 2.7 in
 > commit 4b33d7a47dd41fed5364a398320c2b7d0687ba5e:

 > In file included from /home/autobuild/autobuild/instance-7/output-1/host/riscv64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:27,
 >                  from ../src/tty.c:23:
 > /home/autobuild/autobuild/instance-7/output-1/host/riscv64-buildroot-linux-uclibc/sysroot/usr/include/features.h:218:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]
 >   218 | #   warning requested reentrant code, but thread support was disabled
 >       |     ^~~~~~~
 > ../src/tty.c:43:10: fatal error: pthread.h: No such file or directory
 >    43 | #include <pthread.h>
 >       |          ^~~~~~~~~~~

 > Fixes: 4b33d7a47dd41fed5364a398320c2b7d0687ba5e
 >  - http://autobuild.buildroot.org/results/9b20ff06a0ad24b7e7f4750ebe64e2077e36164a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
