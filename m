Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2914CD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD99360AD4;
	Sun,  7 Dec 2025 14:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toWS2nj1gwat; Sun,  7 Dec 2025 14:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D8F605A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117656;
	bh=acWwSemrmOFjM8L1kk5XCvDYO9/3UFjE/MJAPLqUihY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJmFcnONxBdjaegTPyvPfBffAKhqEfvn42PpE3tZdMjoGdnvLVplLgQNqc/rXg4a5
	 YtvCocAWNPRIFPXa4o5fZZBhCmSCB28stdGsBGXNjsmm7EUDoyZrnE4CiWtWQX6r+r
	 WEGFfaB/stPFCG6OAe8YDhYN8ARrNwZcIHKSr9bdbH+ms3k5utnN/hAunUezazMOj8
	 MBMKkjSeP2s/71TpuXoHesNXwEkbNTOAokVEoGD0FtWkgQG/g0rVqe284y3xHZToHk
	 lBingvB7ZPL5mih+8Tpj6M9AmNBx3q+NtckVDhsGQfVg7QxKOn0OMp4zCGi0YDMunk
	 potAuNgJSeeRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D8F605A4;
	Sun,  7 Dec 2025 14:27:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DDA572CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3981605A4
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id deaY4tm0c1XT for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A658E60594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A658E60594
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A658E60594
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02C32A4C0965;
 Sun,  7 Dec 2025 15:26:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFiu-000000001Fk-0PP2;
 Sun, 07 Dec 2025 14:26:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:50 +0100
Message-ID: <20251207142651.3695074-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117619;
 bh=tofl3JZoku7yHQj+1MkrDd4tS64W5ysflokZlAanzrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aO2CTKHy2ScmZb/9yvFB3uaj1C6Rp4N32kjIeuaOiC0qEw+bpKtjh/tjSjvs7WevU
 t4MIEyNOEK5sfBLOi8L3T2Vu0OHC8UFLtaQ6mvLk4ZgMGqnAeWTT/aX7/unEJsqaWK
 cwLrMgcZLm3ThQ74hC02s6fcq1QrEpFTFSFs01ZOggZIPaiaIHkfXzhAakio5OPQAx
 a/NNggy/HIJs9xgmZp+dIhL+HCLcLw0OR5rvsMKc/31SFwMbV85QmKmoNoo/oCohb/
 uxVOWWwcLekdvvHpgYZUsvq34wU7I3ymseBj2z26TZg2212qwud3qSNUlUoDxX6K+D
 OLLWHsPpsQHTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=aO2CTKHy
Subject: [Buildroot] [PATCH/next 13/14] package/ympd: fix cmake 4
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
 ...-bump-required-cmake-version-to-3.10.patch | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/ympd/0003-bump-required-cmake-version-to-3.10.patch

diff --git a/package/ympd/0003-bump-required-cmake-version-to-3.10.patch b/package/ympd/0003-bump-required-cmake-version-to-3.10.patch
new file mode 100644
index 0000000000..72a1966d77
--- /dev/null
+++ b/package/ympd/0003-bump-required-cmake-version-to-3.10.patch
@@ -0,0 +1,22 @@
+From 5c5862071e7ae982de6f39c9d1679dc496f38a20 Mon Sep 17 00:00:00 2001
+From: "Felix J. Ogris" <fjo@core7.intra.ogris.net>
+Date: Fri, 20 Jun 2025 15:10:38 +0200
+Subject: [PATCH] bump required cmake version to 3.10
+
+Upstream: https://github.com/notandy/ympd/pull/199
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 02ee5141d..a8ee3730d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.10)
+ 
+ project (ympd C)
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
