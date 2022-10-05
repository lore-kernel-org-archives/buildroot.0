Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671BFC433FE
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FDB5408DB;
	Wed,  5 Oct 2022 21:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FDB5408DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpDviQVTLBbs; Wed,  5 Oct 2022 21:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04D55405E9;
	Wed,  5 Oct 2022 21:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04D55405E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A635F1BF301
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 21:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EDB6405BE
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 21:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EDB6405BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lU3mS60vJymX for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 21:22:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CBAA40194
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CBAA40194
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 21:22:01 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id lx7so31950pjb.0
 for <buildroot@buildroot.org>; Wed, 05 Oct 2022 14:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ty9QfczeYgtZPt0Hhz0elmqhXM+eyz7Y7cz7G6RdTjo=;
 b=7dX5mY4myEvBR2TBHlf8qUXenbIFgXEhD3lpoQSFetn0FjacrMEXKqn0vhg7J+qroh
 taTa1bznsnzNGVGMkxcXQtMooiQdrjXoSFtjr984HLBJqDtpMxDwBANCqaDXq8l3XwzV
 H8WZjwI2hYxRWzd+h/5SkK/6MPmft3diHwvzI4rRUVNPKMjSQvWV2jZa1mabjQ+M2PvA
 BgH0JhuO32go9I0/dhEIEoxI6+LZUc86qORGEvUKn8bk7pT5WKZUxwy09WUIXq0tTn/w
 Pq6jP/oRgAqTgqRoQi/Fn3rqb0oEJ41026/2BTQtWw3daZxEd2y+7uUWhgM4k8pbBbMM
 TvuQ==
X-Gm-Message-State: ACrzQf0ig0u2K68AmwRwvOsK3TlFXvTqSImWQn3TEncEyffYOEVg6D/I
 bELfQQjd/BVZE9AhbKadQEGOtl8zRybqyw==
X-Google-Smtp-Source: AMsMyM4b+J7eei/GHAdpbRSdE++QPi/FauJ5cvb1WmVsYgCdqmCg1g1NB1Ua3t6lS/cHs9SNymQKZg==
X-Received: by 2002:a17:90a:be0c:b0:20a:c658:c16c with SMTP id
 a12-20020a17090abe0c00b0020ac658c16cmr6993407pjs.195.1665004920596; 
 Wed, 05 Oct 2022 14:22:00 -0700 (PDT)
Received: from adam-workstation.. ([47.153.94.144])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a170903018c00b00172e19c2fa9sm11003033plg.9.2022.10.05.14.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 14:21:59 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 14:21:49 -0700
Message-Id: <20221005212150.1384370-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005212150.1384370-1-aduskett@gmail.com>
References: <20221005212150.1384370-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ty9QfczeYgtZPt0Hhz0elmqhXM+eyz7Y7cz7G6RdTjo=;
 b=dlt7m4U6bGHhqcup2N6PBnuvBPW5MuzVxS2xEkXX35SGN60bFL70cM+pvEG1Ea6Um0
 dpWgfS30VJnCIM189KUnyPFsNDTbHFNXYoIV9FCgGh7XTcw6YbFMvmFQurhTIeQAAucv
 E7S0vanllSVOmk1XenOQngJrjEJfb0/NmkVHdDiZwBF4sQyHBG6kxUuf6IAIso1MGSbo
 ca7APBsLlQPmQi/iZQqVwyK9nGu9G927cNkXbaotv6CWNsH+mRAv2wXi2tzBjBOY6uvt
 /bBtfv4JGlvIPSqj5j66uct0LfxAr5u2oCl4R2/rOV7QNg1rsXHu7ivFD5ajFqPdsRh2
 AE1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dlt7m4U6
Subject: [Buildroot] [PATCH 3/4] package/mender-artifact: bump version to
 3.9.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
New licenses:
  Apache  2.0:
  - vendor/github.com/mendersoftware/openssl/LICENSE

BSD 3 Clause:
  - vendor/golang.org/x/crypto/LICENSE
  - vendor/golang.org/x/time/LICENSE

mender-artifact now requires OpenSSL, and is incompatible with OpenSSL3.
As such, the host-pkgconf and host-libopenssl packages are now dependencies to
prevent linking errors against OpenSSL3 on newer distributions such as
Fedora 35.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender-artifact/Config.in.host       |  1 +
 package/mender-artifact/mender-artifact.hash |  7 +++++--
 package/mender-artifact/mender-artifact.mk   | 16 +++++++++++++---
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/package/mender-artifact/Config.in.host b/package/mender-artifact/Config.in.host
index c7be0ed261..1879b4aa74 100644
--- a/package/mender-artifact/Config.in.host
+++ b/package/mender-artifact/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_MENDER_ARTIFACT
 	bool "host mender-artifact"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_PKGCONF
 	help
 	  The mender-artifact tool is a CLI implementation of the
 	  Mender artifacts library.
diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 8262e26bf0..58a8cc663d 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  d3ed68d8637195ff35de97b12c8fa148cebffb1ee0fd0d43909ec1643c0c296a  mender-artifact-3.8.0.tar.gz
-sha256  b8462a14975e30fb0dff14ed50e7563e833ccce13c2aa93f95386ffe877ed673  LIC_FILES_CHKSUM.sha256
+sha256  cb6d4da1bef47b5ddab311ffe5c7331073d6c98f2a8dac29ddced36feac29e5e  mender-artifact-3.9.0.tar.gz
+sha256  5635790313f33aea860583427e8e73792e99c5dfb947d4025c0102011564af50  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -22,6 +22,7 @@ sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  vendor
 sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/golang/groupcache/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/gopkg.in/square/go-jose.v2/LICENSE
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/github.com/oklog/run/LICENSE
+sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/mendersoftware/openssl/LICENSE
 
 #
 # BSD 2 Clause licenses.
@@ -44,6 +45,8 @@ sha256  fc0a2f71df4e8f047902da53d1f85301be43e0f360fc167057a2d04658ed2ba9  vendor
 sha256  4835612df0098ca95f8e7d9e3bffcb02358d435dbb38057c844c99d7f725eb20  vendor/google.golang.org/protobuf/LICENSE
 sha256  8778a9fc1eaffb03ab873caae251df2d224f6b5502be8777d3cd573a4dd43903  vendor/github.com/golang/protobuf/LICENSE
 sha256  b95218cd9607855a6536384c0262922b30a0c2bf56e4ced790240f3a3bac4722  vendor/github.com/googleapis/gax-go/v2/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/crypto/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/time/LICENSE
 sha256  f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf351335bf98cf  vendor/github.com/golang/snappy/LICENSE
 sha256  dd26a7abddd02e2d0aba97805b31f248ef7835d9e10da289b22e3b8ab78b324d  vendor/gopkg.in/square/go-jose.v2/json/LICENSE
 sha256  6a358d2540ca14048f02d366f23787c0a480157e58f058113f0e27168dd4e447  vendor/github.com/pierrec/lz4/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 1031166f34..a5f79ea449 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.8.0
+HOST_MENDER_ARTIFACT_VERSION = 3.9.0
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, MPL-2.0
 HOST_MENDER_ARTIFACT_LICENSE_FILES = \
@@ -23,6 +23,7 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/golang/groupcache/LICENSE \
 	vendor/gopkg.in/square/go-jose.v2/LICENSE \
 	vendor/github.com/oklog/run/LICENSE \
+	vendor/github.com/mendersoftware/openssl/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
@@ -40,6 +41,8 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/google.golang.org/protobuf/LICENSE \
 	vendor/github.com/golang/protobuf/LICENSE \
 	vendor/github.com/googleapis/gax-go/v2/LICENSE \
+	vendor/golang.org/x/crypto/LICENSE \
+	vendor/golang.org/x/time/LICENSE \
 	vendor/github.com/golang/snappy/LICENSE \
 	vendor/gopkg.in/square/go-jose.v2/json/LICENSE \
 	vendor/github.com/pierrec/lz4/LICENSE \
@@ -84,7 +87,7 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/hashicorp/go-multierror/LICENSE \
 	vendor/github.com/hashicorp/golang-lru/LICENSE
 
-HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
+HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz host-libopenssl host-pkgconf
 
 # By default, go will attempt to download needed modules before building, which
 # is not desirable. This behavior also causes permission issues when cleaning,
@@ -92,7 +95,14 @@ HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 # includes the modules in the vendor directory, mod=vendor prevents the package
 # from downloading the go modules during the build process and prevents
 # permission issues when cleaning.
-HOST_MENDER_ARTIFACT_GO_ENV = GOFLAGS="-mod=vendor"
+#
+# Mender-artifact requires OpenSSL, and is not yet compatible with OpenSSL3.
+# Mender-artifact also uses pkgconf to find the OpenSSL library.
+# Use host-pkgconf to force mender-artifact to use Buildroots host-openssl, as
+# newer distributions, such as Fedora, are starting to use OpenSSL3.
+HOST_MENDER_ARTIFACT_GO_ENV = \
+	GOFLAGS="-mod=vendor" \
+	PKG_CONFIG_PATH="$(HOST_DIR)/lib/pkgconfig"
 
 HOST_MENDER_ARTIFACT_LDFLAGS = -X github.com/mendersoftware/mender-artifact/cli.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
