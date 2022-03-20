Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E173FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F9E44022C;
	Sun, 20 Mar 2022 21:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZtiG6IRfvNB; Sun, 20 Mar 2022 21:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7407E4031F;
	Sun, 20 Mar 2022 21:26:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FEC11BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FC4E408DF
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uONl65imSkZl for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:26:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B07CC408DE
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:26:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8CB0784633; Sun, 20 Mar 2022 21:17:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:19:33 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fb7b9e5a7294fb8a970aaec653b49e6226c4a7a2
X-Git-Newrev: 80ca8b0a4bcc0373ffdf8c0fd4633e5c8aeaa27c
X-Patchwork-Hint: ignore
Message-Id: <20220320211733.8CB0784633@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/dnsmasq: fix
 dnssec static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=80ca8b0a4bcc0373ffdf8c0fd4633e5c8aeaa27c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit b6a4453bd7352d3bb27aef565d9023a1d11209c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
