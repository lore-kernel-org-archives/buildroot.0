Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E3CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7343B80F40;
	Tue, 29 Sep 2026 18:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 881GqhVOvvln; Tue, 29 Sep 2026 18:36:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 769DC80F01
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707009;
	b=TeCfetCTWH6Ro1tj97dihp2NuyLW0w429Nxkk1+8LQ6C5hIZR6R4mq+0Ata6chX3WRIk
	 kTCjgZJzvKo+7J2kWHgQmEPIBVnbxpcU54ghMeWyHejnvCSylrHBGPsinSa7P4hUis3eA
	 MR0bI5CNyaaoen9IWe3k3uqpRB4xz1bt9AE1i14iYNQou9sjG7VY7oOhj24eMfR+VuVvb
	 NmOIKyZw3Hn+mxkbgjosDb1jheQmgHIqGWK7gWQc9e4cWRCi0rlH9+LSdxbSMIpQoVXEN
	 E/xv062Khw1ul8kOzaRiFD5Dp4tNmFsf4V8zg0mw0gyAznpdmxlZs9GjUCI0l3K0TbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707009;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7hDSbH83Zi8KYwvdj3RTG0kdn/6rsS7wWLlSBrFBoEY=;
	b=pEjg+ChKZfQj3DyCwUL/o+gqj6+zYx8e/1nU1cJGXPErjNV/2sV+IdjrfZMKHxdyWcCr
	 nWDmXRN0ZbKDQSgkhkxjdVsp4evjddng3RjUEkdGv8qu+dwmLmVRc4sB8mujGPyznByt+
	 dlm1wIdErr0CdMKNBfDhBezvboj0uP0cV26Szjt5uhobN2DywxG0tTacSBCtX0OVoDpbN
	 WBavhwAqGmjPTX+puS9a2PD6RHFJTSct8tXW953Oy5BWPV/2Jlg9bYOfIQMGfTNsqVYie
	 HwpkHHS3UWBs0lf2blg6gRJcKSoTpVvtgW5LWShP6hKRHxF9uIb/q3qXSiGlNd3EMHA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707009;
	bh=7hDSbH83Zi8KYwvdj3RTG0kdn/6rsS7wWLlSBrFBoEY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jyldKUk+KzZ6XTAIYinsdbNMisfrZb72WEzZZq4kf4iJPbLalvb4NI65hGwnpzm/B
	 b78rPqM5YjFQzEBOEhFyXHGtuPSXtfYQyGQbXmY3SKtq/K3rKXmNJwP8cKQPNo3lrt
	 zZ/8IHdzpmbBPr3RtoRN9/5cSiP3XLzYa4/FFwkEbFcU9ubcrgl+2WAyGyLsug7SO9
	 BMDvDjvg2bXFE6GYLvka6OcD3ktdNrsAWaeSQkgvxNKMwZPfG7QA3S39XzZv6kiJs5
	 Qd0ddyna/6PXBrBV7k6kl9yd4+KXEKfCQq2WMxz+WOjL8GZgQRGDm8VS2GL8ohWF9Z
	 0I1k9VD5p+VmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 769DC80F01;
	Tue, 29 Sep 2026 18:36:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C94B014C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAD2C4065B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6rtpQhijXHX for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:36:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AC6CF405C9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707008;
 b=h8jOj5Z+OoQTUGC7Flb26xWIDo72gmk9SfyQV+nC+TcSlMcmGBIG9HZDe0yzYLN8uxbD
 TzBRyRbQMew7h2THB93CwJuLmUEaNf67CDu17xRQ0a6BC1jfk98dLinHQDUDQlpCVp/1T
 ScbkBZjJ63xpQzlyEyKwd551aPzuKPdxyx9YbqJ5TlL7KtnKjY9N1B/gb4JariHVvcWVa
 MOsHWF3AZINRkwcBYLorPNUFrAjFcJRFiu/l2tRl4xTwmjHEFI1snxMtd35p3OWIhULjr
 MxRXbHn/ZPhWC67MYerh11qebQ/z367vbr2IzPPhTOoYblzVsUuVLOOkY1K+kIuCXpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707008;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=2Rgr+EkXEeEma/Aksh+gON1QcNTRGVGpo7SvT9rVHus=;
 b=me5G28Aa/wMTk3YIHO+FI25raNi1TYFXopBRNdjr6MhuD/zdWkydJsfutdiOyDonW3yr
 EWxhYRXpsW119FluaxIUuArNxT3nLBAUCwER8E1K8AdYv+J4maT2Xst2xoUzzMjKDiDY4
 19UlGngTss76nG8Pnk6veiBXq/xnLO/7m4nrE6DL0WWtQMpeNQDa4heWQ40tnKroOT9pO
 043XmRcR/rDChsZGSzJx3gfn57khK9MtTjLYdjdtWU0mhkRz2IpheLJ5TojnUid6cmReK
 UA+QRJx1WbvOs3oxuG+mg8YWGvGfhuqdvSOTi6DpYvMftc07WvlstkpNTIgW+eckmtQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pF8JWVG1; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pF8JWVG1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC6CF405C9
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790706980;
 bh=2Rgr+EkXEeEma/Aksh+gON1QcNTRGVGpo7SvT9rVHus=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pF8JWVG1rBmp3QTCnSR4DPLyjC/jd6r/w4tJ06znbguCn5DCxgw9B7DZrremA+H2a
 6IWJj08EYoxkDo0fkc0q3FHaYftoNRJLngmLv+Si7oPZgXRSXnFJ8RObICb6FF6D0C
 KkdzdK+5kny42nrbTLtoRPsakZL3WV5p8lK6e8Uti28M62RHsn+pY5v9DUNowx4yJE
 +lHhAJBNHmmi45lo4isWTWMXZqmHlwpIMZ7d+1GHLg15rz9Zf/oKmYyjYSrUMHQJRV
 WmfuHb5RsGqdAjDlEE+/XQ6m0/l1GssY8Feu9iPPg/6l+XEAQYBEmrTqCZVZZGYdTT
 FEQBEaZuquT3Q==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 Y7agnKlhxxfZrrYpeQBfouhK6tyfyHpSAg3ilj+t9phYlm4MefapxH+mq4t2NNiNVc5AXH6nQ2u
 Airlf5I9Ag7k+EpiFCDKK1pmed/2/uJ50IWQ1MhPyNuVhQmMhnNLy/AdsrCdsxJOjWOHFkJ4Mqf
 o05aBwQB4IVU7/hfSDGkaEhEvrvFN1tSQbT0uMUuBLGgQBSRFEPqoMW8S1mLrfQPS2f3Me2PWtU
 PgQWKADK2uhhvQKKiw4JFlkGicDR/DDf+DbiRecrLighExWPHwkzuRdvL/8JDoWIfGVrjBFU3tk
 3SV31cIk83PXsQq9ny2Ul7ieUunbUiXuPqEY/RHN9ncTGUe/1EeZAYz8KfRu8mO1aefWeUKkAIL
 um2yMTW7hYkVl2MQjQ/mA37CshLwCmvE4c2bnonX3mlUiLjGsS78dldjWmUNqwzKyHKemriKFrZ
 K00UjQ3JzphNgO9q5CD8uy9+JU6SiD66m0+d4n5UBUMkMvcSwb7I35Hc9/hYLwCOEJcE4jAVhFw
 m1neYQVAKDD+cOE3BqiEOVYvMCSJjBK0d/WAFv9vkSOH2MR9JqgooOIppcWOfXZINwUPSq8Mcxk
 aCikDQ==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5DC1FA4C515E;
 Tue, 29 Sep 2026 20:36:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgd-000000006Jn-30Pl;
 Tue, 29 Sep 2026 18:36:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:02 +0200
Message-ID: <20260929183607.1849293-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 03/66] package/qt6/qt6opcua: remove package
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

Build is broken with the upcoming bump of OpenSSL to 4.0.3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Andreas Naumann <dev@andin.de>
---
 Config.in.legacy                   |  7 ++++++
 DEVELOPERS                         |  1 -
 package/qt6/Config.in              |  1 -
 package/qt6/qt6opcua/Config.in     | 14 -----------
 package/qt6/qt6opcua/qt6opcua.hash | 10 --------
 package/qt6/qt6opcua/qt6opcua.mk   | 40 ------------------------------
 6 files changed, 7 insertions(+), 66 deletions(-)
 delete mode 100644 package/qt6/qt6opcua/Config.in
 delete mode 100644 package/qt6/qt6opcua/qt6opcua.hash
 delete mode 100644 package/qt6/qt6opcua/qt6opcua.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 1cceec25d2..a6f97db08c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_QT6OPCUA
+	bool "qt6opcua has been removed"
+	select BR2_LEGACY
+	help
+	  The qt6opcua package has been removed because it is
+	  incompatible with OpenSSL >= 4.x and mbed TLS 3.x
+
 config BR2_PACKAGE_QT5OPCUA
 	bool "qt5opcua has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 76c99ed311..892bd983f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -203,7 +203,6 @@ N:	Andreas Naumann <dev@andin.de>
 F:	package/evemu/
 F:	package/libevdev/
 F:	package/pkg-qmake.mk
-F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
 F:	package/mpd/
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index d6ee9f3ea3..31fa4582d2 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -52,7 +52,6 @@ source "package/qt6/qt6grpc/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6multimedia/Config.in"
-source "package/qt6/qt6opcua/Config.in"
 source "package/qt6/qt6positioning/Config.in"
 source "package/qt6/qt6quick3d/Config.in"
 source "package/qt6/qt6quicktimeline/Config.in"
diff --git a/package/qt6/qt6opcua/Config.in b/package/qt6/qt6opcua/Config.in
deleted file mode 100644
index 9b5359dd4c..0000000000
--- a/package/qt6/qt6opcua/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_QT6OPCUA
-	bool "qt6opcua"
-	select BR2_PACKAGE_QT6BASE_NETWORK
-	# qt6opcua needs host-qt6opcua, and host-qt6opcua needs
-	# network support in qt6base.
-	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
-
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  This package corresponds to the qt6opcua module.
-
-	  https://doc.qt.io/qt-6/qtopcua-index.html
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
deleted file mode 100644
index e05212eaa8..0000000000
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ /dev/null
@@ -1,10 +0,0 @@
-# Locally computed
-sha256  41982d99b93bfde68f9ee5997376cd64f62d0e7cdca1a08e582a034840528ca1  qt6opcua-6.11.2-git4.tar.gz
-
-# Hashes for license files
-sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.mk b/package/qt6/qt6opcua/qt6opcua.mk
deleted file mode 100644
index 28771ba8a5..0000000000
--- a/package/qt6/qt6opcua/qt6opcua.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-################################################################################
-#
-# qt6opcua
-#
-################################################################################
-
-QT6OPCUA_VERSION = $(QT6_VERSION)
-QT6OPCUA_SITE = $(QT6_GIT)/qt/qtopcua.git
-QT6OPCUA_SITE_METHOD = git
-QT6OPCUA_INSTALL_STAGING = YES
-QT6OPCUA_SUPPORTS_IN_SOURCE_BUILD = NO
-
-QT6OPCUA_CMAKE_BACKEND = ninja
-
-QT6OPCUA_LICENSE = \
-	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
-	GFDL-1.3 no invariants (docs), \
-	BSD-3-Clause (examples + buildsystem)
-
-QT6OPCUA_LICENSE_FILES = \
-	LICENSES/BSD-3-Clause.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt \
-	LICENSES/GPL-2.0-only.txt \
-	LICENSES/GPL-3.0-only.txt \
-	LICENSES/LGPL-3.0-only.txt
-
-QT6OPCUA_CONF_OPTS = \
-	-DQT_HOST_PATH=$(HOST_DIR) \
-	-DBUILD_WITH_PCH=OFF
-
-QT6OPCUA_DEPENDENCIES = \
-	qt6base \
-	host-qt6opcua
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-QT6OPCUA_DEPENDENCIES += openssl
-endif
-
-$(eval $(cmake-package))
-$(eval $(host-cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
