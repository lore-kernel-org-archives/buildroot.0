Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D54DD5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92F2060D78;
	Sat, 13 Dec 2025 11:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQxbeLgAra2m; Sat, 13 Dec 2025 11:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1563260D6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765626982;
	bh=TV8qlMaOBciMUSKUiIyyYDTdnt7+J8riHMIFgFh8UCY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/jRSiiiLm0QgaBMcYrzz1qvInm5ByIH5ZJCZgAilPJrz0bBOeTJU9rFAYo+MhCAg
	 01C6UbLmPrvVBa3wV3nsmZ6aWAZPVmQ2XaCZZv2kAhnfH7LNUqd309ClGSsnzOWD/o
	 AHljipVdZ3hbnbXYue3D4fzXA1/fPfynKcHABvZTcLFnghW7NGpDajAshOj2+2iOr6
	 gS/XtXgZFEyugLzAunLApIFltsCDY+kgUUT6cX0Zu7hd7/tSLXBdXZ2N0+kHu+2Z08
	 qg4j+uNB2nhB0UBG7eaM2+X0T/oqzBeQy9Spq5mDsCXt+qAS9kkzCseHJGBJ6rOCx/
	 /4P/+V+UBxC4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1563260D6E;
	Sat, 13 Dec 2025 11:56:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2FB22C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99C6B407DD
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15zDOk_xohXz for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51117407D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51117407D3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51117407D3
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:56:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1482A4C4033
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:56:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33154)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOEH-000000006gk-2xQZ
 for buildroot@buildroot.org; Sat, 13 Dec 2025 11:56:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 12:56:05 +0100
Message-ID: <20251213115605.1277049-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213115605.1277049-1-bernd@kuhls.net>
References: <20251213115605.1277049-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765626965;
 bh=vBUCZ2KoPmNJyTVoB2wOQl32Mqukwn8wsT3lEduDt6c=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=bITNpjiHrsi9Z2wm8FeXRNE5RcxHe9l9OQTyvW4GoizzDPnB9HoFdfybUBV7oi38C
 Lf6JAbLc6FELotwAV3IrJ/6cxBXIiRK7jkscBQjBxLoNDOVcJp1926QFYd7YcQEtlj
 G5+8kvNYK9jfklrO7DwAx5XyfX4Y0gLyQuKxjO+flp3IcJH17A7pSFr7yuq19XM92b
 Aq+o15o0a9P5HfLoSE8MxeonLpyZIzGxdsK2OGEgDiRFUCrBp9AxFEQRqvwnDE8N9u
 2nKR26lw9h1+8CVcUCeaIPujV2Yg6zRa5KpxJ7FSnPLW74Pjh2JbnLuyvGuIpBSPVT
 ZT1A6oteLU+fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=bITNpjiH
Subject: [Buildroot] [PATCH 2/2] package/libva-utils: bump version to 2.23.0
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

https://github.com/intel/libva-utils/blob/2.23.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libva-utils/libva-utils.hash | 2 +-
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 049781810a..6888647865 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b57615c130427ec134bb5d2b80af516ce5bb19a40e89b1dab46a0d59760d96c  libva-utils-2.22.0.tar.gz
+sha256  fa7ff29847b55010fbbb775b35382f97f29b7b97abe9a2f6fb3e22b36db5440a  libva-utils-2.23.0.tar.gz
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 0536f022d2..3fdb6bcf70 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.22.0
+LIBVA_UTILS_VERSION = 2.23.0
 LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
