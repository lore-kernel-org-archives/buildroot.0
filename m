Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBF1F01801
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 07:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95AB441B7E;
	Fri,  6 Mar 2026 07:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6s9mkQVopIFb; Fri,  6 Mar 2026 07:41:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE48D41B74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772782873;
	bh=3Tc239535kc9jM2TCRkT5loJFiPUakpSrn783si66jU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m/X2MyRBT8jU1x+8YeWA/PhvbogxrXwTWOGlDa9/mJqU6M8SVswDTVSgl7YjcCLF6
	 gZDVA2siXDlNXNJtMncr2ziMGNwohFJpM9jVfXt0zFTbGsJrYFv6sWUB/W8QI7kzyS
	 CPeeAgeogwP/HpcUIl6WbUpk0aP78bgpsWSJ7Hti5/UzNqMIAdd2xankq/vv+nuBwj
	 aA2O8r0GueEP6NbJzvg0XOLe7dHVBv3RpfopYxOtfdScxCp1rJjG7lDia24dYRMWMA
	 cmArwHamVYq88VKXUcJZUonKhIabbFp0IZBY7550mrfm/o8bRBKc/MDqbdB+EbJ7Kc
	 JG+RtstFHk/MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE48D41B74;
	Fri,  6 Mar 2026 07:41:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF54A25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 07:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0BCD400A2
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 07:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jO68tYKW4p9V for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 07:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 66D134005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66D134005B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66D134005B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 07:41:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DEC86A4C352B;
 Fri,  6 Mar 2026 08:41:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyPo2-000000005YP-3x2j;
 Fri, 06 Mar 2026 07:41:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Date: Fri,  6 Mar 2026 08:41:06 +0100
Message-ID: <20260306074106.124068-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306074106.124068-1-bernd@kuhls.net>
References: <20260306074106.124068-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772782867;
 bh=cbOXaJ+fB0qgCnxn5hBdtyuFT+kL0kYj8soaKWtZaiA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uWNOuCdSVSb8GnCPOQAn3KUyHMGnGhSGWevCuoS/WsnG8Kr++3Vl1EYbYqOaRbzLo
 EQz2eH1DtjCGlf40ejaJ5su36ec7DxLdNV6dAn2NkofWqeaV/aqbC/cA/zP+ElWsev
 BZXycNr2bU/wyxprr5/DzfBT761EgrXKndGiXX5i7Jwj1R/r0+1QtFXOuHZWSIk+kS
 eu5jOLhqXXEUCveFiBSr997lp/gLz841uH+YhpzEcNKLIopbKuihpYl8/MNL0MVRw4
 Xg6PzRVyO+fKO7OV2L9lOIpt9h93ly+Eo5114XKjhasCMaZVyQPg4hvnwwBtZ5Sben
 nhkgc94tnkNAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=uWNOuCdS
Subject: [Buildroot] [PATCH 2/2] package/libtpms: security bump version to
 0.10.2
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

https://github.com/stefanberger/libtpms/blob/v0.10.2/CHANGES

Fixes CVE-2026-21444.

Added comment to hash file about locally computed hashes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libtpms/libtpms.hash | 3 ++-
 package/libtpms/libtpms.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
index f10364f36e..175e6e3af6 100644
--- a/package/libtpms/libtpms.hash
+++ b/package/libtpms/libtpms.hash
@@ -1,2 +1,3 @@
-sha256  ebc24f3191d90f6cf0b4d4200cd876db4bd224b3c565708bbea0a82ee275e0fb  libtpms-0.10.1.tar.gz
+# Locally computed
+sha256  edac03680f8a4a1c5c1d609a10e3f41e1a129e38ff5158f0c8deaedc719fb127  libtpms-0.10.2.tar.gz
 sha256  82f1e6bae374bb6a9d4f4596767fd33e499718d560de140fd9f3d402cc5e41fb  LICENSE
diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
index 6e5708202e..7bc69a50d6 100644
--- a/package/libtpms/libtpms.mk
+++ b/package/libtpms/libtpms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTPMS_VERSION = 0.10.1
+LIBTPMS_VERSION = 0.10.2
 LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))
 LIBTPMS_LICENSE = BSD-4-Clause
 LIBTPMS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
