Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9E4C46CA2
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 17:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94815826F5;
	Tue, 19 Dec 2023 17:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94815826F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3MKpQLfBVZBM; Tue, 19 Dec 2023 17:25:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63DB2832C2;
	Tue, 19 Dec 2023 17:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63DB2832C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14A3F1BF390
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E262682871
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E262682871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXXlvr99Q1sH for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 17:24:54 +0000 (UTC)
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 663778291C
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 17:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 663778291C
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-591487a1941so3317072eaf.3
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 09:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703006693; x=1703611493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AxQmo5FnKJhqaGvNS4/ajybxlA0Vh45/6aBRiey6hCs=;
 b=bYBmkXqYRsoCnrkdSy0W5rrXMqRJk5sXBpJtc8DEoWXU+2Oeoq1pOPHVUIg0+mBUSB
 Ljx3IklBXzIt2yYe3SoFml2FWrSs+ZLcaJfnwmIVyBtJVw3vIkoYNQBa5eUMfP5BFYDa
 BbVuxJgnudyih9ahKUFaJaYASZ6rJ19GPcqbhDtafrX+n9lKUnI8WTq0QQvHHH05PTaV
 T2wQCuuaVRmll5FYCLue7ipP7faNDkAF6ilQfusOYVn24vwgAgjcshi5gDWRN9OYeXXX
 DOBcMwoxwCqB/vjwMSFaM7+RRZLlJ7uGEhiNsFZq/qHVKMxrXwwL/8QL8w7Rx2pOjKpq
 Jfow==
X-Gm-Message-State: AOJu0YyR/8seo4MRy6e/OyCxPiKhR7uNN/3ApU2lYQlay74Ht2R4xP/J
 A0ansrfYMaHFZa5aevfkC4kp58S3+2JhKPLmMBI=
X-Google-Smtp-Source: AGHT+IFjk/AR8QfViJTD/2jtUjV0+Qr2rxh2Cw39AnBIY0ICutBkPPJj4XI4he5zVCRQpg3lVRq0aQ==
X-Received: by 2002:a05:6820:2405:b0:593:ebff:5580 with SMTP id
 cp5-20020a056820240500b00593ebff5580mr800242oob.3.1703006692804; 
 Tue, 19 Dec 2023 09:24:52 -0800 (PST)
Received: from fedora.. ([75.174.143.7]) by smtp.gmail.com with ESMTPSA id
 g192-20020a636bc9000000b0058901200bbbsm19910829pgc.40.2023.12.19.09.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:24:52 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 10:24:44 -0700
Message-ID: <20231219172446.498409-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
References: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703006693; x=1703611493;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AxQmo5FnKJhqaGvNS4/ajybxlA0Vh45/6aBRiey6hCs=;
 b=hROLBSvhx1YgKnH39l2tqCvDgLQjxkc1AjzdQ0lrcSeR4leLvwdRFEPOpj3Vsa1gN1
 K1qXdJ/R4mEFEtHWGrGcBSXDpYhyeWJt8J/FVJuJze/VF13MsXS/soA3A28cKe42OCAI
 H7B+LdZOcRBreHgvWGYZ894HwgCSxlg0R+O74=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hROLBSvh
Subject: [Buildroot] [PATCH v3 4/6] package/mender-artifact: bump version to
 3.10.2
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
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mender-artifact now explicitly depends on host-openssl and uses host-pkgconf
to find the correct libraries.

As suggested by Thomas in this previous patcch:
https://patchwork.ozlabs.org/project/buildroot/patch/20221005212150.1384370-3-aduskett@gmail.com/

Use the same variables as defined in HOST_MAKE_ENV (in package/Makefile.in) for
HOST_MENDER_ARTIFACT_GO_ENV.

The updated mender-artifact package introduces the write bootstrap-artifact
argument which is needed for 3.5.1.

License changes:
New:
  Apache 2.0
  vendor/github.com/mendersoftware/openssl/LICENSE
  vendor/github.com/googleapis/enterprise-certificate-proxy/LICENSE

  BSD-3:
  vendor/golang.org/x/crypto/LICENSE
  vendor/golang.org/x/time/LICENSE
  vendor/github.com/klauspost/compress/internal/snapref/LICENSE

  MIT:
  vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt

  MPL-2.0:
  vendor/github.com/hashicorp/go-secure-stdlib/mlock/LICENSE

Removed:
  vendor/cloud.google.com/go/LICENSE
  vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE

Modified:
  LIC_FILES_CHKSUM.sha256: Sum of all licenses changed
  LICENSE: Update year from 2022 to 2023
  vendor/github.com/urfave/cli/LICENSE: Update year from 2016 to 2023
  vendor/github.com/hashicorp/vault/sdk/LICENSE
    - Add missing Copyright (c) 2015 HashiCorp, Inc.
  vendor/github.com/hashicorp/vault/api/LICENSE
    - Add missing Copyright (c) 2015 HashiCorp, Inc.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-artifact/mender-artifact.hash | 21 ++++++++++-------
 package/mender-artifact/mender-artifact.mk   | 24 ++++++++++++++++----
 2 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 8262e26bf0..3bba211f68 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  d3ed68d8637195ff35de97b12c8fa148cebffb1ee0fd0d43909ec1643c0c296a  mender-artifact-3.8.0.tar.gz
-sha256  b8462a14975e30fb0dff14ed50e7563e833ccce13c2aa93f95386ffe877ed673  LIC_FILES_CHKSUM.sha256
+sha256  c8709cbe2c01ee23c68c76250a4c6e2a0cfe2cf10e42c264c359569f97c1af76  mender-artifact-3.10.2.tar.gz
+sha256  a413cbd2475f73b94500a618f2606a51abed453ae9e1054d2980274136d0e620  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -8,13 +8,12 @@ sha256  b8462a14975e30fb0dff14ed50e7563e833ccce13c2aa93f95386ffe877ed673  LIC_FI
 #     sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache 2.0 licenses.
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
+sha256  52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca23a  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
 sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/github.com/mendersoftware/progressbar/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/google.golang.org/genproto/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/google.golang.org/grpc/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/google.golang.org/appengine/LICENSE
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/cloud.google.com/go/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/cloud.google.com/go/kms/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/cloud.google.com/go/iam/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/cloud.google.com/go/compute/LICENSE
@@ -22,6 +21,8 @@ sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  vendor
 sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/golang/groupcache/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/gopkg.in/square/go-jose.v2/LICENSE
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/github.com/oklog/run/LICENSE
+sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/mendersoftware/openssl/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/googleapis/enterprise-certificate-proxy/LICENSE
 
 #
 # BSD 2 Clause licenses.
@@ -44,20 +45,22 @@ sha256  fc0a2f71df4e8f047902da53d1f85301be43e0f360fc167057a2d04658ed2ba9  vendor
 sha256  4835612df0098ca95f8e7d9e3bffcb02358d435dbb38057c844c99d7f725eb20  vendor/google.golang.org/protobuf/LICENSE
 sha256  8778a9fc1eaffb03ab873caae251df2d224f6b5502be8777d3cd573a4dd43903  vendor/github.com/golang/protobuf/LICENSE
 sha256  b95218cd9607855a6536384c0262922b30a0c2bf56e4ced790240f3a3bac4722  vendor/github.com/googleapis/gax-go/v2/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/crypto/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/time/LICENSE
 sha256  f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf351335bf98cf  vendor/github.com/golang/snappy/LICENSE
 sha256  dd26a7abddd02e2d0aba97805b31f248ef7835d9e10da289b22e3b8ab78b324d  vendor/gopkg.in/square/go-jose.v2/json/LICENSE
 sha256  6a358d2540ca14048f02d366f23787c0a480157e58f058113f0e27168dd4e447  vendor/github.com/pierrec/lz4/LICENSE
+sha256  f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf351335bf98cf  vendor/github.com/klauspost/compress/internal/snapref/LICENSE
 #
 # ISC licenses.
 sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
 #
 # MIT licenses.
 sha256  f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/github.com/stretchr/testify/LICENSE
-sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/LICENSE
+sha256  2be6c75f36f3022ea015fea7b1b7135ce67d477ee721d0fc6c98678badb13b8b  vendor/github.com/urfave/cli/LICENSE
 sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/sirupsen/logrus/LICENSE
 sha256  6d2de1cde19c4d2bd8bcd9aaa1d581f4cfa3db9cf71896140330eaa2f2687685  vendor/github.com/klauspost/pgzip/LICENSE
 sha256  a55959c4e3e8917bfa857359bb641115336276a6cc97408fd8197e079fb18470  vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md
-sha256  c8024e31c1de453fea90f22a221968835cc7af9d520274a2576c9ec9976055b0  vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
 sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/gopkg.in/yaml.v3/LICENSE
 sha256  08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor/github.com/mattn/go-isatty/LICENSE
 sha256  5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40212  vendor/github.com/klauspost/cpuid/v2/LICENSE
@@ -74,6 +77,7 @@ sha256  831892cd31b9eef0311bb1de9014527ef5d3592eed7add1f9f829510d2065e62  vendor
 sha256  d0bb61dd59b6d59021893751bdd1205ee88c8206dcabd6b4c68d35b94ee19750  vendor/github.com/armon/go-metrics/LICENSE
 sha256  5c0476add4c38b55d0ed5ac11b85e00c38f26e1caee20dfe3ab58190103d1fbc  vendor/github.com/cenkalti/backoff/v3/LICENSE
 sha256  b8ce983c0e0b1410115d42b65d5471b3666a8d4f4334a52f29f457a39a71b463  vendor/github.com/hashicorp/go-hclog/LICENSE
+sha256  f566a9f97bacdaf00d9f21dd991e81dc11201c4e016c86b470799429a1c9a79c  vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt
 #
 # MPL-2.0 licenses.
 sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-secure-stdlib/strutil/LICENSE
@@ -87,9 +91,10 @@ sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor
 sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-uuid/LICENSE
 sha256  a830016911a348a54e89bd54f2f8b0d8fffdeac20aecfba8e36ebbf38a03f5ff  vendor/github.com/hashicorp/go-plugin/LICENSE
 sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  vendor/github.com/hashicorp/go-sockaddr/LICENSE
-sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/vault/sdk/LICENSE
-sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/vault/api/LICENSE
+sha256  d6b1a865f1c8c697d343bd4e0ce61025f91898486a1f00d727f32e8644af77d3  vendor/github.com/hashicorp/vault/sdk/LICENSE
+sha256  d6b1a865f1c8c697d343bd4e0ce61025f91898486a1f00d727f32e8644af77d3  vendor/github.com/hashicorp/vault/api/LICENSE
 sha256  812e9d96e900a093ae4d1d3f22c5f82f568a0a0461c3007a99d00573d41c5461  vendor/github.com/hashicorp/yamux/LICENSE
 sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-immutable-radix/LICENSE
 sha256  a830016911a348a54e89bd54f2f8b0d8fffdeac20aecfba8e36ebbf38a03f5ff  vendor/github.com/hashicorp/go-multierror/LICENSE
 sha256  af175b9d96ee93c21a036152e1b905b0b95304d4ae8c2c921c7609100ba8df7e  vendor/github.com/hashicorp/golang-lru/LICENSE
+sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-secure-stdlib/mlock/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 6ade624a23..0d26a6f174 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.8.0
+HOST_MENDER_ARTIFACT_VERSION = 3.10.2
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, MPL-2.0
 HOST_MENDER_ARTIFACT_LICENSE_FILES = \
@@ -15,7 +15,6 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/google.golang.org/genproto/LICENSE \
 	vendor/google.golang.org/grpc/LICENSE \
 	vendor/google.golang.org/appengine/LICENSE \
-	vendor/cloud.google.com/go/LICENSE \
 	vendor/cloud.google.com/go/kms/LICENSE \
 	vendor/cloud.google.com/go/iam/LICENSE \
 	vendor/cloud.google.com/go/compute/LICENSE \
@@ -23,6 +22,8 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/golang/groupcache/LICENSE \
 	vendor/gopkg.in/square/go-jose.v2/LICENSE \
 	vendor/github.com/oklog/run/LICENSE \
+	vendor/github.com/mendersoftware/openssl/LICENSE \
+	vendor/github.com/googleapis/enterprise-certificate-proxy/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
@@ -40,16 +41,18 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/google.golang.org/protobuf/LICENSE \
 	vendor/github.com/golang/protobuf/LICENSE \
 	vendor/github.com/googleapis/gax-go/v2/LICENSE \
+	vendor/golang.org/x/crypto/LICENSE \
+	vendor/golang.org/x/time/LICENSE \
 	vendor/github.com/golang/snappy/LICENSE \
 	vendor/gopkg.in/square/go-jose.v2/json/LICENSE \
 	vendor/github.com/pierrec/lz4/LICENSE \
+	vendor/github.com/klauspost/compress/internal/snapref/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/urfave/cli/LICENSE \
 	vendor/github.com/sirupsen/logrus/LICENSE \
 	vendor/github.com/klauspost/pgzip/LICENSE \
 	vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md \
-	vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE \
 	vendor/gopkg.in/yaml.v3/LICENSE \
 	vendor/github.com/mattn/go-isatty/LICENSE \
 	vendor/github.com/klauspost/cpuid/v2/LICENSE \
@@ -66,6 +69,7 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/armon/go-metrics/LICENSE \
 	vendor/github.com/cenkalti/backoff/v3/LICENSE \
 	vendor/github.com/hashicorp/go-hclog/LICENSE \
+	vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt \
 	vendor/github.com/hashicorp/go-secure-stdlib/strutil/LICENSE \
 	vendor/github.com/hashicorp/go-secure-stdlib/parseutil/LICENSE \
 	vendor/github.com/hashicorp/errwrap/LICENSE \
@@ -82,9 +86,19 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/hashicorp/yamux/LICENSE \
 	vendor/github.com/hashicorp/go-immutable-radix/LICENSE \
 	vendor/github.com/hashicorp/go-multierror/LICENSE \
-	vendor/github.com/hashicorp/golang-lru/LICENSE
+	vendor/github.com/hashicorp/golang-lru/LICENSE \
+	vendor/github.com/hashicorp/go-secure-stdlib/mlock/LICENSE
+
+HOST_MENDER_ARTIFACT_DEPENDENCIES = host-pkgconf host-openssl host-xz
 
-HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
+HOST_MENDER_ARTIFACT_GO_ENV += \
+	PATH=$(BR_PATH) \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig" \
+	PKG_CONFIG_PATH="$(HOST_DIR)/lib/pkgconfig" \
+	PKG_CONFIG_SYSROOT_DIR="/"
 
 HOST_MENDER_ARTIFACT_LDFLAGS = -X github.com/mendersoftware/mender-artifact/cli.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
