Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C1FC001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 17:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E51B8610DB;
	Tue, 25 Jul 2023 17:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E51B8610DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yR9_z5qA_W0o; Tue, 25 Jul 2023 17:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16F6660F6F;
	Tue, 25 Jul 2023 17:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16F6660F6F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9D681BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 934E060769
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 934E060769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rZQt_W-BnYo for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 17:32:39 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EABA960F6F
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 17:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EABA960F6F
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-307d20548adso4460985f8f.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 10:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690306356; x=1690911156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uk1+PO7qspyE+Cjn5Si2hQ2uuDamV3ibu7rxTApBNKc=;
 b=ObrowvsXkKQk7dEhZtRW3mr+ruDDeBpjDUZ2JF4i//qXRyhNL0iShTFEI/wuMCXFUX
 5I9KzaYZPK6OwlE//B/ShFKoIG7r1Tq1sX6yCYJWmAR8zAyyFW+kk3PmQJeR89YQas9K
 kJgGX+P3pRHba2nplMhfDU+npyK76npJbc+y9eejmfVvskP2oaVp724BuIhXsBI5rTv/
 YsH8GmITai9JnEBlL0RjU4HK1isxRx6S9NCt7j0c5Sovux2WKALEQWkUDJroIgUUV+dU
 lTKkvwUdgL6pp69E0oC99wPGHIiV4E/0ycoksBJrkDQhCbncsBYAl6sue+F+x/GQgCOw
 BjPA==
X-Gm-Message-State: ABy/qLbcCcVFJ9bU1Q+VS6T1zJeKb6tRLKPIPnugbFTnEgKK8rOnRpwq
 cO8vUY5m4VArAeKlnmI9aJSZ0rOLNaOfIfQeZXw=
X-Google-Smtp-Source: APBJJlEwAIMyDae8l2yC4BeWuOocDh71DcchuM+rmSBH2PDy9MvgDdFsVPiCVTBrCWiE+FbE2drRXg==
X-Received: by 2002:adf:e10c:0:b0:317:7255:6ca1 with SMTP id
 t12-20020adfe10c000000b0031772556ca1mr415519wrz.31.1690306356653; 
 Tue, 25 Jul 2023 10:32:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b00316eb7770b8sm11721541wrv.5.2023.07.25.10.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:32:18 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 19:30:53 +0200
Message-Id: <20230725173102.543874-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725173102.543874-1-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690306356; x=1690911156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uk1+PO7qspyE+Cjn5Si2hQ2uuDamV3ibu7rxTApBNKc=;
 b=WFvPy903uHGfHL59iTu/jhzv2cOK+IFGKSiGstL0hL4lAmdgYoPeJQCXZVQwM8dhhj
 N35yfGnRyQdprALolLSs/dSFFlHTG5PS9wXi3BfjrDj1hqRVbn0390bePUZGt+/Xdvb8
 OFcfjv8fYCFxrE20sw21z55FT2NFFf/4JYQoP4OtHgVt9LNURMOnnDXF9RYty/wkodbN
 ao2aZUWjb90yeWSI/0TnIueFGCMJ0QPNtAsqQXWNpz/BsA0L7Ht2cARYmfh+3XsQsORo
 Wsp6hE/DwKnWxhxkELfTsujSQBrLJ3Q7d9LV2lAknCjd1GRsy+xXDKIkh7uDs/qnZk7d
 sTig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=WFvPy903
Subject: [Buildroot] [PATCH v2 1/9] package/rust-bindgen: new host package
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: multipart/mixed; boundary="===============4015565274449979423=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4015565274449979423==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@smile.fr>

host-rust-bindgen will be required to build several different rust-based
packages, including a Linux kernel with rust modules and mesa3d's
rusticl which is the rust-based implementation of OpenCL.

The Cargo.toml file at the project root is a "virtual manifest". Since
we only want to install rust-bindgen, we can specify RUST_BINDGEN_SUBDIR
= bindgen-cli to use the Cargo.toml from this directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
v2:
    - remove comment explaining deprecated command line options from
      rust-bindgen.mk
    - Add rust-bindgen under Sebastian WEYER in DEVELOPERS file
---
 DEVELOPERS                             |  3 +++
 package/rust-bindgen/rust-bindgen.hash |  3 +++
 package/rust-bindgen/rust-bindgen.mk   | 17 +++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/rust-bindgen/rust-bindgen.hash
 create mode 100644 package/rust-bindgen/rust-bindgen.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c690f1dac7..c9ac202de6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2602,6 +2602,9 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
+N:	Sebastian Weyer <sebastian.weyer@smile.fr>
+F:	package/rust-bindgen
+
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
new file mode 100644
index 0000000000..fe94bbc096
--- /dev/null
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e1cdbaa8e0ed96f647e49807aecfc44d9239d438c2b1c084edb9a3cca0b1f68f  rust-bindgen-0.65.1.tar.gz
+sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
new file mode 100644
index 0000000000..117198f407
--- /dev/null
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rust-bindgen
+#
+################################################################################
+
+RUST_BINDGEN_VERSION = 0.65.1
+RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION))
+RUST_BINDGEN_LICENSE = BSD-3-clause
+RUST_BINDGEN_LICENSE_FILES = LICENSE
+
+# The Cargo.toml at the root directory is an "virtual manifest".
+# Since we only want to build and install bindgen use the Cargo.toml
+# from the bindgen-cli subdirectory.
+RUST_BINDGEN_SUBDIR = bindgen-cli
+
+$(eval $(host-cargo-package))
-- 
2.34.1


--===============4015565274449979423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4015565274449979423==--
