Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0B4CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 08:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0472360F72;
	Sun, 26 Oct 2025 08:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhKmWkL1-5d4; Sun, 26 Oct 2025 08:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1746B60F15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1746B60F15;
	Sun, 26 Oct 2025 08:28:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C494125B
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 08:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB17960F14
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 08:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skEn7oFJyyN2 for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 08:28:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D6A5F60D90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6A5F60D90
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6A5F60D90
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 08:28:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8477A4C4782;
 Sun, 26 Oct 2025 09:28:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53910)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vCw6f-000000000gv-24w9;
 Sun, 26 Oct 2025 08:28:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun, 26 Oct 2025 09:27:57 +0100
Message-ID: <20251026082757.252631-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251026082757.252631-1-bernd@kuhls.net>
References: <20251026082757.252631-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761467285;
 bh=LP4Vh+nZi9tcarEIXVYZSQ6nB+/ZBTWOr3fCuXiL0Sc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Sbzk4uNIO/HVM+NU9k/epckIvvVcV1M6wfYzNP8Uoh1KNOab+aXSlHXwUeKKrWjeb
 aQz+/H7rCot9eYxA8sjQQkdgOiYiTKA4gXC2aoNreyQW4vawfjXGx6K97bbLzEU7WS
 ry8RoL4ADUFEotYn9XhmAi8nkRSwj4OFSdox8NCTUIn3VwymysZMa7uzGQqNRIQUu2
 GWnyiI+nGjPmZOc4JQ3jmhSkzkIth/TsxMLjqyG2YEcx1HkwV3W209Ko4x8EE8D0zJ
 t4E1bqdGMduY34OYaTrq27zpgYy+UvyPaMooREQd510Ii0AoJ0Cge77Q2qkbqlMVJG
 aYhqGefUiKPjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Sbzk4uNI
Subject: [Buildroot] [PATCH 2/2] package/libsolv: bump version to 0.7.35
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

Release notes: https://github.com/openSUSE/libsolv/blob/0.7.35/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libsolv/libsolv.hash | 2 +-
 package/libsolv/libsolv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsolv/libsolv.hash b/package/libsolv/libsolv.hash
index 97259ae93f..14726168a3 100644
--- a/package/libsolv/libsolv.hash
+++ b/package/libsolv/libsolv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ce4aa2f0e3c5c9ab99dced6a1810af3f670f1b98892394edc68ccabe7b272133  libsolv-0.7.30.tar.gz
+sha256  e6ef552846f908beb3bbf6ca718b6dd431bd8a281086d82af9a6d2a3ba919be5  libsolv-0.7.35.tar.gz
 sha256  57f15acfb29fbef7749779e096a5885c60b716633e34484a21bb717554c0198f  LICENSE.BSD
diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
index 2317d3e663..2217ef499b 100644
--- a/package/libsolv/libsolv.mk
+++ b/package/libsolv/libsolv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOLV_VERSION = 0.7.30
+LIBSOLV_VERSION = 0.7.35
 LIBSOLV_SITE = $(call github,openSUSE,libsolv,$(LIBSOLV_VERSION))
 LIBSOLV_LICENSE = BSD-3-Clause
 LIBSOLV_LICENSE_FILES = LICENSE.BSD
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
