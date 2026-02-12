Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A09EB4901
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 11:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1956740B01;
	Thu, 12 Feb 2026 11:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnqbLFnRC6Ko; Thu, 12 Feb 2026 11:10:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3963340B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770894635;
	bh=8eGojsL4WMLVdvTaRhQhtOe42Ejd1TVxNVyI/W0oLuU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V5f9MNZqBl5oFHEWWEQdEyX+Hu/n4S8sknsE+Y9wGz+4B4pzuxnfwD1lD7bk4Ds73
	 zUjBjlLUKVg/SJtwPm1HAms0Z4TL98ENADon25aQaRbh2OG7gqpOUg+684Pt6r0ZeN
	 oG0KmWsb6K4CUQab0aK0SaFgDwcdGdfv3hQma9PwYYnAN06TUb9kAkljoH2tpepLq9
	 JV3QrKc40K2w4J3dHqXb2EK+XSEO3SyFD+eypwJVDKjJYp+8K60NGEuzbGoOgOBqT+
	 AN0u2BZ/1JuT8YVhnvKxieZaWPxS5xEWh6QLpmYlx4nLy8OUxpTZD70zKv75UdmTPV
	 RgOoCCzH17tEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3963340B3E;
	Thu, 12 Feb 2026 11:10:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E6BFBE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 11:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BF6960DB0
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 11:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2DZQb2N6M0o for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 11:10:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 264E960BCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 264E960BCE
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 264E960BCE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 11:10:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F3A31814B9; Thu, 12 Feb 2026 12:10:30 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 12:10:13 +0100
Message-ID: <20260212111019.4129325-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770894630; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=3i7bQjCtwVVk/YhvtBh90RPVkE9pEpxCPiZfMzxFAEM=;
 b=MZl6ZPXRAkwtiDWi0zRdHkS4I9WlDOKdJT9ikJpPCgPLrLopMR8FdZQyD42X4wg1flNIwm
 k0pgyqkX1WqZyQ8lumePtDJhdFr4RJQr9XB2zVl4R5YE5NDEXquhInY+W0jIVTXMZh8Lnz
 jMkwmnEwdOsTgCNMza7qLzSwbPZkj0Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=MZl6ZPXR
Subject: [Buildroot] [PATCH 1/2] package/libabseil-cpp: bump to version
 20260107.1
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/abseil/abseil-cpp/releases/tag/20260107.1
https://github.com/abseil/abseil-cpp/releases/tag/20260107.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libabseil-cpp/libabseil-cpp.hash | 2 +-
 package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index e1b8763e2a..2c3e702743 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1692f77d1739bacf3f94337188b78583cf09bab7e420d2dc6c5605a4f86785a1  libabseil-cpp-20250814.1.tar.gz
+sha256  4314e2a7cbac89cac25a2f2322870f343d81579756ceff7f431803c2c9090195  libabseil-cpp-20260107.1.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index fe97c1c2f3..2fdccee280 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20250814.1
+LIBABSEIL_CPP_VERSION = 20260107.1
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
