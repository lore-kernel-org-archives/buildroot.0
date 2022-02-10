Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429FEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD13D404EF;
	Thu, 10 Feb 2022 21:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HffMuGFiTtyo; Thu, 10 Feb 2022 21:30:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF35440354;
	Thu, 10 Feb 2022 21:30:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A14B51BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 900FA409A6
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFsvqCxKbMr7 for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:30:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A99BE4093D
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:30:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 2435CC0BD8
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:24:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 86A0CC0005;
 Thu, 10 Feb 2022 21:24:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nIGvX-0008Ib-As; Thu, 10 Feb 2022 22:24:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 22:24:29 +0100
Message-Id: <20220210212429.31856-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python3: unconditionally install
 python{, -config} symlinks
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

Now that host-python2 is gone, it makes sense to unconditionally install the
symlinks for the host, similar to how it is done for the target.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6af7488ddd..3a334fb28d 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -262,18 +262,12 @@ endef
 
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
 
-# Some packages may have build scripts requiring python3, whatever is the
-# python version chosen for the target.
-# Only install the python symlink in the host tree if python3 is enabled
-# for the target.
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define HOST_PYTHON3_INSTALL_SYMLINK
 	ln -fs python3 $(HOST_DIR)/bin/python
 	ln -fs python3-config $(HOST_DIR)/bin/python-config
 endef
 
 HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
-endif
 
 # Provided to other packages
 PYTHON3_PATH = $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
