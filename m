Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1852C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B24402FA;
	Sun,  9 Jan 2022 21:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xm_osymp_O5z; Sun,  9 Jan 2022 21:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F02B402C5;
	Sun,  9 Jan 2022 21:56:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA8931BF3C0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C92C4402C5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKi2wVdlin0O for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:56:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02CDD402C1
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 21:56:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 95CF3812D8; Sun,  9 Jan 2022 21:49:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 22:52:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0f9e2447d57194f0b02edb93cd16a677ebb326c
X-Git-Newrev: f81242ae4fb64ab85af5d38e70246222276552ae
X-Patchwork-Hint: ignore
Message-Id: <20220109214950.95CF3812D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirtd: fix recursive dependency
 in Kconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=f81242ae4fb64ab85af5d38e70246222276552ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
