Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0976EE77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5D0D408B0;
	Sat, 30 Sep 2023 13:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5D0D408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFMDXssGRTIO; Sat, 30 Sep 2023 13:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A722740C0A;
	Sat, 30 Sep 2023 13:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A722740C0A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 448041BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DDB760D6E
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DDB760D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dSagN6ueb33m for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:43:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D63FC60D58
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D63FC60D58
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6737B1C0007;
 Sat, 30 Sep 2023 13:42:57 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qmaFE-00Ey6p-LK; Sat, 30 Sep 2023 15:42:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 15:42:34 +0200
Message-Id: <20230930134234.3567570-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/urandom-scripts: move seedrng init
 script to S01
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

We want to initialize the kernel random number generator as soon as
possible, as early init scripts may also need random numbers (E.G.
syslog-ng in S01syslog-ng does).

Seedrng was presumably only using S20 because the previos urandom script
used S20, which (after som moves) dates all the way back to:

commit 8262508fc4456b5230216473ea14c897268ba791
Author: Eric Andersen <andersen@codepoet.org>
Date:   Fri Apr 26 22:01:43 2002 +0000

    With this update, everything now works as expected.
     -Erik

Seedrng needs persistent storage, but mount -a is run before executing the
init scripts, so S01 should be as good as S20 - Atleast with the scripts in
upstream Buildroot.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/urandom-scripts/{S20seedrng => S01seedrng} | 0
 package/urandom-scripts/urandom-scripts.mk         | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename package/urandom-scripts/{S20seedrng => S01seedrng} (100%)

diff --git a/package/urandom-scripts/S20seedrng b/package/urandom-scripts/S01seedrng
similarity index 100%
rename from package/urandom-scripts/S20seedrng
rename to package/urandom-scripts/S01seedrng
diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
index 32f3e09343..89abdfff72 100644
--- a/package/urandom-scripts/urandom-scripts.mk
+++ b/package/urandom-scripts/urandom-scripts.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S20seedrng \
-		$(TARGET_DIR)/etc/init.d/S20seedrng
+	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S01seedrng \
+		$(TARGET_DIR)/etc/init.d/S01seedrng
 endef
 
 $(eval $(generic-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
