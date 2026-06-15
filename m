Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DCBCD98C5
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 05:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04093408B5;
	Mon, 15 Jun 2026 05:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIcoy8NSSmQz; Mon, 15 Jun 2026 05:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3024036A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781501776;
	bh=IzRxtVCWzzKvFsylCgC+jKPmaeBOMz83Ah3UO4waLlo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jeZ3+ug/pDZFoP2aNG4IW8xgnd9JUk8AUSFsLw0s6zK1cN1pWEpv09ltfi6qRXSQN
	 SAmhy94VAPNw6ikKDIROswVIYM/0TnGmpK9gh6GMTSgwnXjufkLvCd/Uugefme9FtC
	 8kjphDqFl+9PinPcL56nzLakrt+M/k/PyTZRk3Gx6eNFjUNlbJcdkN5I/Ipm1Mx/p4
	 N31FN3V9E0E34pI7Gnvvo8u3O2epkYc8PBAml2awEBg9GNcn/Ejeo05d+kQOtMnCGU
	 3iNcWCJKvmolVrcAv9wvkCS9H7+osvq9fO88KSeDwW4p+UZM/dc4PHO5GS6aADj8k+
	 YDaW6lwqsoOMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF3024036A;
	Mon, 15 Jun 2026 05:36:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E1C92B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 05:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B77140DB0
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 05:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YNJcvqY8j6z for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 05:36:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19E6740D83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19E6740D83
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19E6740D83
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 05:36:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04de.dip0.t-ipconnect.de [91.58.4.222])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6374CA4C2EDF
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 07:35:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33844)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wYzzH-00000000516-3dip
 for buildroot@buildroot.org; Mon, 15 Jun 2026 05:35:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 07:35:54 +0200
Message-ID: <20260615053555.1112644-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781501756;
 bh=WKpwXhXJTCqZPtWEXSHtyQBg2YPq4lYKwSFltnNigzc=;
 h=From:To:Subject:Date:From;
 b=qWGPb0kpNPeBJ9Uh+Jqh1ZvsXvMlACJzL9MKKoAZHWH5OpOPEA1yxDJwAjG7aYZ9t
 iCQcDhuUHh9qwcRac2CPgXLd3GhvRlddK9nA08hpcpWGWUQMP/8VVyC7wPl4y0YSMH
 RFW/hS/AFD0fQDkyFnFIwzzFMiV/uAbVFNPJgnnA/PqpI0GTNXSth5sYXg/Wy9SRa5
 zb6U1+Ugs7ziF2xO2TZlhMnIRiAUU9z7LFdWBt667kQZIIjFtfnb5vRaTkxiEQpUm1
 F4jF2rHrUUTGI9LJfs575KVdo7ueGN7/qnkZHxBm+tUGT7p2n93XkIaWf1rD+WEO2u
 sxgxJ//ht2vwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qWGPb0kp
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.2.2
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.2.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed for the series:
https://gitlab.com/bkuhls/buildroot/-/commits/76453eef54ad48a74e9a80efc05fa023f04bca35

 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index a5d012dc2e..d4ec60476e 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  65bc05de32869ed73bcc6e7275d425987adfff792152565440f45d6b54fe1b9d  intel-media-26.2.1.tar.gz
+sha256  48e7b2f6614041a4710f4f4d191a3dc7dd8b86d43de4ae7aa99ec24c3820f2c0  intel-media-26.2.2.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 2cc7372342..778470ef8e 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.2.1
+INTEL_MEDIADRIVER_VERSION = 26.2.2
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
