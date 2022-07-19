Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662E2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 21:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 032F8610C9;
	Tue, 19 Jul 2022 21:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 032F8610C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gu1RUUy9L06e; Tue, 19 Jul 2022 21:59:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E2F61044;
	Tue, 19 Jul 2022 21:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63E2F61044
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 215DA1BF228
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF21D61044
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF21D61044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZe386NO36o2 for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 21:59:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E216061019
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E216061019
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 21:59:37 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id b6so9220955wmq.5
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 14:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRsIsstC5n/dMx2lcbh12/ieTgr0d64KG1NZJN3tgbk=;
 b=RY6ckZPfPp5X/X+hm3nMmrItNjT+GV000pkFCDaDWbzoWmK7Xus9IYlQ1hx6wxJjuy
 6gtR4APe3gmn5sCVqxaSBRaxkhGQYcfEJDOetjV7YxE1EN184UTzzN6YTZk5DMuKEW77
 e7Oc/5+yWED4OMNWoNZu/wSfakhR/JdOAOCJNxUjKeEpQ9UDLFcLL77mOWFfAC2VNxVG
 9D21O6fJ9hZFaGUO1NrU/ZxN8VcCiBo2SOi/9XHuGeI9eiKAXqn5jbjwUutUFojulAx+
 uxWrCpJ/7mq37+hOFFVJmQ4axLLt/IJscHvMbhn5DdMUpepTiIJ73eEoFq8ToZBwqiB5
 EyOg==
X-Gm-Message-State: AJIora9s+BsKS10BkedxmsN2pyMWTeKo/RjF5uydmq+r7owXewkmQGhi
 zMGQQ6/cfOtHr2cAnekLYHDT458LVro=
X-Google-Smtp-Source: AGRyM1sQtHlMZBauQPOE6hw7x/tK7Qr0knfUQpX6ydEp1LFqqD2p74bZhL6IXXZ2huE9LHExl7IR9w==
X-Received: by 2002:a05:600c:5022:b0:3a3:13cc:5567 with SMTP id
 n34-20020a05600c502200b003a313cc5567mr1051509wmr.148.1658267975821; 
 Tue, 19 Jul 2022 14:59:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a1ce902000000b003a3186fa559sm194428wmc.29.2022.07.19.14.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 14:59:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 23:56:19 +0200
Message-Id: <20220719215619.3144281-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRsIsstC5n/dMx2lcbh12/ieTgr0d64KG1NZJN3tgbk=;
 b=oc9lN/+xhuG37DNgPfMr/TYpn2HWmxh9XPl0XBb9FhRZEpAP2lA5JMvJTvaff6v2rL
 Iebhk9j1sNwsNfYV3mb4KZAu+t0GYKQK65CgL5S+K7bFusp/22hUUHDU4NGYXrQ59x4L
 JVTVdPKam15GOtVWlnfrWkktpKIacPQ956XSIl49p2xOowx1I5rxWPZC6M2tmCZfMgmY
 eDHI7Jk86wAhvrqFI/R0WtzWE/ITNu+KU0iI7aomPtrTYF9gJcxA5gCdvdo62vJDuQoY
 6S6cm7WPB+szzFOSu/72Zej0R4+0VrSDb+8cPEQu0Z7Rt15FDwd55TXOke6PV3Y74x2t
 rt1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oc9lN/+x
Subject: [Buildroot] [PATCH 1/1] package/libp11: needs threads
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

threads are mandatory since bump to version 0.4.12 in commit
86ab91483dcb4b60de8c1daa20e2f42bd95ab5fb and
https://github.com/OpenSC/libp11/commit/4bd92da60a670e3c25d9cb69fca3363f47a225c7:

In file included from eng_back.c:30:
p11_pthread.h:92:2: error: #error Locking not supported on this platform.
   92 | #error Locking not supported on this platform.
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/22adeb78ec4a807c362e6666825f50db6c0408f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libp11/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libp11/Config.in b/package/libp11/Config.in
index 4d7ff56895..ef1e5b4703 100644
--- a/package/libp11/Config.in
+++ b/package/libp11/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBP11
 	bool "libp11"
 	depends on !BR2_STATIC_LIBS # dlopen
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
 	help
 	  OpenSSL engine for PKCS#11 modules. Part of the OpenSC
@@ -8,5 +9,5 @@ config BR2_PACKAGE_LIBP11
 
 	  https://github.com/OpenSC/OpenSC/wiki
 
-comment "libp11 needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "libp11 needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
