Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22EBC30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 13:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7616140A38;
	Fri,  5 Jul 2024 13:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rwlJY30EWfk; Fri,  5 Jul 2024 13:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CAF2402E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CAF2402E4;
	Fri,  5 Jul 2024 13:26:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F37211BF284
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 13:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC0E4402E4
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 13:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Y3-GQSjayUP for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 13:26:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=shengwen1997.tw@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9492840197
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9492840197
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9492840197
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 13:26:05 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-700cc388839so1079369a34.0
 for <buildroot@buildroot.org>; Fri, 05 Jul 2024 06:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720185963; x=1720790763;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LOf8LFEbQ7JBejAHDXWGquJDuRw9NIo0j6UQD41YiJ0=;
 b=An4Yaq3txQOmU8zPubUvC20ZRLx3Fw8AFsiQOLEGSvK8nJoUTNS5t8J3U/cxezCZj3
 hl+brdpmObAAn68eQCFn1Mt16Zw0KkLyyBSP4wvCZR5phlU+QydFFscdrGxfvweNdrHM
 J32ABNNJ8D8AtcTnQto/RjniYk+P7j3/bPQsVN5KgxdDYRGGP6X+zAWOgp6OeVWu8tOl
 A6YedX2Tp+ltt/DZCmOwG6Oz0PwneI0AKhnxP2hWfyfMfKO5X6xZkegXDOJM684rG100
 NWiW5xUioGepm38ti3yf3LlYE4y+eHRYZVsOwe/jt6dp2V3EZ4a0b98rzNOQ7NfiGfEh
 iSaQ==
X-Gm-Message-State: AOJu0Yy1nJstbdgxUCfAxVufX+Rr0fAVNhrDrMULVG61SG9ixlN/NzOi
 AHiBix14XvPZUQSaqAtACtM0T8yAyfUAyMe/X3JWoQGCDPkQcGOXOgjjwqap
X-Google-Smtp-Source: AGHT+IGXq8Oqak1PeAeOgrqbzGldWVt2FpOIkg2mm0oVfBYOTldousYj1K+O+i26y22mgVG01iCVzw==
X-Received: by 2002:a05:6870:d10f:b0:25e:11f4:f691 with SMTP id
 586e51a60fabf-25e2bf100b0mr3906476fac.47.1720185962787; 
 Fri, 05 Jul 2024 06:26:02 -0700 (PDT)
Received: from pop-os.. (118-163-201-9.hinet-ip.hinet.net. [118.163.201.9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70802666489sm13926949b3a.85.2024.07.05.06.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 06:26:02 -0700 (PDT)
From: Shengwen Cheng <shengwen1997.tw@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 21:25:44 +0800
Message-Id: <20240705132544.351613-1-shengwen1997.tw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720185963; x=1720790763; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LOf8LFEbQ7JBejAHDXWGquJDuRw9NIo0j6UQD41YiJ0=;
 b=Xjt3c1oZO0GZzDwtCo39R6LHlYvcpwB22GxuY/4A8Fyl3ZhueyvDOuZqzzkW7apq03
 Uy/BOYVvhGT3cr+jfj5TdlUeyW3a7lCUlNoXBq6R1HkkG7+VQnmmefeb75X+6NMVXzOC
 m0pCUa0DtF9Vi3jtMlJU+iQXEsBPcsUg9Nm7F3qhduLQ4HTsovMi1uAa3W9DMI7Mfnht
 boKMyU748RL9bguSReiC3vBZGuAkCSfo7sqxORpL+Szb5P8EAyijE/iQt9K+1Fyh3y4A
 EDTo45z4FKIWYLy1ihIm8KxQGQSTA9pYaoyK2/EVkIO55trdxLeGBKO+GFG/qJAF2nWe
 jkKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xjt3c1oZ
Subject: [Buildroot] [PATCH 1/1] package/directfb2: add directfb2 packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Shengwen Cheng <shengwen1997.tw@gmail.com>, Jim Huang <jserv@ccns.ncku.edu.tw>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This introduces DirectFB2, a fork of DirectFB to the Buildroot. The original
DirectFB has not been maintained since 2016. Meanwhile, in 2022, DirectFB2 was
announced at FOSDEM in Brussels, with the goal of maintaining DirectFB for use
on embedded systems.

New packages:
1. directfb2
2. directfb2-csource
3. directfb2-lite
4. directfb2-media
5. directfb2-tools
6. directfb2-examples
7. dfbterm

[1] https://archive.fosdem.org/2022/schedule/event/directfb/attachments/slides/
5077/export/events/attachments/directfb/slides/5077/fosdem_2022_directfb2.pdf

Signed-off-by: Shengwen Cheng <shengwen1997.tw@gmail.com>
---
 package/Config.in                             |   1 +
 package/dfbterm/Config.in                     |  11 ++
 package/dfbterm/dfbterm.mk                    |  14 +++
 package/directfb2-csource/Config.in           |   6 +
 .../directfb2-csource/directfb2-csource.mk    |  15 +++
 package/directfb2-examples/Config.in          | 104 ++++++++++++++++++
 .../directfb2-examples/directfb2-examples.mk  |  61 ++++++++++
 package/directfb2-lite/Config.in              |   7 ++
 package/directfb2-lite/directfb2-lite.mk      |  15 +++
 package/directfb2-media/Config.in             |   6 +
 package/directfb2-media/directfb2-media.mk    |  15 +++
 package/directfb2-tools/Config.in             |   5 +
 package/directfb2-tools/directfb2-tools.mk    |  14 +++
 package/directfb2/Config.in                   |  70 ++++++++++++
 package/directfb2/directfb2.mk                |  62 +++++++++++
 15 files changed, 406 insertions(+)
 create mode 100644 package/dfbterm/Config.in
 create mode 100644 package/dfbterm/dfbterm.mk
 create mode 100644 package/directfb2-csource/Config.in
 create mode 100644 package/directfb2-csource/directfb2-csource.mk
 create mode 100644 package/directfb2-examples/Config.in
 create mode 100644 package/directfb2-examples/directfb2-examples.mk
 create mode 100644 package/directfb2-lite/Config.in
 create mode 100644 package/directfb2-lite/directfb2-lite.mk
 create mode 100644 package/directfb2-media/Config.in
 create mode 100644 package/directfb2-media/directfb2-media.mk
 create mode 100644 package/directfb2-tools/Config.in
 create mode 100644 package/directfb2-tools/directfb2-tools.mk
 create mode 100644 package/directfb2/Config.in
 create mode 100644 package/directfb2/directfb2.mk

diff --git a/package/Config.in b/package/Config.in
index 550fdc1f41..d9b96201ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -346,6 +346,7 @@ comment "Graphic libraries"
 	source "package/cegui/Config.in"
 	source "package/directfb/Config.in"
 	source "package/directfb-examples/Config.in"
+	source "package/directfb2/Config.in"
 	source "package/efl/Config.in"
 	source "package/fb-test-app/Config.in"
 	source "package/fbdump/Config.in"
diff --git a/package/dfbterm/Config.in b/package/dfbterm/Config.in
new file mode 100644
index 0000000000..4258a857b9
--- /dev/null
+++ b/package/dfbterm/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DFBTERM
+	bool "DFBTerm"
+	depends on BR2_PACKAGE_DIRECTFB2
+	select BR2_PACKAGE_DIRECTFB2_LITE
+	help
+	  DFBTerm is a terminal emulator runnning on DirectFB2 and
+	  based on libzvt.
+
+	  libzvt (Zed's virtual terminal emulation library) is
+	  included directly in the source code, although it is
+	  possible to use the system's libzvt library.
diff --git a/package/dfbterm/dfbterm.mk b/package/dfbterm/dfbterm.mk
new file mode 100644
index 0000000000..8f53883dfc
--- /dev/null
+++ b/package/dfbterm/dfbterm.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# dfbterm
+#
+################################################################################
+
+DFBTERM_VERSION = 0e78750b5e58655d521da54540dc0a9bdca2f840
+DFBTERM_SITE = "https://github.com/directfb2/DFBTerm"
+DFBTERM_SITE_METHOD = git
+DFBTERM_LICENSE = GPL-2.0
+DFBTERM_LICENSE_FILES = COPYING
+DFBTERM_DEPENDENCIES = directfb2 directfb2-lite
+
+$(eval $(meson-package))
diff --git a/package/directfb2-csource/Config.in b/package/directfb2-csource/Config.in
new file mode 100644
index 0000000000..0419bcb839
--- /dev/null
+++ b/package/directfb2-csource/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_DIRECTFB2_CSOURCE
+	bool "directfb2-csource"
+	depends on BR2_PACKAGE_DIRECTFB2
+	help
+	  directfb2-csource is a data header file generation utility for
+	  DirectFB2 code.
diff --git a/package/directfb2-csource/directfb2-csource.mk b/package/directfb2-csource/directfb2-csource.mk
new file mode 100644
index 0000000000..231c848442
--- /dev/null
+++ b/package/directfb2-csource/directfb2-csource.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# directfb2-csource
+#
+################################################################################
+
+DIRECTFB2_CSOURCE_VERSION = 2758dee7937e8850d6c8105bd6ef1db06c86064f
+DIRECTFB2_CSOURCE_SITE = "https://github.com/directfb2/directfb-csource"
+DIRECTFB2_CSOURCE_SITE_METHOD = git
+DIRECTFB2_CSOURCE_LICENSE = GPL-2.0
+DIRECTFB2_CSOURCE_LICENSE_FILES = COPYING
+DIRECTFB2_CSOURCE_DEPENDENCIES = directfb2
+DIRECTFB2_CSOURCE_INSTALL_STAGING = YES
+
+$(eval $(meson-package))
diff --git a/package/directfb2-examples/Config.in b/package/directfb2-examples/Config.in
new file mode 100644
index 0000000000..05f34ee002
--- /dev/null
+++ b/package/directfb2-examples/Config.in
@@ -0,0 +1,104 @@
+menuconfig BR2_PACKAGE_DIRECTFB2_EXAMPLES
+	bool "DirectFB2 examples"
+	depends on BR2_PACKAGE_DIRECTFB2
+	select BR2_PACKAGE_DIRECTFB2_CSOURCE
+	help
+	  The DirectFB2-examples package contains a set of simple
+	  DirectFB2 applications that can be used to test and
+	  demonstrate various DirectFB2 features. Note that DirectFB2
+	  is a fork of DirectFB, as the original DirectFB stopped
+	  being maintained in 2016.
+
+	  The official DirectFB2 website can be visited via
+	  https://directfb2.github.io/
+
+if BR2_PACKAGE_DIRECTFB2_EXAMPLES
+
+choice
+	prompt "DirectFBGL interface version"
+	default BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_NULL
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_NULL
+	bool "-"
+comment "Build without version flag specified"
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_1
+	bool "1"
+comment "Pass -Ddirectfbgl=1 to the Meson build system"
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_2
+	bool "2"
+comment "Pass -Ddirectfbgl=2 to the Meson build system"
+
+endchoice
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL
+	string "PATH to OpenGL header"
+	default ""
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS
+	string "CFLAGS of the OpenGL implementation"
+	default ""
+
+config BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS
+	string "LDFLAGS of the OpenGL implementation"
+	default ""
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# choice
+#	prompt "Select font header for DirectFB2 examples"
+#	default BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DISABLED
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DISABLED
+#	bool "disabled"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DGIFF
+#	bool "dgiff"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_ttf
+#	bool "ttf"
+#
+#endchoice
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# choice
+#	prompt "Select image header for DirectFB2 examples"
+#	default BR2_PACKAGE_DIRECTFB2_EXAMPLES_DISABLED
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_DISABLED
+#	bool "disabled"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_DFIFF
+#	bool "dfiff"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_PNG
+#	bool "png"
+#
+# endchoice
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# choice
+#	prompt "Select video header for DirectFB2 examples"
+#	default BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DISABLED
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DISABLED
+#	bool "disabled"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DFVFF
+#	bool "dfvff"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_M2V
+#	bool "m2v"
+#
+# config BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_264
+#	bool "264"
+#
+# endchoice
+
+endif # BR2_PACKAGE_DIRECTFB2_EXAMPLES
diff --git a/package/directfb2-examples/directfb2-examples.mk b/package/directfb2-examples/directfb2-examples.mk
new file mode 100644
index 0000000000..b627ba6906
--- /dev/null
+++ b/package/directfb2-examples/directfb2-examples.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# directfb2-examples
+#
+################################################################################
+
+DIRECTFB2_EXAMPLES_VERSION = d627550430407ce6f1e42a861985ec42c0f4ac19
+DIRECTFB2_EXAMPLES_SITE = "https://github.com/directfb2/DirectFB-examples"
+DIRECTFB2_EXAMPLES_SITE_METHOD = git
+DIRECTFB2_EXAMPLES_LICENSE = MIT
+DIRECTFB2_EXAMPLES_LICENSE_FILES = COPYING
+DIRECTFB2_EXAMPLES_DEPENDENCIES = directfb2 directfb2-csource
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_1),y)
+DIRECTFB2_EXAMPLES_CONF_OPTS += -Ddirectfbgl=1
+else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_2),y)
+DIRECTFB2_EXAMPLES_CONF_OPTS += -Ddirectfbgl=2
+endif
+
+ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL)),)
+DIRECTFB2_EXAMPLES_CONF_OPTS += -Dgl=$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL)
+endif
+
+ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS)),)
+DIRECTFB2_EXAMPLES_CONF_OPTS += -Dgl-cflags=$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS)
+endif
+
+ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS)),)
+DIRECTFB2_EXAMPLES_CONF_OPTS += -Dgl-ldflags=$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS)
+endif
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DGIFF),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dfont-headers=dgiff
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_ttf),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dfont-headers=ttf
+# endif
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_DFIFF),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dimage-headers=dfiff
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_PNG),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dimage-headers=png
+# endif
+
+# Disabled for now as directfb2-csource currently does not generate
+# pkgconfig file
+#
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DFVFF),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dvideo-headers=dfvff
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_M2V),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dvideo-headers=m2v
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_264),y)
+# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dvideo-headers=264
+# endif
+
+$(eval $(meson-package))
diff --git a/package/directfb2-lite/Config.in b/package/directfb2-lite/Config.in
new file mode 100644
index 0000000000..d76a2896e1
--- /dev/null
+++ b/package/directfb2-lite/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DIRECTFB2_LITE
+	bool "directfb2-lite"
+	depends on BR2_PACKAGE_DIRECTFB2
+	help
+	  LiTE stands for Lightweight Toolkit Enabler and is a simple
+	  user interface library on top of DirectFB2. Widgets can be
+	  used with a default theme, or with its own custom theme.
diff --git a/package/directfb2-lite/directfb2-lite.mk b/package/directfb2-lite/directfb2-lite.mk
new file mode 100644
index 0000000000..56cb099e98
--- /dev/null
+++ b/package/directfb2-lite/directfb2-lite.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# directfb2-lite
+#
+################################################################################
+
+DIRECTFB2_LITE_VERSION = 164bb5eca507c3cee1be2adf3798745f305495d7
+DIRECTFB2_LITE_SITE = "https://github.com/directfb2/LiTE"
+DIRECTFB2_LITE_SITE_METHOD = git
+DIRECTFB2_LITE_LICENSE = LGPL-2.1
+DIRECTFB2_LITE_LICENSE_FILES = COPYING
+DIRECTFB2_LITE_DEPENDENCIES = directfb2
+DIRECTFB2_LITE_INSTALL_STAGING = YES
+
+$(eval $(meson-package))
diff --git a/package/directfb2-media/Config.in b/package/directfb2-media/Config.in
new file mode 100644
index 0000000000..1a0e09d077
--- /dev/null
+++ b/package/directfb2-media/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_DIRECTFB2_MEDIA
+	bool "directfb2-media"
+	depends on BR2_PACKAGE_DIRECTFB2
+	help
+	  DirectFB2-media contains additional font/image/music/video
+	  providers for DirectFB2.
diff --git a/package/directfb2-media/directfb2-media.mk b/package/directfb2-media/directfb2-media.mk
new file mode 100644
index 0000000000..50efa168d9
--- /dev/null
+++ b/package/directfb2-media/directfb2-media.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# directfb2-media
+#
+################################################################################
+
+DIRECTFB2_MEDIA_VERSION = 8f8cb02a3d67a3eb9726ca2927061e2697b7f2de
+DIRECTFB2_MEDIA_SITE = "https://github.com/directfb2/DirectFB2-media"
+DIRECTFB2_MEDIA_SITE_METHOD = git
+DIRECTFB2_MEDIA_LICENSE = LGPL-2.1
+DIRECTFB2_MEDIA_LICENSE_FILES = COPYING
+DIRECTFB2_MEDIA_DEPENDENCIES = directfb2
+DIRECTFB2_MEDIA_INSTALL_STAGING = YES
+
+$(eval $(meson-package))
diff --git a/package/directfb2-tools/Config.in b/package/directfb2-tools/Config.in
new file mode 100644
index 0000000000..f4d16596bc
--- /dev/null
+++ b/package/directfb2-tools/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_DIRECTFB2_TOOLS
+	bool "directfb2-tools"
+	depends on BR2_PACKAGE_DIRECTFB2
+	help
+	  DirectFB2-tools contains various DirectFB2 utilities.
diff --git a/package/directfb2-tools/directfb2-tools.mk b/package/directfb2-tools/directfb2-tools.mk
new file mode 100644
index 0000000000..7930159f2b
--- /dev/null
+++ b/package/directfb2-tools/directfb2-tools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# directfb2-tools
+#
+################################################################################
+
+DIRECTFB2_TOOLS_VERSION = 679838c281cbe7849011f7f6db1c815167c44fee
+DIRECTFB2_TOOLS_SITE = "https://github.com/directfb2/DirectFB2-tools"
+DIRECTFB2_TOOLS_SITE_METHOD = git
+DIRECTFB2_TOOLS_LICENSE = GPL-2.0
+DIRECTFB2_TOOLS_LICENSE_FILES = COPYING
+DIRECTFB2_TOOLS_DEPENDENCIES = directfb2
+
+$(eval $(meson-package))
diff --git a/package/directfb2/Config.in b/package/directfb2/Config.in
new file mode 100644
index 0000000000..6ef6e69a07
--- /dev/null
+++ b/package/directfb2/Config.in
@@ -0,0 +1,70 @@
+menuconfig BR2_PACKAGE_DIRECTFB2
+	bool "DirectFB2"
+	default n
+	help
+	  DirectFB2 is a fork of DirectFB (Direct Frame Buffer) whose
+	  purpose is to preserve and maintain the DirectFB graphics
+	  backend, particularly for use on embedded systems.
+
+	  The official DirectFB2 website can be visited via
+	  https://directfb2.github.io/
+
+if BR2_PACKAGE_DIRECTFB2
+
+menu "DirectFB2 Options"
+
+config BR2_PACKAGE_DIRECTFB2_DRMKMS
+	bool "Enable Linux DRM/KMS support"
+
+config BR2_PACKAGE_DIRECTFB2_FBDEV
+	bool "Enable Linux Framebuffer support"
+
+config BR2_PACKAGE_DIRECTFB2_LINUX_INPUT
+	bool "Enable Linux input support"
+
+if BR2_X86_CPU_HAS_MMX
+config BR2_PACKAGE_DIRECTFB2_MMX
+	bool "Enable MMX assembly support"
+	default y
+endif #	BR2_X86_CPU_HAS_MMX
+
+config BR2_PACKAGE_DIRECTFB2_MULTI
+	bool "Enable multi application support"
+
+config BR2_PACKAGE_DIRECTFB2_MULTI_KERNEL
+	bool "Enable Linux fusion device support for multi application"
+	select BR2_PACKAGE_DIRECTFB2_MULTI
+
+# if BR2_ARM_CPU_HAS_NEON
+# config BR2_PACKAGE_DIRECTFB2_NEON
+#	bool "Enable NEON assembly support"
+#	default y
+# endif # BR2_ARM_CPU_HAS_NEON
+#
+# DirectFB2 currently has issues enabling NEON. For more details, see:
+# https://github.com/directfb2/DirectFB2/issues/142
+
+config BR2_PACKAGE_DIRECTFB2_NETWORK
+	bool "Enable network support"
+
+config BR2_PACKAGE_DIRECTFB2_SENTINELS
+	bool "Enable surface sentinels at the end of chunks in video memory"
+
+config BR2_PACKAGE_DIRECTFB2_SMOOTH_SCALING
+	bool "Enable smooth scaling support"
+
+endmenu
+
+menu "DirectFB2 Applications"
+source "package/directfb2-examples/Config.in"
+source "package/dfbterm/Config.in"
+endmenu
+
+menu "DirectFB2 Utilities"
+source "package/directfb2-media/Config.in"
+source "package/directfb2-tools/Config.in"
+source "package/directfb2-csource/Config.in"
+source "package/directfb2-lite/Config.in"
+endmenu
+
+endif # BR2_PACKAGE_DIRECTFB2
diff --git a/package/directfb2/directfb2.mk b/package/directfb2/directfb2.mk
new file mode 100644
index 0000000000..197ff38632
--- /dev/null
+++ b/package/directfb2/directfb2.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# directfb2
+#
+################################################################################
+
+DIRECTFB2_VERSION = 2952d1d16b546be09e1cbb5da5e0c718d8f5ee32
+DIRECTFB2_SITE = "https://github.com/directfb2/DirectFB2"
+DIRECTFB2_SITE_METHOD = git
+DIRECTFB2_LICENSE = LGPL-2.1
+DIRECTFB2_LICENSE_FILES = COPYING
+DIRECTFB2_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_DRMKMS),y)
+DIRECTFB2_CONF_OPTS += -Ddrmkms=true
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_FBDEV),y)
+DIRECTFB2_CONF_OPTS += -Dfbdev=true
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_LINUX_INPUT),y)
+DIRECTFB2_CONF_OPTS += -Dlinux_input=true
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_MMX),y)
+DIRECTFB2_CONF_OPTS += -Dmmx=true
+else ifeq ($(BR2_PACKAGE_DIRECTFB2_MMX),n)
+DIRECTFB2_CONF_OPTS += -Dmmx=false
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_MULTI),y)
+DIRECTFB2_CONF_OPTS += -Dmulti=true
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_MULTI_KERNEL),y)
+DIRECTFB2_CONF_OPTS += -Dmulti-kernel=true
+endif
+
+# ifeq ($(BR2_PACKAGE_DIRECTFB2_NEON),y)
+# DIRECTFB2_CONF_OPTS += -Dneon=true
+# else ifeq ($(BR2_PACKAGE_DIRECTFB2_NEON),y)
+# DIRECTFB2_CONF_OPTS += -Dneon=false
+# endif
+#
+# DirectFB2 currently has issues enabling NEON. For more details, see:
+# https://github.com/directfb2/DirectFB2/issues/142
+DIRECTFB2_CONF_OPTS += -Dneon=false
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_NETWORK),y)
+DIRECTFB2_CONF_OPTS += -Dnetwork=true
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_SENTINELS),y)
+DIRECTFB2_CONF_OPTS += -Dsentinels=true
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB2_SMOOTH_SCALING),y)
+DIRECTFB2_CONF_OPTS += -Dsmooth-scaling=true
+endif
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
