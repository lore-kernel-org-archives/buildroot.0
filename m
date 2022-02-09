Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE0DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 18:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F17408D4;
	Wed,  9 Feb 2022 18:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiVPOXECwek4; Wed,  9 Feb 2022 18:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF79E415E5;
	Wed,  9 Feb 2022 18:39:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA4E91BF330
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 18:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A746B82628
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 18:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ohjvMG6c01FW for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 18:37:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A12E8247F
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 18:37:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5918E40007;
 Wed,  9 Feb 2022 18:37:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDD-0001Nl-68; Wed, 09 Feb 2022 17:52:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:39 +0100
Message-Id: <20220209165213.4498-74-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 073/107] package/python3: drop references to
 python2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/Config.in  | 1 -
 package/python3/python3.mk | 2 --
 2 files changed, 3 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 7714518edc..61470c2944 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -4,7 +4,6 @@ comment "python3 needs a toolchain w/ wchar, threads, dynamic library"
 
 config BR2_PACKAGE_PYTHON3
 	bool "python3"
-	depends on !BR2_PACKAGE_PYTHON
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index f9afcd5097..6af7488ddd 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -260,9 +260,7 @@ define PYTHON3_INSTALL_SYMLINK
 	ln -fs python3 $(TARGET_DIR)/usr/bin/python
 endef
 
-ifneq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
-endif
 
 # Some packages may have build scripts requiring python3, whatever is the
 # python version chosen for the target.
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
