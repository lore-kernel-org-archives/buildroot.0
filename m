Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73C5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:14:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CF5260527
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CF5260527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7074021C;
	Mon, 25 Oct 2021 20:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPSxhwSJCzqO; Mon, 25 Oct 2021 20:14:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58AF840411;
	Mon, 25 Oct 2021 20:14:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB5F51BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A4CE40237
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1O2fMbkS1su2 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:14:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF4294021C
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:14:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3039B88864; Mon, 25 Oct 2021 20:10:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 22:12:33 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9cfdf025c27ca15a617a24aeaf4dd684c73647bb
X-Git-Newrev: c8b881daf466c12f7e96282972021b927d473769
X-Patchwork-Hint: ignore
Message-Id: <20211025201042.3039B88864@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gpsd: enable
 python support and modules
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8b881daf466c12f7e96282972021b927d473769
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add option that enables gpsd python support including modules, tools,
and gpsfake test harness. If python is enabled then install python
modules unconditionally. Note that gpsd python modules run compatibly
under Python 2 and 3.x for x >= 2. So enable gpsd python support when
any Python version is enabled in board configuration. If no Python is
enabled, but gpsd Python support is requested, then select Python 3.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f3ef0723cf7159401de595dbfb2d023d78c9336a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/Config.in | 11 +++++++++++
 package/gpsd/gpsd.mk   | 13 ++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 5dd57c34b8..1da9a5ce2a 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -79,6 +79,17 @@ config BR2_PACKAGE_GPSD_MAX_DEV_VALUE
 config BR2_PACKAGE_GPSD_SQUELCH
 	bool "squelch gpsd_report and gpsd_hexdump to save cpu"
 
+config BR2_PACKAGE_GPSD_PYTHON
+	bool "build Python support and modules"
+	depends on BR2_USE_WCHAR # python
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	help
+	  Python libraries and tools for the gpsd service daemon
+	  including gpsfake test harness.
+
+comment "GPSD python support not available with toolchain w/o wide characters support"
+	depends on !BR2_USE_WCHAR
+
 comment "Protocols"
 
 config BR2_PACKAGE_GPSD_AIVDM
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 01a3b0a58b..ef82fd913f 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -24,7 +24,6 @@ GPSD_SCONS_OPTS = \
 	prefix=/usr \
 	sysroot=$(STAGING_DIR) \
 	strip=no \
-	python=no \
 	qt=no \
 	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
 
@@ -188,6 +187,18 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
 GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+GPSD_SCONS_OPTS += \
+	python=yes \
+	python_libdir="/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages"
+else ifeq ($(BR2_PACKAGE_PYTHON),y)
+GPSD_SCONS_OPTS += \
+	python=yes \
+	python_libdir="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
+else
+GPSD_SCONS_OPTS += python=no
+endif
+
 GPSD_SCONS_ENV += \
 	LDFLAGS="$(GPSD_LDFLAGS)" \
 	CFLAGS="$(GPSD_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
