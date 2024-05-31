Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD59C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 15:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0B8F42438;
	Fri, 31 May 2024 15:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuNrB7ao-eU7; Fri, 31 May 2024 15:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA41542433
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA41542433;
	Fri, 31 May 2024 15:14:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A9CF1D5418
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94E7280E3A
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgBQDZiuY1IZ for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 15:13:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 752D080AAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 752D080AAD
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 752D080AAD
 for <buildroot@buildroot.org>; Fri, 31 May 2024 15:13:48 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52b82d57963so1663296e87.2
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717168426; x=1717773226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xlA9PzsCI1lx6lB2dOkYd0H2c7coy3dE5sTqexc3754=;
 b=nIY0u+Xy4lOzyL2EbQzrQwW0DugcK4XWCwAs89YCZ04/NaJzdBpafLDit3Ob4YoHv1
 paZrkmuGgj9CfoWu7R3kwxx+skm0Mk+7tI1osa9f/zu9ukSSuzH5r6Tplrvg1QxlKV+s
 Q2+lCwL0n1COqIXFrImpT/3FCv/WwiD7Itpb1l7PcI6KCYlkLWbLQlSuWuxLA8QShCMk
 OWTf1C7Xpt6qjCN9RwL4JG9J041+h6UoziLTAVjv1qcwJ+cwOCvgtg7bZzqDhpgVuGF9
 5wzg11aYjenQLz/0eVAcbnPkukXz8jeIhYYd8cBLML9qPkTAnOUbR3u1VvFu89zphyke
 PO1g==
X-Gm-Message-State: AOJu0YwS17JItUg2skTjiq3ziJl7AHsAmAbR2kPR58PWOjwSpus2CBLh
 0wQ1dKsIXjqnnY6EElGSc9LXNmN+Cu0/uFxIMQpebDKBI7tJnC4urbYE0S6O
X-Google-Smtp-Source: AGHT+IH5BmIETJzC+eMfC5H+F+4/zoW30Bqs6YU0dsgoreUW0Y9IG/AsShcr7wkMSEAxPsaOQnLH8w==
X-Received: by 2002:ac2:58d8:0:b0:51b:e46c:19fd with SMTP id
 2adb3069b0e04-52b89595e9dmr1253207e87.18.1717168424857; 
 Fri, 31 May 2024 08:13:44 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f510sm362599e87.90.2024.05.31.08.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 08:13:44 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 17:13:09 +0200
Message-ID: <20240531151325.2443323-8-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
References: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
 <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717168426; x=1717773226; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xlA9PzsCI1lx6lB2dOkYd0H2c7coy3dE5sTqexc3754=;
 b=j9s3fZ7fMmqDt1RxqDbfiWfQdS4gxQQ9LyIiD5tpYOwOwBV0X64+PNggJvv2KGpWBI
 b6tQB6EGREihT9AmhuCErSDdlxc+Da9afvoGTY84dvduBtlihTBQdzh6/5k8sWW05XcQ
 3wlfXCYwwP54Gkd1ZKSDNb8DymRXVtPlxi+tPZXytEeQu3snswpHMty7i9zz9P1V8VLR
 uEeATuDfrje/zATah60MtF8Zr9AbUmE04k0/uzWYGc4ZmpNZuOFGGuyj+qUkgV1Bje0J
 DVINUMyBY16UAzVw/wn6hLFmFIPMFcPyie1xHLuFglrBOQp245sh04C8orXVvLAJvi3e
 JBNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j9s3fZ7f
Subject: [Buildroot] [PATCH v5 08/14] package/qt6/qt6languageserver: new
 package
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
Changes v4 -> v5:
  - Bump to v6.7.1

 package/qt6/Config.in                         |  1 +
 package/qt6/qt6languageserver/Config.in       |  9 +++++
 .../qt6languageserver/qt6languageserver.hash  | 11 ++++++
 .../qt6languageserver/qt6languageserver.mk    | 34 +++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/qt6/qt6languageserver/Config.in
 create mode 100644 package/qt6/qt6languageserver/qt6languageserver.hash
 create mode 100644 package/qt6/qt6languageserver/qt6languageserver.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index b7e95a6885..81682af476 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
+source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
diff --git a/package/qt6/qt6languageserver/Config.in b/package/qt6/qt6languageserver/Config.in
new file mode 100644
index 0000000000..8a54ae1911
--- /dev/null
+++ b/package/qt6/qt6languageserver/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT6LANGUAGESERVER
+	bool "qt6languageserver"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6languageserver module.
+
+	  https://doc.qt.io/qt-6/qtlanguageserver-index.html
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
new file mode 100644
index 0000000000..8193d7d14a
--- /dev/null
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtlanguageserver-everywhere-src-6.7.1.tar.xz.sha256
+sha256  a0fcda1464760e10d9d78d4260e78c94f7ef51343193d8fd2cfef991a4fa94f9  qtlanguageserver-everywhere-src-6.7.1.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.mk b/package/qt6/qt6languageserver/qt6languageserver.mk
new file mode 100644
index 0000000000..6f96feb275
--- /dev/null
+++ b/package/qt6/qt6languageserver/qt6languageserver.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# qt6languageserver
+#
+################################################################################
+
+QT6LANGUAGESERVER_VERSION = $(QT6_VERSION)
+QT6LANGUAGESERVER_SITE = $(QT6_SITE)
+QT6LANGUAGESERVER_SOURCE = qtlanguageserver-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6LANGUAGESERVER_VERSION).tar.xz
+QT6LANGUAGESERVER_INSTALL_STAGING = YES
+QT6LANGUAGESERVER_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6LANGUAGESERVER_CMAKE_BACKEND = ninja
+
+QT6LANGUAGESERVER_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6LANGUAGESERVER_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6LANGUAGESERVER_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6LANGUAGESERVER_DEPENDENCIES = \
+	qt6base
+
+$(eval $(cmake-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
