Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF90C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 21:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC41612F6;
	Thu, 11 Apr 2024 21:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOJi5q6C9kJY; Thu, 11 Apr 2024 21:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D8A761311
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D8A761311;
	Thu, 11 Apr 2024 21:01:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42F421BF330
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E51D82274
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kA09JsocYkPq for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 21:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CFF282269
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CFF282269
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CFF282269
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 21:01:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A063A4C3146;
 Thu, 11 Apr 2024 23:01:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36024)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rv1XY-000000001B4-1wh6;
 Thu, 11 Apr 2024 21:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 23:01:00 +0200
Message-Id: <20240411210100.2127868-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712869261;
 bh=zDwLmOPjVqLBY9BiOkJ/ZPzUmdWzO/9whNK4X9+Z4jw=;
 h=From:To:Cc:Subject:Date:From;
 b=RSS81kjQS2coioIULjjqnrfYjzJjJ1ib9o1Av/VYGmy0LJPGDBioz+9CH2Oe5K147
 uey9wNNxL0S9JWCDI3gaIxaCChRKYn/r92/QNBsIqKAg4A14YM5bROoXfMfN+Rc8j2
 f48vrMCPizR19X4mM76fJbVoFoC2bkb2lzVZVgszPy4I+IFTNyEyaWB17Wscf1O3Tt
 BhMj0hn2z90FAca7uvgDxcWPYS5d716id37sODjw2V60Ln32EmIQAh3BYH2dD0p1kn
 PWdnyZ3CYzfJNZtYkRZqyXLKke8crz0LnEaaxLxHMaOvmzmKavuMYV5hnTnB+UN2d6
 Xd4B7eAOu1Jog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=RSS81kjQ
Subject: [Buildroot] [PATCH] package/libedit: bump version to 20230828-3.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://www.thrysoee.dk/editline/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libedit/libedit.hash | 2 +-
 package/libedit/libedit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libedit/libedit.hash b/package/libedit/libedit.hash
index 2e7363d828..c2ed7f773f 100644
--- a/package/libedit/libedit.hash
+++ b/package/libedit/libedit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f0925a5adf4b1bf116ee19766b7daa766917aec198747943b1c4edf67a4be2bb  libedit-20221030-3.1.tar.gz
+sha256  4ee8182b6e569290e7d1f44f0f78dac8716b35f656b76528f699c69c98814dad  libedit-20230828-3.1.tar.gz
 sha256  9da6c9c74987a36c84302982799d17d2f748ba1c1c0c471425716173c1d07649  COPYING
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 576a163173..ea7f98fdbd 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDIT_VERSION = 20221030-3.1
+LIBEDIT_VERSION = 20230828-3.1
 LIBEDIT_SITE = https://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
