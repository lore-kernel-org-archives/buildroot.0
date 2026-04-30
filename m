Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D73CD13DA
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 18:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 163436F4DA;
	Thu, 30 Apr 2026 18:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJ8Z9Rtm7mMq; Thu, 30 Apr 2026 18:56:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E9046F4DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777575400;
	bh=2vKBHHIjQJi5KjspdvJNv0C17Ku90QjOGFfRPJto/OM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oigja4EdllSRE2cPrqwsMzs/ifjwUOLozj8WdUhgtKHGZxPps4yjh9N1paVZOkSJU
	 VRt0BVdAT0FeobMyNzvgSYfEnC8hM0QRWVAoHTfpIuGV+WJ+U9cGmVCyeL1ekRYpJV
	 BUgtRpCWIMcBr5Beq1jKwtOj4hmq5rH0lOVNgQFR6XP2DRc7mAJGFIJ37Co6x7eVV4
	 nLzbimw39vMuVRsUP+qqF6h/rgR2Xe/J+dH62WfcK2feLQ4Tg9WMmfQI8nkmo7jZHF
	 4/TkoZgI7KFJXoFG/1kn1PVfHAThWfvWwbT3xvvulgTUf1d6ViCRh01y6JAvtnSPB0
	 ixcv1FY1XxKmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E9046F4DD;
	Thu, 30 Apr 2026 18:56:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21E65127
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F9B541C26
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6F1NxKXjNJ8p for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 18:56:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4196541BD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4196541BD3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4196541BD3
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:56:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0ED4EA4C11E2
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 20:56:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36606)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIWYu-0000000073H-0gZb
 for buildroot@buildroot.org; Thu, 30 Apr 2026 18:56:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 20:56:35 +0200
Message-ID: <20260430185635.2999959-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777575396;
 bh=2Xo2bfev6Gqe+IJNoipfbLqzC+z49Il9Iq6aBT2f0dg=;
 h=From:To:Subject:Date:From;
 b=Btx7hTcq52oLs427ZyfsQFBfvMU8G/zfFlxB+CJjvsuRQO4nAzEEqHT93+e+e1Ooo
 hlmaTFQHuJMJbAx/XA511sJWkDeiR4IpBJALibFomkC1tkBwIRMnA3nLMAnqlO8NhJ
 jdn6HowtJzouvet9ZKxc5MCNy+zBzSfFJlYx/T1qtdJqThEYgrSasFFXluxbq4XKB7
 uc+HfoCNv0cTjZDhXtPG/rDeUzhN6jP18Sah0lW6Zt2CDADSwg3zD8n/Qx4Dzez6Sm
 wUTZ2FgT9aTSgKDk9iaOZlJ12Ethh2EFqAGnDMACu5YIBGHcRB5CcjXzXh/G+nYWoD
 QRDKvD9HV8Udg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Btx7hTcq
Subject: [Buildroot] [PATCH 1/1] package/thrift: security bump version to
 0.23.0
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

https://github.com/apache/thrift/blob/v0.23.0/CHANGES.md

Fixes the following CVEs:

CVE-2026-41636: https://seclists.org/oss-sec/2026/q2/236
CVE-2026-41607: https://seclists.org/oss-sec/2026/q2/237
CVE-2026-41606: https://seclists.org/oss-sec/2026/q2/238
CVE-2026-41605: https://seclists.org/oss-sec/2026/q2/239
CVE-2026-41604: https://seclists.org/oss-sec/2026/q2/240
CVE-2026-41602: https://seclists.org/oss-sec/2026/q2/241
CVE-2026-41603: https://seclists.org/oss-sec/2026/q2/242
CVE-2025-48431: https://seclists.org/oss-sec/2026/q2/243

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/thrift/thrift.hash | 4 ++--
 package/thrift/thrift.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index a517900c82..ff69f16849 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/thrift/0.22.0/thrift-0.22.0.tar.gz.sha256
-sha256  794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5  thrift-0.22.0.tar.gz
+# From https://downloads.apache.org/thrift/0.23.0/thrift-0.23.0.tar.gz.sha256
+sha256  1859d932d2ae1f13d16c5a196931208c116310a5ff50f2bfd11d3db03be8f46f  thrift-0.23.0.tar.gz
 # License files, locally calculated
 sha256  d315e6cdedc07c478de6992027bfb66f220886c6216fd7e9885ced30c3703646  LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index cee7adb8ed..68b9faa3e4 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.22.0
+THRIFT_VERSION = 0.23.0
 THRIFT_SITE = https://downloads.apache.org/thrift/$(THRIFT_VERSION)
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
