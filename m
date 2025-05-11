Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ACBC3ABCB
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 16:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 388E4608FD;
	Sun, 11 May 2025 16:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbexXK_H4-Qj; Sun, 11 May 2025 16:13:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 635FB608D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 635FB608D3;
	Sun, 11 May 2025 16:13:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D608154
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2DD1608ED
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsrRg4ttCm5u for <buildroot@buildroot.org>;
 Sun, 11 May 2025 16:13:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF4A1608C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF4A1608C7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF4A1608C7
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:13:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b54c.dip0.t-ipconnect.de [84.161.181.76])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02456A4C055D
 for <buildroot@buildroot.org>; Sun, 11 May 2025 18:13:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54398)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uE9Id-000000003lk-2yAw
 for buildroot@buildroot.org; Sun, 11 May 2025 16:13:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 May 2025 18:13:12 +0200
Message-Id: <20250511161312.3194997-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1746979993;
 bh=VyI6BY86LjczCnWHoca80Ju4dhjH/QoFs4De3H4xuUo=;
 h=From:To:Subject:Date:From;
 b=SUbZbmHIvM40c/kWaiE5Rj6JZ9YW877ck90p1WXwkVbci0BiSDDLs4o0i+q2GSeQw
 JWr/RbyHiEWQLVkvK7t8l/N6F1Q/yYkVrRQ8n4QyxIHIe5hUvGbYmrIe+WqgLn0OKi
 ZiQDwDPgPaIQYdfAXooP0hVMXafZX8iWqwmissQfAbp/lOQgimKrzfLMwcf19LN54z
 NbTH622rqhARZrgsR1cnRSfaX0K2zQz5ZEcFNPy176gffdIeyRW/S4Ky0PRVQ0Q+a3
 hq/lOeC/KLjRHJyIOJaxtzfDlwRVTT9tIqQs+7tpSaayF9O3pIvAHy7CT9dK/wqIe3
 otnGPh0Z8jtBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=SUbZbmHI
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 10.05.1
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

Release notes: https://ghostscript.readthedocs.io/en/gs10.05.1/News.html

"This release addresses CVEs: CVE-2025-27835, CVE-2025-27832,
 CVE-2025-27831, CVE-2025-27836, CVE-2025-27830, CVE-2025-27833,
 CVE-2025-27837, CVE-2025-27834, CVE-2025-46646"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 8f44c444f1..c434ac1f3a 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10050/SHA512SUMS
-sha512  5a8695726ea2c70fd153bac47696c9e9046e9f74eccf8eea500794f79f09d5d2be70597c9d85c0b51b71d46d7974f50c5c9e3b0e242816bb84e64f1098a306a6  ghostscript-10.05.0.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10051/SHA512SUMS
+sha512  1a3f2b0f53db9a00a245df19ce8fdce0fbccc6fad47b64d14fc9058b494ab07c77e21bb073df8d4a2522b3ccb0df26735f8224a9e36c07367031ed2262fb26af  ghostscript-10.05.1.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 9e2342e5ac..0ddcb950ff 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.05.0
+GHOSTSCRIPT_VERSION = 10.05.1
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
