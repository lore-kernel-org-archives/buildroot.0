Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0F4C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 20:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3DE7826C0;
	Fri,  1 Mar 2024 20:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRjlfsCUj15d; Fri,  1 Mar 2024 20:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB675820F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB675820F4;
	Fri,  1 Mar 2024 20:50:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B78A91BF28F
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 20:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3004820F4
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 20:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-CGa08hxAxQ for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 20:50:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D6D3820BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D6D3820BA
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D6D3820BA
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 20:50:48 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-512ed314881so2234943e87.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 12:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709326246; x=1709931046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D3LsEuLtR04jH6r6cDldCSl+IZVFHTPkrYehz94JyyA=;
 b=d6jLAPQ5BYot18U+2SnLVhE2gcPG0PAzqyVzkMykTeKZOXiVoKtTZVe919MtuPMGe+
 V7bQltik0gFxfNMVyjNSpbstdyHlVA0z0x7gvuMNhVKzgwk/Bjwb1p7ZnmH6T7IMyOy6
 tPKxqH5v94ycMxl5mEOMn74jS0otqu7n8laORtUBXeFMH7vile3TTbhSTrs81nEcmmud
 s47E+CzCP85NJMdJSlMR+xR/PZraw1s4ajPgjojOBDCc92D2BVyk2evIP0OCqkR/8oyz
 o1cV8uU8vqyFe2Cw+hsBVAo+hWt6h2YUAcKwIo96DZs5TtGT9g5Dmnmg1V066ZryoOHY
 KJBw==
X-Gm-Message-State: AOJu0Yx9773wt9DVascqmJ1P9qh1qUbaHeks3G9a4VFFcxrFf7YiADxY
 aTRiZh3oP66L9d6Qy/2Dhwch80Ah6YzhY+7nZH/UobIITl1MBoikuVgC5eoI
X-Google-Smtp-Source: AGHT+IEGQ/aB62DPEWqtNttlh/OXg1IL6DWKiVXthA62IhqTcPTQHhY31RfNumxcM9fMs4uXQJ0i+Q==
X-Received: by 2002:a05:6512:2209:b0:512:bce5:5564 with SMTP id
 h9-20020a056512220900b00512bce55564mr2638005lfu.43.1709326246276; 
 Fri, 01 Mar 2024 12:50:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f15-20020adfb60f000000b0033dc931eb06sm5572287wre.0.2024.03.01.12.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 12:50:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 21:50:37 +0100
Message-ID: <20240301205037.914259-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709326246; x=1709931046; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D3LsEuLtR04jH6r6cDldCSl+IZVFHTPkrYehz94JyyA=;
 b=FcDjduheneiy4GLW7YCFmn0FJ8goCrGp5rJ0s9cQousmW8x8RrQUNm7HHIonFhjJV7
 1XrEEsrzcKWASBJlKnf8B/9vhVx5mfeTy4oa6hmIw0t8qlPHS1Up1qSxjfEJgSIjT5PV
 fkbOlu527f5MYJJxilbIB6tEWUjqqNPs0vA+NY8RnET3EAZWmgFYAvqz5X76eKjkhkEh
 sV4KjAxNG4PQLKqbqMNoudb5rxQ5XjXg4i7/ZgHnzHwRrrEAqQxEF3xBCVR/DS5QSzRJ
 H+PKB+EgYQSO49HsXFaNY0rXq00+M0KjCaVgFiyhog8vmJFaM33Dv7xi2rAk+OJcqkE6
 mVZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FcDjduhe
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio: add
 BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit ea45b95c0e54866134c63e88e60489a012b3d134:

In file included from third_party/boringssl-with-bazel/src/include/openssl/base.h:78,
                 from third_party/boringssl-with-bazel/src/include/openssl/ssl.h:145,
                 from ./src/core/tsi/ssl/key_logging/ssl_key_logging.h:23,
                 from ./src/core/lib/security/security_connector/ssl_utils.h:42,
                 from ./src/core/lib/security/credentials/tls/grpc_tls_certificate_distributor.h:36,
                 from ./src/core/ext/xds/certificate_provider_store.h:44,
                 from src/core/ext/xds/certificate_provider_store.cc:21:
third_party/boringssl-with-bazel/src/include/openssl/target.h:62:2: error: #error "Unknown target CPU"
   62 | #error "Unknown target CPU"
      |  ^~~~~

Fixes: ea45b95c0e54866134c63e88e60489a012b3d134
 - http://autobuild.buildroot.org/results/36686aca1b45f0bf692a60e67a48424b561930a3
 - http://autobuild.buildroot.org/results/4f79c7b1b2fc3306f300ae3ec0aa4439725814c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-grpc-requests/Config.in     |  3 +++
 package/python-grpcio-reflection/Config.in |  2 ++
 package/python-grpcio/Config.in            | 11 +++++++++++
 3 files changed, 16 insertions(+)

diff --git a/package/python-grpc-requests/Config.in b/package/python-grpc-requests/Config.in
index 3a2740f0f7..1cdd0d3f67 100644
--- a/package/python-grpc-requests/Config.in
+++ b/package/python-grpc-requests/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	bool "python-grpc-requests"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS # python-grpcio
 	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_GOOGLE_API_CORE # runtime
@@ -12,4 +13,6 @@ config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	  https://github.com/wesky93/grpc_requests
 
 comment "python-grpcio-requests needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-grpcio-reflection/Config.in b/package/python-grpcio-reflection/Config.in
index afe8988165..a0ca35c286 100644
--- a/package/python-grpcio-reflection/Config.in
+++ b/package/python-grpcio-reflection/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
 	bool "python-grpcio-reflection"
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS # python-grpcio
 	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
@@ -9,4 +10,5 @@ config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
 	  https://grpc.io
 
 comment "python-grpcio-reflection needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
index 5242eb461e..9657ccb6ed 100644
--- a/package/python-grpcio/Config.in
+++ b/package/python-grpcio/Config.in
@@ -1,5 +1,15 @@
+config BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
+	bool
+	# see third_party/boringssl-with-bazel/src/include/openssl/target.h
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_riscv
+
 config BR2_PACKAGE_PYTHON_GRPCIO
 	bool "python-grpcio"
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  HTTP/2-based RPC framework.
@@ -7,4 +17,5 @@ config BR2_PACKAGE_PYTHON_GRPCIO
 	  https://grpc.io
 
 comment "python-grpcio needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
