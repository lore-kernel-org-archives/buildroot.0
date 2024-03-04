Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D9BC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 21:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC73A60A57;
	Mon,  4 Mar 2024 21:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MIxaHba_OhQ2; Mon,  4 Mar 2024 21:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCFD360A5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCFD360A5A;
	Mon,  4 Mar 2024 21:48:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E48591BF94D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D10474086F
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yxi48B4MEU7P for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 21:48:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73A8F4086B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73A8F4086B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73A8F4086B
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 21:48:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2BB91BF203;
 Mon,  4 Mar 2024 21:48:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rhGAY-00GzAU-0N;
 Mon, 04 Mar 2024 22:48:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240304153539.3372042-1-fontaine.fabrice@gmail.com>
Date: Mon, 04 Mar 2024 22:48:22 +0100
In-Reply-To: <20240304153539.3372042-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 4 Mar 2024 16:35:39 +0100")
Message-ID: <87r0gp1xeh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/fluent-bit: fix build with BR2_TIME_BITS_64
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Do not remove _FILE_OFFSET_BITS=64 from CFLAGS to avoid the following
 > build failure with BR2_TIME_BITS_64 raised since commit
 > 3c427c64726560ea1743282a3fdb78f5b28692eb:

 > In file included from /home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
 >                  from /home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
 >                  from /home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/stdio.h:27,
 >                  from /home/thomas/autobuild/instance-1/output-1/build/fluent-bit-2.1.7/tools/xxd-c/xxd-c.c:27:
 > /home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >    26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >       |     ^~~~~

 > Indeed, this LFS workaround was present since the addition of the
 > package in commit 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483 and is
 > only needed to fix a build failure with the old codesourcery-arm
 > toolchain from 2014 which uses glibc < 2.23. as glibc 2.23 was released
 > in February 2016: https://sourceware.org/glibc/wiki/Release/2.23, drop
 > this workaround as already done for libselinux in commit
 > c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
 > drop codesourcery-arm toolchain.

 > Fixes: 3c427c64726560ea1743282a3fdb78f5b28692eb
 >  - http://autobuild.buildroot.org/results/ff5c60cd038550453ce138fe2a9383af2f5d6f2f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Update commit message

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
