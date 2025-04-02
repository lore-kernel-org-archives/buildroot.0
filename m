Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD20C3601A
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 10:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 938A96F56D;
	Wed,  2 Apr 2025 10:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7ttXVG_COSH; Wed,  2 Apr 2025 10:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B631A61AC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B631A61AC0;
	Wed,  2 Apr 2025 10:18:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DE31123
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 10:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83FCE610AE
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 10:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IF5tToxeD4dj for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 10:18:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BA3B612AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA3B612AC
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BA3B612AC
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 10:18:18 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22435603572so122021235ad.1
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 03:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743589098; x=1744193898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2JGwbWJXZyHSDTm7+p+EWI1xiS+heaHQtc9zL6Pdc8=;
 b=CaNMO1sNAkMGtZz/EaYZISd18LoLSWRPnboeTcVfqXuNsnW5SNYGsKtrdtZwckaFl0
 kTs+sRODgUOMXpMDJsnhNBdaAGRAApWQevj+2DcMWy+afARfjDfAaaj+czKJJhXjRUb3
 4327ywgSbDmMcnRDJHPEuO3RqhFJJO+T6DlMG8LEtKEWY3Ru8T8rMEKM7gJ6jj1JyefX
 clnKv7uc08QS9BxABjI3x9sC4beA3U0q45gtRVVJSZi9PZQvDukm6hewMu/MVZzFlIzY
 mvjemU65sU3rnFtzjNMJr31RwR8sOgOCI0Y/2OyHqSxBPe0a2x1cxRY7q/IF1x4kCmYT
 cEgQ==
X-Gm-Message-State: AOJu0YzCIpJTFPG3Be0Gf+EOQ+ULI3zdxCHHsF6TVZYItVR5PX4i4Zow
 PtxTr6OKAkZ4RhBAYvZzCy9r/tJBr8ZEVQ71WyYCJkgb1fov+AmS94sqN8O745WJGDvMVpXwn5n
 M
X-Gm-Gg: ASbGncsVZ/xA2ZAzS0yjeqZpsjwl9tHAjD9D4sRAhxsR7H205QyMyO3pDF1AF+CTOWz
 L0P62WzHKs9GkbrFj6RubECWkcTOc1c/VU0KvamDhqJbbHPXJkbwvxn+UR8UP6sReeaAZ6fpuMV
 ouwBaqdzDKohV340sQ2FW3VnlCiPuBdiG/pCyzHEKBPX+H5q9AU1uocdfYX6lEvB5hTZb3clOCw
 hI/nv3wEyRCvci066+wK/JZx6+fj5DBz1ijQtjXOCjLcF0vqPh2Pi3ov+9yNCUQwb10zw7pQt0f
 eG7wSupAm7MzmngvWSXnNQrzYHJRbiB4o9T97zh0r/CIL33/sU/0tZhQfyr3ruNWBQh4nq4=
X-Google-Smtp-Source: AGHT+IF6RWkUOTr/hNs7L1xgnaWUQmzzgCpetvgkEs/Sub0615Xre9OcCaGAoSHBA8ni4I1zSNxq2Q==
X-Received: by 2002:a17:902:e545:b0:220:bcc5:2845 with SMTP id
 d9443c01a7336-2292f9494c0mr241232745ad.7.1743589097717; 
 Wed, 02 Apr 2025 03:18:17 -0700 (PDT)
Received: from localhost.localdomain ([94.156.149.178])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1ce08csm104591735ad.127.2025.04.02.03.18.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 03:18:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  2 Apr 2025 03:18:05 -0700
Message-ID: <20250402101805.18896-2-christian@aperture.us>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402101805.18896-1-christian@aperture.us>
References: <20250402101805.18896-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1743589098; x=1744193898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2JGwbWJXZyHSDTm7+p+EWI1xiS+heaHQtc9zL6Pdc8=;
 b=k+AzVt6wRF1yrGrZZAk6sZfS7uXFEZDJt4K2yYNT4nWAcfOsZDcTmJxVLapE5PkQ+i
 Zm6yIv3Lvk9ybxkRV1GFcXczfKI5VIVhhGlvymjRMJRh9fd5Bj2jXGXhgZjPuKBH611Z
 HEW0tDdyeYrpP/9fPO4tgEjRq1GjkZgnB46D8SGN5et8xrsf2i+lwpUZ965TtlLMduue
 g4TVMuWvOg0xV+iuoamhN+Y/sRwYtTYnDMeq2aNEm5B4vUHyxpF5RrQx6Y6lf1o6Edzt
 Qi0vY4tW2TJzrcLk/Hdj1TkXuVvNOn8u/pjJ69w42DOvgm4t+bqWj7vfWyB5oUjpUEWh
 igvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=k+AzVt6w
Subject: [Buildroot] [PATCH v1 2/2] package/go: bump to version 1.24.2
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
---
 package/go/Config.in.host   |  2 +-
 package/go/go-src/go-src.mk |  4 ++--
 package/go/go.hash          | 14 +++++++-------
 package/go/go.mk            |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 4fd98c2301..98ec5ab001 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
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
index 48ba6b7fd9..2410b727bf 100644
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
+sha256  9dc77ffadc16d837a1bf32d99c624cb4df0647cee7b119edd9e7b1bcc05f2e00  go1.24.2.src.tar.gz
+sha256  4c382776d52313266f3026236297a224a6688751256a2dffa3f524d8d6f6c0ba  go1.24.2.linux-386.tar.gz
+sha256  68097bd680839cbc9d464a0edce4f7c333975e27a90246890e9f1078c7e702ad  go1.24.2.linux-amd64.tar.gz
+sha256  756274ea4b68fa5535eb9fe2559889287d725a8da63c6aae4d5f23778c229f4b  go1.24.2.linux-arm64.tar.gz
+sha256  438d5d3d7dcb239b58d893a715672eabe670b9730b1fd1c8fc858a46722a598a  go1.24.2.linux-armv6l.tar.gz
+sha256  5fff857791d541c71d8ea0171c73f6f99770d15ff7e2ad979104856d01f36563  go1.24.2.linux-ppc64le.tar.gz
+sha256  1cb3448166d6abb515a85a3ee5afbdf932081fb58ad7143a8fb666fbc06146d9  go1.24.2.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
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
