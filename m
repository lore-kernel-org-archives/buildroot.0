Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE58CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 09:29:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 353F561039
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 09:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 353F561039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03CFA60BBE;
	Sun, 12 Sep 2021 09:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IloOmyIW9zn9; Sun, 12 Sep 2021 09:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6474F60A35;
	Sun, 12 Sep 2021 09:29:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B70621BF47E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 09:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5EC840477
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 09:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IRLs2_qx60XF for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 09:29:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3C7840443
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 09:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=9gjeeylGopmbi8NOZiYB9OyYBoCFIdXkK6j5WXbYDj0=; 
 b=m2AMYkxkshfsq3S5+GrR1XVBZoFEBuM/zo3MXVBolnaHYoHTBcLRWJUplRZ6xP0I2tnbHhJFGmh1eruu7sZ7gDENi5IsdZrkicUXVX99kAG+SHkXgASJUD34m3J1i2trjg1uZuJ6iKGuuMxPUdOXk01rGo/D/6QnjRcjEUYC4fFtq/h+5rBV3TovdIUkDX9f8k1+bwlfDF8dmFz4LmTIqFJ6pvBSOUXG4DkXStFv9EwcsgT9JyAM8wxgvJUClVv1Lzs10CIfSHQ8GvPyC4GZ0s1a4NxJNspesgHFVktmUPJpNG4sPD0091YCLZgwS9e5CtyvvJYQF9C97sS9z9vlKQ==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mPLnN-00016S-FH; Sun, 12 Sep 2021 11:29:05 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 6768ffb7;
 Sun, 12 Sep 2021 09:28:55 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 12:28:55 +0300
Message-Id: <20210912092855.2427158-1-aperez@igalia.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.10.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Update to version 0.10.1, which fixes the build when the DRM platform
module is enabled, fixes handling of absolute pointer events, and makes
the headless platform optional. Note that while optional, Buildroot
keeps it enabled (as previously) because the wpebackend-fdo dependency
is always needed anyway because Buildroot does not include any other
WPE backend.

Release notes:

  https://wpewebkit.org/release/cog-0.10.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 566d30fa2a..3abc5f2c83 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.10.0.tar.xz.sums
-md5  1b0407b6163a3a01afdfc0fb454a7570  cog-0.10.0.tar.xz
-sha1  911816c00a2b08f4cfd388b1d2e176835c9b4e9e  cog-0.10.0.tar.xz
-sha256  2c72369c636ca4684370adad1344071b23c9ee2c851eb7d738fa2e1d7092031f  cog-0.10.0.tar.xz
+# From https://wpewebkit.org/releases/cog-0.10.1.tar.xz.sums
+md5  b997da3c143bc34ec5e953eb7e7ccefc  cog-0.10.1.tar.xz
+sha1  f25312141de918f41add3e3c9984faa985cda0a9  cog-0.10.1.tar.xz
+sha256  aecf546d7b0645119d79559c5574cb5eb68364fc8409dfbd47a4920bd1f221bc  cog-0.10.1.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index d373e6e1b6..07b8e245ef 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.10.0
+COG_VERSION = 0.10.1
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
@@ -13,6 +13,7 @@ COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
 	-DCOG_BUILD_PROGRAMS=ON \
+	-DCOG_PLATFORM_HEADLESS=ON \
 	-DCOG_WESTON_DIRECT_DISPLAY=OFF \
 	-DINSTALL_MAN_PAGES=OFF \
 	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
