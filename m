Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70618C61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 14:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B45040533;
	Wed, 26 Aug 2026 14:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvBsj7qEO8Sc; Wed, 26 Aug 2026 14:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787754527;
	bh=+gUi+2j7LaTFY8F3twiqz+FhVJaFYtIQHWViFiFchSs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CNqSsSdzVxzb0hISiQaikyp2O3juuAx2xQihbWfCscGQkdSsiRM4AQK5ZcqAoy585
	 QTHgH5YogMpMcprDOQuqWf5+tnbtT/FV7AGbYk8DORL140Owjxh40u88sbwaZsD8+g
	 wt9mFg1/3o3hwU6xdP+WeawRRpYtNCBhFDSxsyXnWrVFXqF+/wXpJmZUg9ztMvxlRb
	 p0PCPQAjoMijJsphjelk5Za3d0uI5IzK4CpMk6yu/+s9v0AUUrr0zK8GT8fXJirxz1
	 cgeXyooyVH75Vjj+WuXiTjLIdYKuA4VG0imDR2UcENGNuXXR4IBOG/cPp7O733hVAZ
	 gZHZf6CaIiwhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6193A4052E;
	Wed, 26 Aug 2026 14:28:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D515E334
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAECE60657
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZXJ5os4zunS for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 14:28:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE9A1605EE
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:28:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7D76A4E413BB;
 Wed, 26 Aug 2026 14:28:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5288A604EC;
 Wed, 26 Aug 2026 14:28:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7552C11C7832C; 
 Wed, 26 Aug 2026 16:28:38 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Wed, 26 Aug 2026 16:28:29 +0200
Message-ID: <20260826142830.4040428-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826142830.4040428-1-thomas.petazzoni@bootlin.com>
References: <20260826142830.4040428-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/qt6/qt6declarative: fix select of
 host-qt6base network
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The BR2_PACKAGE_QT6DECLARATIVE_QUICK option has some logic to select
network support in host-qt6base if network support is enabled in
qt6base. However, it turns out that this is actually required at the
top level BR2_PACKAGE_QT6DECLARATIVE option: as soon as network
support is available in qt6base, the qt6declarative build will assume
that qmlprofiler is available... but that requires network support in
host-qt6base.

This fixes the following build failure:

CMake Error at /home/thomas/autobuild/instance-2/output-1/build/qt6base-6.9.1/cmake/QtToolHelpers.cmake:784 (message):
  Failed to find the host tool "Qt6::qmlprofiler".  It is part of the
  Qt6QmlTools package, but the package did not contain the tool.  Make sure
  that the host module Qml was built with all features enabled (no explicitly
  disabled tools).
Call Stack (most recent call first):
  /home/thomas/autobuild/instance-2/output-1/build/qt6base-6.9.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
  tools/qmlprofiler/CMakeLists.txt:11 (qt_internal_add_tool)

Fixes:

  https://autobuild.buildroot.net/results/72c956fdf982382d2981c649c456d1edc2c9d6b2/

We did not trace back exactly since when the problem exists, but we
verified that the problem exists in 2025.02.x. It can be reproduced
with the following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_NETWORK=y
BR2_PACKAGE_QT6DECLARATIVE=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6declarative/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
index a57b203071..e24133c3e5 100644
--- a/package/qt6/qt6declarative/Config.in
+++ b/package/qt6/qt6declarative/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_QT6DECLARATIVE
 	bool "qt6declarative"
+	# When target qt6base has network support, qt6declarative
+	# assumes that qmlprofiler is available, but that requires
+	# network support in host-qt6base.
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -14,7 +18,6 @@ config BR2_PACKAGE_QT6DECLARATIVE_QUICK
 	bool "quick module"
 	# Enable host test module to ensure that qmltestrunner is built
 	select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST # qmltestrunner
-	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
 	select BR2_PACKAGE_QT6BASE_GUI
 	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6_GL_SUPPORTS
 	select BR2_PACKAGE_QT6SHADERTOOLS
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
