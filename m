Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1709C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 13:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 820F781970;
	Sun, 24 Mar 2024 13:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSGprGfG6kw7; Sun, 24 Mar 2024 13:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8710C81D35
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8710C81D35;
	Sun, 24 Mar 2024 13:07:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92A0C1BF861
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FC2D40184
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRojgu_yKQQU for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 13:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63A49400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63A49400E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63A49400E4
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 13:07:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72439A4C2FAB;
 Sun, 24 Mar 2024 14:07:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49344)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1roNZJ-000000005iJ-3N7Q;
 Sun, 24 Mar 2024 13:07:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 14:07:18 +0100
Message-Id: <20240324130721.29945-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240324130721.29945-1-bernd@kuhls.net>
References: <20240324130721.29945-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711285642;
 bh=2N6k9fud7w67N66UwM9bxfgeH97SEYRuTVfjyc85RJg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DOJNcDc8Ht7VjRc0PatilpWb/3fRTWZZCemhNoa8vVUjwUq6XlsQUrVo7CSP+9Umd
 NQ9i9k3OFv8MXsapn8UynhTmFhivVsqgLEJ7w23sr6yWTXbG9aFUJ5w8GvbxUF2EvB
 UAhgNYY6vufG+062/pc0TRSdHZwtjozf2cSABJRUrtaclio41z8JroUghy2S1eXHlQ
 uIz3FsjtkUtHGy0SdKGsYokUqv21LMgOeJD/zWr0byKcS5CTk7SLztqvsDI9Gxk9gf
 Ndf6DQba5wz5s97Qowi+5L+MC9LOyqiO8HGQbOhHRU7LdtKBLhbN3VSJ5PtdZmzcAN
 rcjrkxWFL14bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=DOJNcDc8
Subject: [Buildroot] [PATCH 2/5] package/intel-mediadriver: bump version to
 24.1.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 4b410fb961..6bc9549c11 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7ea727b3e2890cf8f50307a3910664209bcbae1ce0d3d8f81bb9f522b0f66d59  intel-media-24.1.4.tar.gz
+sha256  e23ea37c98d8d4b9d1a3a134b6489256d8f5a7a4ee71967b1db8ade70052654f  intel-media-24.1.5.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 814175867f..160d4e0454 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.1.4
+INTEL_MEDIADRIVER_VERSION = 24.1.5
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
