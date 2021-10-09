Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA046C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:04:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A7E60F57
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9A7E60F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9649A81919;
	Sat,  9 Oct 2021 12:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVwYIiuWjpAq; Sat,  9 Oct 2021 12:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE96D81886;
	Sat,  9 Oct 2021 12:04:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A5131BF36A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61EE960B9A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6CpTSPEeiN5C for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:02:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A84760B9C
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:02:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6255E9359A; Sat,  9 Oct 2021 12:00:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:44:25 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 2c683e623c0b0ae63e6c3336867db6444684fb2e
X-Git-Newrev: 2c4ebb28f3a876b03ac751fc8e5073ac699d7e53
X-Patchwork-Hint: ignore
Message-Id: <20211009120015.6255E9359A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/mesa3d: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c4ebb28f3a876b03ac751fc8e5073ac699d7e53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
index eb7c1eef46..82a40511f1 100644
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
@@ -441,3 +442,7 @@ comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
+
+comment "mesa3d needs a toolchain w/ gcc >= 7"
+	depends on BR2_m68k
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6a53d203ef..aa222c03f3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -259,4 +259,13 @@ else
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
