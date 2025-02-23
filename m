Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B488C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 21:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5021D406F6;
	Sun, 23 Feb 2025 21:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4KQwA7HJdo1; Sun, 23 Feb 2025 21:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1724440713
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1724440713;
	Sun, 23 Feb 2025 21:14:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 568CA943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 357AE60BDA
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7m1CEyVzsZtP for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 21:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F372060B77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F372060B77
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F372060B77
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:37 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4398e3dfc66so33263415e9.0
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740345276; x=1740950076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O7bOmPeXYreFssZa1QMaT+nYB/R3EiKUJ4YpkZMqpeQ=;
 b=jkCtuGRN9Vn0WFgIppHkM7fRC26HLpNUbxW9IUudLyeltEtGdcxnSzAhbk0ojUPmjy
 pwjxz+SxP1UnpSZkDHtJH7C/jzA0mfUl7GtH889kRSx/qm9Vzfp/V8+yx+oKMgd4GKXH
 CuDUR2Gjk5Ny65cB+XTOhEP0Aet0mDDTV51F5+cQX2q8HGhrIk0kdJQrDKRtpPwLrCGl
 yDR93rTU72d6gt9Z3IbE+Uu++XeKqrw/qrsaMQKVFJ9CJagb2QEyLJMNIU0KpyLfQ6Ty
 jTTI9zoapMdySogSQKTqCCz8EBfyKd897SewFSoTUBjpjVFK34uiRTK/VkQaU1kQO8jm
 zD9A==
X-Gm-Message-State: AOJu0YzBPJ0GDE8KoruByzap1ugAAJq3J+h55aAjRWIKtnPyZwClzG75
 KzVb01teDFMcfUG68vMSPqj+hwLSVJG5fK+UvzooMMkqRyeDBIn0kwy/wg==
X-Gm-Gg: ASbGncvsPSVQbD3njDZcBiZz3l9oivgrhgsGKSyIzr96X+B2VyxSK+l+XbYJ+q8mgEH
 0EFZ5rLZRDXkviOVAjlLfZp2Ks6BZkQgDg3sKnYfJORLo5hgGTbB86AK3C40kFnrV8V1atT/T+E
 PolPS3wtb69D3TjI94xp2QIQAUmwu6RCiQLjqC1nYK24SkBdEYMJMJJ7Xc3/OCFhRHgKnuPw9yr
 QIcR/4ygyUSChsy5FQ7R2IzaK9IrdfSaiGGV2+Nt9PxQM7ZI88QWAtBM2ef3FWb0PqeMIoXBACb
 Pu4chwtI0RjEOIsshAIWj/It4Fi3YozSJIZ9
X-Google-Smtp-Source: AGHT+IGFTBJYUwlczD+zcOHaYDY8u9Usq2qS/e3chzRcLIwycjaEsPRh+E1tXi6u+VPLjQdI4YArjQ==
X-Received: by 2002:a05:600c:19c9:b0:439:331b:e34f with SMTP id
 5b1f17b1804b1-439ae1f2f86mr91322515e9.17.1740345275950; 
 Sun, 23 Feb 2025 13:14:35 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030be5esm86757955e9.30.2025.02.23.13.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 13:14:35 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2025 22:14:31 +0100
Message-ID: <5e819993550219b8f32aed81a29672d4ed355aef.1740345268.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740345268.git.yann.morin.1998@free.fr>
References: <cover.1740345268.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740345276; x=1740950076; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O7bOmPeXYreFssZa1QMaT+nYB/R3EiKUJ4YpkZMqpeQ=;
 b=PBQW5QacBwiHRa1n0N36Rw1MlCq+r7R4bUgJwnST8adOlVZWnuQ0/P3BjKaWs81WjD
 pvjHrudd9oUoxqECJ8cVgUJX6uyDSsExcR2QaMg5kXYcP9JMKRksKVZuvXpoDvOjl0cv
 1yvsDp+APoP+Mb2emdBdO3lwuw3N0FAuKNz/NPVLqQdeJ7plrh2oSz3O7F3hIvd07I0k
 /BmjxjktB5ooay/ERUOH/G+KKqmkudRsjML0ms66yF6/aesKK1bhu5injoNEFBZmWlOc
 V+Wa7PVRUnSYhEo6cq+USWYnPnkS2PBYEYoXxBChqOSvcQu1RFztoDT+oRC3zHcwfxod
 fR0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PBQW5Qac
Subject: [Buildroot] [PATCH 7/8] package/netavark: new package
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in              |  1 +
 package/netavark/Config.in     | 10 ++++++++++
 package/netavark/netavark.hash |  2 ++
 package/netavark/netavark.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/netavark/Config.in
 create mode 100644 package/netavark/netavark.hash
 create mode 100644 package/netavark/netavark.mk

diff --git a/package/Config.in b/package/Config.in
index 5a3af06571..6e38f0ef33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2559,6 +2559,7 @@ endif
 	source "package/ndisc6/Config.in"
 	source "package/net-tools/Config.in"
 	source "package/netatalk/Config.in"
+	source "package/netavark/Config.in"
 	source "package/netcalc/Config.in"
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
diff --git a/package/netavark/Config.in b/package/netavark/Config.in
new file mode 100644
index 0000000000..caac3c4872
--- /dev/null
+++ b/package/netavark/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NETAVARK
+	bool "netavark"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Netavark is a rust based network stack for containers. It
+	  is being designed to work with Podman but is also applicable
+	  for other OCI container management applications.
+
+	  https://github.com/containers/netavark
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
new file mode 100644
index 0000000000..8fa2c9e647
--- /dev/null
+++ b/package/netavark/netavark.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  09471bd116fdebfd3f7a8100b37809e3a306d0f18e5feee8445ed1e01a22e0aa  netavark-v1.14.0-git4-cargo2.tar.gz
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
new file mode 100644
index 0000000000..e674da7e5e
--- /dev/null
+++ b/package/netavark/netavark.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# netavark
+#
+################################################################################
+
+NETAVARK_VERSION = v1.14.0
+NETAVARK_SITE = https://github.com/containers/netavark
+NETAVARK_SITE_METHOD = git
+
+# For protoc
+NETAVARK_DEPENDENCIES = host-protobuf
+
+NETAVARK_CARGO_ENV = PROTOC=$(HOST_DIR)/bin/protoc
+
+$(eval $(cargo-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
