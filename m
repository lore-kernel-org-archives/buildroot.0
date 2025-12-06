Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F907D3B7D5
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 21:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BB7560644;
	Sat,  6 Dec 2025 21:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TICCC78pT4cZ; Sat,  6 Dec 2025 21:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8530660674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765057461;
	bh=uTjXSgkj14ZhCggKVltcdz4JX9hJTDcl3Gp+li5Kl50=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vs1/hxZWQZ15A90hc31PJZKR6skPveHwJQdXl78sHe4iXxBTJPHmcwa0iBgi0Ydq6
	 gr+00HbzFIvov05gLFqZmDz4h0vkmlJK9juo9Jq3tiYdmXx7UaFI9tIF4dSJUM51nq
	 Edyho1Bz0SRjec+7oBdiuXcisrIjQZfFo596dQB4u+uLR1l/tZZup2/hL3hL+s7RzH
	 42WcYAJvKkdBU5IZ8W4gz7D2oi0R7gSB6t6SBXmxGNjEB5cxbRFoKJyO0xot4yyTBq
	 HoNQKrJJMOCfoD4+Eqw1AC4PzjKbCaboBwtidA8jq1jXOJSKVcQ40rZHH5n1RK3CAx
	 fiADXjvwewBsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8530660674;
	Sat,  6 Dec 2025 21:44:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF477E7
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A18DF823CF
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHm5yJ1cE8Jg for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 21:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B50F8238E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B50F8238E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B50F8238E
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:44:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 58BC8A4C02C4;
 Sat,  6 Dec 2025 22:44:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59824)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vS04d-000000007GF-2SJg;
 Sat, 06 Dec 2025 21:44:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Steve Kenton <skenton@ou.edu>
Date: Sat,  6 Dec 2025 22:44:15 +0100
Message-ID: <20251206214415.2307196-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765057456;
 bh=KkwfQVqtouEF6kY9FXcCURq76t5ndFrATTPvS6QQO3k=;
 h=From:To:Cc:Subject:Date:From;
 b=E8wvRMRt/SPDCQWRFhudoa+tjhNstt7Cxm6o5HNbZEkWuePDnJUHmtPL+ObDr0D0L
 oKGdTL7liYcUmID6JATr6R7vYUN6bHbDo9giF1Tds7PpHpDeWToCC6VVUGyY+q3o/J
 S6mkFzE/yTV9td8X77/HNwZyaBvjuYtCeSvAirBlqcnbLC12fYS56K7QHg7bS6pXCU
 svjJe0grF2zSxZy1DILnQYNDnuHjOqfLSMS6ABbu4/+dIJ5P8juiZ8xNMZUHay9ujH
 +xTSr5kyvqhvYAJHOzU31muXeH2lN5xcLGGsK9AwYYc1qV8fgNtXe0d9oklJRFHj52
 r7G90nxpisRLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=E8wvRMRt
Subject: [Buildroot] [PATCH 1/1] package/dvdrw-tools: switch SITE to
 snapshot.debian.org
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

Original site returns 404, according to archive.org since June 2025.

Fixes:
https://autobuild.buildroot.net/results/94e/94ec9719b33a1b3a406f2e41dc3ad8f443bf2dc1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dvdrw-tools/Config.in        | 2 +-
 package/dvdrw-tools/dvdrw-tools.hash | 2 +-
 package/dvdrw-tools/dvdrw-tools.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
index d4d6bd2cd3..7f7f2be729 100644
--- a/package/dvdrw-tools/Config.in
+++ b/package/dvdrw-tools/Config.in
@@ -29,7 +29,7 @@ config BR2_PACKAGE_DVDRW_TOOLS
 	  Choose the one which seems most appropriate for your use.
 	  NOTE: xorriso does not currently support UDF.
 
-	  http://fy.chalmers.se/~appro/linux/DVD+RW/tools
+	  https://web.archive.org/web/20250512175714/http://fy.chalmers.se/~appro/linux/DVD+RW/
 
 if BR2_PACKAGE_DVDRW_TOOLS
 choice
diff --git a/package/dvdrw-tools/dvdrw-tools.hash b/package/dvdrw-tools/dvdrw-tools.hash
index a5ed6ad521..a2acbe9d86 100644
--- a/package/dvdrw-tools/dvdrw-tools.hash
+++ b/package/dvdrw-tools/dvdrw-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed using sha256sum
-sha256  f8d60f822e914128bcbc5f64fbe3ed131cbff9045dca7e12c5b77b26edde72ca  dvd+rw-tools-7.1.tar.gz
+sha256  f8d60f822e914128bcbc5f64fbe3ed131cbff9045dca7e12c5b77b26edde72ca  dvd+rw-tools_7.1.orig.tar.gz
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  LICENSE
diff --git a/package/dvdrw-tools/dvdrw-tools.mk b/package/dvdrw-tools/dvdrw-tools.mk
index 5dab546607..1dc11c0568 100644
--- a/package/dvdrw-tools/dvdrw-tools.mk
+++ b/package/dvdrw-tools/dvdrw-tools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 DVDRW_TOOLS_VERSION = 7.1
-DVDRW_TOOLS_SOURCE = dvd+rw-tools-$(DVDRW_TOOLS_VERSION).tar.gz
-DVDRW_TOOLS_SITE = http://fy.chalmers.se/~appro/linux/DVD+RW/tools
+DVDRW_TOOLS_SOURCE = dvd+rw-tools_$(DVDRW_TOOLS_VERSION).orig.tar.gz
+DVDRW_TOOLS_SITE = https://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool/main/d/dvd+rw-tools
 DVDRW_TOOLS_LICENSE = GPL-2.0
 DVDRW_TOOLS_LICENSE_FILES = LICENSE
 DVDRW_TOOLS_DEPENDENCIES = host-m4
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
