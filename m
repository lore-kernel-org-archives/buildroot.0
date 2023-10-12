Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E4ECDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 16:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29DA581E09;
	Thu, 12 Oct 2023 16:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29DA581E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_ysVVCDR5pj; Thu, 12 Oct 2023 16:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 238CA81E25;
	Thu, 12 Oct 2023 16:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 238CA81E25
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A79951BF2F8
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80F6F60B55
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80F6F60B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-yLiuiI7NcQ for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 16:21:02 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5391360B45
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 16:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5391360B45
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-323168869daso1130311f8f.2
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 09:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697127660; x=1697732460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cxBLq9P0zAATlQfOtozsCHtnMIsQ4Y967nzo8brLwdw=;
 b=HBBA3tKzhRIQsdHY/V6KyztM3kyIxXWMTCDKzaERpZd2Bu0Dl7uHqJCxVEVTMlj48M
 tUQaUFkYzFH4R6pgCTrcW8aRG3FM0GvH1jGkU0sFm75tTDmDr0rxlzQy+dwo9L8wpYgT
 wSkWgC22EY+E7fbbCbT1uN64Olr12LPA7ufaeWrB0VHq991/zRDJEiZMm1xFXkuqlaBZ
 qVLgJwfMlLtGcX750xW9Zrd1SBGgylwF/CGRSPI43qnMAkLxJiHYRsnCwXeuYaW1Y5dQ
 YVc9AzgHzx21JViDu1+iBw0W1dK0elrHw+cpq7ryrzbxKeJcPc5SGWycT6ciTeFpTfq+
 TYog==
X-Gm-Message-State: AOJu0YwfKvGRMTXTZnLHEzUIJf6Ui0i2tdv1XdBM4eUula1iLWGwuanh
 K7O4GHZUsLpZNiAypaKwlK+Pw+ywIFQ=
X-Google-Smtp-Source: AGHT+IEiHsxj07rsTu1o0rnUxUkTSm1EVbRWS1tzpbwHbvWXGNoLGTA3kcjeq2p0dgVnqpV1QhFs6A==
X-Received: by 2002:a5d:668d:0:b0:32d:9332:816c with SMTP id
 l13-20020a5d668d000000b0032d9332816cmr1650667wru.51.1697127659825; 
 Thu, 12 Oct 2023 09:20:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x18-20020a5d4912000000b0032d9382e6e0sm1770837wrq.45.2023.10.12.09.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 09:20:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 18:20:57 +0200
Message-ID: <20231012162057.4366-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697127660; x=1697732460; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cxBLq9P0zAATlQfOtozsCHtnMIsQ4Y967nzo8brLwdw=;
 b=bPMeic8Yi1l23X4mS4eIUL4ZRuzU2+W5t82cV/m/Wi4J2MZu0tb7SMcNuvUUutPyqF
 IzhUrqFdjTiTNUwsJJBqwK9//enEfipwa+1rEBSW2YaLFmHISDYu6wQKpuLfYnajVw3K
 0et719y+fsPj1j+t0LUbT4956IQcvJ4JNt94TrcRPOTALwTKbxHxIezm86V23CupG2Yp
 C4GPEadveqno42l4C84jmQ/bui0pVu6cdAHsMgpj5wHcHZQZcbkAYzhSaZ2z/IldeJZF
 CO/OMvxtDP5Kj0uAHJ6ZYGpny+AZ34WxqYWvMk2n/M0QP+G8OKhavDzsxTLZ6MdRtzV7
 ecJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bPMeic8Y
Subject: [Buildroot] [PATCH 1/1] package/libmatroska: bump to version 1.7.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

C++14 is mandatory since version 1.7.0 and
https://github.com/Matroska-Org/libmatroska/commit/7263bbaac134a20a79dfe7bd23b364fcd1a588cc

https://github.com/Matroska-Org/libmatroska/blob/release-1.7.1/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmatroska/Config.in        | 2 +-
 package/libmatroska/libmatroska.hash | 2 +-
 package/libmatroska/libmatroska.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmatroska/Config.in b/package/libmatroska/Config.in
index b2e4354df5..4d775c43a0 100644
--- a/package/libmatroska/Config.in
+++ b/package/libmatroska/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBMATROSKA
 	bool "libmatroska"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libebml
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	select BR2_PACKAGE_LIBEBML
 	help
 	  Extensible open standard audio/video container format access
diff --git a/package/libmatroska/libmatroska.hash b/package/libmatroska/libmatroska.hash
index 81b418d030..a3eb74e832 100644
--- a/package/libmatroska/libmatroska.hash
+++ b/package/libmatroska/libmatroska.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  daf91a63f58dd157ca340c457871e66260cb9c3333fefb008b318befbb0e081a  libmatroska-1.6.3.tar.xz
+sha256  572a3033b8d93d48a6a858e514abce4b2f7a946fe1f02cbfeca39bfd703018b3  libmatroska-1.7.1.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 7d326c0076..6b5f34476a 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMATROSKA_VERSION = 1.6.3
+LIBMATROSKA_VERSION = 1.7.1
 LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.xz
 LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
