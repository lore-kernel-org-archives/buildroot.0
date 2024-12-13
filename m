Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC20EE77180
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 11:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9185281F3A;
	Fri, 13 Dec 2024 11:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Y0Vg-pXaoXw; Fri, 13 Dec 2024 11:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 751D481F53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 751D481F53;
	Fri, 13 Dec 2024 11:58:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D4CAECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D0B14091C
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9S0SQzto3whr for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 11:58:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD50E40903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD50E40903
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD50E40903
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:43 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so13211161fa.3
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 03:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734091121; x=1734695921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZCsXLZ6CkOAGvX/GIL8REbIYPKpKJwQOf31AmX1l3uc=;
 b=Fxxd3FgonRlh98Y4AO7CzVPmp2smw3FcyIViUJd+JyoAcJbswZ47dN1fU+p7RUgpHx
 YmzKbtZsWPqUTeqi7/rN1MPLVwoiNXRI63F4tINT3pxZ5/omplK67QQrBqfaikeIKTGi
 xjlrnnUsDnRmHwiyqUSLlskUIu5bft7TJvNFCg1QP6ytIIXcwQrtflXEFbMu9gTP5u8e
 bDEHexQzLAsX3jMF5SVOkLh97DPJvBgIB3Py48d3+TB/a8QKomrl7Nbmy9lcgRekkMKJ
 n7c3n4Uxs0eyxfTk71bahi3TOolA5BzYVhQ3adH1/RZ3AS6HnIiSqCS1ornQGwFkIcw7
 KFag==
X-Gm-Message-State: AOJu0YwUU2nDhNVUlLBeJO42ettodQ/5IlPG+hBHVqNpDf7m9IGN6uKh
 w3J9gMbmA+2jtVm+/b0FX6rbOBHhrWRFoLXe/k+o2CrWSYCDk2A/Wv5nGQ==
X-Gm-Gg: ASbGnctbHn3MKefjkUb5guN89E2ZymxMs4dDV+QHvEkTlk7cJBbLko5LziBD6uC+gS8
 kSyK2EGSmFe8M5R5tZ2UK/xfxqDuIUcW7q/b819Wn5rwrfucDAy2z1kG5y00FOmtXrtD004U0jm
 vcDCcjP2N5ZDhvpS9EW1YSiOMZI8E0YovfX8RbOuTgE7orSzcpRQjXQPznaohD8TrIxkZl8HCA+
 pP+lVJARCbJvfaF2ES5Xurl1IrWzBqscira2r9Xo09NhEj/bHpHa+VO070lIOvjNKBSry5fwV5n
 REkqm9Sa/WMAaZU=
X-Google-Smtp-Source: AGHT+IEZzzTFJAOhmVQXX/9Wb3S7do6Ixq2GNbbibHrlw05/GWXh6jjiWZ4yS4igTcQBXxAK4mzcxA==
X-Received: by 2002:a2e:bc0e:0:b0:302:1dd5:6b34 with SMTP id
 38308e7fff4ca-302546116d9mr9313961fa.29.1734091121346; 
 Fri, 13 Dec 2024 03:58:41 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30038ce97b4sm20610651fa.118.2024.12.13.03.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 03:58:39 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian@klarinett.li>,
 Andreas Naumann <ANaumann@ultratronik.de>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Date: Fri, 13 Dec 2024 12:58:10 +0100
Message-ID: <20241213115820.655993-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213115820.655993-1-roykollensvendsen@gmail.com>
References: <20241213115820.655993-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734091121; x=1734695921; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZCsXLZ6CkOAGvX/GIL8REbIYPKpKJwQOf31AmX1l3uc=;
 b=h8mf/rKoJ8TqTXiealO4xu/41wDss6TjVlWHVPdNuG4339QlPKrd9Xkmfp4gUDJ/kj
 3tRI8xU9sN1Ro9b3SOcJ+/B+TzgP5bV6t6ItbWd5myze1S/ddesHC7K2D8ID7IgaHW2N
 l2hnrxGWlnp85BbovLv0XynJB1yAsV8e2gixzRfLubJDW3YcXLVeqmkm6MQfa+kvnAG2
 CAXMtQf6kEjMZevf6zantDOrqKLCiggW5JkmRKFx8KUac3OH6GGYXP/bP1HgQ7bsOKfi
 rHbJ6cWsaHtvfx6bz1TKq61kHTbhjZkNaY3RRvEKTQs88EmxwiDmc4QG2bF0eQl1bkWq
 tMAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h8mf/rKo
Subject: [Buildroot] [PATCH 3/8] package/qt6/qt6quicktimeline: new package
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6quicktimeline/Config.in        |  7 +++++
 .../qt6quicktimeline/qt6quicktimeline.hash    |  5 ++++
 .../qt6/qt6quicktimeline/qt6quicktimeline.mk  | 26 +++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/qt6/qt6quicktimeline/Config.in
 create mode 100644 package/qt6/qt6quicktimeline/qt6quicktimeline.hash
 create mode 100644 package/qt6/qt6quicktimeline/qt6quicktimeline.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index c5a1a702d3..b1616495a6 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -50,6 +50,7 @@ source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6opcua/Config.in"
+source "package/qt6/qt6quicktimeline/Config.in"
 source "package/qt6/qt6scxml/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
diff --git a/package/qt6/qt6quicktimeline/Config.in b/package/qt6/qt6quicktimeline/Config.in
new file mode 100644
index 0000000000..4dcf0e1452
--- /dev/null
+++ b/package/qt6/qt6quicktimeline/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QT6QUICKTIMELINE
+	bool "qt6quicktimeline"
+	select BR2_PACKAGE_QT6DECLARATIVE_QUICK
+	help
+	  This package corresponds to the Qt Quick Timeline module:
+
+	  https://doc.qt.io/qt-6/qtquicktimeline-index.html
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
new file mode 100644
index 0000000000..b042b4e2f8
--- /dev/null
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -0,0 +1,5 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquicktimeline-everywhere-src-6.8.1.tar.xz.sha256
+sha256  fdbc198e27fd7bce0801fb3cfa336e81932607e6a36c97ae8394880eedfe12a3  qtquicktimeline-everywhere-src-6.8.1.tar.xz
+
+# Hashes for license files
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.mk b/package/qt6/qt6quicktimeline/qt6quicktimeline.mk
new file mode 100644
index 0000000000..18544a5a2b
--- /dev/null
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# qt6quicktimeline
+#
+################################################################################
+
+QT6QUICKTIMELINE_VERSION = $(QT6_VERSION)
+QT6QUICKTIMELINE_SITE = $(QT6_SITE)
+QT6QUICKTIMELINE_SOURCE = qtquicktimeline-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6QUICKTIMELINE_VERSION).tar.xz
+QT6QUICKTIMELINE_INSTALL_STAGING = YES
+QT6QUICKTIMELINE_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6QUICKTIMELINE_CMAKE_BACKEND = ninja
+QT6QUICKTIMELINE_LICENSE = GPL-3.0
+QT6QUICKTIMELINE_LICENSE_FILES = LICENSES/GPL-3.0-only.txt
+
+QT6QUICKTIMELINE_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6QUICKTIMELINE_DEPENDENCIES = \
+	qt6base \
+	qt6declarative
+
+$(eval $(cmake-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
