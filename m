Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5E8CAC58E
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 13:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E34E2411FE;
	Tue,  9 Sep 2025 13:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiWRoa67Bmm1; Tue,  9 Sep 2025 13:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F204120A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F204120A;
	Tue,  9 Sep 2025 13:00:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB275186
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A172F61450
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gf63H9z2BUXO for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 13:00:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B235F61426
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B235F61426
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B235F61426
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E2B4B4E40C71
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B7CC160630
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 514C1102F289A; 
 Tue,  9 Sep 2025 14:59:59 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  9 Sep 2025 14:08:14 +0200
Message-ID: <20250909120822.1069595-10-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
References: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757422799; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=yI7X60znXcRRF8SqTrOnFO86ALgw4JqOSKBkVv35uBQ=;
 b=hIB7BzjCbxH7V8q6ooTs02ORo9eSFMBFjfz9jHDFmo/qfud+pcgrK2DdAWPhYXAd8tq8Bd
 KyUi6XuCln8Pz6269+t1Zh43MNtaNzvjrlJCjxoDktS67M5Kyj8rWPHFmEq/AOvUTP+49R
 5z02AjOLYi7W/uVroz7ABpBmjJCO+a4nTV+SGPrX+YNGQuh+Y+D928uvZUyYFnv+jTWtst
 kwHcEZAkYkaiu1r153nNWbgurX2CRPWbRhsAYTTIhfD4ZWOuRAIfdy6DuiPeGpMAzNYl0o
 7AeK//nkzg0Z2J9T0qzH0WpVuvcuBOk5V15U3joN0z6mwsHl2FDOolATjlbwJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=hIB7BzjC
Subject: [Buildroot] [PATCH 09/11] package/restorecond: bump to version 3.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
https://github.com/SELinuxProject/selinux/releases/download/3.9/RELEASE-3.9.txt

No notable changes related to restorecond.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index 2a55edc313..dcfbd54617 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  164fe4825a9c65f3dd664f68fe252e67df72d4ea817a90d8f62ae0544bfb8ba2  restorecond-3.8.1.tar.gz
+sha256  d57b6ffe7eafd01af58e5efa50f8522eca73c0b3cb2955ca3f33397ba074a1a7  restorecond-3.9.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index f2618c20b3..e8f432c88d 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.8.1
+RESTORECOND_VERSION = 3.9
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
