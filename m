Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8D4C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9631A40FC6;
	Tue, 22 Jul 2025 17:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Li7DtBrGQ0sO; Tue, 22 Jul 2025 17:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB86D4154F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB86D4154F;
	Tue, 22 Jul 2025 17:34:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ABD7DCD
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E38F60B3F
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZjgvjz5G8Vq for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:34:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=208.88.110.44;
 helo=mail.savoirfairelinux.com;
 envelope-from=serosh.deljam@savoirfairelinux.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E580C60AE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E580C60AE1
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E580C60AE1
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 0A2C43D85870
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 13:34:54 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 56vT1pvS5mQF; Tue, 22 Jul 2025 13:34:53 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 7F6763D875A3;
 Tue, 22 Jul 2025 13:34:53 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 7F6763D875A3
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Fd7oJOqLc0kS; Tue, 22 Jul 2025 13:34:53 -0400 (EDT)
Received: from sdeljam-pc.mtl.sfl (unknown [192.168.51.254])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 607743D85870;
 Tue, 22 Jul 2025 13:34:53 -0400 (EDT)
From: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
To: buildroot@buildroot.org
Cc: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
Date: Tue, 22 Jul 2025 13:34:52 -0400
Message-ID: <20250722173452.546013-1-serosh.deljam@savoirfairelinux.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1753205693; bh=5+ne9NbolQsv3Hr9GXhJ9n92W/qcr3/N8MeP66VC6Xs=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=D76pRa1yLCPEhH9z4u+wwAk0jS2sXAMIbq//l2ECkHS8odAfZVRMa5ejuR9wJGVWU
 L8UrYpHvxdcCNn8AcSxXxHX7/ZKsqb8wzMMHnS+CWw65QOHkb/wlVe0yz2Xy7bRs2C
 8pTLPKV+NGRnSDeIpLuWTia0CmPi+7XxSoQMJ5arpNmlcnAxCsnw8fMLxsKz6tcOPO
 d4b1hxq4wcjStwoj0wUAW4zrcKVq/gPneXUF2WkRB6yjN8a7xUz4ypvZ3UCNkbbX+e
 B6oVQo74ctKf4zhRZgKwqZ/XYOM/ImAT7ZjXRZmo1Q3U9ziDvkStlO2lsP5SjySG3q
 qPVfBXgZpQ1jg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=savoirfairelinux.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=D76pRa1y
Subject: [Buildroot] [PATCH 1/1] package/cukinia: bump to version 0.8.0
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

Signed-off-by: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
---
 package/cukinia/cukinia.hash | 3 +--
 package/cukinia/cukinia.mk   | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/cukinia/cukinia.hash b/package/cukinia/cukinia.hash
index 6e76a6ab88..cc0393aff9 100644
--- a/package/cukinia/cukinia.hash
+++ b/package/cukinia/cukinia.hash
@@ -1,4 +1,3 @@
 # locally computed
-sha256  79dc77c7b9f2784e7d22d961dd2c4ad9c78deebbc6e8f39df4fa214118682b40  cukinia-0.6.0.tar.gz
+sha256  8f608571354d87f7ec2949bd335c616881c05f66fc60d7a2fc7488369c9d307d  cukinia-0.8.0.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPLv3
diff --git a/package/cukinia/cukinia.mk b/package/cukinia/cukinia.mk
index 798c199b67..a4e3658ede 100644
--- a/package/cukinia/cukinia.mk
+++ b/package/cukinia/cukinia.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-CUKINIA_VERSION = 0.6.0
+CUKINIA_VERSION = 0.8.0
 CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,v$(CUKINIA_VERSION))
-CUKINIA_LICENSE = Apache-2.0 or GPL-3.0
-CUKINIA_LICENSE_FILES = LICENSE LICENSE.GPLv3
+CUKINIA_LICENSE = Apache-2.0
+CUKINIA_LICENSE_FILES = LICENSE
 
 define CUKINIA_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/cukinia $(TARGET_DIR)/usr/bin/cukinia
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
