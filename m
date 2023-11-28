Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21213C07CA9
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 22:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A1560E35;
	Tue, 28 Nov 2023 22:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4A1560E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EklfR2JBczuG; Tue, 28 Nov 2023 22:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15BDF60C0F;
	Tue, 28 Nov 2023 22:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15BDF60C0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7431E1BF379
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 22:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47D9440A00
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 22:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47D9440A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 89pzI5ZLcor5 for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 22:56:26 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04E8C405CE
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 22:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E8C405CE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F91F240003;
 Tue, 28 Nov 2023 22:56:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r870A-000fAg-1i;
 Tue, 28 Nov 2023 23:56:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231128194647.12817-1-fontaine.fabrice@gmail.com>
Date: Tue, 28 Nov 2023 23:56:22 +0100
In-Reply-To: <20231128194647.12817-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 28 Nov 2023 20:46:47 +0100")
Message-ID: <87il5lbi7d.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] system/Config.in: disable openrc with
 uclibc
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > openrc raises the following uclibc build failures since bump to version
 > 0.51 in commit 730c90faa3ec13ee1ead47113c9c5c7d3a8dac55:

 > ../src/rc-abort/rc-abort.c: In function 'main':
 > ../src/rc-abort/rc-abort.c:27:21: error: implicit declaration of
 > function 'kill'; did you mean 'killpg'?
 > [-Werror=implicit-function-declaration]
 >    27 |                 if (kill(pid, SIGUSR1) != 0)
 >       |                     ^~~~
 >       |                     killpg

 > ../src/libeinfo/libeinfo.c: In function 'colour_terminal':
 > ../src/libeinfo/libeinfo.c:319:26: error: implicit declaration of function 'fileno' [-Werror=implicit-function-declaration]
 >   319 |         if (f && !isatty(fileno(f)))
 >       |                          ^~~~~~

 > ../src/librc/librc-misc.c: In function 'rc_getfile':
 > ../src/librc/librc-misc.c:79:14: error: implicit declaration of
 > function 'fileno'; did you mean 'd_fileno'?
 > [-Werror=implicit-function-declaration]
 >    79 |         fd = fileno(fp);
 >       |              ^~~~~~
 >       |              d_fileno

 > ../src/librc/librc-daemon.c: In function 'rc_service_daemons_crashed':
 > ../src/librc/librc-daemon.c:633:37: error: implicit declaration of
 > function 'kill'; did you mean 'killpg'?
 > [-Werror=implicit-function-declaration]
 >   633 |                                 if (kill(pid, 0) == -1 && errno == ESRCH)
 >       |                                     ^~~~
 >       |                                     killpg

 > These build failures could be fixed by patching openrc but upstream
 > is not happy with this patch: https://github.com/OpenRC/openrc/pull/674.

 > So, as advised by Yann E. Morin, openrc is hided away for uClibc, until
 > upstream has a proper fix.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/494ef392a971ddb3c5c7b01e0149c6439018dbe7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I was going to say that such things are normally fixed by defining
_GNU_SOURCE, E.G. we could do

OPENRC_CFLAGS=$(TARGET_CFLAGS) -D_GNU_SOURCE

But indeed, upstream doesn't seem very receptive - So lets drop uClibc
support.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
