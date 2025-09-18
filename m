Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFC6CAC597
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 20:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C237B80D9C;
	Thu, 18 Sep 2025 20:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glxXINVU3OFR; Thu, 18 Sep 2025 20:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0095480D96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0095480D96;
	Thu, 18 Sep 2025 20:25:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDA87E7
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF9D440BF5
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7Z_wXoA2Z-i for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 20:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1512C40BFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1512C40BFB
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:25:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03D6585CBF; Thu, 18 Sep 2025 20:25:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 22:12:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbc1dbc8895e92d51dd7c0c93c704fc5312fbd3c
X-Git-Newrev: 2d076a1b7660d696d2b2f4eb7b25d8d9bc555ddc
X-Patchwork-Hint: ignore
Message-Id: <20250918202508.03D6585CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xdm: needs libxcrypt
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2d076a1b7660d696d2b2f4eb7b25d8d9bc555ddc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While doing a per-package build the package is failing to
compile with this error (gcc 13.x glibc toochain):
make[3]: Entering directory
'/home/wbx/buildroot-2025.02.3/output/build/xapp_xdm-1.1.14/xdm'   CC
session.o session.c:146:11: fatal error: crypt.h: No such file or
directory   146 | # include <crypt.h>       |           ^~~~~~~~~
compilation terminated.

Fix this error by providing the needed glibc dependencies.

Fixes:
 https://autobuild.buildroot.org/results/b75/b75ad8f1159613656dce482992c800545d60ae69/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xdm/Config.in   | 1 +
 package/x11r7/xapp_xdm/xapp_xdm.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index 1ac15ce368..adeb3ce0c0 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_XAPP_XDM
 	depends on BR2_USE_MMU # fork()
 	# Runtime dependency: can't start an X server unless there is one
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_XAPP_SESSREG
 	select BR2_PACKAGE_XAPP_XRDB
 	select BR2_PACKAGE_XLIB_LIBX11
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 035f2e9484..2a343b55e2 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -30,6 +30,10 @@ else
 XAPP_XDM_CONF_OPTS += --without-xinerama
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+XAPP_XDM_DEPENDENCIES += libxcrypt
+endif
+
 define XAPP_XDM_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/x11r7/xapp_xdm/S99xdm \
 		$(TARGET_DIR)/etc/init.d/S99xdm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
