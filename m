Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C518E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 08:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE2EB60AB7;
	Mon, 29 Dec 2025 08:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkdqQIwqoVRc; Mon, 29 Dec 2025 08:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 097C260ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766996674;
	bh=58EBUAPKGBjbtWSrJ3RyYgXSi4UJwgDb86ll5OiJSmw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xk8ThzFYT7yPegKz08dUYIXCM6BrKcqeTmNrB7GOep4LLnKH3NLcSoEQz2QFrI8Zm
	 xXnuZ6Ji+xB95fVedd0i0lUaCQh6rT6dok0SFUsMv9zt0gB5Hd2/AVcGX/1Uh2v3gX
	 x5ZzNJrrJsaX+uYQQBUoLrqBRmUuq7ze82InbSI8mBNdUmhFpbP0Wfc7l/ZhihElkG
	 JBUhj6MiTUibIPPMeWoabY37PKbweri0hcC1el95d2dO2S3hsk3Jg9jfIAna7C5Adb
	 OfFpPPZpyaO6Ay3ihV+5sPHa04VHfASL5oaB4T43sOh4+tY1yfg1/cIQhYUKISicdN
	 8hqpg4GiUOgXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 097C260ACB;
	Mon, 29 Dec 2025 08:24:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39C7F1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36AE160ACB
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fY-0XrDjUvMB for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 08:24:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D81960AB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D81960AB7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D81960AB7
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:24:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32B52A4C10E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:24:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44214)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1va8YF-000000007DF-2acY
 for buildroot@buildroot.org; Mon, 29 Dec 2025 08:24:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 09:24:27 +0100
Message-ID: <20251229082427.827148-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766996668;
 bh=kYPvkqLxapFvnkoMUBMjU8kdW4sfGTNsLwDBONyMvts=;
 h=From:To:Subject:Date:From;
 b=Dmafn2AN16ZcLAqnCm4Zhg/nOyRKc4yiaw8L8YhUGZLQKzBJCxVZKZvsj/CVfb6QL
 Y6m3TrbSc/lzndyFM+ACc5Arx42F8nJXOs4ih5I7Js1s+YbyLN/SyFvFfVBBpCssA9
 7fz+XKJ18PZjF1FrBX7Rrr2Pcut8vx1gozAMgxQhyNZSxUFWTNyXnR+zaPhNlKeLo/
 HSHvQOxqxXXddpRdNuVoO1jL1uWuRkBvp317HXOeOPS7fFFVjJgICKhoFoSI5xDqBk
 EMZhkhtylLEwAAKUHwU+R2aanCa9H4GDLRnysjxpvGWEmdYFGd0HHI5TC7zRZOkm9+
 pej415oSGZowg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Dmafn2AN
Subject: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: bump version to 2.3
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
https://lists.x.org/archives/xorg-announce/2025-December/003648.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/igt-gpu-tools/igt-gpu-tools.hash | 6 +++---
 package/igt-gpu-tools/igt-gpu-tools.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/igt-gpu-tools/igt-gpu-tools.hash b/package/igt-gpu-tools/igt-gpu-tools.hash
index fb4b702549..b1899cd986 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.hash
+++ b/package/igt-gpu-tools/igt-gpu-tools.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-September/003631.html
-sha256  88178558b352a5e8a287954cb2eef05d775aedfacf43b88251509ea014b6182d  igt-gpu-tools-2.2.tar.xz
-sha512  20032b90e397ca73f9f8f5b453034fffc09e28372adddebd1a71b1323235e3e379bf452d5a4dd76b895e4c47df67595051c16b8a1488249e5aae946f6a35258c  igt-gpu-tools-2.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003648.html
+sha256  429f2578fb16cff7402e9beb325c5c267ad30a2b7b957343c77e8ea24af03887  igt-gpu-tools-2.3.tar.xz
+sha512  669e5f124c1177ed58c43b8b9b945f6436fc37b1162b16bbd1db78c5e170c68be98cc3b08b5ecb438d1313722fee2ab8bba8ca86a971443401c2acc3f3ec68ff  igt-gpu-tools-2.3.tar.xz
 
 # Hash for license file:
 sha256  1b7e266857b05808660f42369a4a797459d7b7bec7245e378aa28a8db2f213da  COPYING
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index bb43f8fe9b..85ed999ed4 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGT_GPU_TOOLS_VERSION = 2.2
+IGT_GPU_TOOLS_VERSION = 2.3
 IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.xz
 IGT_GPU_TOOLS_SITE = https://www.x.org/releases/individual/app
 IGT_GPU_TOOLS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
