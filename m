Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F245CC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 11:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90CF440A70;
	Sun, 20 Sep 2026 11:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwrpYJoXNyox; Sun, 20 Sep 2026 11:51:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 712BB40A72
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789905095;
	b=a7D2ENhK6YD/WpwFB7csC5TJo1vkKwDN69wIpi1FMydowPAeW3VJe69KGk6kj9lguluo
	 rfgX24plgl4tGgAi2Oa5Q42swmls6OrJbq6jO7PwdC4dJft4igJeuWUEUYKt8RBNBMnF7
	 kWoUrK3jfda+u3kNhhBR12h3h/3LSZ51qeb2KtzZpkdzEz3kQ7BgD1eVduw/Bi4IhXEZF
	 tT3GUrl/c94dLytPFW/rbP5YboJZmr/StuRL6JRKPK44T6mUjVBd1nS18VxMUw188bHNV
	 zJ8K/v4HCyz0iBnyYBpsGEOV7ROdV7qkonIlOYSCrHIImSfTxgHwO+aCZjP9ogOYg4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789905095;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yIQjnzay0XT3T89xYq6sihqjj8f98U1gV9If4LksYh4=;
	b=Nsyi4INcko/9G6PBsY950sTmGMs1t+TKGxSXMtudDy2bxMk3RfsR0ZEMTwqfUCymRdYz
	 kvoSSYizXxbrLYEDCvmmToetpwlL2EkKn5dySXEZTiZ0OA8YCVnoL3pPM6/dzppD941F6
	 dKbBs/3H9wtvxyRpAiiwwohNXVryJ0uVYMH867pRIp32J4df76Zz+N6zy2kGDK0LW1CyN
	 MYiqcEPsgHJuBqxtT14mGzJaeTyKRI0VnOAcj+hSfbxaWt9/2VWZbDUpDEl3nhUOSKVyJ
	 URYx8jv00durQKh4YGtOHi8PSvYH52QioSgL5quIan+MvIbZus6pZ6VGJ+V2J6Ne3vw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789905095;
	bh=yIQjnzay0XT3T89xYq6sihqjj8f98U1gV9If4LksYh4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mbkilMpLkaPApsNjSFtJTCU7w2sK1ikTrXzQqCweKrOS//zo/0ohKk1zuuyODksu9
	 /QtmIUMOQCaZSQuuoqUixAXPzsDGKAW0AEdxBuzcOvAn/1esnGFSWCPSUNr5yCZ3ce
	 0r2YRnAArgM1TYntDEBl2vfdLV2H308XhM1YKzYHdW+88OXklrznH585tZqtWy1CWn
	 vhCzqHnttjiw9v9XE4uITUsS80dWxk5286831Pm9CaNW55Hk95W9TX8e9Uzllpdiig
	 IEhlrZ4LsKOh6P3j28hvZhurPfDdGQAu1R+owlJWRU/uH1k46WQW5FFT4pljE/XlVd
	 +ZShzeXbQgnsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712BB40A72;
	Sun, 20 Sep 2026 11:51:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DDAD224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22BAE6065C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwKUb025A-OT for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 11:51:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 726436063A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789905093;
 b=EGsie1dlTszlpFU4WF0VYe4NA3CXvHHaT/qPzqBwIo5FO5zf6qpRpO+/f3fYzJJrZl/2
 cV9Voo0QdyotfTDXs+lBBn0jGOfhveUEw7TdRhTaDeZ2qyJ6EUGsqDFMDuWj9Z1/X6v/Q
 NVM8EiTf//K3dewECm3wIDj3j66Ppcp+vXNBtuFYTwtVLod9EqulKvpxX6LPVBg3GnQ3v
 6OQMsNDCLvTjr0byaqzcF+9hRyKvIQ003Fuv5AbAwLE8fJqiYMfeHfbBlzD0aMIbR9/fa
 rFLRT4WFSIhKdfxYSislvQmZmYZD+w5qRPgIpbiy/TqVet6KyIFeNqc/5D0BKFP5uig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789905093;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=YD4jFgi8W4rLZ5gv8DaZ99x4CU9XqXmquADTo2K/MOw=;
 b=DoJCfxWGxTyLLtVjZ4KxDLoCH2mvOL5arf0nv/EHiFb2sdmGO15bWxrST/Op7d1lijHF
 NremZnjl0GM4ACrSxhxou4lJu2lLX0qvYPpNktMTy8LBEdmzgHKgkQsVYZNzTulWB4nC2
 5nCDm2GTvCTNexfW4xwl0a2wM/M7mTfuopZRnotxylIvEUSuAX1YNxYVf3pQn3qmhIt3f
 Z6UxGzKtU3BAMazbJ4iJv0lw09RKalTXYsGdVADUmnt6b/pHz4UXqtQg0Os6bGE5ozDBQ
 Bmqpwwgq7kH5TyErr0qno/J6TCTIBD0WY5Z2TGeGrfEsDSl32R2CaaWrElkt6xF478A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="NZLE/cQ/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=NZLE/cQ/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 726436063A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789905087;
 bh=YD4jFgi8W4rLZ5gv8DaZ99x4CU9XqXmquADTo2K/MOw=;
 h=From:To:Subject:Date:From;
 b=NZLE/cQ/KYiEItdOa1+N6+AYDzDlUnQEYh/sYXNzwIg7Iez+wznbjcC6MZshYoZXa
 sEdHuaSC4ryUR1pfif4XTLe/DrK411FJeK8p/3MKQrtaFXfyvp5tTyLqjqh+hPUNmQ
 MPGJMApUfaVDFHHtECP2H2RfNkb0Cbwp2QPqOXcUNiy2LceE70P8P3qrPuScLetF+g
 QWsnAse0T9VLVo4A51uBR1M3kU4ZHhby/YvWE6wT5qy+hfxYy0Pt7p/7uRsYPxZuv0
 HcqzjgT+UQ341HwQMY9UZjaCGunWSv9tBag6Pu5ofU6rx/LL2LYoQaRKA1VoFtjKhr
 +aJME3vEtwl+A==
X-KAS-Sym: v3:f51bdf72230551df:FC8XpElimLVtI2M8YwnPIVv+vsvG0Fp1yQI0x9+kfBFCp2dTOKiteRqhiZxnvafBmHs9/u5hf5mJId7RU3h0Gd4Z3lP/G5zUr1EyBQ2t51ZqLTB9hJk9ajQN+7tEbHxNtKTExyxrfREN6CtL7usk0yJWPOxKjYyv2JXlvTL6mCZPc7OWnvXh7B3GvEWK8eAQZbM+1bYH+YI1QbPOD9j67L0QV5y4eKQ6TBdvLuG6vaHu3ynMcfTLtyAzVWAV0g+Iy9pOY74ItJp0u6NBRqU8q5XjmjbgPABbtLVOr9Masnyx4laANrLnL6vhMTA0Z9uvF5eipFK25cJmfPoJ+yoo5A==:7GLCA3wsRq/DVMIlctFoliGMJG3je0QLI9K32yDKnr/SgHmXIddrG1C0HJbm9BrefPsDM2JMf9xyrOntpNcGXHiWQo+ZxOTRvEhDwvhZVVJFH4A1OGwhb6yv1ClD7708LrVASU1n/ohK4xIk9LPTyaPDRGlKpY+eU1k+E2l8uNdNxm+ByICYJPipGepGyhHRJSbX+g/cby/rXoXIcd2tVFDjI/XecTO//5n3j9PEXLmvAGfV1hVohVsQWG8JF9tHtf8XQ3tbXEcPjaOXZ/nLqx9vphlFo093YyeJzuw1xmw7YK3g8bRgBmxKXqkzw1bg25v82AZEMQ07uvdBXF2L9r4xKKVe9yB7e9Dvrbz45eo0AchCgCWTbUIcIbXZRjkpCaMu3yUPQyUDH+AmcydWHAbWwy3Eimm3iuCZSOhLVphCeBNZuzDiCfZLMtQs0YuWhwM2HavVvVY32XAm4JpRKsMxA4t/5qNARSzQImsjY21czY3fcJVtB1v6goz/ZpZ80RHvd8Ago4qzmboJ+qHytF2aT4kTQOYP1Nm7ZuPEhPNvpJvI2ultANUdHfJn+SoZjDmLrZByg3AdaC4BgxagoESuPS00IyPToOIXdI2S9vyULK
 wm
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 50FA7A4C469D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:51:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57566)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8G4t-000000003qT-060B
 for buildroot@buildroot.org; Sun, 20 Sep 2026 11:51:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 13:51:26 +0200
Message-ID: <20260920115126.1062295-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v3 1/1] package/libdeflate: bump version to 1.26
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

https://github.com/ebiggers/libdeflate/blob/v1.26/NEWS.md

Switched to sha256 tarball hash provided by upstream.

Depends on gcc >= 4.8 because "libdeflate now requires a C11 compiler":
https://github.com/ebiggers/libdeflate/commit/a7cbb2258188cd459e436b0c0a1e4b892e2b1ac7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: fixed C11 comment (Thomas)
v2: Added dependency to gcc >= 4.8 (Thomas)

Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/c4b6c7b32132ae1237554fa6c0b3cda3a3cebc54

 package/libdeflate/Config.in       | 4 ++++
 package/libdeflate/libdeflate.hash | 3 ++-
 package/libdeflate/libdeflate.mk   | 2 +-
 package/tiff/Config.in             | 4 ++++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/libdeflate/Config.in b/package/libdeflate/Config.in
index d2fb0d6c55..462ab02d14 100644
--- a/package/libdeflate/Config.in
+++ b/package/libdeflate/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBDEFLATE
 	bool "libdeflate"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C11
 	help
 	  Libdeflate is a heavily optimized library for DEFLATE/zlib/
 	  gzip compression and decompression
 
 	  https://github.com/ebiggers/libdeflate
+
+comment "libdeflate needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index 24aad4a799..851926182f 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,4 @@
+# From https://github.com/ebiggers/libdeflate/releases/tag/v1.26
+sha256  125856d4656e0feab660f94842f835923410c9281fedbcee64598c918da42b5a  libdeflate-1.26.tar.gz
 # Locally computed
-sha256  fed5cd22f00f30cc4c2e5329f94e2b8a901df9fa45ee255cb70e2b0b42344477  libdeflate-1.25.tar.gz
 sha256  4ad69099cb4374836fd27583d9991e2838cd86b6e4666ab26b2d32582c91e73a  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 889e04c97b..a0b99cbf23 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.25
+LIBDEFLATE_VERSION = 1.26
 LIBDEFLATE_SITE = https://github.com/ebiggers/libdeflate/releases/download/v$(LIBDEFLATE_VERSION)
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index d357d08406..ff5bbd2355 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -13,9 +13,13 @@ config BR2_PACKAGE_TIFF_CCITT
 
 config BR2_PACKAGE_TIFF_LIBDEFLATE
 	bool "Libdeflate usage (still requires Zlib)"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libdeflate
 	select BR2_PACKAGE_LIBDEFLATE
 	select BR2_PACKAGE_TIFF_ZLIB
 
+comment "libdeflate usage needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_TIFF_PACKBITS
 	bool "Macintosh PackBits algorithm"
 	default y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
