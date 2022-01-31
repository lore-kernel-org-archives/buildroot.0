Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A65C433FE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 19:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2005F40917;
	Mon, 31 Jan 2022 19:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7iNc0eyiBhfD; Mon, 31 Jan 2022 19:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1280E40900;
	Mon, 31 Jan 2022 19:58:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C713F1BF379
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3544402EC
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3DNYabpITJcW for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 19:57:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1114F402E9
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 19:57:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9665982821; Mon, 31 Jan 2022 19:50:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 20:54:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dd01a63004994393ca42c90f99aeaf767a61e9f
X-Git-Newrev: ea8579141c1af9e3afc08e1d398e5187a67f38cd
X-Patchwork-Hint: ignore
Message-Id: <20220131195022.9665982821@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: fix build without
 opengl
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea8579141c1af9e3afc08e1d398e5187a67f38cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without opengl raised since bump to
version 5.212.0-alpha4 in commit
df0b0fe6919c0d0f3750f439a3cfa765232bd569:

CMake Error at Source/cmake/OptionsQt.cmake:592 (message):
  Qt with OpenGL support is required for ENABLE_OPENGL

WebKit2 unconditionally depends on TextureMapperGL.h and tools builds
QtTestBrowser which unconditionally depends on QtOpenGL

Fixes:
 - http://autobuild.buildroot.org/results/5604555279f99ba0221dd8d0baf9ab4d7cca3aed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5webkit/qt5webkit.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 3af1918a46..de3c428fbe 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -20,6 +20,16 @@ QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
 # in the archive.
 QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
 
+ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)
+QT5WEBKIT_CONF_OPTS += \
+	-DENABLE_OPENGL=ON \
+	-DENABLE_WEBKIT2=ON
+else
+QT5WEBKIT_CONF_OPTS += \
+	-DENABLE_OPENGL=OFF \
+	-DENABLE_WEBKIT2=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5WEBKIT_DEPENDENCIES += xlib_libXcomposite xlib_libXext xlib_libXrender
 endif
@@ -29,6 +39,7 @@ QT5WEBKIT_DEPENDENCIES += qt5declarative
 endif
 
 QT5WEBKIT_CONF_OPTS += \
+	-DENABLE_TOOLS=OFF \
 	-DPORT=Qt \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DUSE_LIBHYPHEN=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
