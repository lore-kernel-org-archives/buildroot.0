Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA336C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:58:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D57F60EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D57F60EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E21ED60682;
	Sun, 25 Jul 2021 12:58:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlHsCDfS9nvf; Sun, 25 Jul 2021 12:58:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F55660688;
	Sun, 25 Jul 2021 12:58:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD3FA1BF470
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A993983168
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=posteo.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZc0GZ_OWm_k for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 12:58:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59F378305C
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 12:58:20 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 88B2C24002B
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:58:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1627217897; bh=iUQIMxuqeoXVzzF1Z1+xmlq+mIquhuPVXXH+/Zp2koo=;
 h=From:To:Cc:Subject:Date:From;
 b=fONHfxEzcd/uCePoFQV0+ujeCoy4qn+PZpXqAYa75M1qV89UDeJ5d7CvI1uXG/Y+3
 FSAbBCReGLWo5emA5Kt/xqoau0YbFCQCarsjn40yzybAKqBQmBi1b1fqGdKZdHAJvj
 61Lq69WWqBkIrLbPYJAT1BFttZcMBObHKWdeOtWtWGVtn2sRxOnqNVYdJVUn5hYg8v
 4XZoqimtTehg+xWT+AhtuZV4CNcRXU0MIEycOqLylgugZTpMhKmB7mvGbrU3wi46Lm
 A0QDpF+1XpxSp1ImTLazW8W4YMFQ6vhGaz+Af23p937IvpRqzvfbHl7lKgMR/B9iBz
 +0+hSR304IjLg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4GXjlr2tX7z6tmL;
 Sun, 25 Jul 2021 14:58:16 +0200 (CEST)
From: Daniil Stas <daniil.stas@posteo.net>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 12:57:46 +0000
Message-Id: <20210725125746.1169974-1-daniil.stas@posteo.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/htop: fix sources location
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Daniil Stas <daniil.stas@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Change sources location from bintray to github since bintray doesn't
work anymore.
Use commit hash for version instead of git tag to avoid breaking
existing source caches.

Signed-off-by: Daniil Stas <daniil.stas@posteo.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
Backport to: 2021.02.x, 2021.05.x

Changes v1 -> v2:
  - Use commit hash instead of git tag for the package version
---
 package/htop/htop.hash |  2 +-
 package/htop/htop.mk   | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 647feabb8e..34d95eb7a1 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  19535f8f01ac08be2df880c93c9cedfc50fa92320d48e3ef92a30b6edc4d1917  htop-3.0.5.tar.gz
+sha256  123476d56a5e6a219654eebb6b2ec747dfa364f39c01a6475bf8030a25c81bff  htop-ce6d60e7def146c13d0b8bca4642e7401a0a8995.tar.gz
 sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index aa2ff24750..bb2bcb29ae 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,9 +4,15 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.0.5
-HTOP_SITE = https://dl.bintray.com/htop/source
+# This commit hash corresponds to version 3.0.5.
+# htop sources were moved from bintray to github and the sources tar archive
+# was also changed (the build process requires `HTOP_AUTORECONF = YES` now). We
+# use commit hash instead of git tag here to avoid breaking existing source
+# caches
+HTOP_VERSION = ce6d60e7def146c13d0b8bca4642e7401a0a8995
+HTOP_SITE = $(call github,htop-dev,htop,$(HTOP_VERSION))
 HTOP_DEPENDENCIES = ncurses
+HTOP_AUTORECONF = YES
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 HTOP_LICENSE = GPL-2.0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
