Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FF5D6E2DC
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 18:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A291E4103C;
	Thu, 18 Dec 2025 18:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8OJdS1p32JZ; Thu, 18 Dec 2025 18:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE9324109B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766084019;
	bh=2hGkhjwGqiOcnFetPqID9eAYpK/5sEDlYmOr1liZYmI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y8fwdNxvVjekgak0cBCn7mA6VQVbLMZqveT2k8YWfeopBzHxYjEQ0OMm+b8bMLiLk
	 /rRMYQ/GlMzSmL+A02z9BQzGgPsYqg0b7gc2s9DpRkhiyd99LoF6lWwEE8+xIVA2d8
	 WxJ/LgzMjJ8B6h9F5tn05ZcblTAfJPqF81awyyqOzBFD7HsL9deGeVPoT6c8IDbVvb
	 EXGygMVgbN228Yl/GOvN78RFXPKvWbXnKIiqm1smLZ5OKc0ervMRhqJvdukWCIHxdI
	 FxDMwxB6ScOeGvaRhA3sLxM9G03qroPNfssC02oQ1CHg/E3PdLN8QJ5mN0FMuadvfe
	 FCWCJvt3WKmZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE9324109B;
	Thu, 18 Dec 2025 18:53:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A1FC361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 18:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFFE760BC3
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 18:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFKTUMDIYKwW for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 18:53:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBF4860689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBF4860689
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBF4860689
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 18:53:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55DB6A4C489C
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 19:53:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45574)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vWJ7q-000000008Rz-35ka
 for buildroot@buildroot.org; Thu, 18 Dec 2025 18:53:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 19:53:22 +0100
Message-ID: <20251218185322.3943200-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251218185322.3943200-1-bernd@kuhls.net>
References: <20251218185322.3943200-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766084003;
 bh=yt99fCsI3D/tAv7ABx0OztMHpE6NWkbx3Pu8sTAhglA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=texwUVVp+hs22dLqa/u/daoX4rBjsO42JTZGnRI5aa9muCNGMlbSrpsp/Rroh2kl2
 FNEaHPHpNqtLzAKisAbn5AkqTf4qBTesPejK7YCNlzYeLLq2feh2ic6/NTRqPSpIBw
 SXn8yIaLm43kMr2u+1OCNEc6KLYcWzxWoJejYKrE6deOjJJPLetZkdB+CvYgwodjQF
 BiHjTQgqj9cH3nU3bQZJfpcsRJnrW5rnmgpkIYAZMpacYhutWdn9bKAvXQJ/auX2JK
 RqUmIaFGSc+uRDkP/qjAIFhnw67586cBg6K7ee2z0LDAQ3gEPAHkhqyiQBT7hc1HbH
 5OgsSVJR2yI8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=texwUVVp
Subject: [Buildroot] [PATCH 2/2] package/linux-headers: drop 6.17.x option
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

The 6.17.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index da91b68087..99289f2903 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_KERNEL_HEADERS_6_17
+	bool "kernel headers version 6.17.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.17.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_MESA3D_VDPAU
 	bool "mesa3d Gallium VDPAU state tracker support removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 06abb56756..733ef50d8e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  558c6bbab749492b34f99827fe807b0039a744693c21d3a7e03b3a48edaab96a  linux-6.18.2.tar.xz
-sha256  116802dc3ad1646163cc6ffe9bddba24a8069b569135ec0523cd799064f2edb9  linux-6.17.13.tar.xz
 sha256  9502c5ffe4b894383c97abfccf74430a84732f04ee476b9c0d87635b29df7db3  linux-6.12.63.tar.xz
 sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
 sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ca652962d1..05a4822636 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
-config BR2_KERNEL_HEADERS_6_17
-	bool "Linux 6.17.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
-
 config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
@@ -465,7 +461,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.63"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.13"	if BR2_KERNEL_HEADERS_6_17
 	default "6.18.2"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
