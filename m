Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7EFC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 17:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DA168403C;
	Fri, 12 Jan 2024 17:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA168403C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lo6dgUtPxe8D; Fri, 12 Jan 2024 17:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73CDF83F85;
	Fri, 12 Jan 2024 17:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73CDF83F85
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A75C1BF309
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0385760B3C
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0385760B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPh4fjj2Y3Jc for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 17:16:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F196F60AEE
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 17:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F196F60AEE
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9AD1C0002;
 Fri, 12 Jan 2024 17:16:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOL9E-00C7hH-1E;
 Fri, 12 Jan 2024 18:16:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240102204208.1662781-1-fontaine.fabrice@gmail.com>
Date: Fri, 12 Jan 2024 18:16:48 +0100
In-Reply-To: <20240102204208.1662781-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 2 Jan 2024 21:42:08 +0100")
Message-ID: <87ttnizd33.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libsigsegv: fix musl build with
 powerpc
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following musl build failure with powerpc raised since bump to
 > version 2.14 in commit c6addf4606c3a41cdad5c6ac4c6508b298b6e92a:

 > In file included from fault.h:36,
 >                  from handler-unix.c:77,
 >                  from handler.c:19:
 > handler-unix.c: In function 'sigsegv_handler':
 > fault-linux-powerpc.h:35:73: error: 'mcontext_t' has no member named 'uc_regs'; did you mean 'gregs'?
 >    35 | #  define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
 >       |                                                                         ^~~~~~~
 > handler-unix.c:157:43: note: in expansion of macro 'SIGSEGV_FAULT_STACKPOINTER'
 >   157 |           uintptr_t old_sp = (uintptr_t) (SIGSEGV_FAULT_STACKPOINTER);
 >       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/77b600071f07605be3ec28e2da46d6938e240087

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
