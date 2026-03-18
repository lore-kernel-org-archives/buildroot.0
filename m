Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6C510854DB
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 09:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB72B40A52;
	Wed, 18 Mar 2026 09:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOY20U3bogey; Wed, 18 Mar 2026 09:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 004D340C1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773826129;
	bh=a+SRflKBIheTixwNgJfTfF4RG09XerMULqSC6vAXMGA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z+1jsQvrEWEkjBA+QEtNVSz0eaU/1hvAZRPLdOAKUWVvjS6iPKE3W2Ua8lXFDJ7KZ
	 IotymB4cHQvxe5zXLZ+BHw4EWBMFrkREjOVoa9+byEk62mU5zDvyfsJf37WQMJWW/b
	 26QtN5frCf63HR19W5mhy3dob/+q7tFMcWk7e6/o5mFmY6wPlM/bKPR78T1zk0M1v6
	 ryZ9ZOlSx8/QBGK0kbyVM4wN+58xaPaFeEp+YOXByyNhiRjZruCCBSfw4/UI05/L1J
	 DeR048TvHanwBOxJoBZqMkjZ6UwPZSur3kEIjg/kaOGg13Ug7SaE+GP8IysM1THam6
	 NrClZbyRDhuYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 004D340C1B;
	Wed, 18 Mar 2026 09:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40B271BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 09:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26D7D608EA
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 09:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MIQZnGOKsI9 for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 09:28:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:102:465::206; helo=mout-b-206.mailbox.org;
 envelope-from=manuel.diener@oss.othermo.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E7A3608FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E7A3608FB
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org
 [IPv6:2001:67c:2050:102:465::206])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E7A3608FB
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 09:28:44 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4fbNmj6yT1z9xmk;
 Wed, 18 Mar 2026 10:28:37 +0100 (CET)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Date: Wed, 18 Mar 2026 10:27:08 +0100
Message-ID: <20260318092709.987316-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1773826118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VrD2CTJiyuSisEbyLGIGDSLOKPB2puL6gz/r1+DuHl0=;
 b=adWPKhedpsvJ6+I8TvENmAmvm7zWwIJPuaLWzUC+S8NIUScgRH8LvzH8GHwK65K5HKQxoR
 DaBTbnbpn5H+3CDY/rJga6o04IZD2XaRmZ0LTosjREshTsF/vWzUjNFc4v0Bxlb0o534Ko
 XWiWC6IkS6+u8kPzWgo0/kybrbNvYL03h15VZJe/M0KHuITlfZ0Xk4A6YISLzcWuguvMwy
 xQo8nKZfJuPAvgfzB8P684efJBMmMKkqsLDmqn6TsCix7RvpQXlm3L5OKABYmwgOhulpG+
 Vrvi55uJD/mZrxyp+/3k3NUysx7qF5S6ZQbvcOLVe/+nhVC6xfn6QZXUyirjMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=adWPKhed
Subject: [Buildroot] [PATCH] package/uboot-tools: bump to version 2026.01
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

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/uboot-tools/uboot-tools.hash | 2 +-
 package/uboot-tools/uboot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 7b71e2d948..39b894fe9a 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 1135fb9c03..fa0b6aba78 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2025.10
+UBOOT_TOOLS_VERSION = 2026.01
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = https://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
