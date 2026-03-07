Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C039AF55105
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 19:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84494607C5;
	Sat,  7 Mar 2026 19:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZl-WK2mN2ig; Sat,  7 Mar 2026 19:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CFB4607E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772910548;
	bh=/6xbn4MV9idq5FWR2yPrCc9AdcflCwezIEKKAsr+0b8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NNbRSZTA9J6TK38j0dtE1Um94ndkLMCo4l5cPIRuV9LF8+ApPV1ayQ7866Fv3j8w+
	 /CqPyCYIrv/6JVSxmaudErLZBl+xCabjNCPtgggsI5faCwVGjN5iF5EFZl7QcRLGPp
	 Y9O8uSFJ02P+7LnqubVKnOwR0VgA6fTkUqgzsgRorVCr/vGP4cSVIYKmL1q1/wnwY2
	 uMB09qqagmqQJ1J4XzqreRvRIaMCo3A1Aeb78hWo0uyE8UfDVc73fRr5aUsbPMsr+D
	 urMo2tWzRAyPV2O38iVUxnhtJoiCjahj7ANcalu2QoNlKhdHMFyAKG9xhK/Ng7WZi5
	 0FL1rGRd8W4Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CFB4607E3;
	Sat,  7 Mar 2026 19:09:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 565E0223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 19:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BEAF41A70
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 19:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pgs4XhdWVte6 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 19:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E8B641A6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E8B641A6F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E8B641A6F
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 19:09:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE41DA4C3819;
 Sat,  7 Mar 2026 20:08:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34068)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyx19-000000002zL-1zc4;
 Sat, 07 Mar 2026 19:08:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Sat,  7 Mar 2026 20:08:51 +0100
Message-ID: <20260307190851.853162-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260307190851.853162-1-bernd@kuhls.net>
References: <20260307190851.853162-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772910531;
 bh=08GYYMdIQwInebKfWkCSOWidsUUBPNVa8UcGDQvpPLo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=u0JuxcUfKccP+sg4fHzaAD9/mOXaLZ04vUc2iOGnoZDVI1rofzrZv772nL0JZTT94
 9Zbg2q9wYSM+kS6+XmqZMTM1KIsS1Zmvrg+n1yKSbJClLSeCee86cT3/N7RbEFX5Qv
 /eQaDjRBvfDDJen6cv7eQIS4IG72RWAISN6jBFq4gqqTqxPy0ZuCBkeZJaq4fq4b2F
 zT7txWsDfTneDQmok7H+f83eFGwjaVHyFOjczVbHO1FdQxKwxtWx/KjQlcaOO2l7Jh
 bLMkSHd+Y3ko9/BEyHG2VjErRCOnNDrJo9ZWW5QgdUbJ6Hu3NkTyhlzG2UqDxe/gUP
 BuaFpiz391qLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=u0JuxcUf
Subject: [Buildroot] [PATCH 2/2] package/libvips: bump version to 8.18.0
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

https://github.com/libvips/libvips/blob/v8.18.0/ChangeLog

Added dependency to gcc >= 4.9 due to C++14 features being used since
this version bump:
https://github.com/libvips/libvips/commit/3fa537480dda6170c3d8fb39abb838161d1c45ce

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvips/Config.in    | 5 +++--
 package/libvips/libvips.hash | 5 +++--
 package/libvips/libvips.mk   | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libvips/Config.in b/package/libvips/Config.in
index 70d01f0e35..ec2d031141 100644
--- a/package/libvips/Config.in
+++ b/package/libvips/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBVIPS
 	bool "libvips"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_USE_MMU # fork()
 	# C++ support is required to build libvips
 	# https://github.com/jcupitt/libvips/issues/231
@@ -15,7 +16,7 @@ config BR2_PACKAGE_LIBVIPS
 
 	  http://www.vips.ecs.soton.ac.uk/
 
-comment "libvips needs a toolchain w/ wchar, threads, C++"
+comment "libvips needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libvips/libvips.hash b/package/libvips/libvips.hash
index dd7510ecb2..956ff5924a 100644
--- a/package/libvips/libvips.hash
+++ b/package/libvips/libvips.hash
@@ -1,3 +1,4 @@
-# From https://github.com/libvips/libvips/releases/download/v8.17.2/vips-8.17.2.tar.xz.sha256sum
-sha256  57ea0ec4f30ea04748c9e8eec5415e7c9ac7cafe6822e4788fc110376a1d224a  vips-8.17.2.tar.xz
+# From https://github.com/libvips/libvips/releases/download/v8.18.0/vips-8.18.0.tar.xz.sha256sum
+sha256  b85ab92280c30d22f5c8fe2f68b809cddb7eaac437d8c33474475dac84ddc574  vips-8.18.0.tar.xz
+# Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 729d5fb9e3..8e576038e7 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVIPS_VERSION = 8.17.2
+LIBVIPS_VERSION = 8.18.0
 LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.xz
 LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
 LIBVIPS_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
