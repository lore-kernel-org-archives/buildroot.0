Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56243C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 161A180CE3;
	Wed, 16 Feb 2022 21:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ZER6b3cTKjk; Wed, 16 Feb 2022 21:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DA4580D18;
	Wed, 16 Feb 2022 21:08:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 947F01BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80412404F4
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82RSyy_9JMIe for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:06:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CA55403C4
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:06:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D733E836E6; Wed, 16 Feb 2022 20:58:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:05:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2e6e376a2d7551ccf146855ec4e99a65c35bd16
X-Git-Newrev: c7d3f5cd9f39caead1ae4aedda42a48343571b57
X-Patchwork-Hint: ignore
Message-Id: <20220216205835.D733E836E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: needs execinfo.h
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7d3f5cd9f39caead1ae4aedda42a48343571b57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5webkit needs execinfo.h since bump to version 5.212.0-alpha4 in
commit df0b0fe6919c0d0f3750f439a3cfa765232bd569:

/tmp/instance-1/output-1/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/inspector/JSGlobalObjectInspectorController.cpp:54:10: fatal error: execinfo.h: No such file or directory
   54 | #include <execinfo.h>
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/351529f7d928e28fa2db22c6297dc70d21db562b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt5/qt5webkit/Config.in    | 1 +
 package/qt5/qt5webkit/qt5webkit.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 68b679dfcd..ed87efca95 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_QT5LOCATION
 	select BR2_PACKAGE_QT5SENSORS
 	select BR2_PACKAGE_QT5WEBCHANNEL
+	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_SQLITE
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 565c57e813..2e96acc00f 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -38,6 +38,10 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBKIT_DEPENDENCIES += qt5declarative
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+QT5WEBKIT_DEPENDENCIES += libexecinfo
+endif
+
 QT5WEBKIT_CONF_OPTS += \
 	-DENABLE_TOOLS=OFF \
 	-DPORT=Qt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
