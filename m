Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B989FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 06:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF2B60736;
	Sun,  3 May 2026 06:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IzSb63q1lkZ; Sun,  3 May 2026 06:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D5060E16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777788982;
	bh=E8wOR05NjKtBsTWnCvoHclvF/zD2a016kO/o6H2YGxQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Czr7q8UU/VzQQtl76KhR3cdSUek9O585AfktzZe2Yf2x6YydFKrDkDexfmqQNO7xX
	 +Kn9k4U4YRUwc3qljKPRLY7DOBEgs2dRbhmu5+V0pxnZjZ9VUgxXSwgCSGolMIUvi1
	 YBWKla1mZM44UOn4cI/eXW3VEWZ+ebDV1qN7uTiArqK0K0eLv9xGus4mUFcRspHynx
	 M/mbP0KiblgS4fwUT86CuKJVVjary61KRuyDqYLd4bPwjBiXQXztKFUEpHKVHnRWPA
	 JY8l0gm+Ys/p5oXiIALcO/W8WX5WTQ+ldUzBJgQnIuXGZgeecJQGsfpFDTtwhcIV54
	 fckUFfNj3cIZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32D5060E16;
	Sun,  3 May 2026 06:16:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2369E190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 06:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08CB4817FD
 for <buildroot@buildroot.org>; Sun,  3 May 2026 06:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcmvlWvz60Ni for <buildroot@buildroot.org>;
 Sun,  3 May 2026 06:16:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C319817E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C319817E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C319817E4
 for <buildroot@buildroot.org>; Sun,  3 May 2026 06:16:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E784A4C0282
 for <buildroot@buildroot.org>; Sun,  3 May 2026 08:16:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56372)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wJQ7m-000000004Jt-1iFb
 for buildroot@buildroot.org; Sun, 03 May 2026 06:16:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  3 May 2026 08:16:17 +0200
Message-ID: <20260503061617.615268-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777788978;
 bh=KHaR8zoihitm4iojNoezMJNR4pYUkNm0QytLDtM6SEU=;
 h=From:To:Subject:Date:From;
 b=XNOKyj1hYDB+oKAXcs8RVtk7uEI7D4+TCVr+QAlp3UTAaJEbjGeUdN4Giq6d/wd1M
 mSqE5ePWg6EY6BfYGy5K5wG5aLpSMfue6yyLna6/IAnKf6AXQK+yzcH6t43OH8/ODu
 x9n8Tv6b9prFoBx4hzubsZ7Qpfnxq4UVa6JTkRxDlzs18E3hJM/zorzKNUw0qP3CzC
 nsE1lydr0TS0iU29I+Ngc0rsvSITa1NZroQR/tTUu+n94FsbXluAa49sT2USKcN9e8
 kKeYDEpU3/VVQk3d8S8YTYveq2zsdWbkLg9cjopcPwIaCNQBb+MkZB1pINXloblbGM
 DR2xj1HiG/5ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XNOKyj1h
Subject: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: bump version
 to 22.1.2
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

https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v22.1.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 1f2886ec6c..59edb3f70d 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  83e7007b8b9b5536b30991661738a98e9cd607d4a203e9342b628aaea5ea32d7  spirv-llvm-translator-22.1.1.tar.gz
+sha256  b37196b1a1a60282a24cf937ab7d6807d7d54dc718f2a37a78e211be26df57ac  spirv-llvm-translator-22.1.2.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 0f5fbb814e..2d8170fc80 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.1
+SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.2
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
