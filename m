Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB797C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94A6E8420E;
	Sun,  2 Jun 2024 20:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y97Jp6f2T9z4; Sun,  2 Jun 2024 20:41:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 500ED84394
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 500ED84394;
	Sun,  2 Jun 2024 20:41:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AF9E1BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A445833B7
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZaIj5vpXbY1 for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:40:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5F5483312
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5F5483312
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5F5483312
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:40:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-35dc36b107fso2707256f8f.1
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360800; x=1717965600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qSXSv7exmnDXhvmoR4LaIuDz6bmMDZ7fsUXUgvqTadg=;
 b=r9ELvYtoUgo+ZSSOm42VW7/J3QYlIYn9g4Vo1R7qk6zUhyGILz5WhvIFMphAz8cxuN
 73GKFdSFKZZtstOWVrh6lYqzlPQlwXm1Bz3Dbw34qaVxYuXtMzw1tY9UYTxuw9ozqgJt
 OQtN6QH8Ue1Gnb3MNG0gNWbVcWTBHezjd8hEtKks/5OortTrgLtWSYFURGL4aA5iicO4
 8oxtkL0rhaMfHu7u6rspG1M4MI1SL/lUZYpumTYaElA1ibon1FJvZ1eA1Tk5QTuN7R+r
 1K8qGRtaLuogftbBmSu3cRo48bZdDwivkLdmQnrKMn7NpYGX6f5NKkOUWZRVylXWc6WA
 J79A==
X-Gm-Message-State: AOJu0YwbyjJU87u/AXgBmTYq2DpyHgorXQe52o8O66fZKkx5ir7z4zZL
 U7s3VTvnQmCXzwKvmjNoGLsqEXfyKmjB3wfPBVmgJo/pxnqqNxKrmWtjUA==
X-Google-Smtp-Source: AGHT+IGhGVLIzrh83+N6usMV7QTiPdqsGUVQ9CLknfFlwvdhL5jlGGz9EWuD80ZGSqZjwNQ1DwcrEQ==
X-Received: by 2002:a5d:560f:0:b0:354:f802:f3a6 with SMTP id
 ffacd0b85a97d-35e0f25dcb1mr5053560f8f.9.1717360799699; 
 Sun, 02 Jun 2024 13:39:59 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:59 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:52 +0200
Message-ID: <318a115ec349252c74ccb73f9ced93b4d41c1504.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360800; x=1717965600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSXSv7exmnDXhvmoR4LaIuDz6bmMDZ7fsUXUgvqTadg=;
 b=ngmnzVztN0hgtI5AbqmAzwrLzBe7SVstLtemzdaAgfdqNPBUb2XG5L0XM/8Y8qoajS
 EtUZSFe+juc0URNTYliG3ENxZHTpAogwDWxzJOnhZix6CCwzTgUh2bRzAg9re2vjlX7a
 JiIG7AodqCMXSzrbA4YQ+jnBYbc9SbC7b21o3FW3zZ5MBgwYY1mJwsm3fGCkTOX1Ck/p
 yrRoPtuEix/sWHr0KnJdl2ILTeoYXOz1v5RCF+7HUnV6FgaCIcPr+Nrz2xMtHTncCa7P
 SfeSPdVoHPd17IYZOZiJTi8uomRH545yc2u1k9p1pTFvUTdE7+aerNy4cAKX4w/sdCPC
 Xysg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ngmnzVzt
Subject: [Buildroot] [PATCH 16/16] RFC: package/anvil: new package
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thie is an RFC, because it has only been build-tested to validate the
cargo-unlocked case; there has been no runtime test of anvil.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in       |  1 +
 package/anvil/Config.in | 20 ++++++++++++++++++++
 package/anvil/anvil.mk  | 30 ++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 package/anvil/Config.in
 create mode 100644 package/anvil/anvil.mk

diff --git a/package/Config.in b/package/Config.in
index 1b6a5b0dab..74635118bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+	source "package/anvil/Config.in"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
 	source "package/dmenu-wayland/Config.in"
diff --git a/package/anvil/Config.in b/package/anvil/Config.in
new file mode 100644
index 0000000000..eb65a9fb53
--- /dev/null
+++ b/package/anvil/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_ANVIL
+	bool "anvil"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS  # wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # wayland
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_MESA3D_GBM
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_SEATD
+	select BR2_PACKAGE_WAYLAND
+
+comment "anvil needs udev /dev amangement, mesa3d w/ gbm, a toolchain w/ threads, shared libs"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_PACKAGE_HAS_UDEV \
+		|| !BR2_PACKAGE_MESA3D_GBM
diff --git a/package/anvil/anvil.mk b/package/anvil/anvil.mk
new file mode 100644
index 0000000000..7de9f3e06d
--- /dev/null
+++ b/package/anvil/anvil.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# anvil
+#
+################################################################################
+
+ANVIL_VERSION = fb44b240ea4a3aa39a6b92f5bede23301ab9a26e
+ANVIL_SITE = https://github.com/Smithay/smithay
+ANVIL_SITE_METHOD = git
+
+# Upstream refuses to lock their package:
+# https://github.com/Smithay/smithay/issues/496
+ANVIL_CARGO_LOCKED = NO
+
+ANVIL_SUBDIR = anvil
+
+ANVIL_DEPENDENCIES = \
+	libinput \
+	libxkbcommon \
+	mesa3d \
+	pixman \
+	seatd \
+	udev \
+	wayland
+
+ifeq ($(BR2_PACKAGE_XWAYLAND),y)
+ANVIL_DEPENDENCIES += xwayland
+endif
+
+$(eval $(cargo-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
