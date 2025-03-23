Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE66BC28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 19:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6197580A77;
	Sun, 23 Mar 2025 19:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRKZdiqITgjf; Sun, 23 Mar 2025 19:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BE5F80FA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BE5F80FA1;
	Sun, 23 Mar 2025 19:05:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 091ED1C9
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E345540756
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycvODpgub-gd for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 19:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EFCB40DC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EFCB40DC2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EFCB40DC2
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:05:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c591.dip0.t-ipconnect.de [79.214.197.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3FFD7A4C35DF
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 20:05:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55920)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1twQdD-000000000Wn-3kKY
 for buildroot@buildroot.org; Sun, 23 Mar 2025 19:05:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Mar 2025 20:05:11 +0100
Message-Id: <20250323190511.3336129-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742756712;
 bh=TONNPzNvQPyFx2q1XoaaAxbMwH2gdDMEPptJMeqvHdA=;
 h=From:To:Subject:Date:From;
 b=BvK0fynKPx6/T6n0yBO8ULgMkwVt9L+piAtVOebOaRE3wTiaK3ENY0pnM3ohKFgTg
 SL2ZqPZ5muvsl9Vgcwz3dqCWsP6L2K7Rtb4dLvpYi/bKzMiUvN31AFwY/9foKQ6UHe
 7oBRwKQdWLlEUE9PGKeWPK7jpRDzcynpXZK+1GvKHXXMHjnhldsS2S3Pc0dHLDRAFJ
 H8urj+AiCjltdZGJwWOpqRz7KboCK4OBeuf89EDLnJi7X0Jv651Ue+a98WC3BLCdkP
 GwSeuRrSaKS+q5RJ8ANu0Ab9fb54PVTR/Y+kJOHo5bhn+Rkva90w5DgD8qBxm3loZU
 342/sxeTg4kJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=BvK0fynK
Subject: [Buildroot] [PATCH] package/tinyxml2: security bump version to
 11.0.0
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
https://github.com/leethomason/tinyxml2/releases/tag/10.1.0
https://github.com/leethomason/tinyxml2/releases/tag/11.0.0

Fixes CVE-2024-50615: https://github.com/advisories/GHSA-884x-p7qm-gq3f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tinyxml2/tinyxml2.hash | 2 +-
 package/tinyxml2/tinyxml2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index a131b8624d..6efe202b52 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3bdf15128ba16686e69bce256cc468e76c7b94ff2c7f391cc5ec09e40bff3839  tinyxml2-10.0.0.tar.gz
+sha256  5556deb5081fb246ee92afae73efd943c889cef0cafea92b0b82422d6a18f289  tinyxml2-11.0.0.tar.gz
 sha256  9332252e9b9e46db8285d4a3f0bf25f139bf1dca6781b956d57f2302efca6432  LICENSE.txt
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index 044b8f82db..ab04091753 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 10.0.0
+TINYXML2_VERSION = 11.0.0
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
