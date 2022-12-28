Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EEDC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F884F32A;
	Mon, 20 Feb 2023 22:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F884F32A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljzlQCbWDw5p; Mon, 20 Feb 2023 22:49:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B6814F32E;
	Mon, 20 Feb 2023 22:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B6814F32E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFEF1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8FBB4170E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8FBB4170E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqgyUtY9eGyJ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2EC0416FE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2EC0416FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF51386496; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 20:49:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 620a77dc9d93365d87c7b18545f091c8e962509e
X-Git-Newrev: e2468404c76e5d56d14f7e2afea8e2641f036e30
X-Patchwork-Hint: ignore
Message-Id: <20230220205216.EF51386496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/slang: add option to
 enable/disable slsh
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2468404c76e5d56d14f7e2afea8e2641f036e30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The S-lang shell is currently installed by default but most packages are
typically interested in the shared libraries only. Add a configuration
option to disable the slsh program and its supporting files.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/slang/Config.in | 9 +++++++++
 package/slang/slang.mk  | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/slang/Config.in b/package/slang/Config.in
index a500ff5b7d..0b2c987f73 100644
--- a/package/slang/Config.in
+++ b/package/slang/Config.in
@@ -5,3 +5,12 @@ config BR2_PACKAGE_SLANG
 	  Multi-platform console display library.
 
 	  http://www.jedsoft.org/slang/index.html
+
+if BR2_PACKAGE_SLANG
+
+config BR2_PACKAGE_SLANG_SLSH
+	bool "enable slsh"
+	help
+	  Enable the S-lang interpreter
+
+endif
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index e0f5968b46..2b3cbdf27a 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -60,4 +60,13 @@ SLANG_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
 SLANG_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
 endif
 
+ifeq ($(BR2_PACKAGE_SLANG_SLSH),)
+define SLANG_REMOVE_SLSH
+	rm -rf $(TARGET_DIR)/etc/slsh.rc \
+		$(TARGET_DIR)/usr/share/slsh \
+		$(TARGET_DIR)/usr/bin/slsh
+endef
+SLANG_POST_INSTALL_TARGET_HOOKS += SLANG_REMOVE_SLSH
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
