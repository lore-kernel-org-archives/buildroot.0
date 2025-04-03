Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24DBC36014
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 02:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9D8C60812;
	Thu,  3 Apr 2025 02:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRAcQL0X7kQt; Thu,  3 Apr 2025 02:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BE1060884
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BE1060884;
	Thu,  3 Apr 2025 02:12:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B246117
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 02:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2833040749
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 02:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1GgG8dSk2iK for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 02:12:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45D47411FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45D47411FD
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45D47411FD
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 02:12:31 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-af51e820336so429158a12.1
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 19:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743646350; x=1744251150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EuCkWHmSCByvwbEveqckpU0YtiuYQpNpwJ/MFOMsFEo=;
 b=mdhkSLJT6M3g/Jp4XTTqw4zzg8nMD6hA7N7gg53foyvKxfQTZUfY8dZ9f823Q0GzFd
 WBKeFyKVuVRieotYHB7sAA2n++YJ7AOBnErq5ND5FHdLXN/viLLqkECUNE6Qum8Kc4l1
 en1oPnLJin5nE6DTSmKWxw1fXaf9feOofMDHV/s7hfpQLp74M3r7bcS1E59oTSOfnYNu
 AJt7G+7ZoIRMd8ZIEshH5HilLUvGfqQczExPyh8etZsp33AlOe/l0nPoi7W9Lz+7V7NF
 GEUG/O1RLYDqzcJp5dMRlxh1UITww1uR52RhBBLwkORuBNMdV73srvJJwf65Zy6nCYGQ
 3l1Q==
X-Gm-Message-State: AOJu0Yx3B2AIWRSQKcMmK/03flU+Wt/cPTC9ZAP2iRwTGndm826XXYWn
 IBDX70C2S/7DRjep8APu16j5iKB0w/wuctCqR1VH1oqwAk9uxqr02HWaLGn8E8ZoW1Mw6vrDRn1
 a
X-Gm-Gg: ASbGnctoXU7PvZCv7Bh7cv8EdO9U6+ScjbRMYgQg5/MGuRsPqKYeq4B7FWkcr5vkEp9
 ILPegjXSi5Yi6XocBszR6zdyG6u4rCo4M9tWLgWGdPYK6PSj12R8y3wCcFNZzPJpTxe3bnuu1Hy
 TOIV2t6/gR+9vx71zLqtjdrlh3Y08l+BWdlpm/zH2EySmvW808Uy8WmoxstiST3LAZfdbWLOoLj
 x8NA1cURj0it4mS4Plc89ygWo3EhGJ4+HJcnncli/37htlrjO1WVcyJWwAa25C/X7Ewm2O0nTHN
 zt4NqB5ubbl3v16Ej58eqsuqQOJ7GEnuMTPoVBA4hTxelM8QLcDKdsJGgEcCr5AM+2++gg==
X-Google-Smtp-Source: AGHT+IE7YbP5FcX/aGB52ov1rYw9WxN4AfgCGJXAKiA0ePZKxTsBDoZdZIkMSZSN5diPbLc+4y07Uw==
X-Received: by 2002:a17:903:110f:b0:224:7a4:b2a with SMTP id
 d9443c01a7336-2296c603b87mr67510455ad.11.1743646350462; 
 Wed, 02 Apr 2025 19:12:30 -0700 (PDT)
Received: from localhost.localdomain ([185.228.19.20])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2297866e267sm2880515ad.188.2025.04.02.19.12.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 19:12:30 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  2 Apr 2025 19:12:22 -0700
Message-ID: <20250403021222.25741-2-christian@aperture.us>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403021222.25741-1-christian@aperture.us>
References: <20250403021222.25741-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1743646350; x=1744251150; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EuCkWHmSCByvwbEveqckpU0YtiuYQpNpwJ/MFOMsFEo=;
 b=o4loGJYvzxxBKS8xduq/Ai9a+o20JaZ3QvmUr3PRHRzwdrx36mTo+GPS806IO0q+Xw
 ylKPkNNaRwumhhgkF02UeiXuxSe5Zp1gshytwGnv1hXIGLyUT0kXRLwz3MDcfcf2n3jz
 Hnhi4UyofmYcrhb5ANsk4oyN7DYLWC1uz7iQzXpl3Qb1G1sLkpLQLOZv++AwvHFYHbTh
 /2Otzs9+ND0kwIyi/vTfvWxiSQ6bB6VHXyJF6qrSU8mqBWlum0KNN00ujJ0CISFFALHa
 zFUNp8Zuw9SmVI+22Vi65yNk5cUB77zXRdM59uTNrlEm/wHSshA3rWW2W/SiXuaKv6aJ
 SxFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=o4loGJYv
Subject: [Buildroot] [PATCH v2 2/2] package/go: bump to version 1.24.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest Go release, version 1.24, arrives in February 2025, six months after
Go 1.23. Most of its changes are in the implementation of the toolchain,
runtime, and libraries. The release maintains the Go 1 promise of compatibility.

go1.24.2 (released 2025-04-01) includes security fixes to the net/http package,
as well as bug fixes to the compiler, the runtime, the go command, and the
crypto/tls, go/types, net/http, and testing packages.

https://go.dev/doc/devel/release#go1.24.2
https://github.com/golang/go/issues?q=milestone%3AGo1.24.2+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>

===

v1 => v2:

 - fix license hash
 - fix dependencies on STAGE3

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/Config.in.host   |  8 ++++----
 package/go/go-src/go-src.mk |  4 ++--
 package/go/go.hash          | 16 ++++++++--------
 package/go/go.mk            |  2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 4fd98c2301..50998d64a2 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
@@ -34,7 +34,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 
 # CGO linking for the host. Since we use the same compiler for target
 # and host, if the target can't do CGO linking, then the host can't.
@@ -57,7 +57,7 @@ if BR2_PACKAGE_HOST_GO
 
 choice
 	prompt "Go compiler variant"
-	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
 	default BR2_PACKAGE_HOST_GO_BIN if BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	help
 	  Select a Go compiler variant.
@@ -66,7 +66,7 @@ choice
 
 config BR2_PACKAGE_HOST_GO_SRC
 	bool "host go (source)"
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
 	help
 	  This package will build the go compiler for the host.
 
diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index 340aada94c..4d5784c500 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -14,7 +14,7 @@ GO_SRC_CPE_ID_VENDOR = golang
 
 HOST_GO_SRC_PROVIDES = host-go
 HOST_GO_SRC_DEPENDENCIES = \
-	host-go-bootstrap-stage3 \
+	host-go-bootstrap-stage4 \
 	$(HOST_GO_DEPENDENCIES_CGO)
 
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
@@ -35,7 +35,7 @@ endif
 HOST_GO_SRC_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE4_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
diff --git a/package/go/go.hash b/package/go/go.hash
index 48ba6b7fd9..0f30e1861c 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  0ca1f1e37ea255e3ce283af3f4e628502fb444587da987a5bb96d6c6f15930d4  go1.23.8.src.tar.gz
-sha256  714b9d004063bfa27686f9ff0e5648bb190b3a5bc1e86b0aa16c134d8d8c315f  go1.23.8.linux-386.tar.gz
-sha256  45b87381172a58d62c977f27c4683c8681ef36580abecd14fd124d24ca306d3f  go1.23.8.linux-amd64.tar.gz
-sha256  9d6d938422724a954832d6f806d397cf85ccfde8c581c201673e50e634fdc992  go1.23.8.linux-arm64.tar.gz
-sha256  d14e0bea9fb25344a0460f395880d5589bbcd413ffd5555be48e46c0de084437  go1.23.8.linux-armv6l.tar.gz
-sha256  0cadab469e612b159f5f68b1a30d75aa7b7e1ed5292746005a6a3c8ff04e6f35  go1.23.8.linux-ppc64le.tar.gz
-sha256  cbe954ee534eb02aa782639716d8c25706dd171445f7c8336bd2fc0b8f6fe38e  go1.23.8.linux-s390x.tar.gz
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
+sha256  9dc77ffadc16d837a1bf32d99c624cb4df0647cee7b119edd9e7b1bcc05f2e00  go1.24.2.src.tar.gz
+sha256  4c382776d52313266f3026236297a224a6688751256a2dffa3f524d8d6f6c0ba  go1.24.2.linux-386.tar.gz
+sha256  68097bd680839cbc9d464a0edce4f7c333975e27a90246890e9f1078c7e702ad  go1.24.2.linux-amd64.tar.gz
+sha256  756274ea4b68fa5535eb9fe2559889287d725a8da63c6aae4d5f23778c229f4b  go1.24.2.linux-arm64.tar.gz
+sha256  438d5d3d7dcb239b58d893a715672eabe670b9730b1fd1c8fc858a46722a598a  go1.24.2.linux-armv6l.tar.gz
+sha256  5fff857791d541c71d8ea0171c73f6f99770d15ff7e2ad979104856d01f36563  go1.24.2.linux-ppc64le.tar.gz
+sha256  1cb3448166d6abb515a85a3ee5afbdf932081fb58ad7143a8fb666fbc06146d9  go1.24.2.linux-s390x.tar.gz
+sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index d618a7a262..dd0b6d3e99 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.8
+GO_VERSION = 1.24.2
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
