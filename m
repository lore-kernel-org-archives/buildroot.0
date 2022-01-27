Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21690C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C270E84ED3;
	Thu, 27 Jan 2022 18:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXUSD0LSD5Py; Thu, 27 Jan 2022 18:32:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCC184ED0;
	Thu, 27 Jan 2022 18:32:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4F61BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C907F400D2
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVd3Ch3VaWrX for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6CF64019F
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4A09D829FD; Thu, 27 Jan 2022 18:25:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:20:51 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: cf0b5f24427dc01106d0c3c892763588dcb21b85
X-Git-Newrev: 53195812536db9890745f6ed69174888177bb812
X-Patchwork-Hint: ignore
Message-Id: <20220127182510.4A09D829FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libvirt: libvirtd
 needs C++ for nmap-ncat
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

commit: https://git.buildroot.net/buildroot/commit/?id=53195812536db9890745f6ed69174888177bb812
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
(cherry picked from commit 4dff1be05e906f5c3cfd56ebc1458579635b4ca7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
