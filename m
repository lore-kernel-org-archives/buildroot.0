Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F2AC28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 19:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17CF440DD1;
	Sun, 23 Mar 2025 19:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V56npgvCxUsi; Sun, 23 Mar 2025 19:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 318E640DC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 318E640DC2;
	Sun, 23 Mar 2025 19:04:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19E5E1C9
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00B69606D5
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94b4yMh8f7nA for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 19:03:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2B9560699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2B9560699
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2B9560699
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:03:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c591.dip0.t-ipconnect.de [79.214.197.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3171BA4C35DF;
 Sun, 23 Mar 2025 20:03:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33098)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1twQbv-00000000063-2Iye;
 Sun, 23 Mar 2025 19:03:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mauro Condarelli <mc5686@mclink.it>
Date: Sun, 23 Mar 2025 20:03:51 +0100
Message-Id: <20250323190351.3335904-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742756633;
 bh=Epxfq9eOAug6llWWC8Q68B+f7azSmiGiLWe0qN6KTtw=;
 h=From:To:Cc:Subject:Date:From;
 b=SzKw9PCu7Tpd5iy1m6QK7njdbbF71B9bFmiuwI4ZGrbPFMuY+MLG90mtjss3APfpq
 SbQDVVMsZIkjUXFNmI/OvTvSOgRUV8Z8n7EEbtJQEiZYrV4sF+bax/bnveCwbZFa0V
 GbnJH8Dn10qNZEBRD3GcPi4Srum//7lWrtjjMHZ2lZa4+sqNIEEAXYbjDrm3phzr59
 37tZr4BexiD2pxWXr3Jq55AMc0VEFUysdrtAhHn5/edCWUVDhbUi/8KPEWM49n8o7y
 JbaVBlAunUVOt91HIXPlfvVMJWwXiojEfUkgsWwXZodtcJEY48v4vfpHnwJ/UT6B6p
 aSoTQsAxKXD9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=SzKw9PCu
Subject: [Buildroot] [PATCH 1/1] package/mc: bump version to 4.8.33
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

Changelog: https://github.com/MidnightCommander/mc/blob/master/doc/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 01c0f61b44..09fdcd24a5 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.32.sha256
-sha256  4ddc83d1ede9af2363b3eab987f54b87cf6619324110ce2d3a0e70944d1359fe  mc-4.8.32.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.33.sha256
+sha256  cae149d42f844e5185d8c81d7db3913a8fa214c65f852200a9d896b468af164c  mc-4.8.33.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index b7e7e107c7..9401b8a191 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.32
+MC_VERSION = 4.8.33
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
