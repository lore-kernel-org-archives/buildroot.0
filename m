Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27E9C98330
	for <buildroot@archiver.kernel.org>; Sat, 17 Jan 2026 19:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0458612B5;
	Sat, 17 Jan 2026 19:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZdDD-X3F7gi; Sat, 17 Jan 2026 19:07:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2692612A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768676824;
	bh=K9Pi66ws+ms7ZQZmwX/z0CAoYx2fHrjI6a2pvNmY8JQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=diOWld7w8izWEAg6zPqtgt8de7oAANF81n52y2OK9hHnO49yMRVurU1JoN9GS2p/Q
	 LZSJgIg6TBNehL9bEQS1hTpNx/v/kkZ9C9feSJ5UcKCDuNo/1qmjxSw9LVa0jU2siA
	 R2XciKhZu2ZNyMCarrxiGHOUB2E0VgPPahIBns57oTtYXY1Yx8HacJVIcelA1j9dho
	 5PBPsq8o/cEh4LvEtmfFriF433xhsBjZTqcs5FjyGCbbuxPYv6IQfr608tu6Trp85u
	 LVs+M3ApUzuxC9axc0A/2xTwQtTLNYOuZGi0yG9bSPRF78X9PVuQ8zXSqcSYzTPXor
	 uAvuJ52Xsh3eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2692612A5;
	Sat, 17 Jan 2026 19:07:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EFD55347
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 19:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA5668436F
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 19:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Acw36mEav4gV for <buildroot@buildroot.org>;
 Sat, 17 Jan 2026 19:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BE9E8408C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BE9E8408C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BE9E8408C
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 19:07:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09ef.dip0.t-ipconnect.de [91.58.9.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2628EA4C428F
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 20:06:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46222)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhBdQ-0000000087n-0ZjK
 for buildroot@buildroot.org; Sat, 17 Jan 2026 19:06:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 17 Jan 2026 20:06:56 +0100
Message-ID: <20260117190656.3000294-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768676818;
 bh=nXdUDOBDM+j8ZjNuutetis1+P9F1oQ8XhVkNYbJcKwc=;
 h=From:To:Subject:Date:From;
 b=klD4GX7G6bQ7T63lahCiArkwuu6JmtJI7DZp5cEQzKEkiR+d8BlMWTlkmfnb+8wG7
 8/4M5+mfMBvTS7b20s2Wq/5cXih6NNKn6y8eXaqBSEH6YahG2ORGs4CvMCI6UELLXE
 xSRGH7pw9ZIt+j2Zkul+a6Ks1p3uowU2G0gUMMV6UClvFJT31jvWNPZqHdxCfAdw1J
 w1UVcBwpVbcBg6ttF3+F8NqbIjzCRxl0x7nfaH1VrvQTWRbPZdmfrFgspzo3zRk/2k
 vd6p7eTJVpGGNmdPzliPN4SBsOBDMYezS6QBbC+L85gPEll1FZX+9im/SA1q0iDanv
 zUs1QXtvyAz0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=klD4GX7G
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6, 12,
 18}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 12f8a87451..69dfe3977a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index cdfd260ef1..1f9256c27f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
-sha256  54e852667af35c0ed06cfc81311e65fa7f5f798a3bfcf78a559d3b4785a139c1  linux-6.12.65.tar.xz
-sha256  405c332d59eedc4fd78863ff07a06c040dfeef651e58f022910a5ac953e4dc21  linux-6.6.120.tar.xz
-sha256  0e8546a8437558be17ef5a87142055347bf2e7e9863ee58bb3996cbf0fd28496  linux-6.1.160.tar.xz
+sha256  472497197b2f68d4dbf1bc32cc6dc669ca220ff4c0eb0dc39a9cff9a88f9a31b  linux-6.18.6.tar.xz
+sha256  ba3897a1c060b05a03cb4dda6f20d8c75e6f73c88b217744823a915056536eaf  linux-6.12.66.tar.xz
+sha256  76af9d4fce24cc5a1c9f1fcbba2e23c4e87bbc8e20525b1691206801f24d14ba  linux-6.6.121.tar.xz
+sha256  b41666bda7223600386a07ebe1802f5029da2fe81f6a85d691b6ec6a707e5a29  linux-6.1.161.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
 sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4710fc79a9..04dce45ea5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -458,10 +458,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.160"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.120"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.65"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.5"	if BR2_KERNEL_HEADERS_6_18
+	default "6.1.161"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.121"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.66"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.6"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
