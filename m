Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA15E77180
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 11:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 331464148D;
	Fri, 13 Dec 2024 11:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrTWcnA3SFtm; Fri, 13 Dec 2024 11:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFDDD414EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFDDD414EE;
	Fri, 13 Dec 2024 11:59:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4163C1146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 235FB81F85
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wk7StHd_aIps for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 11:58:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0B1B81F57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0B1B81F57
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0B1B81F57
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:56 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30229d5b229so14643991fa.0
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 03:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734091135; x=1734695935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vsudPsPzJy8oK8aJgXxFbASds6xmJJkTl7FcorcS7P8=;
 b=T9ZYCvSgwBdFZxvOfBD6UuZXfzub8eD5DUgkaSufd4klGEeybHZ8mXkp2Lw+PdN++y
 DPOBIvcbf28sM13sSyE0eXGym+ZxRucZ0TrRexDzALcNfBekmeU9Z75emqn87ZXZ/a3g
 2Sz+RFbbijDfHMwUKRnDOdMnf2g0z4LGtLr4WP+Kzc0qctxYxAPZ4qCQRWaYus11Dz6r
 Yj1gcrTz39H/VZ0B/TkebU1oQ2xUvxqODsr10AI+YY3epAvd1voz9AbHrkXY2Dmtjf2h
 rPzzM4/Q9zXiEt1ybr9RDEeVo/Cynw7hOQGzuZQEY9xTn9zTYM1huv5QuvDHcLHGbMW1
 3cag==
X-Gm-Message-State: AOJu0Yx4plPAp1rDdNrB9ZlWANCvBAWsUFzkzyaWClraKkvm/4ueyH/1
 szPAPQiwwDfDo5wQjcl9lj2Fpbo0Grjb9DBRJCpoOIbNL8UGRP28tbP2VQ==
X-Gm-Gg: ASbGncvTLPjQsJN0uzSoRoUhSEzRN54oB9FxSNZXZhCwdTzJ3T8grlIkpXXPdjOKBT5
 rEzsthe246tIYvUqv4kCBkezl6BF8BaAnkalkORpjf1aG7O2tDTP9/psA4GQtOVdjG1KMY4v9qR
 Efm78/p3kVix8TDVgwQzEyoq+yWogIoRIuwyOin25jp6X2w+L95o/XM6azpFEAEFvAI//cV/A2N
 3BLowkl8rEYe/OeduRP54haPrr4OvgUUqZLw7wu1vCc4NyoiMV4+WapcLE/HKspBvFtPNOWnv1a
 8txH840tMQG5SHs=
X-Google-Smtp-Source: AGHT+IFvrfo0gMu4kSukiEGwUhIEeAKOR424CBVvBkL+Z/kjMW0fGk8tG4WZrPRIODhIw0gDN3f0/w==
X-Received: by 2002:a2e:be9f:0:b0:302:34d6:eeea with SMTP id
 38308e7fff4ca-3025447f0d7mr8419901fa.3.1734091134521; 
 Fri, 13 Dec 2024 03:58:54 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30038ce97b4sm20610651fa.118.2024.12.13.03.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 03:58:53 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian@klarinett.li>,
 Andreas Naumann <ANaumann@ultratronik.de>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Date: Fri, 13 Dec 2024 12:58:14 +0100
Message-ID: <20241213115820.655993-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213115820.655993-1-roykollensvendsen@gmail.com>
References: <20241213115820.655993-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734091135; x=1734695935; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vsudPsPzJy8oK8aJgXxFbASds6xmJJkTl7FcorcS7P8=;
 b=cpEj0F4JRIEFFLX8tD/0WO1MVGGMRhd57mEgC3e+s3H+68dkKxPoVNxWUjOlau5+9S
 sJcglBovYG/61dugX/M8zv0Vtt3M6PNOFtO6sEkzDjzCncP/9PnJuX1ouqJFBRcqsufG
 RJ5/GQddJfYl7vVFFqbGCgtpFKtIjFH82CBdDSxrtfQnn78xu31p15YFRC8ijm8fApAN
 TRqOTAwF11q7K2hjRYuIslXpcqkUdOdS9IAtEhu3Cv4/tEZdr5MuosOaX469bFRZNqzU
 B4W+gHMNJZZ2Gg35tmj08g90MkdYtweXv46cxFNbFSDffCZU0+FWtjyEZT5NzvWfc087
 l6Aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cpEj0F4J
Subject: [Buildroot] [PATCH 7/8] package/qt6/qt6graphs: new package
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
 package/qt6/Config.in                |  1 +
 package/qt6/qt6graphs/Config.in      |  8 ++++++++
 package/qt6/qt6graphs/qt6graphs.hash |  5 +++++
 package/qt6/qt6graphs/qt6graphs.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/qt6/qt6graphs/Config.in
 create mode 100644 package/qt6/qt6graphs/qt6graphs.hash
 create mode 100644 package/qt6/qt6graphs/qt6graphs.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 2a5f5a4511..80c417809d 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -47,6 +47,7 @@ source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6charts/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
+source "package/qt6/qt6graphs/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6opcua/Config.in"
diff --git a/package/qt6/qt6graphs/Config.in b/package/qt6/qt6graphs/Config.in
new file mode 100644
index 0000000000..a99f25d6de
--- /dev/null
+++ b/package/qt6/qt6graphs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_QT6GRAPHS
+	bool "qt6graphs"
+	select BR2_PACKAGE_QT6DECLARATIVE
+	select BR2_PACKAGE_QT6QUICK3D
+	help
+	  This package corresponds to the Qt Graphs module:
+
+	  https://doc.qt.io/qt-6/qtgraphs-index.html
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
new file mode 100644
index 0000000000..59d35d9e66
--- /dev/null
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -0,0 +1,5 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgraphs-everywhere-src-6.8.1.tar.xz.sha256
+sha256  1e46e3de69936835652ab40ef8caf5824ea71e26871274561fb65ec142d54a80  qtgraphs-everywhere-src-6.8.1.tar.xz
+
+# Hashes for license files
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.mk b/package/qt6/qt6graphs/qt6graphs.mk
new file mode 100644
index 0000000000..488d5acde2
--- /dev/null
+++ b/package/qt6/qt6graphs/qt6graphs.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# qt6graphs
+#
+################################################################################
+
+QT6GRAPHS_VERSION = $(QT6_VERSION)
+QT6GRAPHS_SITE = $(QT6_SITE)
+QT6GRAPHS_SOURCE = qtgraphs-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6GRAPHS_VERSION).tar.xz
+QT6GRAPHS_INSTALL_STAGING = YES
+QT6GRAPHS_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6GRAPHS_CMAKE_BACKEND = ninja
+QT6GRAPHS_LICENSE = GPL-3.0
+QT6GRAPHS_LICENSE_FILES = LICENSES/GPL-3.0-only.txt
+
+QT6GRAPHS_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6GRAPHS_DEPENDENCIES = \
+	qt6base \
+	qt6declarative \
+	qt6quick3d
+
+$(eval $(cmake-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
