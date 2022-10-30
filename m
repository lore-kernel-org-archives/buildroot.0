Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C35FA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 10:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE36A40567;
	Sun, 30 Oct 2022 10:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE36A40567
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ncwiz8GinxRS; Sun, 30 Oct 2022 10:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D931B40527;
	Sun, 30 Oct 2022 10:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D931B40527
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3F91BF2B7
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58C2D60644
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58C2D60644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hH0tPmZHaBFc for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 10:42:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8FD9606EC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 10:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8FD9606EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 974C387460; Sun, 30 Oct 2022 10:42:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:41:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ed6d61c03bf9e1ce7830bafcfeca683e6c93592
X-Git-Newrev: 1ce9af6ccfa3136e62d0c429adb38460bece058f
X-Patchwork-Hint: ignore
Message-Id: <20221030104205.974C387460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkcapi: support enabling
 lib-asym and lib-kpp
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ce9af6ccfa3136e62d0c429adb38460bece058f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Kconfig options to allow enabling asymmetric cipher support
(--enable-lib-asym) and key protocol primitives support
(--enable-lib-kpp) in library.

Signed-off-by: Tan En De <ende.tan@linux.starfivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkcapi/Config.in   | 14 ++++++++++++++
 package/libkcapi/libkcapi.mk | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/package/libkcapi/Config.in b/package/libkcapi/Config.in
index 8f2cf7ecc4..bf9c95270c 100644
--- a/package/libkcapi/Config.in
+++ b/package/libkcapi/Config.in
@@ -8,6 +8,13 @@ config BR2_PACKAGE_LIBKCAPI
 
 if BR2_PACKAGE_LIBKCAPI
 
+config BR2_PACKAGE_LIBKCAPI_ASYM
+	bool "build asymmetric ciphers library"
+	help
+	  Using this library requires the Linux kernel to be patched
+	  with libkcapi Linux kernel patches found in libkcapi
+	  kernel-patches/ directory.
+
 config BR2_PACKAGE_LIBKCAPI_DGSTAPP
 	bool "build dgst application"
 
@@ -21,6 +28,13 @@ config BR2_PACKAGE_LIBKCAPI_HASHER
 comment "hasher application needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_LIBKCAPI_KPP
+	bool "build KPP library"
+	help
+	  Using this library requires the Linux kernel to be patched
+	  with libkcapi Linux kernel patches found in libkcapi
+	  kernel-patches/ directory.
+
 config BR2_PACKAGE_LIBKCAPI_RNGAPP
 	bool "build rng read application"
 
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index c6e58c6a9b..e88928a74d 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -17,6 +17,12 @@ LIBKCAPI_CONF_ENV = \
 	ac_cv_path_XMLTO=""
 LIBKCAPI_MAKE_OPTS = CPPFLAGS="$(TARGET_CPPFLAGS)"
 
+ifeq ($(BR2_PACKAGE_LIBKCAPI_ASYM),y)
+LIBKCAPI_CONF_OPTS += --enable-lib-asym
+else
+LIBKCAPI_CONF_OPTS += --disable-lib-asym
+endif
+
 ifeq ($(BR2_PACKAGE_LIBKCAPI_DGSTAPP),y)
 LIBKCAPI_CONF_OPTS += --enable-kcapi-dgstapp
 else
@@ -35,6 +41,12 @@ else
 LIBKCAPI_CONF_OPTS += --disable-kcapi-hasher
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKCAPI_KPP),y)
+LIBKCAPI_CONF_OPTS += --enable-lib-kpp
+else
+LIBKCAPI_CONF_OPTS += --disable-lib-kpp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBKCAPI_RNGAPP),y)
 LIBKCAPI_CONF_OPTS += --enable-kcapi-rngapp
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
