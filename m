Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CAAD25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9359614C0;
	Mon, 12 Jan 2026 08:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wO9EoPhgRHM; Mon, 12 Jan 2026 08:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED860614EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205999;
	bh=l5jApflbmWPYyZUL2dEHHxJ3WrRbrfDGAu8Y1XZpHPI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Edcl9kZIU0Uiy66p38hvm+vkwyfuLc5hVcQtsAsPWaDhY690pfnz4+OGesS6bsE+U
	 qggiQ4FLqhQPFDSc6p13+njpC3fUf1gQjfQ7XWPz5/y/qQYIW8VXUrDXr11fYYX5ia
	 o97qxgl0wTzaYfHHKLoqqXsgkgdIoM5e1CLaEwnDLBk6EJQyEuHB1AuKOLpWqyhWZj
	 CVgDPILp8k/HIGkCwp272rxgbxkGCVI9OwqNu/U7NserIiTCdoFVtPo+2+MRuqjcyh
	 lqkFs57vQCT7tHR3tAOmHvkLOZbrve7SsNi8C+Og0vQVYIokjfR5zYGKqSMYuRFsm1
	 R9f+3y4N5/e7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED860614EC;
	Mon, 12 Jan 2026 08:19:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57F9D18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C1C414E3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nD4RIqSii4Hn for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B57A414E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B57A414E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B57A414E2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 047C8A4C40E2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-1TPC
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:02 +0100
Message-ID: <20260112080419.2516889-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205145;
 bh=ZJdWmBVM++cMyCrkHkP5l/wrkpderTZ4mXndveGRzAg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=uvhhptj5IQgMCFH7YlyrTxa/rhI6CzOjVtFTfLiIYhCXvTBZtN/zGMicG23rjL9Cp
 SXocMxcqsdV8A2P/Rp85+zezTY12/FYRRWcxl4S9GqciwqCqjLJM/5jkpVEIer4vZs
 zZDzGgVXwFrn/Uwxd8RV+eAqToDEKE8NZSEtgMqAHYs0mrQkW8dsWLqbbBkIL874Te
 AznQkPYgHgZ3su7TljyoD+DL+7fulm6wWsDiSuh/XBXxNHyWNjwLydOKrYCb3hiHN9
 O1YfrdoJoCbw2r4wXRwOu5PyH9wwf7I28maC7DhnAPlpIFLT6IS523aCYsm/MflW9L
 gezsRdTnPQ+Fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=uvhhptj5
Subject: [Buildroot] [PATCH 027/104] package/x11r7/xapp_sessreg: bump
 version to 1.1.4
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

https://lists.x.org/archives/xorg-announce/2025-May/003601.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/sessreg/-/commit/498db3a831ac76b487cfec86492ebc54e0e25bb4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_sessreg/xapp_sessreg.hash | 8 ++++----
 package/x11r7/xapp_sessreg/xapp_sessreg.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.hash b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
index 1f1b54b877..7d12d7617d 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.hash
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003246.html
-sha256  022acd5de8077dddc4f919961f79e102ecd5f3228a333681af5cd0e7344facc2  sessreg-1.1.3.tar.xz
-sha512  bc1e83afc598ac5b4c6ab0861799b6c8727c123ee662c1fb9cbdd9ee926973b7a00cc62e32f6b4e462c0da3516f8b824337d9cf17587ebabd3f4753502641a60  sessreg-1.1.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003601.html
+sha256  4e85b52f4f65a93449753bfb00ceb5d77f3317e24d07dc23147f2f116c785350  sessreg-1.1.4.tar.xz
+sha512  836d2cfa60448de9b4af1b79693905854ba5c1135d623654bba627d125271eb74111bac2b4437a86f4cbd362695e796fc0279d4f4684f2cd5080cdd953318686  sessreg-1.1.4.tar.xz
 # Locally computed
-sha256  ac8f5cc696e6c473aea4caaf18650316dc8912fcf0f370cae1df5f395cea8631  COPYING
+sha256  1274afd6bafa32e4e1c2fc7c1b2ebe2fd690f6e63faf4a54a5b1348d6928e20d  COPYING
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index b196bb947e..bd5a419ad1 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SESSREG_VERSION = 1.1.3
+XAPP_SESSREG_VERSION = 1.1.4
 XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.xz
 XAPP_SESSREG_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SESSREG_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
