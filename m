Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77946E8385B
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 07:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E43A60EB6;
	Tue, 17 Feb 2026 07:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cs2elNwCXxRR; Tue, 17 Feb 2026 07:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE2660EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771314634;
	bh=MUPieJd6HnSSMq2cpwyjWPRZleRb4wqXXCMCVe2+bvc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k2KnjusTvmrYXMbFnWhAhAEDQ7cnh0R1Ief9CZE2n3pmxnqjr/Z9f7qzmpaef1rvN
	 2kOQNDj/deEbbQOpWf3mvfTwwndRkqpBJ4jnH+ECkqqkcuy8HuJiu0qONyB3s1/gxK
	 Lqf9NAY0+5vzeFg0P9+JzBgJ805HGq0VlCiHc+H70/QrCcxT5B5fbjjILGHDpkiTun
	 AENBWef9hnoKt4Fzei2j8u6MC8DF5q52me8lqSJgYcZOC9wPY0wFeXb90MVyoz3eIY
	 okngXNRjL+H5dJEpntaBLAj7CCm1tKB8B7hV0gFz7T51nhtmBoYLrehFDLIA0lw7NR
	 tyFYxce0JWiTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FE2660EBB;
	Tue, 17 Feb 2026 07:50:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39D79206
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E4FF812DE
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fiN_A0rrt1la for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 07:50:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43CE280F80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43CE280F80
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43CE280F80
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:50:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b4bf.dip0.t-ipconnect.de [84.161.180.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 758F4A4C0C4D
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 08:50:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42808)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vsFqk-000000007ri-3ovW
 for buildroot@buildroot.org; Tue, 17 Feb 2026 07:50:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 08:50:26 +0100
Message-ID: <20260217075026.395724-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771314627;
 bh=IOV5kDLkk4WaMttc52c/2A9MHvZ6O9fWLH5xF0BVHHg=;
 h=From:To:Subject:Date:From;
 b=qhsInktxZkncIOrafr/H4VKSLnA+sccBCMJUTjkYArQEhwi2FtIxINzn/s1Y1qyg+
 WWmW2aMHybBCMKdhioKgoQgSn815x4sYin39QZvrZ0gjwceDY5x1qo3ehcazu7KCqx
 T7JPtU+el4NPmTwzaNJnHXuCxRTf6sNPYHvYfzEQlH7k+NyTAdbMi7GhrUfLPPXeyi
 sDmwutCl2BDtvkuvD6jnkWZbRoKcJ1060qZmcZ/Hc/w95EsHh2T1il+U6TpmakXkuB
 f644kLWAlzVv51OmmLGLkHG7hFrKhQvWd2btoA7BEcndURH0I7SK9VR3aBFiu32+A5
 VuPgsQn8Pnm2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=qhsInktx
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12, 18,
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
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 4 ++--
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.71 => 6.12.73} | 0
 package/linux-headers/{6.18.10 => 6.18.12} | 0
 package/linux-headers/{6.19 => 6.19.2}     | 0
 package/linux-headers/{6.6.124 => 6.6.126} | 0
 package/linux-headers/Config.in.host       | 8 ++++----
 8 files changed, 9 insertions(+), 9 deletions(-)
 rename package/linux-headers/{6.12.71 => 6.12.73} (100%)
 rename package/linux-headers/{6.18.10 => 6.18.12} (100%)
 rename package/linux-headers/{6.19 => 6.19.2} (100%)
 rename package/linux-headers/{6.6.124 => 6.6.126} (100%)

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
