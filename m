Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38154C83F17
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D93BD83C5B;
	Thu, 10 Jul 2025 20:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aY1QoYuWGKb; Thu, 10 Jul 2025 20:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02A0A83C5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02A0A83C5E;
	Thu, 10 Jul 2025 20:05:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D69C114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03D2940AF2
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lx88d5YbSuoT for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 20:05:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD12F40111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD12F40111
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD12F40111
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:05:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bbdd.dip0.t-ipconnect.de [84.161.187.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3CED1A4C0258
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 22:05:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34376)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uZxWD-000000007uG-28nI
 for buildroot@buildroot.org; Thu, 10 Jul 2025 20:05:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 22:05:21 +0200
Message-Id: <20250710200521.3666109-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1752177922;
 bh=v1NmvrMOevyzb1xBGSw10HmPemw+L6MhgPvbKYpVJ4E=;
 h=From:To:Subject:Date:From;
 b=ApwTsCDR9LqOobjTAxQmNW5+pkuXlCPIsfPg3UFF258ubhtaOsbPtALBwEr9zkJuf
 nHqUKv8ydliUpbW735obv/HTHaeIKt0zCIpaaiEFixElSr5E0lOTTsc2kk2pLjdNWN
 q1wDtVdyIjwVW1XoM+D0I+2BVVZr/rtzPf9HDscAjg5+BXORhy3urMnmTwnGw5UXkM
 1jNE2gEvERPCd8iM5+oGbzuvxuqbHMWeBr5KfpbRwLUnPFvVyVZ2RDgdzSfXghGQ22
 88Kc4tBv7i4PVAgJNaGPoxoT9Kuy0gZlYztuxTZOCdjFxzmBrPHCE5G5JHX0s5fyV9
 SMhNzPRg550Yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ApwTsCDR
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version to
 2.4.64
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

Fixes CVE-2025-53020, CVE-2025-49812, CVE-2025-49630, CVE-2025-23048,
CVE-2024-47252, CVE-2024-43394, CVE-2024-43204 & CVE-2024-42516.

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.64

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index da0b1f1f17..748be01de7 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.63.tar.bz2.{sha256,sha512}
-sha256  88fc236ab99b2864b248de7d49a008ec2afd7551e64dce8b95f58f32f94c46ab  httpd-2.4.63.tar.bz2
-sha512  a804ca564dfee5907fe4ce4f36884815bace0621bc7b8c9aa7c99472a954aa19cb13733f90678ff3d58ab3c76cc0e33a27e1035dc1d8cb597a9622154c59ef48  httpd-2.4.63.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.64.tar.bz2.{sha256,sha512}
+sha256  120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29  httpd-2.4.64.tar.bz2
+sha512  299cb0d87a7e0e0a99d22bba7349b6b07c69222897410f9670af29896288d1f4e1da81d22ac9e1d8d6ea096e88044ab1dd34555b40a4b1b1cb3fd4b1d1897a7a  httpd-2.4.64.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 14676a5aee..7e9fb522b5 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.63
+APACHE_VERSION = 2.4.64
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://dlcdn.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
