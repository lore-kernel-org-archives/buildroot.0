Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C73DCCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 13:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46A2740DEC;
	Fri,  3 Oct 2025 13:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0AfCpewIe7h; Fri,  3 Oct 2025 13:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE4BC40DA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE4BC40DA0;
	Fri,  3 Oct 2025 13:55:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4921591C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 13:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B04C40DA0
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 13:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbACla2EmZeF for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 13:55:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9839040D98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9839040D98
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9839040D98
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 13:55:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc8f.dip0.t-ipconnect.de [79.214.204.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 35824A4C5D13;
 Fri,  3 Oct 2025 15:55:35 +0200 (CEST)
Received: from [192.168.1.144] (port=42458 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4gFy-000000005ND-2WUi;
 Fri, 03 Oct 2025 13:55:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 15:55:30 +0200
Message-ID: <20251003135530.371676-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251003135530.371676-1-bernd@kuhls.net>
References: <20251003135530.371676-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759499735;
 bh=ypc8S/X+Fr7Kc5iqFntNlr3qgptXBvcvSNsvgAu8snU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jKlDgnU1sFCPVQ8LhA7gdKD43ePUd4MIY9Mds9XqqRc4gYPoDloRa4V+69YOWI7/i
 ozmK18jeyfeUZivMn0ywCjYvG13p1U18FO3GzsqregeYz1Zwld/JcM+7TjpXsVl282
 jyuQUAP5o8Vf7tLKcnEdlMxM//wXvurisPbLjbXEg0v0p3YZH9jondRKtnZsNpmwif
 WszJKDuOrgfuypzIxqwHcIqMCqlwYXWA4qPq0JFZRFs90ntBQbU2Y0jpBYZYPJoFZq
 YU+TGUB6avgyIDPcp3ZYkxSakOqd+30m9UGzTRIgJu5XrFaehl6PVKoXbwG2b9o9fl
 X15UnzSxYUWjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=jKlDgnU1
Subject: [Buildroot] [PATCH 3/3] package/asterisk: bump version to 22.5.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index f11ed08ef4..26175667c3 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4cc403c8885d4aed3956dfb75d315d3e5bcc129eb9cd47c156d3b12ecceed1ba  asterisk-22.3.0.tar.gz
+sha256  8a94650b6f348af1f1c9cce7ed3585d280f3a31b0d3820084a42b03712df95d5  asterisk-22.5.2.tar.gz
 
 # Locally computed
 sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index e7e802aa45..9a071fb8e0 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.3.0
+ASTERISK_VERSION = 22.5.2
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
