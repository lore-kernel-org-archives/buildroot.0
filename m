Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA354C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 13:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DC2D6070D;
	Sun,  1 Jun 2025 13:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BN7QaL2fVpg; Sun,  1 Jun 2025 13:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCAFF60AC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCAFF60AC4;
	Sun,  1 Jun 2025 13:32:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FEAC222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8198E40455
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdKXvkwH4WCA for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 13:32:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7815C40457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7815C40457
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7815C40457
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:32:22 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id B941FE001A3;
 Sun,  1 Jun 2025 15:32:19 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>, Florian Larysch <fl@n621.de>
Date: Sun,  1 Jun 2025 15:32:18 +0200
Message-ID: <20250601133219.4675-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748784739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UdGuvA5sBf24YxCQy8AKMRI/MlNxu7XYh+m3AzUHlDc=;
 b=BAhYDnPr7XpRjdXzAaW3h3vgQUjDPbWdrPyEQilsUCObmRJ2QzflzHvGTYuE2SCkE8wZ0X
 p5yDfEqpya876q0SWJKut5KY3FS/e7FRggTo+VDw+uqJZuJb0gPzG8kaCjTOtXkdkzUXl2
 d8MJIOBxhavCwucebbInkBz/pjLFd2Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=BAhYDnPr
Subject: [Buildroot] [PATCH 1/1] package/easyframes: fix CMake 4.0
 compatibility
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

Import the cmake_minimum_required bump from the upstream master branch.

Fixes: https://autobuild.buildroot.org/results/3fe/3fe0973cad67641d880c460a1fef859443e8a10b

Signed-off-by: Florian Larysch <fl@n621.de>
---
 .../easyframes/0001-bump-cmake-version.patch  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/easyframes/0001-bump-cmake-version.patch

diff --git a/package/easyframes/0001-bump-cmake-version.patch b/package/easyframes/0001-bump-cmake-version.patch
new file mode 100644
index 0000000000..74e952b709
--- /dev/null
+++ b/package/easyframes/0001-bump-cmake-version.patch
@@ -0,0 +1,25 @@
+From 5da394897e9ed188310ca838f5f9112687b7bbe9 Mon Sep 17 00:00:00 2001
+From: "Allan W. Nielsen" <allan.nielsen@microchip.com>
+Date: Tue, 12 Sep 2023 20:07:07 +0200
+Subject: [PATCH] EF: Bump cmake version
+
+Review-record: https://bitbucket.microchip.com/projects/UNGE/repos/sw-lmstax-labs/pull-requests/679
+
+Upstream: https://github.com/microchip-ung/easyframes/commit/5da394897e9ed188310ca838f5f9112687b7bbe9
+
+[Github diff munged slightly to avoid including the UTF-8 BOM]
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cf7bad1..e489537 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,4 +2,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.20)
+ 
+ option(TEST_ENABLE "Enable tests" off)
+ 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
