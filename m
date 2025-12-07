Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C209D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 09:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05D3E60661;
	Sun,  7 Dec 2025 09:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnCPbolkNU9y; Sun,  7 Dec 2025 09:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D426066A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765098884;
	bh=bQjN4Nmue8sFRFk2kDjrB3eZXBnrlwkjlU2LDp9EPx4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R4lNLHf1w2d3k0NLbj6t0v2GgY4/HK1J0e/PZNnmAHyTxXwj3oHuNL6yYaOQwF5rf
	 RIG4Ln1ok1fOH6WGI0D9gl7M3BIsnVz4Y5gIErl7KF8OqypedD68ncHRy2Ao25dqi3
	 X65U79V1gSwcGvCIXXE9H53HqH+xY3w0B2KXIt1Vyju6EYaKjd7B+DTm27L7Cxw0XD
	 UY4mJgPsuBs0pyW2DGR7SjQyhV6ycb5C53F6nRNJ+BOhJ2oau0qB4sE8pQpQb3RBYQ
	 CnKikfIcgSQUMC1u9ECAJkADTdRF7d9wTiLrjcnphwDJXIWllt3Mc2Vy5rzejrPb1s
	 pVpcSQW+7WA4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D426066A;
	Sun,  7 Dec 2025 09:14:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DD5EE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 335DE6066A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1esn1I4ri1Lk for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 09:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E409F60661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E409F60661
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E409F60661
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:14:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6E8ABA4C10D4;
 Sun,  7 Dec 2025 10:14:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44536)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSAqI-0000000033z-1cUo;
 Sun, 07 Dec 2025 09:14:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Dec 2025 10:14:08 +0100
Message-ID: <20251207091410.28979-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207091410.28979-1-bernd@kuhls.net>
References: <20251207091410.28979-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765098851;
 bh=kzR+MHdDIVU/loQ9RkzboX7QJe7fBmQrOlEvcTvbcsY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=X+gHLlvsKGa+TEdLGkL1K2x6YWtIbyiksMmjzd9SlrDdf8FXBx1PYGrA/ghtFzh/R
 w/IA7Sdr/HK7Nk4Cp3aNk0Q6z8E3EL8xnAbvYtyzibbui0CImaQ6drbj8goE/rM43Q
 hP5lls+A0lgit4TuxKDWgrSP131Ylawrw479stvxx6WDYZLUX2lq208t13iJ4nPQbH
 YrHmynk61nb6pC4hNMFvQySYnv+CBUoTQbAv0qvOsmJEtCbb9J0gbj5PoKIHFb/Cgn
 breVXqQZ7HLE1iLF4/QfCxirBapispWOO1AdFWqzU9Bv0tmeLXy5sSOfAEBvix9lej
 Kp+oY+/GJUmow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=X+gHLlvs
Subject: [Buildroot] [PATCH 2/4] {toolchain,
 linux-headers}: add support for 6.18 headers
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

And add (and default to) 6.18 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index fcb5bdb113..d14de29189 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  9106a4605da9e31ff17659d958782b815f9591ab308d03b0ee21aad6c7dced4b  linux-6.18.tar.xz
 sha256  934b18af0125f114907bad482d7c5a97d58038970b9dce6162318e920caf257e  linux-6.17.11.tar.xz
 sha256  1a69745105528676f12f29dc2494945d96cb23666dcc5223794abc22415f1735  linux-6.12.61.tar.xz
 sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a53f1a36bd..f4c440fe3f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_17
+	default BR2_KERNEL_HEADERS_6_18
 	help
 	  Select the kernel version to get headers from.
 
@@ -57,6 +57,10 @@ config BR2_KERNEL_HEADERS_6_12
 config BR2_KERNEL_HEADERS_6_17
 	bool "Linux 6.17.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
+
+config BR2_KERNEL_HEADERS_6_18
+	bool "Linux 6.18.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -135,8 +139,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18
+	bool "6.18.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_17
-	bool "6.17.x or later"
+	bool "6.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16
@@ -465,6 +473,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.61"	if BR2_KERNEL_HEADERS_6_12
 	default "6.17.11"	if BR2_KERNEL_HEADERS_6_17
+	default "6.18"		if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5fcc9362ba..8330e652c2 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -675,6 +675,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -688,6 +692,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	default "6.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	default "6.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	default "6.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 9855b33ade..6991b899be 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -173,8 +173,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_18
+	bool "6.18.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_17
-	bool "6.17.x or later"
+	bool "6.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_16
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
