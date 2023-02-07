Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC784C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8275461030;
	Tue,  7 Feb 2023 17:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8275461030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flZREqqrBcAD; Tue,  7 Feb 2023 17:11:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A733961016;
	Tue,  7 Feb 2023 17:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A733961016
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 352851BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C4FF81242
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C4FF81242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GA5ixb89IxwR for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:11:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31AED80E55
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31AED80E55
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:11:36 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 081BCCC4FA
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:00:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F6DA240002;
 Tue,  7 Feb 2023 17:00:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pPRKl-00EhMd-H4; Tue, 07 Feb 2023 18:00:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:00:39 +0100
Message-Id: <20230207170040.3503236-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/pkg-generic.mk: require git on the
 host for packages using cargo/go vendoring
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The vendoring done for cargo / go packages (may) need git, so ensure we
check for it in dependencies, similar to how it is done for packages
directly using git.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5d618c6b39..82187d7db9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1250,6 +1250,13 @@ else ifeq ($$($(2)_SITE_METHOD),cvs)
 DL_TOOLS_DEPENDENCIES += cvs
 endif # SITE_METHOD
 
+# cargo/go vendoring (may) need git
+ifeq ($$($(2)_DOWNLOAD_POST_PROCESS),cargo)
+DL_TOOLS_DEPENDENCIES += git
+else ifeq ($$($(2)_DOWNLOAD_POST_PROCESS),go)
+DL_TOOLS_DEPENDENCIES += git
+endif
+
 DL_TOOLS_DEPENDENCIES += $$(call extractor-system-dependency,$$($(2)_SOURCE))
 
 # Ensure all virtual targets are PHONY. Listed alphabetically.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
