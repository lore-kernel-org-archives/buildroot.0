Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0142FC79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 16:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9031809A4;
	Sun,  6 Sep 2026 16:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZs6PXsChKUk; Sun,  6 Sep 2026 16:52:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A1570809CF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788713529;
	b=MbiYiff9eqjfTJJh/Rhbl8bGbfhTI14p/lVBOxHdysgdzUlhc/t06eZrZ5oG+cl53A/u
	 o5Q9W0BDVOrpQwCk9dhxK7lkj5bFu2Sae1pL/XLCDhPg6vitlXRUeaMmAsBf6Pi934Umi
	 OxhvO/rBUsjjmbmoWXnjAy5wu6gcSSLS7ALh7CpKb/s2Y2hIXNsFmqBvfB2fRkkviQwZb
	 36ESDTaYvOez5BVHkghCpc7MrYsMfbX432wpWPsg8eumrsgpkc/+dRTLdUT8DUpTbFGqr
	 3znfpRj+EHTIe41qL4TubPrd36DNx0DaqxomiQpCSxpLlFbE03sIl8sA2k6UAAL7mIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788713529;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H6ZNfHgtmvRG3RzgAubteA89BM1ijZsWvR1qbuDQDwI=;
	b=Ss2GOcdVt6Gw7mVXPxp5PXSEdip3YwLwAfFqzMeO/YIci8BR2xmk4qvhMDTq/dhb/fwh
	 LrWCH+tist6o7lO0D995n/e6bs3ffBgsKkMzlghXqDBYcRapT4DHZLBUlojfuFYStEnAR
	 YrzLlKGhlgZ17V1NFoKScqTvehJA+Nn1C+XbdSagLrDJspwB647ojk9XvuYex2DQZ0A8T
	 m/6UALwiFqLDyYdo6CF1J+k3pYqb4kr5n+XAbzNuDMrzTBTog5QLHs65zvywoWpc1GX4a
	 aVzGNmmj4fuPx9AHzm+HvZK/63bLNbmCLRWIgEwE0uo8GBwLivw58CmQ+WDFvjoD+dQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788713529;
	bh=H6ZNfHgtmvRG3RzgAubteA89BM1ijZsWvR1qbuDQDwI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=noyjGadvNMYcsNi+XQ9hO35I9298vVeaTjRcOyr0YdIp+SW0qH5baItRzG+CZmg5v
	 dVg13nc0c/4N4hGIt3SKBJkPDw4o+bUQTTra0o0eh3/KydM6nBsJD/jZPxrMytWuzE
	 PjrXgNu/rf2KVbHGZTmJe60yYxXBf1BmqVaeaal4KVgBDu+tOdrgk3zIaGDUglxdwD
	 ps8RqcP15k95Ijiaq7qRUgpl2iqcEhE9aH8Z/MiBiVaZqZROYDvkDAVbRUe9fz+tbW
	 lY/UIASB6vbTGm93rSO2GsBTjKT9cD1bJbyw40N93RF+2gDhmnlNOadd2w9MUhUg2/
	 ybp7sTlT7WgMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1570809CF;
	Sun,  6 Sep 2026 16:52:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 820F2970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73B9540586
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTHfyXRsULa5 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 16:52:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5FAE34057A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788713526;
 b=jcZi3iy1cSX6K0rK7DKiX46fhu3gS2r05wRwRW8Um7hyWWA0PnnDLF8u4/hdfmc4k957
 rKwXf5VTA7jnO8Tsox0HITmi+Mb8LvbwA9xcjDI9SMdhZH7BTqa0eJ0f0tTgr9Kdf08Xk
 XsQLaNkW0LxkdhQ9mE+ab9s4rXQJNc3ahLvO/fUIcNUlULo2WWaYzBdK+vZT9NG+0nW/i
 kahjxtstdeqO7fTKIjC2FQjJ5E14kYYKeEzWMBUI98QnAzvD96ZIYK+81tLA7zWt+MUke
 pEfE1qPtkYDPMcu6pz+pCliouClK+9/WTk7e+s74wv0RACOrELBJm2xDLAjAxzQkFwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788713526;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ez9BdsOzCCX1qEhjqRaR/tt8QbR3w7FN0upPBmBOp6A=;
 b=fX+vB6lLcVFbozwM+l1+4Q0Iy5wO+djwiFkaIc17fIyes9VFxGIpv2jE/W+LMTKJtlAG
 gAD4Mv7OB/Q0Cc1CkHy314OjDAVUc4MFyyfjMr7R7DUlFFAUbsRE2d7a+kBfjsjgRU1l1
 9YgWAN5h0RE2IUfqQV++2tbJszhXdAFsNMAP6oP7uOMSmbd0L0uFdxGM9He8GTOWN/TVB
 0fGYOCVoQ/7loRWsqJiin55xnLqfVYeinf9XpLH5vuc0YM2MJHSUAQpw37msuV3woIzvk
 TsU7E1XJdZ2zr/tx4ztzjcm2KD1x/waNuKaUviFh8ficgH6I2qJyVLA7hn5kURM87aw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="BaddD/bY"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BaddD/bY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FAE34057A
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788713510;
 bh=ez9BdsOzCCX1qEhjqRaR/tt8QbR3w7FN0upPBmBOp6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BaddD/bYRh3U+KbUg+DfYF0V0d9n/Mam0atMyI7UUMTt/BT9LyBw/9DgmnoTX4yat
 ol0DZjcHxgU1gz8IXm1xREcOffiNi0Fzu4ND8EhEQ/oZhVArggIrfBDQP1ioiiNZcY
 xCnNap6OUBLk2Ebv/qCYOwIiy53WrXt6UKy8GlduwC4unUI9zn4h4zixOVrdLkTolR
 qJ5NIjCOzyrAC15tXG/ICgqWxWO+INSlGcdds6J9zf6lMVJTKcop11TnRrVygZ7E3V
 HyjTyjfG1ydylchiSwUBI3UN7hm2R5dhZGbVXAGcFhqTM5O+8NZWWImSiSVU0PUhGU
 FGoaraofUdZcQ==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79154A4C34E4;
 Sun,  6 Sep 2026 18:51:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44048)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3G5u-000000003tT-1KfS;
 Sun, 06 Sep 2026 16:51:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Sep 2026 18:51:49 +0200
Message-ID: <20260906165149.1035063-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906165149.1035063-1-bernd@kuhls.net>
References: <20260906165149.1035063-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 2/2] package/boinc: bump version to 8.2.15
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

https://github.com/BOINC/boinc/wiki/Client-release-notes

Upstream commit
https://github.com/BOINC/boinc/commit/72d6e36abacb0e89d9122a24ff5e44094244d022
which was first released in version 8.2.14 enabled C++17 features.

To fix a build error seen with the Gitlab pipelines with the bootlin-
aarch64-glibc-old defconfig we raise the minimum gcc version to 7.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/0b2ae2cf0276a921cb4798ada40cf13938467d0a

 package/boinc/Config.in  | 6 +++---
 package/boinc/boinc.hash | 2 +-
 package/boinc/boinc.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/boinc/Config.in b/package/boinc/Config.in
index 72d5440131..ef336a79fe 100644
--- a/package/boinc/Config.in
+++ b/package/boinc/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BOINC
 	bool "boinc"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBCURL
@@ -17,8 +17,8 @@ config BR2_PACKAGE_BOINC
 
 	  https://boinc.berkeley.edu
 
-comment "boinc needs a toolchain w/ dynamic library, C++, threads, gcc >= 4.8"
+comment "boinc needs a toolchain w/ dynamic library, C++, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index ee3168b148..47ae5e4a27 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  0697781686bd99f0294d639d19d7184f884e5d8b11ae8fae720b855f58bb3f5a  boinc-8.2.11.tar.gz
+sha256  59ab7ce2877e211ab627350544b0c21cd639ee46191d0b0d804320e539c246b2  boinc-8.2.15.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 6227d464d2..6b9db1c727 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BOINC_VERSION_MAJOR = 8.2
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).11
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).15
 BOINC_SITE = \
 	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
 BOINC_LICENSE = LGPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
