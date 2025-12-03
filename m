Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A070D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7BBF616FE;
	Wed,  3 Dec 2025 22:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmqoABmaHXWP; Wed,  3 Dec 2025 22:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0703361B6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799535;
	bh=I8Q6d9CHjBXJxXn/ebNM8Uul7adpAzATOtKDi2oieN8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CP4lcPNkY6ibsXMp3tNOpD+5uy1g1HKPS75GWz382IQMtP6X/l9+cFvtGHR3tOicU
	 IVA+zSTpvgyiRTQ/MS5oMLMcaFOLhXuGQKndkrwjHQNRIxtwS7kdNfu7ESl22tVKpJ
	 OOaF0fY3GuTt0LWibqSyuF+KuTIE64kDtihdB2DhU0iNDshKvZX+FJHfcUnDcVmMC2
	 VIx7nsCt7QneZ8V5WKKyhMHZK/LmE/6VG8RbNLVaM3xEwoYRKLPx7Dl24OIL2RtQuV
	 u5ZrzGElBS10mncBpNclf6WxXIWl7xcFjadbWpcdERJeH39+/KZICUIYC7JkFmNbt6
	 NGitgHRmGxdfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0703361B6D;
	Wed,  3 Dec 2025 22:05:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0E66E7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B77F483D24
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbMfmasi2Uz4 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A74E283D1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A74E283D1A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A74E283D1A
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EB192A4C79D8;
 Wed,  3 Dec 2025 22:59:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqi-000000002OS-1nuE;
 Wed, 03 Dec 2025 21:57:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:22 +0100
Message-ID: <20251203215723.2323032-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799147;
 bh=8wYeofF8LsWmOf1/4l4OgdxbYG+pyrbfeesbzCMwUCE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Xkf/1WM+F1XxLcXzRK5pmpOcXaeLwtXoqFT3Oowku7r1IEIB8CkUvcIFXgboHnrRD
 yHMhULy27lLFb+xJzrAP0dYyk9N/aJZ3enJ2wFLVlup94W2J8xNcAOnUMKbMwtmZsR
 O+P/IC6ZpjnZlyqErPdEcqHrW9NH2i6AV1Gsl9kYtoAeKBXNbsAc+fzgEoAbOrtgxq
 dZmybIN/oiLWeLlLjf8I80fkZxD4tpJiD7Jrb7LgRCLUv3rqRb6xBVzLDg2x+hWyg2
 gotRoiSuYmkmjnJGRGJsCNNHGtwlq431DIn93dp51CfUl39LSw5Z131Pgoa1CBfJb7
 UBN3enFcF/0Ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Xkf/1WM+
Subject: [Buildroot] [PATCH/next 15/16] package/uhd: bump version to 4.9.0.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/EttusResearch/uhd/releases

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-CMakeLists-add-boost-unit_test_framework-requir.patch | 8 +++++---
 package/uhd/uhd.hash                                      | 2 +-
 package/uhd/uhd.mk                                        | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch b/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
index 4c455d28fc..cdd4b6c64f 100644
--- a/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
+++ b/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
@@ -13,6 +13,8 @@ Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 [Fabrice: updated for 4.3.0.0]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: reverted (https://github.com/EttusResearch/uhd/commit/1a00949b19eaecb84af0f27c370400dc71a9fd84)]
+[Bernd: rebased for version 4.9.0.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  host/CMakeLists.txt | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
@@ -21,9 +23,9 @@ diff --git a/host/CMakeLists.txt b/host/CMakeLists.txt
 index 8f72ece76..a7731ffbd 100644
 --- a/host/CMakeLists.txt
 +++ b/host/CMakeLists.txt
-@@ -291,9 +291,12 @@ set(UHD_BOOST_REQUIRED_COMPONENTS
-     system
+@@ -323,9 +323,12 @@ set(UHD_BOOST_REQUIRED_COMPONENTS
      serialization
+     #system Boost.System is used, but explicitly listing it causes errors on some systems.
      thread
 -    unit_test_framework
  )
@@ -34,7 +36,7 @@ index 8f72ece76..a7731ffbd 100644
 +
  include(UHDBoost)
  
- include_directories(${Boost_INCLUDE_DIRS})
+ # Include boost headers as system headers to avoid compiler warnings from them.
 -- 
 2.26.2
 
diff --git a/package/uhd/uhd.hash b/package/uhd/uhd.hash
index 3282da2ec7..be79a138dd 100644
--- a/package/uhd/uhd.hash
+++ b/package/uhd/uhd.hash
@@ -1,5 +1,5 @@
 # Locally calculated:
-sha256  afe56842587ce72d6a57535a2b15c061905f0a039abcc9d79f0106f072a00d10  uhd-4.7.0.0.tar.gz
+sha256  0be26a139f23041c1fb6e9666d84cba839460e3c756057dc48dc067cc356a7bc  uhd-4.9.0.1.tar.gz
 sha256  94cc36ada2641d037980bf6c2418a750ac10a115ae11de5a5cda6177769dbd4c  LICENSE.md
 sha256  70bf7e79c8cd73a81f97ce81745ea0719a617eebe299a61868165daeae71fff2  host/LICENSE
 sha256  206adc03412b6c5b71b9c9df9c1f2e60e11833e89393877d5031fd11d332b1d4  fpga/usrp3/LICENSE.md
diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index 52ea06a394..a05675b102 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHD_VERSION = 4.7.0.0
+UHD_VERSION = 4.9.0.1
 UHD_SITE = $(call github,EttusResearch,uhd,v$(UHD_VERSION))
 UHD_LICENSE = GPL-3.0+, LGPL-3.0+ (fpga/usrp3)
 UHD_LICENSE_FILES = LICENSE.md host/LICENSE fpga/usrp3/LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
