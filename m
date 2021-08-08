Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68B4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:56:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8502760EC0
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8502760EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5249360805;
	Sun,  8 Aug 2021 09:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kULO3SlDmCA5; Sun,  8 Aug 2021 09:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94AB8607FD;
	Sun,  8 Aug 2021 09:56:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2F41BF97E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AEC140275
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2xVWYt7zPms for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:55:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29C67402C5
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:55:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C6F138D205; Sun,  8 Aug 2021 09:54:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 11:51:52 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: f065276362bc3bd07405df674b5ebf2894ea3d49
X-Git-Newrev: 284cc0f838da859d1bd281690653e5354446bac0
X-Patchwork-Hint: ignore
Message-Id: <20210808095442.C6F138D205@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x]
 package/x11r7/xlib_libxshmfence: disable on riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=284cc0f838da859d1bd281690653e5354446bac0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

xlib_libxshmfence unconditionally uses SYS_futex which raises the
following build failure on riscv32:

xshmfence_futex.h:58:17: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
   58 |  return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
      |                 ^~~~~~~~~
      |                 sys_futex

Fixes:
 - http://autobuild.buildroot.org/results/b3523e35fde0fac04b96a6278cbc6ffdfe56f7d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e39ad96136a8c340b3aea6b036024e28f14584f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in                    | 3 ++-
 package/x11r7/xlib_libxshmfence/Config.in   | 3 +++
 package/x11r7/xserver_xorg-server/Config.in | 3 ++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 642088cfe9..9a5183915d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -65,7 +65,8 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
 		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
 		!BR2_PACKAGE_MESA3D_OPENGL_EGL
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
-		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
+		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4 && \
+			!BR2_RISCV_32)
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	bool
diff --git a/package/x11r7/xlib_libxshmfence/Config.in b/package/x11r7/xlib_libxshmfence/Config.in
index 710476b357..7823bda7c0 100644
--- a/package/x11r7/xlib_libxshmfence/Config.in
+++ b/package/x11r7/xlib_libxshmfence/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBXSHMFENCE
 	bool "libxshmfence"
+	# Due to use of SYS_futex - can be enabled again when upstream
+	# adds SYS_futex64 as an alternative
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_XORGPROTO
 	help
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index fcd3d0ae00..4dc15435a8 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -53,7 +53,8 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBPCIACCESS
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
+		(BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32)
 	help
 	  This variant of the X.org server is the full-blown variant,
 	  as used by desktop GNU/Linux distributions. The drivers (for
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
