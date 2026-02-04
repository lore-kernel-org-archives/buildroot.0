Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ADBEA794A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 23:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 148278268B;
	Wed,  4 Feb 2026 23:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z96GpgSRPtII; Wed,  4 Feb 2026 23:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04DE982690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770246973;
	bh=goucokJnh/MSYSNqu4AQclmm8oR4HlCXB8pEo33g2eQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Lv6DYvBUzbY/Db9pkYqLH1bUXS8WMlaNrlHQ2yRFMEgQg2plAS0W4p/HMleu+5pUf
	 1j3oORCh9Z5h//eskUtHeKXaAz6leAI8ODp/Nvho27kyRKrKzzhdieImUr7KnlE3U6
	 D3d7jPpw2dA1/dqiEwvLU8e8hbxJh7kRTtVbnzxU37c5hIRDAfh5EX7CJS8sdLKG+Y
	 2xcXJVROofCISlM3L/nwPlpBvHYdZyIsHOL4rS+lh0qhKCihRb0jigTnm+Dbi8P9e4
	 34ej5/6vkNq2umLGD5+EGux6LSpdrIWej3dD5ecU+ZG3pZfPP6ZbVZ7O/eWm2sPaFE
	 9OUHB2k7sn1/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04DE982690;
	Wed,  4 Feb 2026 23:16:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A98BF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 23:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38E7340D7A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 23:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAfOt44GQwsL for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 23:16:11 +0000 (UTC)
X-Greylist: delayed 386 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Feb 2026 23:16:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 433E840D88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 433E840D88
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.153.107;
 helo=usb-smtp-delivery-107.mimecast.com; envelope-from=jkastelic@thinksrs.com;
 receiver=<UNKNOWN> 
Received: from usb-smtp-delivery-107.mimecast.com
 (usb-smtp-delivery-107.mimecast.com [170.10.153.107])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 433E840D88
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 23:16:11 +0000 (UTC)
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-36-a79IbZchOoCUBMn77KPoEg-1; Wed, 04 Feb 2026 15:09:41 -0800
X-MC-Unique: a79IbZchOoCUBMn77KPoEg-1
X-Mimecast-MFC-AGG-ID: a79IbZchOoCUBMn77KPoEg_1770246580
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-649b2db7b8fso726444d50.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 15:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770246580; x=1770851380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VJf4WUwO+l6Pyo7d0oX+8zhAeNfgMADA02xDVeJAr0I=;
 b=EeWKXyFyXLOBFl/c4M4MfbDd0RotrM4UaV/jzFQKsM556XhP3uK1Sy0j0tYgtDH4jh
 suq1FESgnozqndO8V4DSXu0XNDS/13pAQWA5U9rldQg88mLfSparoBwBELJpFYPvJZg0
 wOxO4/oaQNV416w+06H7/qK4xDXKyfrpCbIQRQBdh2HmMrhO/aDLVjgDRemQ4myOHd+P
 xWcFSMGPdNBZ5mUrpXNyaQ8CxoRS8e+l+UTSJIe8U+0dp+oAusuZoTA1sGADBK4nrGuE
 m4swE6D32Noak3fqEMVsY9e24Cf+vo/vp+cMB76BdnnOCZbm4f8cnCjGLoRTtKYgUuH5
 kTrw==
X-Gm-Message-State: AOJu0Yx0wf/8tkDhwffPjLx18stUCMTLm/WTtjWxVH6n4JYEHni8iCC8
 C/bTobZ2xmKu+7j8tBeL+ubKsqyNKW9HhxllzgOFGPChkWw/CGfmsGBhNYHBDq4tW9Yo/IsHpRj
 ty3yDi5BpSk4BWM6TtYwFLlU8TQi3jDneONRf5xm0/AxAN3000iA4ARuNpKTNE+wyTYI=
X-Gm-Gg: AZuq6aLmvyC+WlyaaG4TzZwRu34dJgcEkjpPrZv3NvWat9cvf3q3o0J4naCi9WtWMNt
 NGg8vuXYJhfD7xhG9BLorrxzUfCvxqrpkJ+s/mg9Z7G3+PRblMn9bKLZDF+Z3e3GiMaExS1JSdd
 7vKiMUKBbJE4tmGMBjY4dJYaRawD990b7WdHIJwVIAGH6pUjmBNw1GZ/dIGP3maITw2S5Y2mb6d
 padDVGCcVxQxAUFnoOoaLynFin6uK4g5+Yd6eAiVDiyy4/G1hg3l8bQ5TtHoofd+eWKRVsMaX6Y
 8WIhfSRWn8mU2kwI1GnQb5AzvtEl9w+qq1IaA4Anu0gO2WvwjMQoE0qUvLdIHfp+Ajvzeos4HTf
 q9pIAUnuhfqGCZoKhHQdvPri7kT/86EYcOPv28bsHJtKLhi8S8Mu/WaraNMiW6uBkfENJlb6hJY
 qFC6786qR2My8=
X-Received: by 2002:a53:5004:0:b0:649:b468:d8b5 with SMTP id
 956f58d0204a3-649db33f470mr3341787d50.29.1770246579890; 
 Wed, 04 Feb 2026 15:09:39 -0800 (PST)
X-Received: by 2002:a53:5004:0:b0:649:b468:d8b5 with SMTP id
 956f58d0204a3-649db33f470mr3341771d50.29.1770246579470; 
 Wed, 04 Feb 2026 15:09:39 -0800 (PST)
Received: from SRS1720.corp.thinksrs.com
 (107-207-172-155.lightspeed.wlfrct.sbcglobal.net. [107.207.172.155])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-649dc4b8034sm3739111d50.9.2026.02.04.15.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 15:09:38 -0800 (PST)
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Jakob Kastelic <jkastelic@thinksrs.com>
Date: Wed,  4 Feb 2026 15:09:30 -0800
Message-Id: <20260204230930.1596375-1-jkastelic@thinksrs.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uo3MJQd0mLoYz6NPHkud-Cm_452OeUURcXOipsxTnTs_1770246580
X-Mimecast-Originator: thinksrs.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thinksrs.com; 
 s=mimecast20220819; t=1770246969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F8kQIyAmCQ9uUaLkGiGjRPpb+5eLTxwpaIBhhX8MGBU=;
 b=lCGtu2KdV2OYfzL3Y9eX0uSA7KdHotbGldYX2gRtoS/mQHFuxSfkTIGZqrydKCAEfvb94S
 vSKU+HUjhAND3urA1Z4P0pLFqg4VROUiZoE4+BZX7zjpxRnwmdCDr6ayY1lwzTVy3fkJ0E
 e/3uPjaLDwMcND3+6IMuZgsDcuBP9cU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=thinksrs.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=thinksrs.com header.i=@thinksrs.com header.a=rsa-sha256
 header.s=mimecast20220819 header.b=lCGtu2Kd
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
