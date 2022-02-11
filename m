Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB8CC433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E8FE834AE;
	Fri, 11 Feb 2022 19:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7n4YK7Pkn7KZ; Fri, 11 Feb 2022 19:12:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89F93831E3;
	Fri, 11 Feb 2022 19:12:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E40A1BF3F7
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B1E640A0B
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w604lW1P92bK for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FE4D40A0A
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5CF9482DDC; Fri, 11 Feb 2022 19:02:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:08:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4f0e2a63726efe84032c69b4f2b41a883c5e822
X-Git-Newrev: b6ff83722f96f71c8b883c63dde37fe9867c1bdc
X-Patchwork-Hint: ignore
Message-Id: <20220211190259.5CF9482DDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: unconditionally install
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b6ff83722f96f71c8b883c63dde37fe9867c1bdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
