Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36418C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:03:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF986108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEF986108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B883940480;
	Mon, 18 Oct 2021 20:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2IZn_ijhUuX; Mon, 18 Oct 2021 20:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 817B7401CA;
	Mon, 18 Oct 2021 20:03:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3794E1BF97A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 321394051B
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZxRX-TNC37c for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:03:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 714F440608
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:03:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 264BF87945; Mon, 18 Oct 2021 19:59:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 22:02:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04bd3edf3472a5abfe456b2fc7fab54f07b1907c
X-Git-Newrev: 98728c893d194daa9bae777b4244dfe8bfb42749
X-Patchwork-Hint: ignore
Message-Id: <20211018195958.264BF87945@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/knock: add knockd option
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

commit: https://git.buildroot.net/buildroot/commit/?id=98728c893d194daa9bae777b4244dfe8bfb42749
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add knockd option to make libpcap and MMU optional and enable it by
default for backward compatibility

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/knock/Config.in | 14 ++++++++++++--
 package/knock/knock.mk  |  9 +++++++--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/knock/Config.in b/package/knock/Config.in
index 0060ad07ce..5a4c00d9e8 100644
--- a/package/knock/Config.in
+++ b/package/knock/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_KNOCK
 	bool "knock"
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBPCAP
 	help
 	  A port knocking implementation.
 	  Provides a daemon and a user application. Port knocking can be
@@ -11,3 +9,15 @@ config BR2_PACKAGE_KNOCK
 	  firewall.
 
 	  http://www.zeroflux.org/projects/knock
+
+if BR2_PACKAGE_KNOCK
+
+config BR2_PACKAGE_KNOCK_KNOCKD
+	bool "knockd"
+	default y
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Enable knockd
+
+endif
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 2cfa738074..de70f26274 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -9,10 +9,15 @@ KNOCK_SITE = $(call github,jvinet,knock,v$(KNOCK_VERSION))
 KNOCK_AUTORECONF = YES
 KNOCK_LICENSE = GPL-2.0+
 KNOCK_LICENSE_FILES = COPYING
-KNOCK_DEPENDENCIES = libpcap
 
+ifeq ($(BR2_PACKAGE_KNOCK_KNOCKD),y)
+KNOCK_DEPENDENCIES += libpcap
+KNOCK_CONF_OPTS += --enable-knockd
 ifeq ($(BR2_STATIC_LIBS),y)
-KNOCK_CONF_OPTS = LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+KNOCK_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+endif
+else
+KNOCK_CONF_OPTS += --disable-knockd
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
