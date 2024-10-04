Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EB0CF885B
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 21:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152E141807;
	Fri,  4 Oct 2024 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJwPpt7GhkHf; Fri,  4 Oct 2024 21:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0272D4186B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0272D4186B;
	Fri,  4 Oct 2024 21:09:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EEDA1BF5F5
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D78B041816
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GgCN9aYseIB for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 21:09:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DD2F4180D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD2F4180D
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DD2F4180D
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 21:09:38 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2fad15b3eeeso30748951fa.2
 for <buildroot@buildroot.org>; Fri, 04 Oct 2024 14:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728076176; x=1728680976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kRXcp99J+MQ4U/M4m5t+0SgxsdMLGCXXFgFOhOg3sRw=;
 b=MlcPduxUcz63/uDjbBYvQ6aM9FUwjuNwjmI0xnjhj6dkFIhxGwT9MUypmkjhYOMIuU
 AaaoJGo3ILkllyHPsAPGQYE0QYsYyePbr9dpoCue33aq8Is+ZBrzSGpGtVbo2maFZVlo
 BLUM3n/GSLfpx5z6t1oK/bp26v+WsBK94q0rR0GjGlLAekH2jKaFndNC6d/5rpRvHKnw
 5JTlx5EKhxuGt784EEmHGtRAp1F0/UJMQcYJAwIvjn7O/Ajt2D01g0h0QaKAHIg67koE
 sAFbMMzHCVmYlJhdy8IpXvjdaqEeNLgeU6ZiBcrgLn+7ipItERYn/i/110v898KkPLyB
 wbKA==
X-Gm-Message-State: AOJu0YyAeHgxl8wpRhfQbw6jatp3Ek1M+tvbhaFRwtJWpebkw14EuKOC
 mQNbuSteYWKfLYqmRm/LQezZD3HWpbvTnK8UQQeNbhaRfCLPq8sb8gTbKw==
X-Google-Smtp-Source: AGHT+IHifPm57HM71a0fsZD4ibWAf2pyAvGAw6ehYmNPDV+T/LItejTuGPT9r1lro10q3hYterQ9+w==
X-Received: by 2002:a2e:a542:0:b0:2f7:51a2:96f2 with SMTP id
 38308e7fff4ca-2faf3c011dbmr18228191fa.8.1728076175655; 
 Fri, 04 Oct 2024 14:09:35 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9ab19c5sm732071fa.6.2024.10.04.14.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 14:09:34 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Oct 2024 23:09:17 +0200
Message-ID: <20241004210919.3699625-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004210919.3699625-1-roykollensvendsen@gmail.com>
References: <20241004210919.3699625-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728076176; x=1728680976; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kRXcp99J+MQ4U/M4m5t+0SgxsdMLGCXXFgFOhOg3sRw=;
 b=j5Q94XvaqHVZdT5MOY6C1ErjVuCPpQAeTKJwGiSqvuCQYJ1rybYGxFzwU+SYY02hIx
 eCH6r0a1xgYs0jXjR8iOLsil/Nkvc4UXRj8CdHdlQHMGj6YO5usbbl5zRUNrS+atSTbI
 33zPoZW9R7bSL/J+9EZk3/7J358GsaS3c7Ts/yCf7IUiJKSWTURVZKqbgOYYksJfkBAW
 EXZOlayumaY7alDlqiOrQP75vYb1SIce/cRE3ts1Txh+pkQMgibAsqa33LQdScJ9DUAt
 YyDNphmNcEmLMkDjjrkVGwTumiELvZ0SoxD0x/Je1lB1Nt/mqu68SYOit63oVs9BQqSe
 IyOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j5Q94Xva
Subject: [Buildroot] [PATCH v2 2/2] package/qt6/qt6charts: new package
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
Cc: Andreas Naumann <ANaumann@ultratronik.de>,
 Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In Qt 6.8.0 this package will be replaced by Qt Graphs. But since it was
requested on the mailinglist I added it now. I'll replace it by
qt6graphs when Qt 6.8.0 is out.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v1 -> v2:
  - this patch was added

 package/qt6/Config.in                |  1 +
 package/qt6/qt6charts/Config.in      |  8 +++++++
 package/qt6/qt6charts/qt6charts.hash |  5 +++++
 package/qt6/qt6charts/qt6charts.mk   | 32 ++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/qt6/qt6charts/Config.in
 create mode 100644 package/qt6/qt6charts/qt6charts.hash
 create mode 100644 package/qt6/qt6charts/qt6charts.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 4cbb60322c..c5a1a702d3 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -44,6 +44,7 @@ menuconfig BR2_PACKAGE_QT6
 if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
+source "package/qt6/qt6charts/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
diff --git a/package/qt6/qt6charts/Config.in b/package/qt6/qt6charts/Config.in
new file mode 100644
index 0000000000..cf44ce7169
--- /dev/null
+++ b/package/qt6/qt6charts/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_QT6CHARTS
+	bool "qt6charts"
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	help
+	  This package corresponds the Qt Charts module:
+
+	  https://doc.qt.io/qt-6/qtcharts-index.html
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
new file mode 100644
index 0000000000..fbeb580f29
--- /dev/null
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -0,0 +1,5 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtcharts-everywhere-src-6.7.3.tar.xz.sha256
+sha256  07ea63a550e6bcfa4a9c38056f7aa524357305572268fe26f6063d83e4233659  qtcharts-everywhere-src-6.7.3.tar.xz
+
+# Hashes for license files
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6charts/qt6charts.mk b/package/qt6/qt6charts/qt6charts.mk
new file mode 100644
index 0000000000..16b5286967
--- /dev/null
+++ b/package/qt6/qt6charts/qt6charts.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# qt6charts
+#
+################################################################################
+
+QT6CHARTS_VERSION = $(QT6_VERSION)
+QT6CHARTS_SITE = $(QT6_SITE)
+QT6CHARTS_SOURCE = qtcharts-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6CHARTS_VERSION).tar.xz
+QT6CHARTS_INSTALL_STAGING = YES
+QT6CHARTS_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6CHARTS_CMAKE_BACKEND = ninja
+QT6CHARTS_LICENSE = GPL-3.0
+QT6CHARTS_LICENSE_FILES = LICENSES/GPL-3.0-only.txt
+
+QT6CHARTS_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6CHARTS_DEPENDENCIES = qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6CHARTS_DEPENDENCIES += qt6declarative
+endif
+
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA),y)
+QT6CHARTS_DEPENDENCIES += qt6multimedia
+endif
+
+$(eval $(cmake-package))
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
