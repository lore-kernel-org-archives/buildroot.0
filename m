Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72180C79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 21:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEBAF40680;
	Tue,  8 Sep 2026 21:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q000DJnK6jQ9; Tue,  8 Sep 2026 21:32:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BAC234066C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788903159;
	b=AkRzKBpm663uNbyw4sJh0BUkaYDy1s8bQHbc4uCYDNJh1lRWkVDMa8c6FPAYAKNEQyn1
	 QQzEt5QQzLX7Qiey7Ed8k0/jWRcN/idx4EuDFvOBqVfJ+ZIpyU2vC6tok93N8O/XKHEZI
	 B5mQTFAMfPC9EWsi0+MVrqsAXlH9VIcKHvNdOLXnel2f1bnip1Q3GlmrSuTltWJDOcDrR
	 uMrdLSHJ3TM01TOcwbpCDEiV8fK0PBHpK0Of/Ro8wql9s5lCIqi+8pcziU6sDkv3PFlA3
	 PkdIhayo1toxu/g6CuxnA3JV4zfYiMN0cDa4r4JZVITkN4YTuN5+kJDidSBpl6H6aDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788903159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=BEn5LVGVOrJq/QAFspJqumgLrcDJ7hStKGwuL3Ar0Gw=;
	b=eiPMvPlHdd4Glf7FYwFkT1Ht6k2N/EwGFmfen6Ikn+UKQD1rZuQ/UkCE0DCTiAdFHgya
	 oGFS1SPhjQiY/dsGu9670UjXewt+X/Ig9tGH0E59OMGAPoSklHelFWICuYkUfGDImq6ZJ
	 lDF/eoCa2xuXWhB2OA15h/cAPpULqPEVjuE/pdPlfCO0gwfH/s6xZLF6KzyHgjvitiGDE
	 HIHVOgMTRZ8UYu6NwIrojZuS3rKn6r596BG4r3Jif8Qvu8L45mjAA603xD2OLidSwFxpd
	 t5QbePKgFIn3pssW00vGBXT12KQeRjqFMKgH/VtgnXa1ufNjQEtpFfcnlt3U1PZUrAQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788903159;
	bh=BEn5LVGVOrJq/QAFspJqumgLrcDJ7hStKGwuL3Ar0Gw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bQJLWgEWk7n4ezZ5mhqf6rK4YT3YRtIt8W0m+RxemD7c9VU2Qj4KpvLBHXd7DHOhl
	 tf0p/IhdLuTcziwl+SULZXpnDs0Oz0Tvp1O31hxZg8kRSduSZSW8suReUc3ENRFY+X
	 L5kGWhEXhrWnO2MFZMCiLBdw0wqpbsCvigcaDICTAKq24n05ABsXrWCbN3bjVdomeQ
	 aJejrOgrEX3vAwJBx/w7T1wSxkx8pCgvSgM1TiSuujCUCab7+djpu+GnW0xx1gVYGG
	 XbBx65v4aDZXbwMyHApzVNYeRO1k7XHaSTLB+ArAZXyk5ywJIX2jB5ni/ceat1FpA9
	 Z7t1kzdaCDHmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAC234066C;
	Tue,  8 Sep 2026 21:32:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6541A372
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5768760702
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1j0Gr4ZeUl7g for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 21:32:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E18F9606F8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788903157;
 b=rjB8XCIaFvXxZz5vHHHESqAQO47LL7YoFu5NMquPHQCrHbf/TMaWMTGLQwf9XKpMNaVf
 NXMPZaZDz3slsd64yLrIGmDhROdt1zKlyjX3GJsUXEpWJG2nCHogLFCPjmoUCun4ckwgC
 PYUofoS2pU7ItZsXQNWCQU2Vnn59wory9bBrx7Jo88x9ZILWxm15Ecjvg0L2+G6+YIQZp
 0FMRBuUEKVgIJPb3d20QFxohtpJ6aqTImL7GNmJ4+L3xabRZCollcSwvpKFk064NTr153
 oCsDOmL/oxKEl44wCDj39sIaM5x5DdVSkWbDZ+Yxk3r+r3d/q0Q7kdmZjT5GM/uc6yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788903157;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=dVPl6CU3AtOgudUqG3FrTtr0waixm+EdHO+oYLc0pg0=;
 b=U5rhvRe8xDR7ttnAyUmWPTq69wXrtCD9X6HwgeJWj6uq2UwP3KUpnn4K0p1Pmtwv2IKT
 BIk3rydajuB25o7R/Y3L3GyF/aK57bWvfOrtNwNVrb2nOSaEuEjIDqYJ0QGEZ//4w1lxc
 IYwHTprzzRDZ7PprcPBa0jQD83l5Yy+suKj0Uwv2m9A27LUlNggXJmzhPmWkB4wx+Yr1F
 qrpB6Zw+LJJq6COfoBF3Ahbzgg6f1lKfe1WpQdh/tiCn9XOEXJybJ5QGmVIRENxinPv/h
 CH3LhQLf7yaP74bZsIPhl6nkxUHQeZwzyy0HY/t39kLVW9nf/NgwHtosie054AN2Idw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZuKhV0v4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZuKhV0v4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E18F9606F8
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788903151;
 bh=dVPl6CU3AtOgudUqG3FrTtr0waixm+EdHO+oYLc0pg0=;
 h=From:To:Cc:Subject:Date:From;
 b=ZuKhV0v4ht/S759sV0U4ZUCMadP9jxaSdlAvBl2mHfzQ52bSwBnbASVMxxj/4kBnX
 Kcv+sLzNT8zk+U9ucSpfiM/C9LjM8tAzZx52oflparpn5q78wX6BjME7eKvUqwjgKz
 4ktBC9zups2BA8Zsy5viQpL1hkmkE2OGVAYUJPlRZG+zHZ5BOzcwESDe1xOXK3Ji6K
 +aFjN7K+fNR6h6OArr5bGMp4MVUNX20x2WydSh2El1qpdc+snHhuvVtOwSgbcBU7Rm
 NBc+vJtQxRUkB19mDDmbmypp23/6GOq2a9vRLK2ncD4Mo48XzAgexLkyQ2NpcaEzwP
 yb7anhOeyG0yA==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5113A4C0E1B;
 Tue,  8 Sep 2026 23:32:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53342)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x43Qd-000000005r1-3NkA;
 Tue, 08 Sep 2026 21:32:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  8 Sep 2026 23:32:28 +0200
Message-ID: <20260908213231.2542239-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/4] package/snort3: needs gcc >= 8
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

Buildroot commit 5e78c6cf3323b4a45f84bcbc504f511dd268e270 bumped the
package to version 3.11.1.0 which first included upstream commit
https://github.com/snort3/snort3/commit/a8484408d181aad8e78b0b1e44a5bc05206a44ae

which makes use of '#include <filesystem>' that requires gcc >= 8.

Fixes build error found by the Gitlab autobuilders with defconfig
bootlin-aarch64-glibc-old which occured after removing ' = 0' from
src/main/snort.h, line 72, which fixed a previous build error:

output/build/snort3-3.12.2.0/src/flow/dump_flows.cc:26:22:
 fatal error: filesystem: No such file or directory
 #include <filesystem>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/f4cb6546911bbbad6d372ec48f2ea849497f870d

 package/snort3/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snort3/Config.in b/package/snort3/Config.in
index 4680b13a4d..9958199ba7 100644
--- a/package/snort3/Config.in
+++ b/package/snort3/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_SNORT3
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # daq3
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	depends on BR2_TOOLCHAIN_HAS_THREADS # daq3, hwloc
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_DAQ3
@@ -34,10 +34,10 @@ config BR2_PACKAGE_SNORT3
 
 	  https://www.snort.org/snort3
 
-comment "snort3 needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9"
+comment "snort3 needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 8"
 	depends on !BR2_PACKAGE_LUA
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
