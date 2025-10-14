Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268CECCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFF6C40D52;
	Tue, 14 Oct 2025 18:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CnAv7C35fX7; Tue, 14 Oct 2025 18:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125044103D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125044103D;
	Tue, 14 Oct 2025 18:52:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB040294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCA0283E10
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evBzrdIgBm9O for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DAFB883E05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAFB883E05
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAFB883E05
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7E5F7A4C6C38;
 Tue, 14 Oct 2025 20:51:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49012)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8k77-000000003qG-1Z8E;
 Tue, 14 Oct 2025 18:51:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:51:06 +0200
Message-ID: <20251014185113.3583315-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014185113.3583315-1-bernd@kuhls.net>
References: <20251014185113.3583315-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760467874;
 bh=Vw8gNACnUF0t1ZnqxF821mSgLcYRTxp7k6lvMtw2E20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ydiQxKpe2Z+ObQxscq7FRM9QqCVN3jh3Z6wB3z9McxwqkqdGEWWxQ0iQ5GQOe4zfF
 bW59DByOMfdJK1y+G74D9OjnVPrMY6Zg4TSGh46j1R1Vy3imKXzSqJSYn3KuhknFQp
 mvRFheVt9WByiKuqiNOs1hMfx98xz0wC5JBZ1xmG8IE0Rje+zUjScZFmQS0wRrYHsN
 xisIj6zb5sO5HFgCxjrz+8sbcQA9YrSnkc28M2r0vOnodnqrRMFMYu7SoJ4SoU+oHv
 UKzTuWva/pAOeeKZoF/BpWYbb5KH5usPq7rDOP4Wp+oFJa16IF+g3BWGMHc9FhigaM
 rGDlXAG6wykmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=ydiQxKpe
Subject: [Buildroot] [PATCH 07/14] package/python-websockets: bump version
 to 15.0.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 3279977431..13659d2634 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  753a523e3de5b0f32927e590b910dfde  websockets-15.0.tar.gz
-sha256  ca36151289a15b39d8d683fd8b7abbe26fc50be311066c5f8dcf3cb8cee107ab  websockets-15.0.tar.gz
+md5  08f8a430c20d75ffe44faafb95f6f7cc  websockets-15.0.1.tar.gz
+sha256  82544de02076bafba038ce055ee6412d68da13ab47f0c60cab827346de828dee  websockets-15.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index a39c7580ef..cdac2485ab 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 15.0
+PYTHON_WEBSOCKETS_VERSION = 15.0.1
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/2e/7a/8bc4d15af7ff30f7ba34f9a172063bfcee9f5001d7cef04bee800a658f33
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/21/e6/26d09fab466b7ca9c7737474c52be4f76a40301b08362eb2dbc19dcc16c1
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
