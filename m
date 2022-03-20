Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B096C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDD1060B15;
	Sun, 20 Mar 2022 21:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fcCLsyzF7DeR; Sun, 20 Mar 2022 21:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16FB560AF0;
	Sun, 20 Mar 2022 21:22:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3A741BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2CAF8174C
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dz10JdiOlZg4 for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:22:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26D1981749
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:22:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BC630C0005;
 Sun, 20 Mar 2022 21:22:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nW30f-00FJaF-Qk; Sun, 20 Mar 2022 22:22:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220308231733.176991-1-fontaine.fabrice@gmail.com>
Date: Sun, 20 Mar 2022 22:22:45 +0100
In-Reply-To: <20220308231733.176991-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 9 Mar 2022 00:17:33 +0100")
Message-ID: <87zglkl3oa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: fix dnssec static build
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop -DHAVE_DNSSEC_STATIC which has been added by commit
 > e913527b94e2e47b4ea6fcf13e281d5969f54fd6 but is not needed and raises
 > the following static build failure because dnsmasq will wrongly append
 > "-Wl,-Bstatic -lgmp -Wl,-Bdynamic":

 > /home/buildroot/autobuild/instance-2/output-1/host/bin/x86_64-linux-gcc
 > -static -o dnsmasq cache.o rfc1035.o util.o option.o forward.o
 > network.o dnsmasq.o dhcp.o lease.o rfc2131.o netlink.o dbus.o bpf.o
 > helper.o tftp.o log.o conntrack.o dhcp6.o rfc3315.o dhcp-common.o
 > outpacket.o radv.o slaac.o auth.o ipset.o pattern.o domain.o dnssec.o
 > blockdata.o tables.o loop.o inotify.o poll.o rrfilter.o edns0.o arp.o
 > crypto.o dump.o ubus.o metrics.o hash-questions.o domain-match.o
 > -Wl,-Bstatic
 > -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/lib
 > -lhogweed -lgmp -lnettle -Wl,-Bdynamic -Wl,-Bstatic -lgmp
 > -Wl,-Bdynamic
 > /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld:
 > attempted static link of dynamic object
 > `/home/buildroot/autobuild/instance-2/output-1/host/x86_64-buildroot-linux-musl/sysroot/lib/../lib64/libc.so'

 > Strangely enough, this is the first time this build failure is raised by
 > the autobuilders whereas "-Wl,-Bdynamic" is set since a very long time:
 > https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=c979fa04a40ff12370c8d3a82ad27d9d3b5907e3

 > Fixes:
 >  - http://autobuild.buildroot.org/results/99b419ddb5a3be561d39e715833510a59519213e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
