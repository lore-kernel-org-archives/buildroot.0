Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C202C4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 09:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C99118216D;
	Fri, 23 Dec 2022 09:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C99118216D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5suTOUHLv44; Fri, 23 Dec 2022 09:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2950E8216A;
	Fri, 23 Dec 2022 09:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2950E8216A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1F6D1BF34C
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB2E1419C7
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB2E1419C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zm8esqndozOo for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 09:46:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B80441922
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B80441922
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 09:46:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BEDF61BF20A;
 Fri, 23 Dec 2022 09:46:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p8edS-002rOw-TM; Fri, 23 Dec 2022 10:46:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Alex Musatti <alex.musatti@gmail.com>
References: <CA+brViFJP-ZAR0HA-6erOkbuk1FfBgbwWErXihrFhygYABGbmQ@mail.gmail.com>
Date: Fri, 23 Dec 2022 10:46:38 +0100
In-Reply-To: <CA+brViFJP-ZAR0HA-6erOkbuk1FfBgbwWErXihrFhygYABGbmQ@mail.gmail.com>
 (Alex Musatti's message of "Fri, 23 Dec 2022 01:15:35 +0100")
Message-ID: <87edsqjvup.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] OpenSSH server connection reset
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

>>>>> "Alex" == Alex Musatti <alex.musatti@gmail.com> writes:

 > Hello everyone,
 > I've recently build firmware image for stm32mp157f-dk2.
 > I noticed sshd server closed the connection during key exchange, so I ran
 > it in debug mode:

 > #/usr/sbin/sshd -ddd -f /etc/ssh/sshd_config

 > debug1: SSH2_MSG_KEXINIT sent [preauth]
 > ssh_sandbox_violation: unexpected system call (arch:0x40000028,syscall:414

So the system call filter detected an unexpected system call. According
to https://marcin.juszkiewicz.com.pl/download/tables/syscalls.html, 414
is ppoll_time64 on ARM. Looking at sandbox-seccomp-filter.c it correctly
allows ppoll_time64 if __NR_ppoll_time64 is defined:

#ifdef __NR_ppoll_time64
        SC_ALLOW(__NR_ppoll_time64),
#endif

What toolchain / C library are you using? It sounds like
__NR_ppoll_time64 is not defined in the kernel headers, but your C
library still uses it at runtime.

Alternatively you can disable the syscall filtering using
BR2_PACKAGE_OPENSSH_SANDBOX.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
