Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F60C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79F2E82628;
	Sat, 27 Jan 2024 20:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79F2E82628
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tq9UVRY-JPsQ; Sat, 27 Jan 2024 20:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEFD28258D;
	Sat, 27 Jan 2024 20:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEFD28258D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C1F71BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D4C9415ED
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4C9415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wk1co1fAwlbB for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:08:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50C3D415E3
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50C3D415E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B760865AE; Sat, 27 Jan 2024 20:08:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 21:07:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74b6774108cae46a53b6d9d08fe2733c5740f439
X-Git-Newrev: 48874afb9d03cb02b0207fd53bf2cdf0c37c8fa0
X-Patchwork-Hint: ignore
Message-Id: <20240127200855.3B760865AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/environment-setup: do not export
 GIT_DIR
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

commit: https://git.buildroot.net/buildroot/commit/?id=48874afb9d03cb02b0207fd53bf2cdf0c37c8fa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
