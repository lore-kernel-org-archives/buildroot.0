Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F059DD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B2A60750;
	Sun,  7 Dec 2025 14:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hL4hNyFgfjRd; Sun,  7 Dec 2025 14:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37C6D605A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117630;
	bh=lFgX7VCuJqYcAszRfPMch2GQhtlLi4EcT4L41thmffM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sw+JbIIfPTTwQfCOjGqcwEvt9KZtQK/hLpnm3esPA16iZnpyPHKuU4VC87l09FHCs
	 Nu3ChkUpIkZ8qBN6d9rDDIPsOgvqMrHl0xpZYrl6UHMAlgwIgZWNodyjPZshY5T1FM
	 cc+a0Awu/zsj5C2jG006sOoAE0TgMu7Ko6xdOrsArKs0MKX4FWCwcjoN6pcrjT8FtT
	 tkkhlpfUtbd0UXmEMi1krfG74m6xA3Up9Zxvv2/5DZ8LzyjrOrtxJClUug+jEgFxOV
	 iwonAazHuXcbo9gh8SqIWp2ipQw/N4DKz4uPQAAyZ01wkwWBEfr0QUfvnHVqM7D/qh
	 PY9LauEtiKUuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37C6D605A4;
	Sun,  7 Dec 2025 14:27:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DCCE72CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA7DE40259
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6pwsDw33Qm3 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 801D640166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 801D640166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 801D640166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C16E5A4C0937;
 Sun,  7 Dec 2025 15:26:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFit-000000001Fk-0Cvl;
 Sun, 07 Dec 2025 14:26:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:39 +0100
Message-ID: <20251207142651.3695074-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117611;
 bh=P+j72GgbpAgT5LHJVFgmrbBTb85r7uXYzOw14dVBPwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tkLTP+J36gOzg8YdJwbDhKdMsFcBV1nzXUdQSaXV9wMjzthuFf60UieNdA+j9gcmm
 ZxazpFByxVMoTkAiLAjrQcGCYOGEohpIzc4IaWDzhj6y33xShylzoc07C8Nrc1cCSx
 LNTdJ7oCxTYAig9k7uflv+jznSv9zzfgrIwJlRPR3SMtx+yKyZKOWMRO//NCxrIJC4
 Kec+fvsebUiqN6R2Lh+2p+HeSbaiKEC/kY8wTScl6+vGK/qPMoW++77qncnjUbJxPr
 OrvKL0wHsyOp4tGCpLdLPd/TMS3d7Oj6bFksz3qJpligkgX72M1rQ0x3dP+ScpPS98
 zGSEO/Vwc5XZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=tkLTP+J3
Subject: [Buildroot] [PATCH/next 02/14] package/rtl_433: fix cmake 4
 compatibility
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
 ...d-Update-for-compat-with-newer-CMake.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch

diff --git a/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch b/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch
new file mode 100644
index 0000000000..81cb5cd094
--- /dev/null
+++ b/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch
@@ -0,0 +1,25 @@
+From 42ac641452aa56afa04f7bad5a55f790ee639852 Mon Sep 17 00:00:00 2001
+From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
+Date: Sun, 30 Mar 2025 12:05:53 +0200
+Subject: [PATCH] build: Update for compat with newer CMake (closes #3245)
+
+Upstream: https://github.com/merbanan/rtl_433/commit/42ac641452aa56afa04f7bad5a55f790ee639852
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 08f63eea7..6dc1f7910 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ ########################################################################
+ # Project setup
+ ########################################################################
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 2.6...3.10)
+ # Fix behavior of CMAKE_C_STANDARD when targeting macOS.
+ if(POLICY CMP0025)
+     cmake_policy(SET CMP0025 NEW)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
