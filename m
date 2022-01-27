Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8636AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D3EB60DFD;
	Thu, 27 Jan 2022 18:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgSK5kpg9EqI; Thu, 27 Jan 2022 18:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BFC460EC6;
	Thu, 27 Jan 2022 18:32:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA6A11BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 843B081AD1
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9CZbJQxgsqf8 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD03784EE5
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 56B66829FE; Thu, 27 Jan 2022 18:25:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:21:02 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 53195812536db9890745f6ed69174888177bb812
X-Git-Newrev: dcc1585d9ddb12ff849cf0e0940d90389e23123e
X-Patchwork-Hint: ignore
Message-Id: <20220127182510.56B66829FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libvirtd: fix
 recursive dependency in Kconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcc1585d9ddb12ff849cf0e0940d90389e23123e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Commit 4dff1be05e90 (package/libvirt: libvirtd needs C++ for nmap-ncat)
introduce a recursive dependency (really: a circular dependency):

    package/busybox/Config.in:33:error: recursive dependency detected!
    package/busybox/Config.in:33:   symbol BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected by BR2_PACKAGE_EBTABLES_UTILS_SAVE
    package/ebtables/Config.in:11:  symbol BR2_PACKAGE_EBTABLES_UTILS_SAVE depends on BR2_PACKAGE_EBTABLES
    package/ebtables/Config.in:1:   symbol BR2_PACKAGE_EBTABLES is selected by BR2_PACKAGE_LIBVIRT_DAEMON
    package/libvirt/Config.in:44:   symbol BR2_PACKAGE_LIBVIRT_DAEMON depends on BR2_PACKAGE_NETCAT_OPENBSD
    package/netcat-openbsd/Config.in:1:     symbol BR2_PACKAGE_NETCAT_OPENBSD depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

As usual with this kind of circular depednency, it is not trivial to see
what the real cuplrit is, or where to cut the circle.

A simple solution in this case is to drop the C++ dependency, and switch
the netcat-openbsd and nmap-ncat dependencies conditions.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f81242ae4fb64ab85af5d38e70246222276552ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 103d1b9543..b91b8e2c1c 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -44,15 +44,13 @@ if BR2_PACKAGE_LIBVIRT
 config BR2_PACKAGE_LIBVIRT_DAEMON
 	bool "libvirtd"
 	default y
-	depends on BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_NETCAT_OPENBSD # nmap
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
 	select BR2_PACKAGE_EBTABLES
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_IPROUTE2
 	# These are required because there is no way to unequivocally select a modern netcat
-	select BR2_PACKAGE_NMAP      if !BR2_PACKAGE_NETCAT_OPENBSD
-	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT_OPENBSD
+	select BR2_PACKAGE_NETCAT_OPENBSD if !BR2_PACKAGE_NMAP_NCAT
 	select BR2_PACKAGE_RADVD
 	help
 	  Build the libvirt daemon (libvirtd) otherwise build only the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
