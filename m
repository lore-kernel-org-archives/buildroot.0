Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E158FCCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 15:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB9F60AFE;
	Sun, 12 Oct 2025 15:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3Zbw8PvY9Yz; Sun, 12 Oct 2025 15:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D142260BD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D142260BD8;
	Sun, 12 Oct 2025 15:33:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C675012B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7FA640AD1
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYG14ZYIymIy for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 15:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFFA040012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFFA040012
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFFA040012
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:33:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2C6B4A4C65EA
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 17:33:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59578)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v7y4V-000000005fD-26Ln
 for buildroot@buildroot.org; Sun, 12 Oct 2025 15:33:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 17:33:19 +0200
Message-ID: <20251012153319.99747-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760283200;
 bh=A3Bi45mdviBaP8+/Ov16dGa2hrjTD09+qik80s9gmlo=;
 h=From:To:Subject:Date:From;
 b=U7RGavno6vNoq5AUBGbnTCUHw7ZkH6WVoEUA+cYdgeLIu4irF1bQNqiVWbh41Xln+
 rumExpgvYxQQutC0BRqJgRS6C7A2JptvZzUpcXvYaXWg2FloWDWrW+fDYuTsUYP6FI
 ypb9yUbmqfGSggthBiDc24kzEmYCYoiJ3jakag5YfZL3JlwA/LodHLNcMfMcDBsCgY
 gNsy4o5bpW3AtmIXxrRgHlv7Wdi7O678/MV0ntyN+LcmN24znOVDCtwAhZysUZRBrj
 Dre9TCXMufi9v7t1X8PTtVO8ltnjlcxU+V3vI6zacjSj5qloVhvyP7Q/XJfKnX1m7Q
 TmJ6KXBmuPZXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=U7RGavno
Subject: [Buildroot] [PATCH 1/1] package/which: bump version to 2.23
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://cgit.git.savannah.gnu.org/cgit/which.git/tree/NEWS?id=3e2c8f8acc3a333b66b06de234bc9324c6fe5500

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/which/which.hash | 2 +-
 package/which/which.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/which/which.hash b/package/which/which.hash
index edea4e5e34..b7784fdbf5 100644
--- a/package/which/which.hash
+++ b/package/which/which.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad  which-2.21.tar.gz
+sha256  a2c558226fc4d9e4ce331bd2fd3c3f17f955115d2c00e447618a4ef9978a2a73  which-2.23.tar.gz
 # Locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/which/which.mk b/package/which/which.mk
index c96e893756..c914c66839 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WHICH_VERSION = 2.21
+WHICH_VERSION = 2.23
 WHICH_SITE = $(BR2_GNU_MIRROR)/which
 WHICH_LICENSE = GPL-3.0+
 WHICH_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
