Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F66C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 09:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D92F761131
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 09:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D92F761131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80C59607C5;
	Tue, 21 Sep 2021 09:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1T_pc2WLVmk3; Tue, 21 Sep 2021 09:33:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92D2D60B41;
	Tue, 21 Sep 2021 09:33:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCCFE1BF956
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 09:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B93DE401E1
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 09:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23b8g7eBvU9J for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 09:32:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B10740114
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 09:32:57 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id F022E240016;
 Tue, 21 Sep 2021 09:32:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mSc8y-0005xA-4B; Tue, 21 Sep 2021 11:32:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 11:32:49 +0200
Message-Id: <20210921093250.22812-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lynx: add security patch for
 CVE-2021-38165
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
Cc: Mario Lang <mlang@blind.guru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Lynx through 2.8.9 mishandles the userinfo subcomponent of a URI, which
allows remote attackers to discover cleartext credentials because they may
appear in SNI data.

https://lists.nongnu.org/archive/html/lynx-dev/2021-08/msg00002.html

Upstream unfortunately does not provide a public VCS (only source
snapshots), so fetch the security patch from Debian.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lynx/lynx.hash | 1 +
 package/lynx/lynx.mk   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/lynx/lynx.hash b/package/lynx/lynx.hash
index 76d7614a7c..62e2555a99 100644
--- a/package/lynx/lynx.hash
+++ b/package/lynx/lynx.hash
@@ -1,3 +1,4 @@
 # Locally calculated:
 sha256  387f193d7792f9cfada14c60b0e5c0bff18f227d9257a39483e14fa1aaf79595  lynx2.8.9rel.1.tar.bz2
+sha256  b2207e757dbbefc34a20a32b1b4a216b4a4316e1dc812bceca4ac6294871119a  90_CVE-2021-38165.patch
 sha256  8406a30ff3134ec23cf752d1ceda92ddaabbe41b4f2dc07ea3cfa139de12d6d6  COPYING
diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index d115682d64..44d52d90a5 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -7,6 +7,10 @@
 LYNX_VERSION = 2.8.9rel.1
 LYNX_SOURCE = lynx$(LYNX_VERSION).tar.bz2
 LYNX_SITE = ftp://ftp.invisible-island.net/lynx/tarballs
+LYNX_PATCH = \
+	https://salsa.debian.org/lynx-team/lynx/-/raw/debian/2.9.0dev.6-3_deb11u1/debian/patches/90_CVE-2021-38165.patch
+# 90_CVE-2021-38165.patch
+LYNX_IGNORE_CVES += CVE-2021-38165
 LYNX_LICENSE = GPL-2.0
 LYNX_LICENSE_FILES = COPYING
 
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
