Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67283C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB97842F2;
	Tue, 15 Mar 2022 21:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogCSznR-LYXx; Tue, 15 Mar 2022 21:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 346C184278;
	Tue, 15 Mar 2022 21:50:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5A91BF9AA
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D875842BB
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7yURAViWaIO for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 816C68422B
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 85AC484130; Tue, 15 Mar 2022 21:41:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:27:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54cb3b506de44fb8389832a1612b55d179b2cfd4
X-Git-Newrev: b6a4453bd7352d3bb27aef565d9023a1d11209c9
X-Patchwork-Hint: ignore
Message-Id: <20220315214147.85AC484130@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: fix dnssec static build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b6a4453bd7352d3bb27aef565d9023a1d11209c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop -DHAVE_DNSSEC_STATIC which has been added by commit
e913527b94e2e47b4ea6fcf13e281d5969f54fd6 but is not needed and raises
the following static build failure because dnsmasq will wrongly append
"-Wl,-Bstatic -lgmp -Wl,-Bdynamic":

/home/buildroot/autobuild/instance-2/output-1/host/bin/x86_64-linux-gcc -static -o dnsmasq cache.o rfc1035.o util.o option.o forward.o network.o dnsmasq.o dhcp.o lease.o rfc2131.o netlink.o dbus.o bpf.o helper.o tftp.o log.o conntrack.o dhcp6.o rfc3315.o dhcp-common.o outpacket.o radv.o slaac.o auth.o ipset.o pattern.o domain.o dnssec.o blockdata.o tables.o loop.o inotify.o poll.o rrfilter.o edns0.o arp.o crypto.o dump.o ubus.o metrics.o hash-questions.o domain-match.o -Wl,-Bstatic -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/lib -lhogweed -lgmp -lnettle  -Wl,-Bdynamic -Wl,-Bstatic -lgmp -Wl,-Bdynamic
/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: attempted static link of dynamic object `/home/buildroot/autobuild/instance-2/output-1/host/x86_64-buildroot-linux-musl/sysroot/lib/../lib64/libc.so'

Strangely enough, this is the first time this build failure is raised by
the autobuilders whereas "-Wl,-Bdynamic" is set since a very long time:
https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=c979fa04a40ff12370c8d3a82ad27d9d3b5907e3

Fixes:
 - http://autobuild.buildroot.org/results/99b419ddb5a3be561d39e715833510a59519213e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dnsmasq/dnsmasq.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 0569475fc4..230e4a8116 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -26,9 +26,6 @@ endif
 ifeq ($(BR2_PACKAGE_DNSMASQ_DNSSEC),y)
 DNSMASQ_DEPENDENCIES += gmp nettle
 DNSMASQ_COPTS += -DHAVE_DNSSEC
-ifeq ($(BR2_STATIC_LIBS),y)
-DNSMASQ_COPTS += -DHAVE_DNSSEC_STATIC
-endif
 endif
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
