Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E4DC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 19:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B034A81234;
	Sat, 20 Jul 2024 19:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgXwV_fwmubW; Sat, 20 Jul 2024 19:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C53380FAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C53380FAA;
	Sat, 20 Jul 2024 19:32:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 396471BF2EC
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 19:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3422460727
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 19:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMaDzTF44wAl for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 19:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 086A8606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 086A8606D6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 086A8606D6
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 19:31:59 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-427d2cc1c4eso20265845e9.1
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 12:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721503917; x=1722108717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vXQIabdLPfmEArFvONN+cg827kLgxUj15En0UAzd3tY=;
 b=eTJpdZm9pChAt7b4eEB5TMDfWftd9EIMJRsZx8DhLz+h6C7Un5nq9c6KewB7tESXg9
 u4H5b7NnGgv1AkitfxwBOJmtAQTFPpghrQbC2Or5AXvnVeaRUNex/5WFOd8STHDWAuD/
 Ax8KfoDcgvVz135OgX2UZrM4jgMeApPK8E/iTg2mxZjwMrDPz8HID2HE0J/KazMU97oZ
 5CfByKnoxaz+eNd8PDnvStlfCLVb15iPGjITBW19msnxDiR3ubuHTw9GXom3T3JAetkb
 2utY6h2AsMqF43ZijV9634QWzzI49vc/+jmFTCoqLqM8kP8SKMzau5wfuyq8R53E0ZeS
 i5Mw==
X-Gm-Message-State: AOJu0Yy8tACEc1b+QpyTQQEpDl6If156Gp+N0wabwLPql62AMKOBTh6H
 k6RWpoelCLexe2XAcZlqrU40zWypovuWzIen1LjalWKPqvHwx8hMZauOWw==
X-Google-Smtp-Source: AGHT+IG0M73nLKd2Rv9npdavEwPqP3lRttU9JMtQmU+4w4529cImE2xn1eWhANFAk3+e4lejH/XvgA==
X-Received: by 2002:a05:600c:1d1f:b0:427:d72a:6c26 with SMTP id
 5b1f17b1804b1-427dc52062fmr14210915e9.6.1721503917416; 
 Sat, 20 Jul 2024 12:31:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a7f6d0sm55170785e9.1.2024.07.20.12.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 12:31:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 21:31:42 +0200
Message-ID: <20240720193142.770839-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721503917; x=1722108717; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vXQIabdLPfmEArFvONN+cg827kLgxUj15En0UAzd3tY=;
 b=RSMoE8FKvz7pvViJbGBefngET47VUKxA3iq71gzBcupYiClFaMEKjxQ5ZcNjiSXSV6
 z2IZ6x9QTceL3hcIFPKQwWX0IwSXw3Aag6xdHAN+C9h4MMJAnRdIEFbAJkVrZrIt9vAe
 tOve07/AyJIPnQ4453b9JvoDbIvFtF1g1X38vPsLWHeSeIhX/W8jAFFe4krWwhVXTzX8
 1samMDvu9RFZ0b1ci9K76F9M8d1MdjxvuA8PI67AcQ6DImN6AV6DvNzSqmxSYlylTglj
 c6lAT1A552tnM+Uxf3AhhMfUGreRaenOPQg0mrrxVRHCoHF6vrdzbAZDvtuEw88Y9dn6
 P5/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RSMoE8FK
Subject: [Buildroot] [PATCH 1/1] package/openswan: select libxcrypt if needed
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

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-7/output-1/build/openswan-3.0.0/programs/pluto/xauth.c:36:10: fatal error: crypt.h: No such file or directory
   36 | #include <crypt.h>
      |          ^~~~~~~~~

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/df7cce809e3e4aa92e700a3fc5105c6c20f21f6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openswan/Config.in   | 1 +
 package/openswan/openswan.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 724654e984..31c4a66b35 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OPENSWAN
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Openswan is an implementation of IPsec for Linux
 
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 4c6a779f0d..64218810f8 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -22,6 +22,10 @@ OPENSWAN_DEPENDENCIES += libcurl
 OPENSWAN_MAKE_OPTS += USE_LIBCURL=true
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+OPENSWAN_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENSWAN_DEPENDENCIES += openssl
 OPENSWAN_MAKE_OPTS += HAVE_OPENSSL=true
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
