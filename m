Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2743C83F26
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 12:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6940181E08;
	Tue, 29 Jul 2025 12:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXShQlkWVj8A; Tue, 29 Jul 2025 12:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 519D581E10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 519D581E10;
	Tue, 29 Jul 2025 12:08:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB35D94
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 12:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83FA381E08
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 12:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jpy2MZmo9lmq for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 12:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64B0581E10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B0581E10
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64B0581E10
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 12:08:51 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ae6f8d3bcd4so1091103166b.1
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 05:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753790929; x=1754395729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vmZ5vUOMxO7IompuAqclSqQCnycrQO4Nih9Cu4RrkA=;
 b=jVg/SimMhhg0ccLriqgnZ0GBb/ojmns08ifb2X8BIH/QrOe0hzq9EB4BJbPwXttCR8
 VAoNekScFGqo4cGpCfXjxoQrok2G79IpKj5mIJO8R+DEhjIeBqLbujCULxDxvj62VSTC
 GPnwwRzn3jLfdmSSGltghj8Ig5lZ4e/jcffx/rj068LkyWfxhKFrLUj6Cx49AF1fX+gz
 rtQIhyedTYwlt0uVIeIT/+r2fxTJjXXkZa6zMEbUqaZnfoF1AVdhQqfyp/kSiV8KViV0
 qzFnwdmPsLnxvDiNNQfHB22En/QXIOCHtdJMZ8Zvhm482bElyHZUf4+Gvfa3qFd8G33e
 4Y6A==
X-Gm-Message-State: AOJu0YwmSnpFftz2JJ2varj/mnpL82k3F7ajPPhCtNjMVrAuXim9UK2F
 9PX0RgZtpPBfiDu7+0994NAF66LtuKweF8gZZy/MmyVCU9m2RccGmxAGMIOd
X-Gm-Gg: ASbGnctOfVTwMjgKVdKKT6Y4789Nd//pL4lPPNe1cFb0bu2sUcxaj1uijijjOJa6mWk
 6PbXDnZr+cUPrN+h8JJ/ZybL3YLjJt0B1RTmLjDCSN7KgibAA/wSH0sM7QPoxD/DNGQodUsVHg0
 VEwTc+j2eOKOsBECjkIvw1MxIWBfOYCNeSyVrhCxUYustuQkP1gl+49ysjiGqR/U5xs75LqIjMT
 /EjCO7yP9/BQvzR/+ormU0W2FY/8OXOtKO06u0ltZfkrOaguHEheVRLtPFMf0z74Vgtib/smcEv
 lBNU+PK/JaswksVf87EMXsIxQHn7F5EerLjSVZwIg0YMXE7N+2/uLA6XeSyjSAGLVjfRkx6RNxW
 zZ5NKdbaL7nfoX3X8vyEh5t7U3uf1WZqL5tF7
X-Google-Smtp-Source: AGHT+IEvpLeErphstjAVjaetuNCdAsg/AHrEozXA9tgJeyqXjJaf5hcVqaox5+2gOcvaDs4QXPFAXA==
X-Received: by 2002:a17:907:db16:b0:aec:4aa6:7800 with SMTP id
 a640c23a62f3a-af6175093bbmr1739978766b.20.1753790928775; 
 Tue, 29 Jul 2025 05:08:48 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6156925daf2sm930794a12.35.2025.07.29.05.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 05:08:48 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 29 Jul 2025 14:08:45 +0200
Message-ID: <20250729120845.240104-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728131926.848832-1-shirokovalexs@gmail.com>
References: <20250728131926.848832-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753790929; x=1754395729; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vmZ5vUOMxO7IompuAqclSqQCnycrQO4Nih9Cu4RrkA=;
 b=M82jVX2rJtx4/+ovK4N4YrUvdf/Dc1UOr+FdDJmGN2zehVBUQZfmxVggZ1gkwNWYye
 bjkpG+NwCVip3e1pgBL8x/CebsRBVBsD8yyV41LaqWX51tRlnP2nUgS8POsPtbPJ54o5
 Yycg4LY1o2HqlsLbv3DlIsj8d3KQSqk2zERnk26CmwZnwJc6OPXZlcFuFOTY5aVQj5m/
 L5L2Tzkt/jxbkY7BmNZ4VPQeoa690ON7hP0+xA9J7MrQ/aEB4ErKCAQcFO3YFFe3dWO1
 HGkZcOgnK0i9Ixoy7uOqXInGcOMcPV7c/WESCz8dVQPc13ura8ETOkJ9essMYDOq14L8
 n1DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M82jVX2r
Subject: [Buildroot] [v3,1/1] package/zellij: new package
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

An advanced terminal multiplexer with batteries included. Supports
layouts, floating and stacked panes, plugins, and customization.
Provides rich functionality out of the box.

Zellij is aimed at developers, operations-oriented users, and anyone who
loves the terminal.

https://github.com/zellij-org/zellij

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
Changes v3->v2:
-  Changes have been squashed.

Changes v1->v2:
- Fixed format of Config.in file. Added comments.
- Fixed ZELLIJ_VERSION.'v' symbol is removed from the variable.
- Updated DEVELOPERS list.
---

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/zellij/Config.in   | 17 +++++++++++++++++
 package/zellij/zellij.hash |  3 +++
 package/zellij/zellij.mk   | 12 ++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/zellij/Config.in
 create mode 100644 package/zellij/zellij.hash
 create mode 100644 package/zellij/zellij.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 12a41597af..ab935fa1de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -132,6 +132,9 @@ F:	package/openpgm/
 N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/libest/
 
+N:	Alexander Shirokov <shirokovalexs@gmail.com>
+F:	package/zellij/
+
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
 
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..3699f1d1d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2832,6 +2832,7 @@ comment "Utilities"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
 	source "package/ytree/Config.in"
+	source "package/zellij/Config.in"
 	source "package/zoxide/Config.in"
 endmenu
 
diff --git a/package/zellij/Config.in b/package/zellij/Config.in
new file mode 100644
index 0000000000..64b158cfe3
--- /dev/null
+++ b/package/zellij/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_ZELLIJ
+	bool "zellij"
+	# Zellij uses the cranelift crate which has architecure
+	# dependencies. Specify them explicitly. See details here:
+	# https://docs.rs/cranelift-codegen/0.122.0/cranelift_codegen/
+	depends on BR2_x86_64 || BR2_x86_i686 || BR2_aarch64
+	depends on BR2_PACKAGE_HOST_RUSTC
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+	  An advanced terminal multiplexer with batteries included.
+	  Supports layouts, floating and stacked panes, plugins, and
+	  customization. Provides rich functionality out of the box.
+
+	  Zellij is aimed at developers, operations-oriented users,
+	  and anyone who loves the terminal.
+
+	  https://github.com/zellij-org/zellij
diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
new file mode 100644
index 0000000000..6f6d48662d
--- /dev/null
+++ b/package/zellij/zellij.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  a416da8cb78575f39c64bab5ec767af7cf76ae34ebb8a31c28db55fd990bc34a  zellij-0.42.2-cargo4.tar.gz
+sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
new file mode 100644
index 0000000000..5dbc4c30b4
--- /dev/null
+++ b/package/zellij/zellij.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# zellij
+#
+################################################################################
+
+ZELLIJ_VERSION = 0.42.2
+ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
+ZELLIJ_LICENSE = MIT
+ZELLIJ_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
