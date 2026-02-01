Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54543E65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 18:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2333A611A5;
	Sun,  1 Feb 2026 18:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbzlNTNODHB6; Sun,  1 Feb 2026 18:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3601060E6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769971244;
	bh=NHJXxuTHmZnzGddxOAye+zml9Tm4Rgz732b0k9UPunU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ad0uZgjrt51LvYx4fERenPgomCDmkF+uwcMjPFHkU0OqvZFT/orAzHS9dCtaX2OCB
	 4Fa1pS2J70flPBAh/TJLLF5rjDYVfE78q82/1hJkQGYS2pytjaKmslu9ug51p6543V
	 VGHX3osN+WOQ84q39bXap4mDXZv00yeS1pqgAu0H0oDw87ReoG0knnC99okhKq+zJq
	 20UDzv5VrpXyeXDqhPWYsk4PcHIgNb0OEz5TWE3AJJ5HUE3S1yzD55ynliGOZrTkmB
	 VhTO6D01XJZJC8C+1snBvzQV4Y/BKd7uo8PR5V0cEu3uPZtY3I2zxLmDQR4J4/xijb
	 ZkReW0pZyHGCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3601060E6B;
	Sun,  1 Feb 2026 18:40:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 049F923E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E613F40766
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUJ0MXxPtbfF for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 18:40:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9EAD4075C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9EAD4075C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9EAD4075C
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:40:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8EAFFA4C547A
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 19:40:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55310)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vmcNC-000000007eO-1uOg
 for buildroot@buildroot.org; Sun, 01 Feb 2026 18:40:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Feb 2026 19:40:37 +0100
Message-ID: <20260201184038.3445579-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769971238;
 bh=dhQWC2yrWA9Limp1DlPrzQ9bE0q/V0YUbY0kVhz3XOA=;
 h=From:To:Subject:Date:From;
 b=NGh8bq5hBufG6JCOUkLswqSsHwlE9OUvbbbErDc6AVMZcthltuRh0r8XUGevzx1F1
 9mhc+OwKxHNNyrGSPQoYNYVpPlzKERHyvjVtdzQC43mEeCNBFl7ekNr4CbzlX4NdH5
 zeuvSZdT9LGivLVCTD2FEnkUt8FlGb5XpQYbQhBJqjz7YBzixIOHxLD49mwghv5/tW
 g1DbhnSeWQgmik/d7JbyJWhSe2B7bOYv7NyKepFn0ryWB7uGPaRcdoF0nZNoyuCVxq
 NZ1d7NBUImfYEPhbXUMkqgikQ61P6zszUFsuSLvmLUuqN8aAANTxc2e7Wwe5GgyFam
 U+NEHVgTEvf9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NGh8bq5h
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.1.1
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index a3a61f867f..ca7993be23 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b9bb6177a36c69a44d821062637b4bb69f7751e8a3be354e5402e1abdf93b96a  intel-media-26.1.0.tar.gz
+sha256  c59cbef1de138bcda45b93ad2b7f3db65619756d5c126fb32a30076ba5bb71b0  intel-media-26.1.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 9bca1d8640..cb142d3220 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.1.0
+INTEL_MEDIADRIVER_VERSION = 26.1.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
