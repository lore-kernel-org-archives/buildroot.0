Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EE6C48260
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 07:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 272F58494B;
	Sat, 10 Feb 2024 07:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31-WnfHG6Sm8; Sat, 10 Feb 2024 07:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A5798494E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A5798494E;
	Sat, 10 Feb 2024 07:37:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB58F1BF3B9
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 07:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5768608AB
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 07:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XdY_PX_NgJog for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 07:37:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7CEE2607A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CEE2607A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CEE2607A1
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 07:37:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36557A4C178A
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 08:37:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49170)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rYhv1-000000003PN-30ho
 for buildroot@buildroot.org; Sat, 10 Feb 2024 08:36:59 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 08:36:59 +0100
Message-Id: <20240210073659.5018-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1707550620;
 bh=gKfGM4hoGkrcmjQOgN113z6ZyrZMTicsAD5Fnjfkjxs=;
 h=From:To:Subject:Date:From;
 b=JxEMouYyW40vnCV4+MSey+sr3hOqxgA/nP4LQxSMs1gRGYfzX1MgeBoZ8y+3+GKte
 hQ1Qy4xOeA8cvWmVL3L2L/rmji/rK1uBGWdF4Y59INfr5LsIzd/lL583s/AzNL42Zf
 NfUOlmTCxnvA/CsWbFiIEWw4wYVgCSiTOn0ZUvMQ0kpAg2z+63DUtFTFn7WpIbh8gA
 HrV3bYKG37bgE3PbFgKgrP1LKEMdBxn55EeRtYiVK5xVPcjKXvUawzYtQt4dEM/MaG
 Nj04NYsdFro+S9SecNhPsQSr0k+uYwrEHCUQcTHkQTRUV7MJWU1bzXllVQQ8iYa7/k
 MV9gp6i83oDow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=JxEMouYy
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1,
 6}.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index da22b439e3..773cb4fbb5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.15" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 10edcc2ed9..52fb480af2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ab290c7f8687f2f8af96e14abd0700ba8b282426151873690f51621d8d5f5faa  linux-6.6.15.tar.xz
-sha256  0580cc0e81ff9aee245f79531d8c1c5c7d711eee227cd4cf52d1ff335727b1fd  linux-6.1.76.tar.xz
+sha256  b21d5795a3bead4f112916423222faa8a0f519e4201df343e3eb88dc9e4aaa30  linux-6.6.16.tar.xz
+sha256  3b54ec567716cdfb3618caf38c58a8aab1372cc41c16430633febe9ccdb3f91d  linux-6.1.77.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c48575c97fd9f4767cbe50a13b1b2b40ee42830aba3182fabd35a03259a6e5d8  linux-5.15.148.tar.xz
 sha256  44e22fad647c638726a8eae23703c4263bead612d17c89ca7ad7ab32b5ce88d5  linux-5.10.209.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a0e572adc0..69857566e3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -407,8 +407,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.268"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.209"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.148"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.76"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.15"	if BR2_KERNEL_HEADERS_6_6
+	default "6.1.77"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.16"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
