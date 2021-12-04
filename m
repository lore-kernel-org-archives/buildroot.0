Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C1CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 19:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB02D40179;
	Sat,  4 Dec 2021 19:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFOH9WYvAOyY; Sat,  4 Dec 2021 19:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D969A401DD;
	Sat,  4 Dec 2021 19:10:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 584261BF95C
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 19:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53E57828D1
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 19:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MlWIj-wLH7l9 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 19:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 963A082451
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 19:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A346C8DAD3; Sat,  4 Dec 2021 19:04:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 20:09:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76c4df324d3eb2af9dde3ffdbb79ee54ffbaa73e
X-Git-Newrev: 22fb4c469bcb5b61beadfc78c27e403656eae979
X-Patchwork-Hint: ignore
Message-Id: <20211204190452.A346C8DAD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-*: run pkg-config at build
 time, not at parse time
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

commit: https://git.buildroot.net/buildroot/commit/?id=22fb4c469bcb5b61beadfc78c27e403656eae979
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When calling 'printvars' on a just-configured tree, the output contains
many spurious warnings about pkg-config being not found:

    make[1]: [...]/host/bin/pkg-config: Command not found

This is partly because a few packages call pkg-config at the time the
Makefile is parsed (really, right when make evaluates the recipe before
executing it).

It is customary, instead, to defer the call to pkg-config to the actual
shell running the recipe's commands, like all our other packages do.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk      | 4 ++--
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk          | 4 ++--
 .../kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index b78646b9a9..21def8ca4c 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -11,7 +11,7 @@ KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = glm kodi
 
 KODI_SCREENSAVER_ASTERWAVE_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index c6dd26a89b..6f462e7d27 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -11,7 +11,7 @@ KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = glm kodi
 
 KODI_SCREENSAVER_CPBLOBS_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index ac4303a719..45d3e46b4a 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -11,7 +11,7 @@ KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi
 
 KODI_SCREENSAVER_MATRIXTRAILS_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
