Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FA9D12D4F
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 18:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B41F60621;
	Sun, 10 Nov 2024 18:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAohmlEGlO1Q; Sun, 10 Nov 2024 18:26:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58A7160639
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58A7160639;
	Sun, 10 Nov 2024 18:26:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 546E4D8F
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35D3960621
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaMLYGvoIN6N for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 18:26:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FC6960630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC6960630
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FC6960630
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:26:20 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:812c:23ef:fa95:555a])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 585825FFC0;
 Sun, 10 Nov 2024 19:26:16 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Sun, 10 Nov 2024 19:24:51 +0100
Message-ID: <20241110182451.49722-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241110182451.49722-1-vjardin@free.fr>
References: <20241110182451.49722-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731263178;
 bh=lOPO5nXlnJiY9cAr/dFj5R7Wgr3XBf59gMkh0zjd6JY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IHPZFhS4VJ5/M2Z+XRhdpep20azuDsLuwoIZeE29nhzJwXRK9uJLjXcRQWwaSTT8q
 vzrLUrIqW5YnAchbtaGE5/ztat56hiKIZR7Ruc2i7An6+WLXRdPT7RuZTr0czBesaQ
 DB5wOh1FPf451ZBnQcG1BFlJLqz6oHXFJmZC/HF37SUUPzPLRISuvVlYiNAhTyuWZF
 Mw+FHh8qbVhCruYI9n5BPXw4M6T8SSbRtvlvhyWymmvhjdPPz0lGpbz3132Yl3HGV4
 OQWSFmMLq185K5N48rwR9F+Y3DtMCyAjk+TeOkFOaFI+F1/29x67QiwRWx+DFJdmBo
 5Q/f98y1eDXXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IHPZFhS4
Subject: [Buildroot] [PATCH v1 1/1] package/mlx5ctl: new package
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

Add a new package that can be used to manage the Mellanox/NVIDIA
Connect-X boards.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/mlx5ctl/Config.in    |  9 +++++++++
 package/mlx5ctl/mlx5ctl.hash |  3 +++
 package/mlx5ctl/mlx5ctl.mk   | 12 ++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/mlx5ctl/Config.in
 create mode 100644 package/mlx5ctl/mlx5ctl.hash
 create mode 100644 package/mlx5ctl/mlx5ctl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index edf823b34b..384e185944 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3274,6 +3274,7 @@ N:	Vincent Jardin <vjardin@free.fr>
 F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
 F:	package/dpdk/
+F:	package/mlx5ctl/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index 876b340a8a..d60835a2be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -567,6 +567,7 @@ endmenu
 	source "package/memtool/Config.in"
 	source "package/mhz/Config.in"
 	source "package/minicom/Config.in"
+	source "package/mlx5ctl/Config.in"
 	source "package/msr-tools/Config.in"
 	source "package/mxt-app/Config.in"
 	source "package/nanocom/Config.in"
diff --git a/package/mlx5ctl/Config.in b/package/mlx5ctl/Config.in
new file mode 100644
index 0000000000..0eaaf29653
--- /dev/null
+++ b/package/mlx5ctl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MLX5CTL
+	bool "mlx5ctl"
+	help
+	  Provides a unified toolset for accessing, debugging, and
+	  monitoring ConnectX MLX5 devices, utilizing secure interface
+	  to simplify diagnostics in production systems with a secure
+	  kernel lockdown enabled.
+
+	  https://github.com/saeedtx/mlx5ctl
diff --git a/package/mlx5ctl/mlx5ctl.hash b/package/mlx5ctl/mlx5ctl.hash
new file mode 100644
index 0000000000..3924e9000a
--- /dev/null
+++ b/package/mlx5ctl/mlx5ctl.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  203253c7354d48b8fba6d9552e316d42a6428fc5ee4fa21b4c490a5b40af2c8d  mlx5ctl-0f64d161e1dad441d2e93a3fd1c9580b0103ce59.tar.gz
+sha256  9e25b25042448dc6de5536cea7183b5ac999245ed54b5bb71b0e3b1200e41e7a  LICENSE
diff --git a/package/mlx5ctl/mlx5ctl.mk b/package/mlx5ctl/mlx5ctl.mk
new file mode 100644
index 0000000000..339ba0f5b3
--- /dev/null
+++ b/package/mlx5ctl/mlx5ctl.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# mlx5ctl
+#
+################################################################################
+
+MLX5CTL_VERSION = 0f64d161e1dad441d2e93a3fd1c9580b0103ce59
+MLX5CTL_SITE = $(call github,saeedtx,mlx5ctl,$(MLX5CTL_VERSION))
+MLX5CTL_LICENSE = BSD-3-Clause
+MLX5CTL_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
