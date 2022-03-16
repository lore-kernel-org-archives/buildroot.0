Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A95C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E53660F6F;
	Wed, 16 Mar 2022 21:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XKBZmhFY3JIx; Wed, 16 Mar 2022 21:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 208F160F70;
	Wed, 16 Mar 2022 21:45:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A72021BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0940984187
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VIJTgBqv4orV for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:44:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6520D84193
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:44:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3F6568424A; Wed, 16 Mar 2022 21:35:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:41:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba7319a06e1b98524fde1384dc570a7f34870881
X-Git-Newrev: 2fc2191845799ae2358b752fa29839817d33ad82
X-Patchwork-Hint: ignore
Message-Id: <20220316213525.3F6568424A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zynaddsubfx: fix alsa-lib handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fc2191845799ae2358b752fa29839817d33ad82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alsa-lib is optional, not mandatory, since the addition of the package
in commit 18a863063735e2c658fa6947a4e540e9dda6c431

Moreover, alsa support depends on BR2_PACKAGE_ALSA_LIB_SEQ (otherwise,
it is silently disabled)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zynaddsubfx/Config.in      | 3 +--
 package/zynaddsubfx/zynaddsubfx.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/zynaddsubfx/Config.in b/package/zynaddsubfx/Config.in
index 837a469e7c..f181a23944 100644
--- a/package/zynaddsubfx/Config.in
+++ b/package/zynaddsubfx/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_ZYNADDSUBFX
 	bool "zynaddsubfx"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, liblo
-	select BR2_PACKAGE_ALSA_LIB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # liblo
 	select BR2_PACKAGE_FFTW
 	select BR2_PACKAGE_FFTW_SINGLE
 	select BR2_PACKAGE_LIBLO
diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index db0459ce62..aeeb0b6405 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -18,10 +18,16 @@ ZYNADDSUBFX_CONF_OPTS += -DOS_LIBRARIES=-latomic
 endif
 
 ZYNADDSUBFX_DEPENDENCIES = \
-	alsa-lib \
 	fftw-single \
 	liblo \
 	mxml \
 	zlib
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB_SEQ),y)
+ZYNADDSUBFX_DEPENDENCIES += alsa-lib
+ZYNADDSUBFX_CONF_OPTS += -DAlsaEnable=ON
+else
+ZYNADDSUBFX_CONF_OPTS += -DAlsaEnable=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
