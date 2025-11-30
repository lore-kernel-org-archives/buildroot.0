Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2B9D111A8
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 11:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 339C240AAA;
	Sun, 30 Nov 2025 11:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8D2xqVAxfUsG; Sun, 30 Nov 2025 11:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 576B340AAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 576B340AAD;
	Sun, 30 Nov 2025 11:57:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66C4A351
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EA57607A5
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duyLlveM-HjI for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 11:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 888A8606F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 888A8606F0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 888A8606F0
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 11:57:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b593.dip0.t-ipconnect.de [84.161.181.147])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F3D7A4C77A9;
 Sun, 30 Nov 2025 12:57:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42664)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPg3p-000000004ET-47Gk;
 Sun, 30 Nov 2025 11:57:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 30 Nov 2025 12:57:49 +0100
Message-ID: <20251130115749.3010712-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764503870;
 bh=AO08bM0zU6ZEEGMtZ/I9QJixnV74OtJX2PSmiWJj6Cc=;
 h=From:To:Cc:Subject:Date:From;
 b=yh2EicvMJBgIT0iXBZGSyhrFY10f0GXMK0nUuUSdAxCDVw3ePsoJAAs8mkUVHaRKM
 p+3Qyn+fhNdwK8I7qTIH5zX8GZP/CUiPkV9ft/MjAHe169R3OSEAZywAOrDa+RzRiN
 epzg5MqSELVb6UyNwQScnfPZcnZepaVH5ntGoIwy52JJF13zyS676gBX0w0eR0nyWu
 /cXSbcpvKHlB62iwMzjLPQiZh+w2ur+9aTorlta9mjMlql1VglnLXsP0+Irn4hV0E6
 qdSTGjXHKTWj2XELl62ouBMDtH6sVZncQFl+3gsgRicbYD7PHAQm6aRFyxrw4ilAEg
 sD7XJPhMUSrrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=yh2EicvM
Subject: [Buildroot] [PATCH 1/1] package/json-c: fix cmake 4 compatibility
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

Fixes:
https://autobuild.buildroot.net/results/dcf/dcf72922750a830901279e8eb8fc2def95d35e01/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Allow-build-with-cmake-4.0.0.patch   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/json-c/0001-Allow-build-with-cmake-4.0.0.patch

diff --git a/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch b/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
new file mode 100644
index 0000000000..c9c957885f
--- /dev/null
+++ b/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
@@ -0,0 +1,25 @@
+From 42864e12b0d7af01b1cf989d6da9e9a4477775a1 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 23:14:48 +1100
+Subject: [PATCH] Allow build with cmake 4.0.0
+
+Update the min version to match parent CMakeLists.txt 3.9...3.12
+
+Upstream: https://github.com/json-c/json-c/commit/42864e12b0d7af01b1cf989d6da9e9a4477775a1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ apps/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/apps/CMakeLists.txt b/apps/CMakeLists.txt
+index f7c9dec633..ef2271d131 100644
+--- a/apps/CMakeLists.txt
++++ b/apps/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ 
+-cmake_minimum_required(VERSION 2.8)  # see ../CMakeLists.txt for why 2.8
++cmake_minimum_required(VERSION 3.9...3.12)
+ 
+ if(POLICY CMP0075)
+     cmake_policy(SET CMP0075 NEW)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
