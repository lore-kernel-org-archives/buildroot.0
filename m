Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9E2F47CBA
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 19:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACE9E606E1;
	Thu,  5 Mar 2026 19:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWdXoGiY-G3t; Thu,  5 Mar 2026 19:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C94756072A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772740221;
	bh=uoA/T6Xt5OdNA/eNUmw7pb3I93nWQFDN/V4BIZ/J9CM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=javn5wkSHuQXqULI8HEV4kEzUb3G+WfhXua919SecMIe3hw6swvjhc/QnZiTrvySL
	 ejccrXYsOqeLBvFMDaKU+KbBBviikDngogsGwsZogDnP/fXwwp7RSqMSC7qRtjQvb0
	 R07xPUnss0m/C6kXV0+W9Md7G1pzSaoZ/crmzgsop5kDCZV1K1a6Kkfu+EUWh0o8M0
	 okyOTfvwyCeR005aYEv8yOP9Y2egpIGywzfJU8I6AIiRyU567W2RWXy1n4AJrrYUBR
	 /P1ZRifYG6HjF/3VdiMLbJoZIM6ZRmUq1l7KJToWgKcD2ZlkNC+ivzLWlwTZfRFGLD
	 vBLOocnUOUK6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C94756072A;
	Thu,  5 Mar 2026 19:50:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28F4E223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 19:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6D3E4187D
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 19:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPYAeq1PBWYs for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 19:50:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2E284187E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2E284187E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2E284187E
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 19:50:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F343EA4C33AC;
 Thu,  5 Mar 2026 20:50:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54384)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyEhv-0000000062g-2eAg;
 Thu, 05 Mar 2026 19:50:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Thu,  5 Mar 2026 20:50:00 +0100
Message-ID: <20260305195003.147773-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772740204;
 bh=PCJ/ztasN0GPBv+0zGRG2mnw80ctWJgVf2OuWdPQAPA=;
 h=From:To:Cc:Subject:Date:From;
 b=grRHs1+hSJSwEVrQZjMyYP/v6DC+OdsPb7BgBAM5/YxpAMdMOKNoB3A3uinT2vYZg
 CPGQw3zy8zKvdeEGRw0ua5yws+A6b92USThH3QBcluqg04Xi34RfprmdcXiAUNWxEq
 utjZhn+yltswRpVpqUBFmdcYlJuu0nbteyMzHy7Oik0IhjYnnj7+nV0tXf3nGG0e2F
 zH/VTarfBxxisMqE+gqc84zAqe9zK1NKzrAg6r92wnjiPeJom52vqbFL+tgNSBGKpn
 ZdhreYUHm4cGb1QSQHrSXnCSpqd9w4rg+oJvSAOAyK3zQd8q0qjfEyoNB1OutwiIZY
 tPzQ2BbeHf1/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=grRHs1+h
Subject: [Buildroot] [PATCH 1/3] package/spirv-{headers,
 tools}: bump to version 1.4.341.0
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

https://github.com/KhronosGroup/SPIRV-Tools/blob/vulkan-sdk-1.4.341.0/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spirv-headers/spirv-headers.hash | 2 +-
 package/spirv-headers/spirv-headers.mk   | 2 +-
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 019145f959..2ddd887076 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1c47ca6342ebe86f57b46b8dbeb266fa655a1ca8e10d07e45370ff2d9c36312e  spirv-headers-1.4.335.0.tar.gz
+sha256  cab0a654c4917e16367483296b44cdb1d614e3120c721beafcd37e3a8580486c  spirv-headers-1.4.341.0.tar.gz
 sha256  ea43b1de38a6f90c488800d66dec1ed671e68cda530266bc96951fb5b6307613  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 0d0ee949bd..413f7c3586 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.4.335.0
+SPIRV_HEADERS_VERSION = 1.4.341.0
 SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index cba67d7d8d..37f8046545 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8b3d5637061b52675e506ffa1100740031e38bdd96b8177978acfd898a705da2  spirv-tools-1.4.335.0.tar.gz
+sha256  15bfb678138cdf9cd1480dfb952547bbb66b763a735b6d5582578572f5c2e6f9  spirv-tools-1.4.341.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index f0e76bb9ad..af3cc659f5 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.4.335.0
+SPIRV_TOOLS_VERSION = 1.4.341.0
 SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
