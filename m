Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADEFEA7943
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 23:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03A7960EB2;
	Wed,  4 Feb 2026 23:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuBu2kNz_MB7; Wed,  4 Feb 2026 23:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B845660FCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770247342;
	bh=goucokJnh/MSYSNqu4AQclmm8oR4HlCXB8pEo33g2eQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=TSW/XrqlyBsYCI9019PZpWiUrislbvXEZy/KED+3Ij7qBE3ibslHTJUHtZGRDnv7v
	 zEBXhFIrePclxLvuIifzYN4u5dQ/vUKb0f3N9rhHSr8yxagTnvyq1jhKb5ynR4D9Qv
	 6e2g8lRnMvF8ZjKIc0BpMGnPWrurCAt9WW6YKp2Ak8P7ShNbn5BrAuNHQgzeb3oot6
	 0WsoCUOK1SJxDAUMm1JwqwU+p+dF5WpbN4yZSsoiMIJFhIeXoTXV4JWPkChfuxcRIU
	 rY4wFTIHtkQKTJCfscFRBS7FIjv1TrKNdAmodLnT5pitsNGOIjR/sft0p+iqMTXAYO
	 PLGXbyPleRGmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B845660FCF;
	Wed,  4 Feb 2026 23:22:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 856F2173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 23:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 719A283EB8
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 23:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8mpLvtPh_sN for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 23:22:16 +0000 (UTC)
X-Greylist: delayed 398 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Feb 2026 23:22:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E113183E88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E113183E88
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.151.107;
 helo=usb-smtp-delivery-107.mimecast.com; envelope-from=jkastelic@thinksrs.com;
 receiver=<UNKNOWN> 
Received: from usb-smtp-delivery-107.mimecast.com
 (usb-smtp-delivery-107.mimecast.com [170.10.151.107])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E113183E88
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 23:22:15 +0000 (UTC)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-45-iU5Ex-JoM-SwhE0LBP4jYQ-1; Wed, 04 Feb 2026 15:15:33 -0800
X-MC-Unique: iU5Ex-JoM-SwhE0LBP4jYQ-1
X-Mimecast-MFC-AGG-ID: iU5Ex-JoM-SwhE0LBP4jYQ_1770246932
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-79431a41d9bso5245857b3.3
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 15:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770246931; x=1770851731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VJf4WUwO+l6Pyo7d0oX+8zhAeNfgMADA02xDVeJAr0I=;
 b=Ebpg+LKBWKpBT6b2skIC/pQv8lCekZsFYNTS9b8u7KyfCmv+icGA7++RMCXyb1VWbe
 zqjPvvN3X2v1oMWHPqoJGnvpne7/G/FmOLB+eLVEoq8C9U9VRcNqF549kkPOEg3GbDRg
 7yekDCymqZTQL7Op76vYWI/fiz4dGpn7E09ge2f7hNYM3JwG9SFbJ58fbjq6brAWrjiv
 RKbmggDj6JdHRx5YJA0pkwb0bsZLPKkAdq/02VHtrxrROTEU+3Wml2U2CmGVs0gqLTyy
 W3RcDTTEehaToBqsEKRY9DWxUIQ9WQ59isF4jtwpahlxQ0v4Z3BfmT0bix/mi3rYrwiO
 Jhdw==
X-Gm-Message-State: AOJu0Yw7IC/rYQy+e+mmLnARhj6Oie0j+bAW5/BCoF9aj8EtWXZJv2co
 rX4ZWUZqrZOLNrKwrTGpcLJI0L1TSwJvRxad82QV000R8dId/elQZ8qB919iJ4Uukly7OI0/WdV
 ISHHTZHgKIxbbRVlh4UaaaLTkRu5tMqQjh7ylHWUgBDHreFZspkw5B2qvnZis852BF50=
X-Gm-Gg: AZuq6aLgnYNPSv44pwxK/s0aRkccaZOAqUYiMl5XESa2+Ht7IHNSAuRcqovLhS5+scQ
 mkgg0Dj/lE71/Dk886J+dfySXznbsukajBZhfxImkwgszili0SeesCLtIq0Vg+4kAjXgNggS+9a
 /yp+Nkx8ztsoe9ZPh1hqPDNSDJc1Fb/azab8iDGKkJmWTr8omZBVg6JnBdvzypL2jr4h5Kq5Au/
 yY73J9vNf4QwCoDJl2rD/J2sV0Gjsugcfd45qqaRQE2iLUQ+LbTLY+KNmk4wi3gMniFZw8IYJza
 ZDxSGRgSVj1uJLeRpKuwZmOLvrDS5DP/GIdQfIpD/k9bhUJwyfia1KJAXxBWOQv03DnRYqRhs2j
 LUeQI2UXUb0Dr9rbgSIy2DBdhFuCq10y5TllAYgk8uyvHhwOS16I/4fgDJkqkqtDK2Q5O6mOO4D
 JY37VpQ3/i/6Y=
X-Received: by 2002:a05:690c:734a:b0:794:b2be:f488 with SMTP id
 00721157ae682-794fe74782cmr35775867b3.36.1770246931533; 
 Wed, 04 Feb 2026 15:15:31 -0800 (PST)
X-Received: by 2002:a05:690c:734a:b0:794:b2be:f488 with SMTP id
 00721157ae682-794fe74782cmr35775757b3.36.1770246931156; 
 Wed, 04 Feb 2026 15:15:31 -0800 (PST)
Received: from SRS1720.corp.thinksrs.com
 (107-207-172-155.lightspeed.wlfrct.sbcglobal.net. [107.207.172.155])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-794fefd00b5sm32657137b3.43.2026.02.04.15.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 15:15:30 -0800 (PST)
To: buildroot@buildroot.org
Cc: Jakob Kastelic <jkastelic@thinksrs.com>
Date: Wed,  4 Feb 2026 15:15:27 -0800
Message-Id: <20260204231527.1654719-1-jkastelic@thinksrs.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T-m56svB5YT4Wvvjik1US6TJfqgB0XspzAEGKUcTtRY_1770246932
X-Mimecast-Originator: thinksrs.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thinksrs.com; 
 s=mimecast20220819; t=1770247333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F8kQIyAmCQ9uUaLkGiGjRPpb+5eLTxwpaIBhhX8MGBU=;
 b=KWBAdBtmwdwvQcxKRCLBwPnZEyEGMvR33bR01mPSADy9ONNB6RDFbo/5mtxMevaf4jM4cM
 QMSk2GrDrXGTx2dZSUmxXAjQDll9jXblO0P6RFeU52PWhqgFc0OucyTW77UJ7CW2yAJlkw
 +bQcplY0Fg9UUCfJ9ArHKwJYjB31WUI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=thinksrs.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=thinksrs.com header.i=@thinksrs.com header.a=rsa-sha256
 header.s=mimecast20220819 header.b=KWBAdBtm
Subject: [Buildroot] [PATCH 1/1] optee: bump to 4.9.0
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
From: Jakob Kastelic via buildroot <buildroot@buildroot.org>
Reply-To: Jakob Kastelic <jkastelic@thinksrs.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Unfortunately, if all optee-related packages are not updated at the same
time, optee-test will not build.

The version bump is needed since optee-examples and optee-test can no
longer compile (compatibility with CMake < 3.5 has been removed from
CMake).

Signed-off-by: Jakob Kastelic <jkastelic@thinksrs.com>
---
 boot/optee-os/Config.in                    | 4 ++--
 boot/optee-os/optee-os.hash                | 2 +-
 package/optee-client/Config.in             | 4 ++--
 package/optee-client/optee-client.hash     | 2 +-
 package/optee-examples/Config.in           | 4 ++--
 package/optee-examples/optee-examples.hash | 2 +-
 package/optee-test/Config.in               | 4 ++--
 package/optee-test/optee-test.hash         | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 4bd7debefd..af08375b9a 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "4.6.0"
+	bool "4.9.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -79,7 +79,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "4.6.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default "4.9.0"		if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index c86bd1e0d9..3db5c85cf1 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0c947c6972bf50c483cb993af01041d4094b1e03711c7246cdde6ba2ffc351fe  optee-os-4.6.0.tar.gz
+sha256  9400e16c45bfa45f15585b2c933b86c449e7de05def0ecaaa62a4f38973a3a45  optee-os-4.9.0.tar.gz
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index ac3b680743..04849ffce4 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_CLIENT_LATEST
-	bool "4.6.0"
+	bool "4.9.0"
 	help
 	  Use the latest release tag from the optee-client official Git
 	  repository.
@@ -60,7 +60,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_CLIENT_AS_OS
-	default "4.6.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	default "4.9.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
 
 config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index a5d98521a3..f6150aaf6c 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a970338c9f69861901336716d89684646e4480b9970996a5b3581ae7d49fdaa3  optee-client-4.6.0.tar.gz
+sha256  2ef152f25b682e59c3684d6d73d7c5a138495615f6b045e95266eb3d0bc0d04e  optee-client-4.9.0.tar.gz
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 702adc84db..fca9aca07c 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -42,7 +42,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
-	bool "4.6.0"
+	bool "4.9.0"
 	help
 	  Use the latest release tag from the optee-examples official
 	  Git repository.
@@ -72,7 +72,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
-	default "4.6.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	default "4.9.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
 
 endif # BR2_PACKAGE_OPTEE_EXAMPLES
diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 54b98868d7..df3bbcbf66 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6891390aefa2046d500d3ffec05c327d7763e89645b2e99ef2330b561ba645f5  optee-examples-4.6.0.tar.gz
+sha256  b95a3d72f2b266aedde0ed9b855f9c59cd0b2608df59b27e3f46935dfb6f919c  optee-examples-4.9.0.tar.gz
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index dd1160ea48..8631d12cef 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -48,7 +48,7 @@ config BR2_PACKAGE_OPTEE_TEST_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_TEST_LATEST
-	bool "4.6.0"
+	bool "4.9.0"
 	help
 	  Use the latest release tag from the optee-test official Git
 	  repository.
@@ -77,7 +77,7 @@ config BR2_PACKAGE_OPTEE_TEST_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_TEST_AS_OS
-	default "4.6.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
+	default "4.9.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
 
 endif # BR2_PACKAGE_OPTEE_TEST
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 058d95e29b..80e1b36571 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  db4de73fa955a7db70a64a2c4ad1d2c48ddcb54c369821aba670fec6131a6f61  optee-test-4.6.0.tar.gz
+sha256  b7158740dc4ea2f585363097ebd60a265eef0e078674d70636b1731be94780cc  optee-test-4.9.0.tar.gz
 sha256  2b36458cd0292200e406a608efe7dfda17aae39646a86b730a2776b61d0fa410  LICENSE-BSD
 sha256  a094472b51f57d0403953d087e410793519cb6f3a7cea2be34eb44e09a426a73  LICENSE-GPL
 sha256  a562ab14c307d0e02b7bf6f1bdb0d1cf789409e6375a500e15dc7a0503e5c2c3  LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
