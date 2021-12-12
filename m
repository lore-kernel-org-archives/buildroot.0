Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1319AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC4AF409B8;
	Sun, 12 Dec 2021 22:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kay_15FTMIgg; Sun, 12 Dec 2021 22:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001B8409B4;
	Sun, 12 Dec 2021 22:29:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26A7D1BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ECD64030B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cXbTrzIN8WY1 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F289040302
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 471F98375C; Sun, 12 Dec 2021 22:18:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:11:57 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 745a763e433467991bbacc6da07517c292e46442
X-Git-Newrev: be8b42242bfb1a702287cba36ab9f98ca7f2865e
X-Patchwork-Hint: ignore
Message-Id: <20211212221828.471F98375C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/kodi-*: run
 pkg-config at build time, not at parse time
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

commit: https://git.buildroot.net/buildroot/commit/?id=be8b42242bfb1a702287cba36ab9f98ca7f2865e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
(cherry picked from commit 22fb4c469bcb5b61beadfc78c27e403656eae979)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk      | 4 ++--
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk          | 4 ++--
 .../kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 9e768fce85..16a1dca261 100644
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
index 628f254a42..6e04aa064e 100644
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
index a89ea72d5d..2c091c8adc 100644
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
