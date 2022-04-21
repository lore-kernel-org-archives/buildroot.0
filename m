Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395C3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E509E41BD1;
	Thu, 21 Apr 2022 19:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VydAx3Yo6mhf; Thu, 21 Apr 2022 19:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1F8441992;
	Thu, 21 Apr 2022 19:30:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4EAD1BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1FB2416B9
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iC9NFxKQns3o for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:30:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62062409B2
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 45A4D83FFB; Thu, 21 Apr 2022 19:20:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 21:26:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 798a4983eae7217281d84b76057fe61401e0f71d
X-Git-Newrev: fde21979427ffeb4fe9c0068310be195f2dec5ec
X-Patchwork-Hint: ignore
Message-Id: <20220421192014.45A4D83FFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcp: untar internal bind
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

commit: https://git.buildroot.net/buildroot/commit/?id=fde21979427ffeb4fe9c0068310be195f2dec5ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Untar internal bind so libtool patches will be applied on bind's
libtool. This will fix:
 - installation of some libraries such as libisccfg. Indeed, if libtool
   is not patched those libraries will be "relinked" and so not
   installed.
 - build failures with riscv and or1k:

  Invalid configuration `riscv64-buildroot-linux-musl': machine `riscv64-buildroot' not recognized

  Invalid configuration `or1k-buildroot-linux-uclibc': machine `or1k-buildroot' not recognized

Fixes:
 - http://autobuild.buildroot.org/results/d25b76e628ffe5293c6bc1fd467a6b8966cb1bc2
 - http://autobuild.buildroot.org/results/ba3258d8df00a7626784189125f0202fb161c40e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Jan Havran <havran.jan@email.cz>
Tested-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dhcp/dhcp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 6ac9ed0147..cf8608f15d 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -14,6 +14,13 @@ DHCP_CPE_ID_VENDOR = isc
 # internal bind does not support parallel builds.
 DHCP_MAKE = $(MAKE1)
 
+# untar internal bind so libtool patches will be applied on bind's libtool
+define DHCP_UNTAR_INTERNAL_BIND
+	$(TAR) xf $(@D)/bind/bind.tar.gz -C $(@D)/bind/
+endef
+
+DHCP_POST_EXTRACT_HOOKS = DHCP_UNTAR_INTERNAL_BIND
+
 # use libtool-enabled configure.ac
 define DHCP_LIBTOOL_AUTORECONF
 	cp $(@D)/configure.ac+lt $(@D)/configure.ac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
