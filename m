Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816A9C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 16:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 514F781EDA;
	Tue, 19 Mar 2024 16:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sX54JwBiCGfP; Tue, 19 Mar 2024 16:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4399781EEC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4399781EEC;
	Tue, 19 Mar 2024 16:36:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECED71BF977
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D94D460B2A
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w9oydi4xIMjP for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D100860807
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D100860807
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAF5182CFA; Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 17:33:18 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 56de003fa31dc3e30e915c0d97d5af5becbdbc01
X-Git-Newrev: a9c9fe8d4ade2c2906d1c2f0b28968808050e96f
X-Patchwork-Hint: ignore
Message-Id: <20240319163621.CAF5182CFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
 package/rauc-hawkbit-updater: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9c9fe8d4ade2c2906d1c2f0b28968808050e96f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following build failure with gcc 4.8 raised since the addition
of the package in commit 928b7219cd7079864eadadc66dbff21c5cd72804:

../src/hawkbit-client.c:873:17: error: 'for' loop initial declarations are only allowed in C99 mode
                 for (const gint *code = &resumable_codes[0]; *code; code++)
                 ^
../src/hawkbit-client.c:873:17: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes: 928b7219cd7079864eadadc66dbff21c5cd72804
 - http://autobuild.buildroot.org/results/e275d0ec4fe1da418a6163b46666316034b83b19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b146a0b944dedf45153348761ac313ca9062a7c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
index a453f75a28..3836d3c84e 100644
--- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
@@ -10,5 +10,6 @@ RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSIO
 RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
 RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
 RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib libcurl
+RAUC_HAWKBIT_UPDATER_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
