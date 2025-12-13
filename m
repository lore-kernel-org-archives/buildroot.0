Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273A5D5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC983605FC;
	Sat, 13 Dec 2025 11:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkPo6aOPWv2O; Sat, 13 Dec 2025 11:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 144A6606B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765627107;
	bh=RhZdUmWIiYcWSKZxD6SsoSwI2rw/5q/2ySC7OdtEErU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rl7lPXx+QUXqPKe3wdnmB7JvfFjr4F1ajngmSEphrSCUA+3tgoqca2qTjo7B8q3X6
	 T/Qbi7ZCf8i4j2H3pbP0nowcETweFI2ujdJzI19eeljs3/WnnpZHKJ8HN0QwwinQ16
	 wNTTVvWHp4M99gk1EukK4O2aPsHzVrrTqftLzEUsisAJBNOLNR02BhZQfAmzUBaEAl
	 GEuJZEcs1Aa++C1wfSSOhjJAXyaQ6OVwsmBpTipy3nyR+idXsDI17Ke4fehVeCQrHN
	 NI0sAVCJzQIEAXFqwYzGs47kp/BapYe0o37IGUxYbDm5LohOGskRMM0vhLE4YdPF4k
	 3QFqdql4kA1qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 144A6606B1;
	Sat, 13 Dec 2025 11:58:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5489A13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46C9F606B1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otmmiOf4zIPX for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 375F2605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 375F2605FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 375F2605FC
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63FC6A4C377C;
 Sat, 13 Dec 2025 12:58:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55170)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOGI-0000000078u-07EI;
 Sat, 13 Dec 2025 11:58:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 12:58:08 +0100
Message-ID: <20251213115809.1277255-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213115809.1277255-1-bernd@kuhls.net>
References: <20251213115809.1277255-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765627090;
 bh=hUY3p4gH6V+jbfhLZXCZbAyJFETSk/h2BUWjzbC8WVg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ix136PtHxOqMy6hp11nUXXclXieg163ZKoJIGVW3PSA/M1kMqyJ12i/oI9iCjkaUA
 QV1LUYD+0rQO3sxLDBLZ08eJWZnKSBX71k+JPGal1DAAzTijcR34nIVkBnYWsGu3Oz
 w/Qo2S0j2FEd7yRf+nYc5uj/Rf/eHTufzsbNb6UpttgrJk0cDUC6ItpowKEofv7gnz
 sqrGMzg/KVd47b3rOnZyVWdtWj1B3WiiNVlg0lVs+GY8fHprZ+jtmTXJ1TT+c+/rPU
 Wayzaa3wWPzzKW03MW9a3Do1411KIqgu5Icnh2Rs2iTZyeExSP4fTe2mf4A5hZ8Ui9
 zqVluAMTCY+QQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ix136PtH
Subject: [Buildroot] [PATCH 2/3] package/spirv-{headers,
 tools}: bump to version 1.4.335.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/KhronosGroup/SPIRV-Tools/blob/vulkan-sdk-1.4.335.0/CHANGES
https://github.com/KhronosGroup/SPIRV-Headers/releases/tag/vulkan-sdk-1.4.335.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spirv-headers/spirv-headers.hash | 2 +-
 package/spirv-headers/spirv-headers.mk   | 2 +-
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index c62d12a79a..019145f959 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  602364ab7bf404a7f352df7da5c645f1c4558a9c92616f8ee33422b04d5e35b7  spirv-headers-1.4.328.1.tar.gz
+sha256  1c47ca6342ebe86f57b46b8dbeb266fa655a1ca8e10d07e45370ff2d9c36312e  spirv-headers-1.4.335.0.tar.gz
 sha256  ea43b1de38a6f90c488800d66dec1ed671e68cda530266bc96951fb5b6307613  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 9312e96d41..0d0ee949bd 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.4.328.1
+SPIRV_HEADERS_VERSION = 1.4.335.0
 SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index e3652a48cd..cba67d7d8d 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d00dc47df7163c2bacd70f090441e8fad96234f0e3b96c54ee9091a49e627adb  spirv-tools-1.4.328.1.tar.gz
+sha256  8b3d5637061b52675e506ffa1100740031e38bdd96b8177978acfd898a705da2  spirv-tools-1.4.335.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index c71a0f8299..f0e76bb9ad 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.4.328.1
+SPIRV_TOOLS_VERSION = 1.4.335.0
 SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
