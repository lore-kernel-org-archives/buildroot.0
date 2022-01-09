Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90584C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB8581D7C;
	Sun,  9 Jan 2022 20:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ki9WFdO-xLnq; Sun,  9 Jan 2022 20:48:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D1DE81D18;
	Sun,  9 Jan 2022 20:48:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4237D1BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 306898176A
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJ-wr48eGd02 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9126481D18
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:48:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4FD7E82984; Sun,  9 Jan 2022 20:42:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 21:47:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7f3b75d59bd3ae480fe99fc435ae0c715f9f204
X-Git-Newrev: 4dff1be05e906f5c3cfd56ebc1458579635b4ca7
X-Patchwork-Hint: ignore
Message-Id: <20220109204212.4FD7E82984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: libvirtd needs C++ for
 nmap-ncat
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dff1be05e906f5c3cfd56ebc1458579635b4ca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
fbf25acfbfd5a73b3560918bea081768abbe5723:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_NMAP
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]
  Selected by [y]:
  - BR2_PACKAGE_LIBVIRT_DAEMON [=y] && BR2_PACKAGE_LIBVIRT [=y] && !BR2_PACKAGE_NETCAT_OPENBSD [=n]

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: C++ only needed without NETCAT_OPENBSD]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvirt/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index e75f1cf15f..103d1b9543 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -44,6 +44,7 @@ if BR2_PACKAGE_LIBVIRT
 config BR2_PACKAGE_LIBVIRT_DAEMON
 	bool "libvirtd"
 	default y
+	depends on BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_NETCAT_OPENBSD # nmap
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
 	select BR2_PACKAGE_EBTABLES
@@ -57,6 +58,9 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	  Build the libvirt daemon (libvirtd) otherwise build only the
 	  utility programs.
 
+comment "libvirtd needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP && !BR2_PACKAGE_NETCAT_OPENBSD
+
 # Stateful drivers are useful only when building the daemon.
 if BR2_PACKAGE_LIBVIRT_DAEMON
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
