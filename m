Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8561C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 19:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A1B60FBE;
	Tue, 13 May 2025 19:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnUar8N5hr0o; Tue, 13 May 2025 19:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A3EE60ED9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A3EE60ED9;
	Tue, 13 May 2025 19:54:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A52E7153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9686140637
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-KWAdrzLlqk for <buildroot@buildroot.org>;
 Tue, 13 May 2025 19:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FD7E40193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD7E40193
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FD7E40193
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:54:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a074a.dip0.t-ipconnect.de [91.58.7.74])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54BA6A4C1069
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:54:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37280)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uEvhh-000000004II-3Vy2
 for buildroot@buildroot.org; Tue, 13 May 2025 19:54:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 13 May 2025 21:54:17 +0200
Message-Id: <20250513195417.2730273-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747166058;
 bh=j+ZJVLDIQgiJrQWQiQmjv9uESEbIQvgr/aakZ2kfGPs=;
 h=From:To:Subject:Date:From;
 b=HO0mfsjZqr4CBnf51UGjTzxOu0CBDTsUE88p14SZ03xlr0VycOrsN4m5H7cRM2pTr
 iSISTqg/tUDQnm2WF7mvClPqNj9GdJxe7gDa14wHzeZHHS35AmEqZqkwPw5ImnCU6l
 80Vkx8o3fBUfB3C8bHNK1fLpjttCMwJZTouKaT9+edjcUE8gFPKbvrXPZYzqmUaUYW
 lllPzWDCgIalWw3DFWjLRDE0BfMECFuhJxPE0Tv5SQ+kZEigbU56+bQTW98VKmxSJL
 TKk5Z0YJQCQw5dDn6Oy2PEvaeJVNCvNDG2KRWd3JWZfJaykfdfFpswMyz9xRpKyvj0
 GwCjm5MVhoBmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=HO0mfsjZ
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20250512
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
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20250512

CVE-2025-24495:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01322.html

CVE-2024-28956:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01153.html

CVE-2024-43420:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01247.html

CVE-2025-20103:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01244.html

"Note: INTEL-SA-01244 and INTEL-SA-01247 will be published on May 13th 2025"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 9721a15976..9504f7a786 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1da88b51953c9da2e20b5c94b3d7270cf87ea5babcaa56e3d6a5c9eaf11694b3  intel-microcode-20250211.tar.gz
+sha256  041af7d2f5791a47c1e914abd7d6255de4d4fc61b0f8e49ada6ee7014bcc3614  intel-microcode-20250512.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index db3e690ec7..1fd09e6a6d 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20250211
+INTEL_MICROCODE_VERSION = 20250512
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
