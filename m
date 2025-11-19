Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2E9CF6482
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 21:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C034060784;
	Wed, 19 Nov 2025 21:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kwf17oxhreiL; Wed, 19 Nov 2025 21:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBC6C6086A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBC6C6086A;
	Wed, 19 Nov 2025 21:54:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25DDD37D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CB264115A
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdX9CvSSX_0n for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 21:54:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F24541149
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F24541149
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F24541149
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:54:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca64.dip0.t-ipconnect.de [79.214.202.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51326A4C72BD;
 Wed, 19 Nov 2025 22:54:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57194)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vLq84-000000000G7-3Ptr;
 Wed, 19 Nov 2025 21:54:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 19 Nov 2025 22:54:20 +0100
Message-ID: <20251119215420.3354837-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763589261;
 bh=PCy0EHrY3hi6LWRYNwBMNiHcu2zDx2yQ8uO7eH9zhHg=;
 h=From:To:Cc:Subject:Date:From;
 b=ua6559ddcGtmwoPdRFK8++SeO9Zf7v7FIuKz2RPUKzcc5V0d9aprEkuL3bn4ae4w5
 SnnDbLWPki7d9apApeRqq5jzDcwXEqJu4xyC1AJWm875fTa0qLgZOhhWmNUPbKITsY
 AsJiL5ok9QpzmcrzJBK4aT270ZJtCXQh3uboDEd+amECSm+OxSqDQg00C4wKtCGXHJ
 VoDmaDwFaaJoLSus0N262tSIdqYMRbwQhiqGQRXax4qA6usRjLfBbyl/9cWhB6EdcC
 gGBYd65AjIXFYOxL9EDPYpDTC3ASMSeHktHlGtivXe/euw3sAa+fJd08UF7uJNgtZG
 rkAioj1oZIV9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=ua6559dd
Subject: [Buildroot] [PATCH 1/1] package/mender-artifact: bump version to
 4.2.0
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
https://github.com/mendersoftware/mender-artifact/releases/tag/4.2.0

https://github.com/mendersoftware/mender-artifact/releases/tag/4.1.1
(mentions CVE-2025-22868 as fixed, but this is a host-only package)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mender-artifact/mender-artifact.hash | 2 +-
 package/mender-artifact/mender-artifact.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 914c210b77..19f650046a 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d82cd2f802033d53f2e947ed8d9d6cdd7a036fadbd92a2696b72122bd2070039  mender-artifact-4.1.0-go2.tar.gz
+sha256  14ba008df9b24321de72821de394bc4326e4dd9e17ed7c111340689e90d8b596  mender-artifact-4.2.0-go2.tar.gz
 sha256  a99c495576ecc6d6e137e471c515d38757179240ff6cc41bd481e29d3504f334  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 7d6f0929e2..609ce05c5a 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 4.1.0
+HOST_MENDER_ARTIFACT_VERSION = 4.2.0
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, MPL-2.0
 # Vendor license paths generated with:
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
