Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083F6E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9981A60611;
	Sun,  8 Dec 2024 13:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovJYkK4GaRdr; Sun,  8 Dec 2024 13:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96D0060645
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96D0060645;
	Sun,  8 Dec 2024 13:40:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 84E58979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F59360645
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XBtiJqsbpIv for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:40:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5871160611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5871160611
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5871160611
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:40:17 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so2935937a12.3
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 05:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733665215; x=1734270015;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4tdg34jNrfSLDL/+ef8ETXe3IXT56nZ6ysGB6vnzTVs=;
 b=tMiGMTZG6reVpHgkZAtCZ+55BvpZOjiT8zusKa9lRkTA/K5rSmHjYOHWRAohUzb/kv
 dOQsr/5O0PdsEuUdklbfwEwQmvzn/WHjp/ICj0Le56S5M61QURhwVOfaB/jB2w7A5m8U
 LbfgJ8baWVnozwcUMGRH1fASRgumgNC7rx5Vahp9VTZ0pP4VmFoZkw3M80pcXSIIbAb9
 /TbhUC9OZCbrm9yVJyqjl9fQ0GyzoiKfYyIs30/tJOlc+/wU0S/vj+N8eifJAQozimpi
 vQwn8hiatFKqCfVxF2wJYPn0BFTCmbNOA3FRdwhpY8aY/V5R90DCRWBEexUmIjeyi+nm
 pOpg==
X-Gm-Message-State: AOJu0YypEG2AAj/jxzXFUk3806RuxzG2VoKno4FylJuXCsf/2uxn0doQ
 1mVZqP6PYX72vLXFFsYwGBgdC5fINVeE+gEdRJzGynKwt6QEiDMaeBKQ
X-Gm-Gg: ASbGncu16OaY9jLkDxTerf1ssuVnVlrkDgkzhQBOF5kyX+Ptl0v/Z8rueaBlT3DFvHF
 Fi5+WdGUeRQF/ZW2fftkIOtR/qwqYpjwYCTGs4aqswcNEIjNZSzI/cbtS0sBhTM8IbjouIqemnU
 XPFJfW9NDfQGgp986gYoCTWjEDrMLIP9C+A0Kyesz6inRyeu+vstNaWHdEVQkUxduITYciWASL+
 yO7lLrcCwjxT6R8ALnfjh1ZwDZu7H7rVqFIHwQWD7QcrEWPQr8dCgH1RpccunpRCuBvE2g=
X-Google-Smtp-Source: AGHT+IEN2l9LsFxlH1whA6613pPbZAoZCbMb/l7KKWFxwm8HV7NFerHqXcEUSzOMIRHABTfpcsjk1g==
X-Received: by 2002:a05:6402:400f:b0:5d1:2440:9b05 with SMTP id
 4fb4d7f45d1cf-5d3be781436mr11672912a12.28.1733665214949; 
 Sun, 08 Dec 2024 05:40:14 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a319:a1e0:eb00:a818:bb9d:4f29:5204])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3f1323f99sm1014320a12.34.2024.12.08.05.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 05:40:14 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Sun,  8 Dec 2024 14:40:04 +0100
Message-ID: <20241208134004.143901-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733665215; x=1734270015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4tdg34jNrfSLDL/+ef8ETXe3IXT56nZ6ysGB6vnzTVs=;
 b=dMuRmZYJ42tnT1mZcykL4r/z+4Psp9eFJW/SCTF/xrljS1hN1xhbuLi6lGRFcFwd1Y
 OSPawhpfZIVS/xSy7iuzNlFZOGQRJTM9BrbsZmiQCMsnctEEmrSVRdaQ/n0N2lidISQa
 j6Zb8Xw3XfQv9Mtsm60VX/cK2RZZ/lh0p2prm2gvFAYAmlr/c3RXgt3ReFn2cHJ8VsxT
 NyfA2AZyGTkxb8s0S0WzByFfxQI9/oQ9geZnb6tFlcWhKAGa760LPFkSnAj7rii6uplZ
 Zn561m+Mqbv8K2UAb2J9c0LHi934KhIHTs8aa0rIIQLm68ADmyLoC2daSilFBSd1BrhB
 gq0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dMuRmZYJ
Subject: [Buildroot] [PATCH 1/1] package/rust-coreutils:new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Rust version aims to be a drop-in replacement for GNU coreutils,
designed to work across a wide range of platforms. Adding it to
Buildroot can help make it available on embedded devices.

This is the initial version of the package, supporting only the
multicall version (single binary). It allows starting to work with the
utilities while avoiding complex configurations and conflicts with
existing tools.

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/Config.in                          |  1 +
 package/rust-coreutils/Config.in           | 12 ++++++++++++
 package/rust-coreutils/rust-coreutils.hash |  3 +++
 package/rust-coreutils/rust-coreutils.mk   | 13 +++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/rust-coreutils/Config.in
 create mode 100644 package/rust-coreutils/rust-coreutils.hash
 create mode 100644 package/rust-coreutils/rust-coreutils.mk

diff --git a/package/Config.in b/package/Config.in
index 60cdb179a3..48b1d96b4e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2874,6 +2874,7 @@ menu "System tools"
 	source "package/rauc-hawkbit-updater/Config.in"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
+	source "package/rust-coreutils/Config.in"
 	source "package/s390-tools/Config.in"
 	source "package/s6/Config.in"
 	source "package/s6-linux-init/Config.in"
diff --git a/package/rust-coreutils/Config.in b/package/rust-coreutils/Config.in
new file mode 100644
index 0000000000..0371805925
--- /dev/null
+++ b/package/rust-coreutils/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_RUST_COREUTILS
+	bool "rust-coreutils"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Rust coreutils is a cross-platform reimplementation of the GNU
+	  coreutils, aiming to be a drop-in replacement.
+
+	  Select this option to build a multicall binary, named
+	  'coreutils'.
+
+	  https://github.com/uutils/coreutils
diff --git a/package/rust-coreutils/rust-coreutils.hash b/package/rust-coreutils/rust-coreutils.hash
new file mode 100644
index 0000000000..bb8e4ac6ca
--- /dev/null
+++ b/package/rust-coreutils/rust-coreutils.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  28e7c79e608989af331fface204fd922eec2a22c4aa2c43a91dced884b6de8d2  rust-coreutils-0.0.28-cargo2.tar.gz
+sha256  29953405eaa3dcc41c37d1621d55b6a47eee93e05613e439e73295029740b10c  LICENSE
diff --git a/package/rust-coreutils/rust-coreutils.mk b/package/rust-coreutils/rust-coreutils.mk
new file mode 100644
index 0000000000..ca41f7101a
--- /dev/null
+++ b/package/rust-coreutils/rust-coreutils.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# rust-coreutils
+#
+################################################################################
+
+RUST_COREUTILS_VERSION = 0.0.28
+RUST_COREUTILS_SITE = $(call github,uutils,coreutils,$(RUST_COREUTILS_VERSION))
+RUST_COREUTILS_LICENSE = MIT
+RUST_COREUTILS_LICENSE_FILES = LICENSE
+RUST_COREUTILS_CPE_ID_VALID = YES
+
+$(eval $(cargo-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
