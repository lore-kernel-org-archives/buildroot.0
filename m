Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD7AC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 769BB60ED5;
	Wed, 28 Feb 2024 16:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t_Zir30nfEBv; Wed, 28 Feb 2024 16:44:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 851F260EE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851F260EE1;
	Wed, 28 Feb 2024 16:44:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 828AB1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00A1E415BF
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qAyRCFi8ragE for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 282B34168B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 282B34168B
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 228F387BD5; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 17:41:22 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e8f374db5c7c9df6190f3014b49e4839acb8eb09
X-Git-Newrev: 6c8d4ea2edec358ae68d4c463402ce81f4d8f603
X-Patchwork-Hint: ignore
Message-Id: <20240228164338.228F387BD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/environment-setup: do not export GIT_DIR
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c8d4ea2edec358ae68d4c463402ce81f4d8f603
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit c07aafa08792 (package/Makefile.in: set GIT_DIR=.  in {HOST,
TARGET}_MAKE_ENV) added GIT_DIR=.  to TARGET_MAKE_ENV (which is included in
TARGET_CONFIGURE_OPTS) to work around issues with packages getting confused
when building in a subdir of the Buildroot git repo.

This unfortunately also causes git commands to fail when
output/host/environment-setup is sourced:

git status
fatal: not a git repository: '.'

So strip GIT_DIR= from TARGET_CONFIGURE_OPTS when generating
environment-setup.

Reported-by: Mircea Gliga <gliga.mircea@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 48874afb9d03cb02b0207fd53bf2cdf0c37c8fa0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/environment-setup/environment-setup.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 29ec5a9a95..069ee25f9f 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -8,7 +8,7 @@ ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
 
 define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 	cp package/environment-setup/environment-setup $(ENVIRONMENT_SETUP_FILE)
-	for var in $(TARGET_CONFIGURE_OPTS); do \
+	for var in $(filter-out GIT_DIR=%,$(TARGET_CONFIGURE_OPTS)); do \
 		printf "export \"$$var\"\n" >> $(ENVIRONMENT_SETUP_FILE); \
 	done
 	printf "export \"ARCH=$(NORMALIZED_ARCH)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
