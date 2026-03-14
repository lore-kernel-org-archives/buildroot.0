Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E9B10706CD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 12:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A6E860733;
	Sat, 14 Mar 2026 12:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7_U0Rw2JVX7; Sat, 14 Mar 2026 12:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC3FD6075D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773491554;
	bh=EXftHmkAmVl+zXVlz/lst13F84WH4RvrX6Xi/U1wn3Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lGW6erVOVoQEeOWx9oVHE19y+XnJeOHHQxtKfpiKz0AKk7afJnZMQg5UyxPrbpR1V
	 edLnZ2lj1KShSG8ekG0ppyYIRwtVjVzXHRnEK8t3s3j/EGBdZ8TFmYdvKAkjsFhh+i
	 f/Q3odU8XPkaxJhK4xhSHxhiymW7Mwx5xMKPrVMQJuKhx9BuRMPnZaclonyUTCaUg5
	 bYfNtByoc0Pt7F0xk1ZYU77yofja/HCEqhPcD8n/lXq6T7WSRV/PXeTShw5M4dfr/E
	 1nduUEIgiHNhCTXhllFOnff8M4qvYE8vCcPc8AS/LCaO+k6Lmk4BJastjMfII8n6oj
	 cDbrgCQZdetDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC3FD6075D;
	Sat, 14 Mar 2026 12:32:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AD1A201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 12:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20C9F40786
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 12:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Us4HOUcfYXnU for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 12:32:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EED9E40785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EED9E40785
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EED9E40785
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 12:32:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4831FA4C0E21
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 13:32:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37614)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1OAP-000000003lN-3wXB
 for buildroot@buildroot.org; Sat, 14 Mar 2026 12:32:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 13:32:29 +0100
Message-ID: <20260314123229.1234005-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773491550;
 bh=PTjlev1DxjugYlUswYwBTEdwDWH0MNfjjduchSkNyuU=;
 h=From:To:Subject:Date:From;
 b=a5wFmRRDuwTMg2PJ6nWu577W0lBw2KP2aHZDCZguwWmzRs7M/+uuQmEZaFYojbhaU
 hk29S6YWRxmjSNXbaS3cnWvO6lBTyRyz1vGloFYflrAM5Bz9binwtZhnBGxSY+HgPu
 d8HFuh8NZq6KCadGU1c83gUK2FrWA7E1wRD61KHi1XiWZBLw/8YFLcaUYETDxoeaC3
 0hf8Q9ccEc0KF/uVuevgmBfzZ4VOFFmWzViVls/GSmjmtWVs+esVMjHMfw5GD5pSwK
 jVXIdcwu0TQgKXl3xkusF5BN9Me9wZcitK8QJeTmnAY/JB0b6o/i+tcilxnBhB3EMg
 eMltMgqUek40g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=a5wFmRRD
Subject: [Buildroot] [PATCH 1/1] package/xz: bump version to 5.8.2
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

https://github.com/tukaani-project/xz/releases/tag/v5.8.2
"- Fix the build on ARM64 on glibc versions older than
   2.24 (2016). They don't have HWCAP_CRC32 in <sys/auxv.h>."

Updated license hashes due to upstream commit
https://github.com/tukaani-project/xz/commit/6d287a3ae90e1b990294f3d5264003d81e853c5e

Fixes:
https://autobuild.buildroot.net/results/b0d/b0dbae7b2c884f5fef0017755b28932a83921a5a/
"check/crc32_arm64.h:27:25: fatal error: sys/auxv.h: No such file or directory
   27 | #               include <sys/auxv.h>"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xz/xz.hash | 8 ++++----
 package/xz/xz.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 0e0618ec02..99daa5e9df 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,11 +1,11 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.8.1/xz-5.8.1.tar.bz2.sig
+# https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.bz2.sig
 # using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-sha256  5965c692c4c8800cd4b33ce6d0f6ac9ac9d6ab227b17c512b6561bce4f08d47e  xz-5.8.1.tar.bz2
+sha256  60345d7c0b9c8d7ffa469e96898c300def3669f5047fc76219b819340839f3d8  xz-5.8.2.tar.bz2
 
 # Hash for license files
 sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
 sha256  0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74bf1  COPYING.0BSD
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING.GPLv2
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index b1e210a172..8aa0716b18 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.8.1
+XZ_VERSION = 5.8.2
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
