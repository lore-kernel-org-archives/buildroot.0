Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0849C36010
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 08:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5779B4F0FE;
	Fri, 28 Mar 2025 08:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9T344gdiBgA; Fri, 28 Mar 2025 08:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8F034F126
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8F034F126;
	Fri, 28 Mar 2025 08:47:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 623B312A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 488164F0FE
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63LLqfDVZ3y5 for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 08:47:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50DBC4F0DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50DBC4F0DA
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50DBC4F0DA
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so1509779f8f.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 01:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743151671; x=1743756471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kPb3o2wzGJbp+8zFYUIWb6eucurMod/QXK++IreLELM=;
 b=Ll1dyiywvJW7qTZ3Ry6g5Mys/I5Ck5D3amOKJH7hd3UFn6GpobbJKK6WYEydwhQzKw
 jKZcMqQ8mhsuzvzLZkMytRc1PgkPv/AHDUNsbSerU/WFzc4/7OX1qlCs06iaQoFIw3r+
 lWmBwnHACkpusGi+/RWi2uv20u94G4S8VMj9NGJsQDH8zOIrF1fJT4c/oUfCNFSYzxdD
 ZD7Bszp/Fz5Z9mts5ah89koUQkC0/ljNkG4HJKsRVnHZXkIJ55uE1e+hNqR7NrHwd88Z
 2bSHiDhQG1Vhbk8gfGzrLPVDvI23D0jUCVMMIuAkeQsha3YNysPysDyXuBh1EjXwxz69
 zzPA==
X-Gm-Message-State: AOJu0YznXv+kY4x2rUp/o17BDdc4oO+GiQVASZN8Q96u8aEDeTHPRCPN
 fQPMjfU9cnhg1Y83JGSzTOfz3KDemDiDgmWWZs2xpzzrCPSlCmHfqOiySfQT4Lk=
X-Gm-Gg: ASbGncvBmeMlan99j/EOhoBfZKtnziQ3t4PXCXe9k/zsXurIkFv7dCfYUE723LHDX+1
 HmV12auT4yTBCDwzECBi0Y95mTRIZKksZjeGqYj+o3+goLFakbdromuocBQvyVwM1Ft9ECkt6No
 IxKLh1KH2vP6B9HwX3/GoGwKfiQkLvCb7LI2+2OxAbODpxkP4YmeVMCvnDlcFFVHvsbvMtcRoCj
 3pZKlVb4tVKXo9A47lRAd1jvGEpIYw9f40Ag6Q52SzMgv0wGsj7sJePvmvpEYXyBVYGMixW42kw
 uXoefznRlhLgKHD8VlnZjK5QKR6vzFysaMlDzJtbsPJ9u+joUNhC0PsKYx27P6VmuJMNMw3qZA=
 =
X-Google-Smtp-Source: AGHT+IEoW8yc42BryrkBdeVBqDkuOeiKWH8DoZJlJs/I87wyvaYUDYFAdaFCImxywHFGtHNQlIo3Fw==
X-Received: by 2002:a5d:5f48:0:b0:391:2bcc:11f2 with SMTP id
 ffacd0b85a97d-39ad173d23bmr6249303f8f.1.1743151671077; 
 Fri, 28 Mar 2025 01:47:51 -0700 (PDT)
Received: from freepad.iliad.local (free-reseau.vlq16.iliad.fr. [213.36.7.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e12bsm1964481f8f.62.2025.03.28.01.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 01:47:50 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Fri, 28 Mar 2025 09:47:42 +0100
Message-ID: <20250328084743.8759-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328084743.8759-1-maxime@leroys.fr>
References: <20250326132655.35729-1-maxime@leroys.fr>
 <20250328084743.8759-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743151671; x=1743756471; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kPb3o2wzGJbp+8zFYUIWb6eucurMod/QXK++IreLELM=;
 b=BNQDXFhwWDaTHq4OCGbcMVlg2XCtAMM1M4kQyViAsbyESx3jfN7ccT+TCeXu/4d9eD
 iSPCRdgF/tH5k9ghKx0kjyGE/epzqHggHDmccMcwEiorIcHrestnGHVGHpvGJuRrOf98
 UN1zIPMNpWjdXCMQHAuHy7FjqkNjCude0m4tMNmvpRGLkkWzS2u5edw2HeIKo1Mv6Fgp
 g26KuPJDUAgYbQPdOqRV4QdS/oS4hIZ0tX2SThvU+mF6yhVsWtwyUy6ihhllrh2fXMVO
 NelUaCRtvoXk54g6Sma2gyxlcx6xmo8pj604xVTN2B2najnVV6QUCa+P63nrOmQPrA5e
 5s3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BNQDXFhw
Subject: [Buildroot] [PATCH v3 2/3] package/grout: new package
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

Grout is a Graph router based on DPDK.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/grout/Config.in  | 13 +++++++++++++
 package/grout/grout.hash |  3 +++
 package/grout/grout.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/grout/Config.in
 create mode 100644 package/grout/grout.hash
 create mode 100644 package/grout/grout.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 44f7684c97..c9871f5d32 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2383,6 +2383,9 @@ F:	package/libtraceevent/
 F:	package/libtracefs
 F:	package/linux-tools/linux-tool-rtla.mk.in
 
+N:	Maxime Leroy <maxime@leroys.fr>
+F:	package/grout
+
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
diff --git a/package/Config.in b/package/Config.in
index d8751fc19f..854cbc6cca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2493,6 +2493,7 @@ endif
 	source "package/gesftpserver/Config.in"
 	source "package/gloox/Config.in"
 	source "package/glorytun/Config.in"
+	source "package/grout/Config.in"
 	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
diff --git a/package/grout/Config.in b/package/grout/Config.in
new file mode 100644
index 0000000000..a39c3283eb
--- /dev/null
+++ b/package/grout/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_GROUT
+	bool "grout"
+	depends on BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_DPDK
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_NUMACTL
+	select BR2_PACKAGE_LIBECOLI
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	help
+	  Graph router based on DPDK
+
+	  NOTE: grout needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
new file mode 100644
index 0000000000..cff686ff19
--- /dev/null
+++ b/package/grout/grout.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  10f8e20b4aa1a8fe928c87b249e23267eef356f39b04994a0b88b52931fcaa4b  v0.8.4.tar.gz
+sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  LICENSE
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
new file mode 100644
index 0000000000..0d6fb8dce9
--- /dev/null
+++ b/package/grout/grout.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# grout
+#
+################################################################################
+
+GROUT_VERSION = 0.8.4
+GROUT_SITE = https://github.com/DPDK/grout/archive/refs/tags
+GROUT_SOURCE = v$(GROUT_VERSION).tar.gz
+GROUT_LICENSE = BSD-3-Clause
+GROUT_LICENSE_FILES = LICENSE
+
+# Avoid using buildroot commit hash
+GROUT_CONF_ENV += GROUT_VERSION=$(GROUT_VERSION)
+
+GROUT_DEPENDENCIES = \
+	host-pkgconf \
+	dpdk \
+	libevent \
+	numactl \
+	libecoli \
+	util-linux
+
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
