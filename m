Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FAACD4F26
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 15:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2107613E1;
	Sat, 20 Jun 2026 15:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reYCybxeMUA7; Sat, 20 Jun 2026 15:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 122BA61439
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781970722;
	bh=2SPW3YVeos+afoVvSX7jnj8CgGnE2l1D2x+Sy8wrKOQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HoKImxqB+FuCWhJFLI+dw6fbgW+cIV147y3YmjNC2n/b7kIKbiBsGZ4YW0+exvV8J
	 Nzrw7+MjJd96mJuqRnWKBnWMFZuiFhkYrm0JpjrXzktECCBnDLeBWtPta1ob5Uejz0
	 L4ZX4nzuy27g1P3LZNvCAGa6WXjokkU9Xmp89ofpKyuKa4qzpAnjB5jPS9cv+sliib
	 wh+G6NcXhRgB4fCc+TO9x8ZHjfExUvIcVJ7fPl3bYXbQjgvvh76ksXGmjvef6APREb
	 ZeDjGFLecyzP7apsUrb3Hn95Pabt+T4hse29lwpqJ3qiInXfYojP0ik3Ujfx+E9ycq
	 4DHejtmmvmxxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 122BA61439;
	Sat, 20 Jun 2026 15:52:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A402324D
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 841544EC35
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHxflq4O5Z3M for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 15:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DBE04EC31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DBE04EC31
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DBE04EC31
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:52:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 975E1A4C10F6;
 Sat, 20 Jun 2026 17:51:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56322)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1waxzC-000000000Ss-19Ta;
 Sat, 20 Jun 2026 15:51:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2026 17:51:58 +0200
Message-ID: <20260620155158.3271308-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781970718;
 bh=F7uIFGcV2q84bxqv5IOYiijIVHAeYP7/k2h49NIVFW0=;
 h=From:To:Cc:Subject:Date:From;
 b=X8QO9FvR3Qkgq2r0ji8sR2eDpXbiknM6hCQZfhazWDxNbBLwzMG2Ucm6OXFAU+9D5
 2uypXO7s3Qg5jlc4CESgq+mProQI6rf4x2jZfe8+hLyI6lzlbF3eW4T+KP94x68eeS
 iAlepTIrdxb4XlTJv/Rrc1mPj5B3gPbg0Pa3N8h22UsCbCiGKJMWOek3lcOQG46bJM
 qekZ0BCq6GIp8/coo7fdGSxr1ELQ+Cm79zcVk4y2IXIbOmY1RooBMWVaftP/lvoCH2
 53Oj586Y9pB51c7xzw6/joSu4/IdGupEIM49C0kaBmTrznwKQKl+NdlLZM6ELjQV+S
 0dp2mseQmCuLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=X8QO9FvR
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.3.4
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

https://cmake.org/cmake/help/latest/release/4.3.html#id4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3be2885778709d33814a21d3c55714cebfccddd7

 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index af7c7dd72b..8b6572c558 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.3/cmake-4.3.3-SHA-256.txt
-sha256  cba4bb7a44edf2877bb6f059932896383babe435b3a8c3b5df48b4aa41c9bb85  cmake-4.3.3.tar.gz
+# From https://cmake.org/files/v4.3/cmake-4.3.4-SHA-256.txt
+sha256  fdeff897b9eb49d764539f2b1edc6eb7e1440df325678a97c1978499e931adda  cmake-4.3.4.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 6971232f76..1422f80a70 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.3
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).4
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
