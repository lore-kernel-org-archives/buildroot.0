Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363D7C3ABAC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 04:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCF3811DA;
	Tue,  6 May 2025 04:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCtvOBWAOkkP; Tue,  6 May 2025 04:06:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81C91811CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81C91811CA;
	Tue,  6 May 2025 04:06:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CAE4412E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 04:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5958F403E0
 for <buildroot@buildroot.org>; Tue,  6 May 2025 04:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOtc2wgv1Tzo for <buildroot@buildroot.org>;
 Tue,  6 May 2025 04:06:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=rubacha.jack03@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B9EE4041F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B9EE4041F
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B9EE4041F
 for <buildroot@buildroot.org>; Tue,  6 May 2025 04:06:02 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-72c7336ed99so1273055a34.0
 for <buildroot@buildroot.org>; Mon, 05 May 2025 21:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746504360; x=1747109160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tUR3mhl0081nL8/od7cOwSG7aL4iFu1QevQrSz6oHq0=;
 b=KUsXPlohmJqwtCqtcRHnDFyBlSM6SH94AQGsblAVWqCepopPs24NhSCN7UqPWsmDHo
 m55Ex+ImTFBvA/5n3or3wZLf9ZAgxvc36RddV+Kwrtgshwn6oMRyc8r6lqx221KsfwaD
 7g4EPsFWegix+Qc/GnAgWWecSGpRyh3PfzzpM3EiBg+x69tp7Zx9F/UT1YS41BdLkKoB
 BZOj49PFEsarnHCpOYrKjL5A2lwhrC1JRpbYXWxBTtYcV29Aeni+O6M4z05+GwfkuCHw
 H53LZJb+KoTJisjq+QhIJg/A8HKHVbe34q9kVlVxyzvzvoKNAhgTTHli3QHMfCya+T/8
 aR+w==
X-Gm-Message-State: AOJu0YxrAvlbNyJS02YQfWA1+7s9mOy0u38G6qKKN2xc+GFFHbVvfjeE
 /KwtesICGc9a/tCFwXeaj6XiTkSSs+jWghSR43scJ+dDnArnZEAczHHB5Q==
X-Gm-Gg: ASbGnctv4UsqHFjHDpaJXNzqj1Hngc6SMinxwoTY7qgF5ZSwd9cLu6Wtx9PhL/I1VX1
 1FzBK2Kd9SC/887uMK5cPwLMTfIx4az0guK9sG3TerjJAcY/LaLFxw7NKdNGsbqSOgH/ZnBfV8E
 7IKSp/tEj14L55PLkKzAtXM61SMrAhWXmuosEUak2bZ6th8AHYXZaI3cKM3pHzj53nDA9sUz2p0
 7dgdVXvSDD0YoSLSS1TF+fFTnij01/aJoBc55X+PPsXH4gfqT2ov5FonpK4rFhF/yOgErv91mIW
 gQyKP0NQ9Avgah1sNOynhfaNyVanQpo8heuGqU9hG1lY4tEQQQCXmBDPubfR+G+RoAE4maDD9Vs
 CSsZT9yskC6PS1zYElSG4OQ==
X-Google-Smtp-Source: AGHT+IGFJor00g+Z64BF/z+kLgg1SJRWrFuU+jQikqbt+7iWbDknJH4EEH+ZLy1glDJpGGk5biCY4g==
X-Received: by 2002:a05:6870:3294:b0:2c1:5448:3941 with SMTP id
 586e51a60fabf-2db38e95e6dmr1277082fac.18.1746504360499; 
 Mon, 05 May 2025 21:06:00 -0700 (PDT)
Received: from localhost.localdomain (syn-071-088-044-109.res.spectrum.com.
 [71.88.44.109]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4033dc83d9csm2263206b6e.48.2025.05.05.21.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 21:06:00 -0700 (PDT)
From: Jack Rubacha <rubacha.jack03@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jack Rubacha <rubacha.jack03@gmail.com>
Date: Tue,  6 May 2025 00:05:56 -0400
Message-ID: <20250506040556.1023507-1-rubacha.jack03@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746504360; x=1747109160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tUR3mhl0081nL8/od7cOwSG7aL4iFu1QevQrSz6oHq0=;
 b=Tqshkwx4yiueg+u68DqoL8LHjHl3jdXwG0sxHFSASSd6DWHhKljjHvZy0vHslx+ykL
 wBIqtvU4YaZX6TjJdpkKPh1sb8q9NqA+aBc0lSOch61sURgrwML6aMYUPG3E8l9krQyg
 QCHzBScPaf9Hy4cJ/pHFWZvqi3puD8EqK4IDfjgPOaZEC3tssYbdCQyJsxc+typ3msx/
 cB5GYIEYB5ruiIb/XDQyHuW8G/8EiZqY70K3Dn74gR6B5GP6+rJ6nCipp2h8oNUIz214
 FY4ZGzbBlmOB2HhMud+mTHp+mx3d4B+XuQZ/VO6H/hS5jJp7GIlqMqhJUBWIcdTpb/bL
 ZL+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Tqshkwx4
Subject: [Buildroot] [PATCH 1/1] package/qt6grpc: new package
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

Signed-off-by: Jack Rubacha <rubacha.jack03@gmail.com>
---
 package/qt6/Config.in            |  1 +
 package/qt6/qt6grpc/Config.in    |  7 +++++++
 package/qt6/qt6grpc/qt6grpc.hash | 10 ++++++++++
 package/qt6/qt6grpc/qt6grpc.mk   | 34 ++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 package/qt6/qt6grpc/Config.in
 create mode 100644 package/qt6/qt6grpc/qt6grpc.hash
 create mode 100644 package/qt6/qt6grpc/qt6grpc.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 10594691cf..9c297b321e 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -48,6 +48,7 @@ source "package/qt6/qt6charts/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6graphs/Config.in"
+source "package/qt6/qt6grpc/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6multimedia/Config.in"
diff --git a/package/qt6/qt6grpc/Config.in b/package/qt6/qt6grpc/Config.in
new file mode 100644
index 0000000000..66adc85cfa
--- /dev/null
+++ b/package/qt6/qt6grpc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QT6GRPC
+	bool "qt6grpc"
+	select BR2_PACKAGE_HOST_QT6BASE
+	help
+	  This package corresponds the Qt GRPC module:
+
+	  https://doc.qt.io/qt-6/qtgrpc-index.html
diff --git a/package/qt6/qt6grpc/qt6grpc.hash b/package/qt6/qt6grpc/qt6grpc.hash
new file mode 100644
index 0000000000..0ebcaaf2a0
--- /dev/null
+++ b/package/qt6/qt6grpc/qt6grpc.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgrpc-everywhere-src-6.8.1.tar.xz.sha256
+sha256  b1615c7096b012e5f42aea57c420d2ce21c906d0eda3ea373b09a47cf40b5e80  qtgrpc-everywhere-src-6.8.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6grpc/qt6grpc.mk b/package/qt6/qt6grpc/qt6grpc.mk
new file mode 100644
index 0000000000..f443116ae0
--- /dev/null
+++ b/package/qt6/qt6grpc/qt6grpc.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# qt6grpc
+#
+################################################################################
+
+QT6GRPC_VERSION = $(QT6_VERSION)
+QT6GRPC_SITE = $(QT6_SITE)
+QT6GRPC_SOURCE = qtgrpc-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6GRPC_VERSION).tar.xz
+QT6GRPC_INSTALL_STAGING = YES
+QT6GRPC_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6GRPC_CMAKE_BACKEND = ninja
+QT6GRPC_LICENSE = GPL-3.0
+QT6GRPC_LICENSE_FILES = LICENSES/GPL-3.0-only.txt
+
+QT6GRPC_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6GRPC_DEPENDENCIES = \
+	host-pkgconf \
+	qt6base \
+	host-qt6grpc
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6GRPC_DEPENDENCIES += qt6declarative
+endif
+
+HOST_QT6GRPC_DEPENDENCIES = host-qt6base host-protobuf
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
