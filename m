Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AC4C77B7C
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 20:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7B440B8D;
	Mon, 23 Jun 2025 20:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Shra3-N81xkb; Mon, 23 Jun 2025 20:27:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C00F040B85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C00F040B85;
	Mon, 23 Jun 2025 20:27:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 615BB12C
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DACA60689
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKNJ99tfrjdV for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 20:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8507160674
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8507160674
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:27:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7302B81E1C; Mon, 23 Jun 2025 20:27:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Jun 2025 22:10:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 942b88e693e27c8ab39dc3e9931aa9d6909a3c7e
X-Git-Newrev: 7f45d183fed51f9f3781a4a75b3784f441d47e3e
X-Patchwork-Hint: ignore
Message-Id: <20250623202736.7302B81E1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: rework OpenCV4
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f45d183fed51f9f3781a4a75b3784f441d47e3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/commit/962081259d91fea1e9a59c1af85d9a85ba45d0dd

Fixes Kconfig warnings:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
      Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=n] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y]
      Selected by [y]:
      - BR2_PACKAGE_FREESWITCH [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_OPENCV4 [=y]

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freeswitch/Config.in     | 3 ---
 package/freeswitch/freeswitch.mk | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 4d700e549f..80d18e064d 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -14,9 +14,6 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI if BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
-	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4
-	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4
-	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if BR2_PACKAGE_OPENCV4
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SOFIA_SIP
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 02cbacab88..58ebc22298 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -283,7 +283,7 @@ FREESWITCH_DEPENDENCIES += opencv3
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV4),y)
+ifeq ($(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV4_LIB_OBJDETECT),yyy)
 FREESWITCH_DEPENDENCIES += opencv4
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
