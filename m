Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75C3CCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 12:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DFA240819;
	Sat, 25 Oct 2025 12:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxR2sWnwBnNa; Sat, 25 Oct 2025 12:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EF7A4087B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EF7A4087B;
	Sat, 25 Oct 2025 12:30:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACCD8976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DA878119C
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwmicOBcRQBf for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 12:30:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 655EA8116E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 655EA8116E
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 655EA8116E
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:30:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b3e7cc84b82so313618766b.0
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 05:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761395439; x=1762000239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OBKDq/xsGIyNaGWes/sqqkA8Scm5Pj94ujLA+wAYZnc=;
 b=ogZL54ueF0l8NihrEdl3c32BijxeFwEr4PSj/KCbL1/fKoSQRoq+rsnpmBNex81t7b
 RaLRNb/dcm4KtvxbJSmvsedEQv6aafFJLqcrQVNfOYGQy9VGWZcvQ9n++a2WD4YergId
 SHl2XbXHr3Xotvjshl6VXvZQW3wIb4uXlm9d8TGrW4YXDeKFSFu/aCexDUIJ/vSiSdlV
 CgJI+n3mIh4Wb6tBMPFBLDOKlhuGQMXqQGtaPvi3xphTkRxmo2dRdrOQJ6EmqlghRoqc
 JKwU3uXeh7hqld7kttU5xuXCU2YGhQASDx4+WSDKaZFdVPqsNSiCPU18QWgcWN+ZXkIQ
 /bEA==
X-Gm-Message-State: AOJu0Yxw1URDl/YQry8a6kRjzPeE6ZfxHh50WMblfU0ep+sZjBcNgMGM
 UXrN/eSZHkkef5EXnFwxRgtuR+97OmPZMRri3sUpGAFWEqzT5MJ2G3GMRk8rNFZAUultmx64zv5
 kVPj5
X-Gm-Gg: ASbGncu0+IPWRPcjAdiEwFMs6YRk5a2Gnu2GOhH2U1lXoRvi0mILCfYTzhCZU4NNkQ3
 F3OWGmyRV5dug0LcAhgyAsA95BRyxNsYrsjR5imQP5415F6eGqtHiHKVUen1EkiBbIHbGAvtu3k
 Y7lU7+24640mzQB218sP/41C+T1nGDuMM3V9URTktiBOcFHshj+10bucPZsFT7Vhk2Mwv9vdO/Z
 novPMyzGpupXODY+G/nTYHyH9V+aMILd2FJrE4Zou3NSM4lg4SVmIh2fXoafs7a9R61qoMTBSBF
 gue2j+98chSWxLDQj8ClopeKBj6bnxmH9GUVQMkwidvL1beuZ9Nb2P328oM3zOI8ihau97PFDpG
 KnKa9C2i/Tt40551CH/D9mcpwJaj53H/pfkEuwfOPVf+etvMLWaqmhMzeWtkxPZDNMGrJlHGF7Z
 8Cwyk6yQjDxSZnQrsBVLkMj6LrF+YXEylDDEqiI19iHvCiplEa1WbY5uhCfl9M4BoPs0f2zW4k3
 DpEFj/DRYgdpVlCkVwC9/9cSmjp0cwQdhWZ8UMExEccIzCg6GWcys4ZFIOsdbn5IQ==
X-Google-Smtp-Source: AGHT+IETyfSSs1NXPoVI101nSqbdsWeE9HqSB0E0DyLJQn2QENiUTVplP5HXdv7qk/uYFUGRpp9KLQ==
X-Received: by 2002:a17:907:bb49:b0:b4b:4f7:7a51 with SMTP id
 a640c23a62f3a-b6475706fc2mr3760349566b.62.1761395438851; 
 Sat, 25 Oct 2025 05:30:38 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853386casm190416566b.15.2025.10.25.05.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Oct 2025 05:30:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 25 Oct 2025 14:30:34 +0200
Message-ID: <20251025123035.1136084-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761395439; x=1762000239;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OBKDq/xsGIyNaGWes/sqqkA8Scm5Pj94ujLA+wAYZnc=;
 b=L7FoQgpnvFrrSBrj/yWCvtKYvSIP1Hs3HwBm+KzwhNd3LFBheCC54j5+9mm0i+Xr++
 x85Xdxws4FoSVwvxXObPoOmQno1+kEmtOvQ+CobwSmaBus6/hvTZbcSSveHxRxtWi1jA
 TuxalMTzQM9Rv02y01t0z3lyTVDN+7Ke7HrmM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=L7FoQgpn
Subject: [Buildroot] [PATCH v2 1/2] package/libjaylink: new package
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

It is a shared library written in C to access SEGGER J-Link and
compatible devices.

https://gitlab.zapb.de/libjaylink/libjaylink

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Added in v2

 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libjaylink/Config.in       | 10 ++++++++++
 package/libjaylink/libjaylink.hash |  3 +++
 package/libjaylink/libjaylink.mk   | 16 ++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/libjaylink/Config.in
 create mode 100644 package/libjaylink/libjaylink.hash
 create mode 100644 package/libjaylink/libjaylink.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 66199a5b72cb..a87b81a9574b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -812,6 +812,7 @@ F:	package/empty/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/less/
+F:	package/libjaylink/
 F:	package/pocketpy/
 F:	package/sscep/
 F:	package/tinyinit/
diff --git a/package/Config.in b/package/Config.in
index 161d61728bf1..b8f83fac755e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -534,6 +534,7 @@ endmenu
 	source "package/lcdproc/Config.in"
 	source "package/ledmon/Config.in"
 	source "package/libiec61850/Config.in"
+	source "package/libjaylink/Config.in"
 	source "package/libmanette/Config.in"
 	source "package/libubootenv/Config.in"
 	source "package/libuio/Config.in"
diff --git a/package/libjaylink/Config.in b/package/libjaylink/Config.in
new file mode 100644
index 000000000000..87b219eca68f
--- /dev/null
+++ b/package/libjaylink/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBJAYLINK
+	bool "libjaylink"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  libjaylink is a shared library written in C to access
+	  SEGGER J-Link and compatible devices.
+
+	  https://gitlab.zapb.de/libjaylink/libjaylink
diff --git a/package/libjaylink/libjaylink.hash b/package/libjaylink/libjaylink.hash
new file mode 100644
index 000000000000..569480416113
--- /dev/null
+++ b/package/libjaylink/libjaylink.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  5557d623934a4bbc053c11f9a181375d7abeb76af910696d9e3d9b1de3bf6987  libjaylink-0.4.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libjaylink/libjaylink.mk b/package/libjaylink/libjaylink.mk
new file mode 100644
index 000000000000..64df09c86a73
--- /dev/null
+++ b/package/libjaylink/libjaylink.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libjaylink
+#
+################################################################################
+
+LIBJAYLINK_VERSION = 0.4.0
+LIBJAYLINK_SITE = https://gitlab.zapb.de/libjaylink/libjaylink/-/archive/$(LIBJAYLINK_VERSION)
+LIBJAYLINK_LICENSE = LGPL-2.1+
+LIBJAYLINK_LICENSE_FILES = COPYING
+LIBJAYLINK_INSTALL_STAGING = YES
+LIBJAYLINK_DEPENDENCIES = host-pkgconf libusb
+HOST_LIBJAYLINK_DEPENDENCIES = host-pkgconf host-libusb
+
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
