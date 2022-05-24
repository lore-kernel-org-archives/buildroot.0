Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26E0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 08:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B820740571;
	Tue, 24 May 2022 08:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6sWwX1CbrC1; Tue, 24 May 2022 08:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91FB140C09;
	Tue, 24 May 2022 08:22:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24CDE1BF28D
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89B6C81959
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dVOPmtFAasGp for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 08:21:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C0AC81975
 for <buildroot@buildroot.org>; Tue, 24 May 2022 08:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 13219863F8; Tue, 24 May 2022 08:10:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 10:19:48 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5430ae90e5556a577333cccd8bd1998971576d88
X-Git-Newrev: 0e6b1ef7737416add4f43d304929a87d230d3438
X-Patchwork-Hint: ignore
Message-Id: <20220524081009.13219863F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/dhcp: untar
 internal bind
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e6b1ef7737416add4f43d304929a87d230d3438
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit fde21979427ffeb4fe9c0068310be195f2dec5ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
