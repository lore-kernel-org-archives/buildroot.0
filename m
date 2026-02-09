Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B21FE7E0D9
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB44A83B9F;
	Mon,  9 Feb 2026 19:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfItuh1t2Dj0; Mon,  9 Feb 2026 19:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B30A83BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770666998;
	bh=ocbYSPlCsWl65dmDhTVyFbFflH668srfl2u2/1Pf2aU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kfQrDPVJCNfHmVBpw/jotFPXoGVOVYG82BI36pdXpwXEJZT+fybOpfpETucM40ofZ
	 Ym8RkB1ArPzOeUhWddvbtLow7mpm0mue0V7ic45TK+IO/fDd/2IgpQjLYge0xjAMMD
	 PuAaJVSWF+yGifLSp4NqI36360oXjEA0Q2TwXbthdEAKFP8VPXNt5LnNTdXSUhVX3T
	 ePXwF6FrS0VKqVCRKE2OSUcgF0/Go7+akGfKD/X+tJEmMM+kORZjY2iZzTjmCtHHM0
	 smzkn4S8FORvJ0ZBOWqMfd3vYRK+41XsLzofmrJTiCKkyQl0PJtbGuCeF33jnUUTCd
	 EVGBIyRnu8Www==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B30A83BC6;
	Mon,  9 Feb 2026 19:56:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E42A6F2
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE865605C6
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IM4zESUheTal for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 19:56:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CCC6B60678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCC6B60678
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCC6B60678
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:56:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a038f.dip0.t-ipconnect.de [91.58.3.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0B63A4C0597;
 Mon,  9 Feb 2026 20:56:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36644)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vpXN3-000000003gY-0D5d;
 Mon, 09 Feb 2026 19:56:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  9 Feb 2026 20:56:32 +0100
Message-ID: <20260209195633.384345-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770666993;
 bh=6dty1uldER1B+Pj1zOf4qBvvd5jga+DWD35dZYzHTi8=;
 h=From:To:Cc:Subject:Date:From;
 b=gCqk45hWJKjC5L7KqeIAbAXEZXgiSLiO3t/0CV5J2tFbwX0HY10bwvuisDSUcZOpH
 TrjQDpKthOzy0APisb1qQL41RM7sjRzPQR0Po4LOXjqksm0pPcqx9aERUQS6l3Ft8l
 Igf06RuZlknLZUgG7hhC9KeL9eMPgaUPo/KA8HKXIoNs7Vd9bZ6VIqLlrWB37EB3eI
 0vhbH49rbU+N+Azmfc3d4EjECPaUr8bqpZMB7ucpIM3gkVcCJxhbHT6s6AnhseE2IQ
 0MpMhSxLBEt99NedPtasocFkbGj/2lRWsdUCjfepVbHPMoyWhKijacfFfQronYbQ5e
 SRilZK8s/e80g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gCqk45hW
Subject: [Buildroot] [PATCH v2 1/2] {toolchain,
 linux-headers}: add support for 6.19 headers
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

And add (and default to) 6.19 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 linux/from-6.17/linux.hash                          |  1 +
 package/linux-headers/6.19                          |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 5 files changed, 23 insertions(+), 3 deletions(-)
 create mode 120000 package/linux-headers/6.19

diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index f158e49815..105f025729 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  303079a8250b8f381f82b03f90463d12ac98d4f6b149b761ea75af1323521357  linux-6.19.tar.xz
 sha256  030115ff8fb4cb536d8449dc40ebc3e314e86ba1b316a6ae21091a11cc930578  linux-6.18.9.tar.xz
 
 # Licenses hashes
diff --git a/package/linux-headers/6.19 b/package/linux-headers/6.19
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/6.19
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7b3efe74b2..b9c86168be 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_18
+	default BR2_KERNEL_HEADERS_6_19
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_12
 config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
+
+config BR2_KERNEL_HEADERS_6_19
+	bool "Linux 6.19.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_19
+	bool "6.19.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18
-	bool "6.18.x or later"
+	bool "6.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_17
@@ -462,6 +470,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.123"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.69"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.9"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19"		if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 99337a1873..51c5ae6f96 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -672,6 +672,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -685,6 +689,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	default "6.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	default "6.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	default "6.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 6991b899be..01c2371e15 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -173,8 +173,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_19
+	bool "6.19.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_18
-	bool "6.18.x or later"
+	bool "6.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_17
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
