Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3B4C021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 21:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A79540C04;
	Mon, 24 Feb 2025 21:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRYxBHSstJE7; Mon, 24 Feb 2025 21:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83E1C40C2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83E1C40C2C;
	Mon, 24 Feb 2025 21:22:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51CEF94E
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C242360E2E
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mcw8rrqqnroy for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 21:22:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A919760E2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A919760E2C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A919760E2C
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-439946a49e1so30687325e9.0
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 13:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740432146; x=1741036946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=US2/30TBb8CbIXQlVsme4zS67etx7aj+Z5EjWE8HfG8=;
 b=DVGR4GQaaGmtlRbTAFEVd6WFRJFjGX6kJdQ2TXluvXNNtX9G42ZNRe1+RDDjMT8EeE
 7kGpQxJAjuWjA3xtU9byo6RS8cSp2aO5+VpHTxzG+pJmYjoDwyJmDAUxOBHcT0hBJ5mk
 UzTs4fL5s0EBxw4GKhF7lNQ4atUE/JNGJdxxpP4LKAh2Irf+lys7A2lZp7kd+YtMfKwD
 R50a6RzbSPEt1B3soZX71wsDxCwClSteA3JyjZsfEC3oQP3KCQZh1ACOeFY4uIvkr20t
 Xg2tGQoyE96IL9NjSnKODA/L6zIynnyvUKo7/JsD6yMPyrI1N3FjERCbiJrj2XwZ2UOA
 Vp2A==
X-Gm-Message-State: AOJu0Yz60TNV1Svj+2Q4x7akmN2+JIh9f8hsHTXAFkM9NWt8OuLWMiNu
 n5YO6tnP1ODmh/X8NYnY7N0P/8isbG/4l65DTlurQoN+QeCNjbwWq2F2ZQ==
X-Gm-Gg: ASbGncuEt1a96EimNF5VeYIHaZtmFP8Rmy1Bg82/wcDOkFR3lXN+lWlJddsYIfXw/eU
 LbUAJMT/R7jnfdN8HbnVpvTQ8728uizQJh69zRC2Co8dMRIz+9smb7+v+kLmxOBSo3FPWxoJY7L
 rCfv1cuk41bGJezQoKpu979PEk26MXMIXzkl8m+Tsa64NXnew6ZiVQidRBOIkippeTsk1yi5TfS
 D+OgpgIYbTITiw6K4wH1yzEzcQ4RuCVjASr3bRuBoHpFWJ9/nHifgeO98HWoH7pQu5nKrlFJYbb
 C4D2IID6tNn9vav+EhXy+bU2P1XVAzHl+teM
X-Google-Smtp-Source: AGHT+IFm/7TRl+F35Y09I5s37WBcRrN06YL2zJ0AWqvG43fmiVMPdVP9GZ4AeiRkubBfX9I3Zxte/A==
X-Received: by 2002:a05:6000:2:b0:38f:3392:9fd8 with SMTP id
 ffacd0b85a97d-38f6e95f455mr11232933f8f.18.1740432145708; 
 Mon, 24 Feb 2025 13:22:25 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b01346d1sm119875635e9.0.2025.02.24.13.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 13:22:25 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Mon, 24 Feb 2025 22:22:20 +0100
Message-ID: <f7592f661eebee2a9770f1b67ebdf81ab2478630.1740432132.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740432132.git.yann.morin.1998@free.fr>
References: <cover.1740432132.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740432146; x=1741036946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=US2/30TBb8CbIXQlVsme4zS67etx7aj+Z5EjWE8HfG8=;
 b=X5qid/4YtnHv89URHeKoDBIwNBfVb9E1CdauLIQUGNHPWKtmBYfkHZjq2QJjvuw3rx
 T+ZpvldjKTOKRcK2IT3hkkQWPfUy0BJA5z2bGAzcd+yZCsh8NdQYdYGGOAVMw9LM1HdJ
 Ks6kgcW6lEeyuauMcK7c3RVSHdnTH61ESfhOyqP/Mt4fjUjNJsAbrjBHVMf2cQEU5FWZ
 nXtinfIhfbtwcy2LeSvi7d+GVmWmw+6VPBgc3ONcnwZHLOLkRgOQwUyduf2D2Seoxg75
 kocGAI1uHAKcRnnPkGk/kuXk05QvbLXPEt+YYk2gIyUHrMUOm0aiW6Fzgl5ViNAvQPU/
 h9Ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X5qid/4Y
Subject: [Buildroot] [PATCH 7/8 v2] package/netavark: new package
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
Cc: Julien Olivain <ju.o@free.fr>

---
Changes v1 -> v2:
  - add licensing information  (Julien)
---
 package/Config.in              |  1 +
 package/netavark/Config.in     | 10 ++++++++++
 package/netavark/netavark.hash |  3 +++
 package/netavark/netavark.mk   | 19 +++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/netavark/Config.in
 create mode 100644 package/netavark/netavark.hash
 create mode 100644 package/netavark/netavark.mk

diff --git a/package/Config.in b/package/Config.in
index a152268209..460955cb90 100644
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
index 0000000000..585763be42
--- /dev/null
+++ b/package/netavark/netavark.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  09471bd116fdebfd3f7a8100b37809e3a306d0f18e5feee8445ed1e01a22e0aa  netavark-v1.14.0-git4-cargo2.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
new file mode 100644
index 0000000000..b2508bb5a8
--- /dev/null
+++ b/package/netavark/netavark.mk
@@ -0,0 +1,19 @@
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
+NETAVARK_LICENSE = Apache-2.0
+NETAVARK_LICENSE_FILES = LICENSE
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
