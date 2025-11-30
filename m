Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8919CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 13:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B9180C4E;
	Sun, 30 Nov 2025 13:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xmeeITVjxUC; Sun, 30 Nov 2025 13:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F55680C50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F55680C50;
	Sun, 30 Nov 2025 13:14:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FD9A351
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 13:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6352E40106
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 13:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNkE0zFm7H-q for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 13:14:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87D5F400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87D5F400A0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87D5F400A0
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 13:14:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b593.dip0.t-ipconnect.de [84.161.181.147])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3DAE8A4C7715;
 Sun, 30 Nov 2025 14:14:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49946)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPhGQ-000000000o2-3qQq;
 Sun, 30 Nov 2025 13:14:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun, 30 Nov 2025 14:14:54 +0100
Message-ID: <20251130131454.3040498-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764508495;
 bh=CgMZIYQSUHnMQIVX28zzFzi5DRAJ2/ua/wPN+Em9+V0=;
 h=From:To:Cc:Subject:Date:From;
 b=ZoK2efnzpEEdbX5MnleuQNLWs+YjzBAaVaDIs37cuWT/RPZg7zm7L3Y094WwKp1Yu
 reRxpr7j23K/syJI96tHmS4uU0kf0qIIA+zgBi/ced9MmwiOFFFuIIsnqmyHc1uNpi
 msjhJmba2bRYmgv2bK6fXGxHuYTnrvfJJ+yCvR/RQcQ0kv2EQ7IAN+wML20VVUBe1q
 38I4AVESL4AwWI7vduqW1/4eBq+p7NZsy/UwJoRerC4nl7hrU9OiJdK0b3SfHCiHjF
 ARAxcyeQ+iU3PbxwMXVpKUMrHZM/ujMMijaxbyTgN1xzzlVoyBVZQii3dElR0aHrIH
 9DGr1GetmX3FQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ZoK2efnz
Subject: [Buildroot] [PATCH/next 1/1] package/nanomsg: bump version to 1.2.2
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
https://github.com/nanomsg/nanomsg/releases/tag/1.2.1
https://github.com/nanomsg/nanomsg/releases/tag/1.2.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/nanomsg/nanomsg.hash | 2 +-
 package/nanomsg/nanomsg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nanomsg/nanomsg.hash b/package/nanomsg/nanomsg.hash
index abf117a572..e49a42130e 100644
--- a/package/nanomsg/nanomsg.hash
+++ b/package/nanomsg/nanomsg.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  6ef7282e833df6a364f3617692ef21e59d5c4878acea4f2d7d36e21c8858de67  nanomsg-1.2.tar.gz
+sha256  3ffeafa9335245a23a99827e8d389bfce5100610f44ebbe4bfaf47e8192d5939  nanomsg-1.2.2.tar.gz
 
 # Hash for license file:
 sha256  4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a  COPYING
diff --git a/package/nanomsg/nanomsg.mk b/package/nanomsg/nanomsg.mk
index e5c576ef2c..25628a87ec 100644
--- a/package/nanomsg/nanomsg.mk
+++ b/package/nanomsg/nanomsg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANOMSG_VERSION = 1.2
+NANOMSG_VERSION = 1.2.2
 NANOMSG_SITE = $(call github,nanomsg,nanomsg,$(NANOMSG_VERSION))
 NANOMSG_INSTALL_STAGING = YES
 NANOMSG_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
