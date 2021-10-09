Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE638C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:08:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB05F60F5D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB05F60F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C7A94071E;
	Sat,  9 Oct 2021 12:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZE304__OOKW; Sat,  9 Oct 2021 12:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A69406CF;
	Sat,  9 Oct 2021 12:08:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7341BF36A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27AC860A65
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CAkJHL62p_eV for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F178C607C0
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:03:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 35A7493616; Sat,  9 Oct 2021 12:00:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:45:06 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: dbbb102a0bc2dbf3175a0b3794df226bde9efa93
X-Git-Newrev: 7fff3595f5a1a66d6b3f6ccb2f429a121d0c116f
X-Patchwork-Hint: ignore
Message-Id: <20211009120024.35A7493616@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/mesa3d: fix build
 on m68k
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fff3595f5a1a66d6b3f6ccb2f429a121d0c116f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

mesa3d uses very big switch statements, which causes the build to fail
on m68k, beause the offsets there are only 16-bit.

We fix that by using -mlong-jump-table-offsets on m68k, to use 32-bit
offsets for switch statements, but this is only available starting with
gcc 7 [0] [1].

Fixes:
http://autobuild.buildroot.net/results/60c4653c2a93125edbdd0beb43cd47301643464a/

Note: we have two packages that select mesa3d, but:
    package/intel-mediadriver/
        -> already depends on x86_64, so implies !m68k

    package/x11r7/xdriver_xf86-video-imx-viv/
        -> imx is an ARM, but xdriver_xf86-video-imx-viv is missing
           a depends on BR2_arm (although the comments do have that
           dependency). However, it depends on other imx related
           packages, and they depend on either arm or aarch64, so
           that implies !m68k.

As such, we do not need to propagate that new dependency.

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c15
[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr:
  - add comment
  - reword commit log, add BZ references, add non-propagation notes
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2fe3a8f81b0507260b76e0a2734671e763180e7a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 5 +++++
 package/mesa3d/mesa3d.mk | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 9a5183915d..295a26cb6d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -4,6 +4,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_m68k || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # m68k needs gcc >= 7.x
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
@@ -462,3 +463,7 @@ comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
+
+comment "mesa3d needs a toolchain w/ gcc >= 7"
+	depends on BR2_m68k
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ca44a66e54..ca8dac8959 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -260,4 +260,13 @@ else
 MESA3D_CONF_OPTS += -Dzstd=disabled
 endif
 
+MESA3D_CFLAGS = $(TARGET_CFLAGS)
+
+# m68k needs 32-bit offsets in switch tables to build
+ifeq ($(BR2_m68k),y)
+MESA3D_CFLAGS += -mlong-jump-table-offsets
+endif
+
+MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
