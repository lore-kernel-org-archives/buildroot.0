Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1CFC47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 09:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E4A83FA8;
	Fri, 26 Jan 2024 09:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34E4A83FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5_8SPRsZgJC; Fri, 26 Jan 2024 09:34:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A0CC83FA3;
	Fri, 26 Jan 2024 09:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A0CC83FA3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5C21BF2B0
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 09:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25DC7611F0
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 09:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25DC7611F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id THx_UBWBlMJ5 for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 09:34:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13D1560F56
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 09:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D1560F56
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3976AFF80B;
 Fri, 26 Jan 2024 09:34:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rTIbi-008wIG-1M;
 Fri, 26 Jan 2024 10:34:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 10:34:40 +0100
Message-Id: <20240126093441.2130693-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/environment-setup: do not export GIT_DIR
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
