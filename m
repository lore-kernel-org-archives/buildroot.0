Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4390ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 12:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64B474161F;
	Fri, 16 Sep 2022 12:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64B474161F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DGbFGmgnYpL; Fri, 16 Sep 2022 12:06:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9154041627;
	Fri, 16 Sep 2022 12:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9154041627
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C55471C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A10C1842E1
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A10C1842E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m430thnleczL for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 12:06:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D86D7842E0
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 12:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D86D7842E0
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C5A6183CDF; Fri, 16 Sep 2022 12:06:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 14:02:31 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: aeecb25abcf13d20b882c2418c2ef5c7db1c8fc8
X-Git-Newrev: c65cf580ad5c3bde8e7e92c5532b5c5b7db4857c
X-Patchwork-Hint: ignore
Message-Id: <20220916120624.C5A6183CDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libvirt: fix
 libvirtd dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c65cf580ad5c3bde8e7e92c5532b5c5b7db4857c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Commit 4dff1be05e90 (package/libvirt: libvirtd needs C++ for nmap-ncat)
introduce a recursive dependency (really: a circular dependency):

    package/busybox/Config.in:33:error: recursive dependency detected!
    package/busybox/Config.in:33:   symbol BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected by BR2_PACKAGE_EBTABLES_UTILS_SAVE
    package/ebtables/Config.in:11:  symbol BR2_PACKAGE_EBTABLES_UTILS_SAVE depends on BR2_PACKAGE_EBTABLES
    package/ebtables/Config.in:1:   symbol BR2_PACKAGE_EBTABLES is selected by BR2_PACKAGE_LIBVIRT_DAEMON
    package/libvirt/Config.in:44:   symbol BR2_PACKAGE_LIBVIRT_DAEMON depends on BR2_PACKAGE_NETCAT_OPENBSD
    package/netcat-openbsd/Config.in:1:     symbol BR2_PACKAGE_NETCAT_OPENBSD depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

We can't drop the C++ dependency and switch the netcat-openbsd and
nmap-ncat dependencies conditions without adding a glibc dependency.

So always mandate C++ even if is only needed by nmap and not
netcat-openbsd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a17c456b2ccd44566c2395efc90d403cd27a2902)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 65226af336..f0687cd5db 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -44,7 +44,7 @@ if BR2_PACKAGE_LIBVIRT
 config BR2_PACKAGE_LIBVIRT_DAEMON
 	bool "libvirtd"
 	default y
-	depends on BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_NETCAT_OPENBSD # nmap
+	depends on BR2_INSTALL_LIBSTDCPP # nmap
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
 	select BR2_PACKAGE_EBTABLES
@@ -58,6 +58,9 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	  Build the libvirt daemon (libvirtd) otherwise build only the
 	  utility programs.
 
+comment "libvirtd needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 # Stateful drivers are useful only when building the daemon.
 if BR2_PACKAGE_LIBVIRT_DAEMON
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
