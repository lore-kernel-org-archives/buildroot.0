Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEDEC25B75
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 18:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C60A60826;
	Sun, 12 May 2024 18:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCkGrYtXOapT; Sun, 12 May 2024 18:16:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C5486086A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C5486086A;
	Sun, 12 May 2024 18:16:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 368491BF2F3
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21CDC403E5
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wpdg-C2p_XA for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 18:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47CED403AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47CED403AC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47CED403AC
 for <buildroot@buildroot.org>; Sun, 12 May 2024 18:16:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c36b.dip0.t-ipconnect.de [79.214.195.107])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 469A6A4C48C0
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:13:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48974)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s6Dhs-000000005zr-2X08
 for buildroot@buildroot.org; Sun, 12 May 2024 18:13:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 20:13:46 +0200
Message-Id: <20240512181356.2106142-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240512181356.2106142-1-bernd@kuhls.net>
References: <20240512181356.2106142-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715537637;
 bh=qaAIGY0CcrOyh6t2XDWm1A1l+CJdxlTYwRyhnReOlRA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HUQTfGKYnaw44qAr075dJcllY/O0bEF1oEUBwAf4ch0zRdvYgP2uVt8zDbb/QlWDs
 FW+EbfRaAamFP22smN2NDo+a8euSy6XBjM/dpBQ0xcLtpoSey4NN59dtVtJpZe2SHY
 9PF8DEp5StOTWZ7D9vudqOTYT9633h9EG1NssU0KL1RjsTdd8/JGNRaB2U9DR+S7UE
 WpU/kEvZyN0apN8AMn6hCP+VqEhzFC+TFP8hMDlPbLY3gBwbcHYEnAem+bZl/54d4S
 wNvomDqnQbHCja7L7UzQiLY/ALarzUfpk9m1yrPwC53UilSGvZlUVe8O6QD/sgLZkM
 aCju9Dq+KIjNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=HUQTfGKY
Subject: [Buildroot] [PATCH 12/22] package/kodi-pvr-njoy: bump version to
 21.0.1-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index b0fc808aee..c99e92bb9d 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0c570cebbb117bb0ef93692d653782608b332fc2b4b6d1728b5421ccd1457f72  kodi-pvr-njoy-21.0.0-Omega.tar.gz
+sha256  e9768f87857374476766ba8d791793b4e8d1e9d3239149b2142a7b5b3f24b439  kodi-pvr-njoy-21.0.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index 47aa357b11..ab0d371c21 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NJOY_VERSION = 21.0.0-Omega
+KODI_PVR_NJOY_VERSION = 21.0.1-Omega
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
