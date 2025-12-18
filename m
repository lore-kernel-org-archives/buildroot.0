Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2C5D6E2CA
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 19:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1D640582;
	Thu, 18 Dec 2025 19:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdzSKcETa5uE; Thu, 18 Dec 2025 19:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E024B40486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766085373;
	bh=bryQTlLSJ2S2cQG+77wXksvOKMTemUJGzNnm/zueZQE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RYiNJPX53NNA7srBi1+uHniRAnny4oe0dBY0i+2g3Q0AkcEnYe9uY/G7VGdnMgIks
	 VGVu6RS5OEcVSK+UOAPlURuU/ou4qwUrLuDaMa25/1Lpts3fE20ZhGr0vLacWElx+N
	 KOAZU9uH+4eEFdB+p9dKhv+VLMJUkWxK9uKRLiiZGhVRMjYxalJJN2/hd2ABB19Cyb
	 fRx+SAExjGuC+6TziRbddE/ddY9U5NPmJI+whHCEklrPBiVEbaxahg6MYfy4F/co2T
	 JdZwwFuMVx1NPtwqUALIBEfulApNwtYjMpubQgOveAMno5TgG1JeCVQi6g6FAJkBPY
	 L1nhWCWn3gPAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E024B40486;
	Thu, 18 Dec 2025 19:16:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE7F01A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 19:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0236413B1
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 19:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewy0ri1KMRbR for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 19:16:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA0E440144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA0E440144
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA0E440144
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 19:16:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D39BA4C44D8
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:16:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36870)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vWJTs-000000004BK-1pKX
 for buildroot@buildroot.org; Thu, 18 Dec 2025 19:16:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 20:16:08 +0100
Message-ID: <20251218191608.74534-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766085369;
 bh=8yZHxDdSEMcSOMmoK8U3zyBM+9Qk2ypk+EVekegsWp0=;
 h=From:To:Subject:Date:From;
 b=nvs/6PV9CRMwiV6Sex6cn3yjqH1Se9qDkFBzpYbeeSk/1Dft6inFaLCuGcMgtNmKP
 ylkMiVI0LgOh0CIetSSJQHVeQZIHe+KhWeJH16yCwafCNpOeEw3YesJZZaMItI38W5
 Z/BUhmvVMq9D+EnT06YxFtjEAv0RgTLZDGo22Lm8lkD0UIwiavE8b5ZUvgFCyH2beA
 P+pEUgd8RnaPncXMIbpugSdUgQVOiVkHectgl5Zk7Vhx4RI4IZ04Hz6Ld3VpKYzQb0
 jamR8T9TFLNH9i8VatN0PJ+aTmHaFPPS/fJqVeUuESNf2lnGZ7C/c0mXLb8+D1Rroa
 bxYsASThuE8Ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nvs/6PV9
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version to
 21.2.2-Omega
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
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index a63d5df793..7bc93a0345 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  15c772adbf79fd92bd6b7d597fd85a23df00b26bd433531c997101ee8ddde86c  kodi-pvr-mythtv-21.1.11-Omega.tar.gz
+sha256  ee1e2730a0491eb3b4b0b6245f9f7f26269fba215d083c84ba2682280ae2026d  kodi-pvr-mythtv-21.2.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index ffb87660b4..9f34d07f1d 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.1.11-Omega
+KODI_PVR_MYTHTV_VERSION = 21.2.2-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
