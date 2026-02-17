Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB66E909D4
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 16:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BC8C84332;
	Tue, 17 Feb 2026 16:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbwSdnI5lK9Q; Tue, 17 Feb 2026 16:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF76B8432F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771346927;
	bh=qTEGylL5RAJk4IrOJxCKubjZublXV73bFsF9j4kG4nI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QBHfz5TfH+9+kYaMiaG6ehkSUTNvHpPehlIc+39pJto67uvZ7hnCFomAAvFv6ekT9
	 H2GyBUBmF2+Fpt9fC5tkxlplVfFKaalG+F56d1OKmtJS9ZDQCMaQ2f1zgff9wbl3MB
	 K8Z5NAfhYydkEXppzSlJeUnUf57FXkPOeP5uSMw8YOSieeuyNxubTmMnIrXUz/41m1
	 9obVeJnZCHi+X7pilk/mMj1iHuCku1SfT5eq3DZ8ZLNX9N+v3YjKuThCABvI5tzlfs
	 nBYYZQJPrsJOePzOeLI52OCB6SdH//isQUqsRZkoitPo5lQbQJcL+/tvNx+O7neXxR
	 pw2R9UClhWSLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF76B8432F;
	Tue, 17 Feb 2026 16:48:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C4E1206
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 16:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2DB4612E8
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 16:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4JhliBpUQor for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 16:48:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 277D06124E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 277D06124E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 277D06124E
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 16:48:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b4bf.dip0.t-ipconnect.de [84.161.180.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B3793A4C0AF8
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 17:48:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33816)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vsOFb-000000005J7-2NQO
 for buildroot@buildroot.org; Tue, 17 Feb 2026 16:48:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 17:48:39 +0100
Message-ID: <20260217164839.1209805-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771346919;
 bh=DIYV9cx5EorZzAkW5tk4KtxBvoS5wwmInH3kTwYe1sI=;
 h=From:To:Subject:Date:From;
 b=mZzFY3ZqJDEfN/EWKa/mInmlr3fNvMgyKevC1FeXB8q5Wfh966SzOgNEeIp9NVWH8
 mA6nVZh3XtGMPnQGLamFnpTWG1apMpJKyDI321YYJp4wwAQNxCq2N3nKKzvTH7kdMh
 +JglytDUrBYvLAXVRSXBoPXuG4wV81VtVB0U3TROFjTFY3UV1rAOVTvt4gqsAGMjpt
 T4Q2S4hkaCVm+q6aFqZM74i6RZZXBVGOkDuiHtHAfPlLJ285v+S9vd9YTyFOMWIczN
 6Xujy4/DeHh5PUoZCAv54ofNvmBaCKC9HJR4xiOJbGVIFSWawm+0cQ3mKGk3fsqoAc
 Lc2mtz+nScA8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=mZzFY3Zq
Subject: [Buildroot] [PATCH v2 1/1] {linux, linux-headers}: bump 6.{6, 12, 18,
 19}.x series
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
v2: added linux/6.19.2 symlink (Fiona)

 linux/{6.19 => 6.19.2}                     | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 4 ++--
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.71 => 6.12.73} | 0
 package/linux-headers/{6.18.10 => 6.18.12} | 0
 package/linux-headers/{6.19 => 6.19.2}     | 0
 package/linux-headers/{6.6.124 => 6.6.126} | 0
 package/linux-headers/Config.in.host       | 8 ++++----
 9 files changed, 9 insertions(+), 9 deletions(-)
 rename linux/{6.19 => 6.19.2} (100%)
 rename package/linux-headers/{6.12.71 => 6.12.73} (100%)
 rename package/linux-headers/{6.18.10 => 6.18.12} (100%)
 rename package/linux-headers/{6.19 => 6.19.2} (100%)
 rename package/linux-headers/{6.6.124 => 6.6.126} (100%)

diff --git a/linux/6.19 b/linux/6.19.2
similarity index 100%
rename from linux/6.19
rename to linux/6.19.2
diff --git a/linux/Config.in b/linux/Config.in
index a0814b2787..e32f252440 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 4352943b52..d523173bb0 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  143e8bc76cc41f831b51aa5e75819bed55bed41f299d35922820f1d2d2b02600  linux-6.12.71.tar.xz
-sha256  a7aefb9f8e9be2314a66ccda708257d1c2dc04e68235cda987879597fc89794e  linux-6.6.124.tar.xz
+sha256  4059d394cbf8e9548df36d37e0b8a80c4409ac4e14ecc5019a72a770ef7b41ba  linux-6.12.73.tar.xz
+sha256  16742f4e78abfec8cc9205fb3cf79d63c7e819c33bfc691402683402c350ee2f  linux-6.6.126.tar.xz
 sha256  fd2d033321bd15e0ad5669208b6e43f3f93ccecb059a512ca6b913ca940c38ea  linux-6.1.163.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  fce4b1c86688880932ba8f755880cbf390a89453464bfd90b9a1b01a121c2998  linux-5.15.200.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index f7effa8edb..6edbdd7471 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  303079a8250b8f381f82b03f90463d12ac98d4f6b149b761ea75af1323521357  linux-6.19.tar.xz
-sha256  d6d377161741ada2fab28eed69143277634a2aeb5e3883e50c031588ede48ede  linux-6.18.10.tar.xz
+sha256  88611981582cceb7cdd4d688d9d881073cf4977176252193a23ca6d4b982ee5a  linux-6.19.2.tar.xz
+sha256  e003294ad4c2c2ac5bb77fbb8259511134f51d987b3212516832dc4b0c83f1ea  linux-6.18.12.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.71 b/package/linux-headers/6.12.73
similarity index 100%
rename from package/linux-headers/6.12.71
rename to package/linux-headers/6.12.73
diff --git a/package/linux-headers/6.18.10 b/package/linux-headers/6.18.12
similarity index 100%
rename from package/linux-headers/6.18.10
rename to package/linux-headers/6.18.12
diff --git a/package/linux-headers/6.19 b/package/linux-headers/6.19.2
similarity index 100%
rename from package/linux-headers/6.19
rename to package/linux-headers/6.19.2
diff --git a/package/linux-headers/6.6.124 b/package/linux-headers/6.6.126
similarity index 100%
rename from package/linux-headers/6.6.124
rename to package/linux-headers/6.6.126
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 09c6cb724b..d53460d07d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -467,10 +467,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.250"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.200"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.163"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.124"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.71"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.10"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19"		if BR2_KERNEL_HEADERS_6_19
+	default "6.6.126"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.73"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.12"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.2"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
