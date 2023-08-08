Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26834C001DF
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 00:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C591A81F1C;
	Tue,  8 Aug 2023 00:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C591A81F1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TO5cqe2o0NbN; Tue,  8 Aug 2023 00:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01BF81F17;
	Tue,  8 Aug 2023 00:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01BF81F17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AB031BF30B
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 00:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CB1E4109B
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 00:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB1E4109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q91lnA-tkv5u for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 00:35:33 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3929440E46
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 00:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3929440E46
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bbc06f830aso34476615ad.0
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 17:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691454932; x=1692059732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+J+Nfka2GbGpC3WrD/WUF8bsx+faJQpmcgbnrvtC+TU=;
 b=UexuxfGvT5sr7lelPLeGxQqmO4kXMke2mm7BB3hoDdEcussCaVqyVhQF6E44JF3V3U
 hNpL/M3++D0GG3WC3YHn658trryqTDZmvLCSUuZYzhysbTjz0EOnkMCF4WmRJEaWVj+V
 /ogyZSBjKCF0DtDDo+goZFCEBqFjXwoQUYOv57JNvfFHrN+sv7FvbbenY9tk8kZoKJJc
 DEnuIyWPH3uQ4I1Iu7ZwU0eSIJVaifuZLGVFq8LwgMZf6zmdpcLQEQScNS4t/EiwcdPn
 L772z4fklT1WI3NVnzG/r2Ugo3xeTIfsrtAW0f7ShIS6LCLAC8sepfO2sIZmjNBTLRYz
 xGVA==
X-Gm-Message-State: AOJu0YwIOmYR63/0x/f4VwRH4EgB0Wxt2s0R5/ByOp+q/fY3ICm4ScXB
 wDFcjkzcG6hioU3/Pu70Lr670go2KM1esavxmfCCDQ==
X-Google-Smtp-Source: AGHT+IGoSuTHVE7d//BgOC1KWGQPZwrRE/flUBiA6rU9307fzyCeLlxXomSfDQNv2/qYO4OFYff/yg==
X-Received: by 2002:a17:902:b218:b0:1bb:c9e3:6d4f with SMTP id
 t24-20020a170902b21800b001bbc9e36d4fmr7871527plr.10.1691454932171; 
 Mon, 07 Aug 2023 17:35:32 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([174.27.153.162])
 by smtp.gmail.com with ESMTPSA id
 ix10-20020a170902f80a00b001b03b7f8adfsm7531923plb.246.2023.08.07.17.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 17:35:31 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 18:35:26 -0600
Message-ID: <20230808003527.1469175-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230808003527.1469175-1-adam.duskett@amarulasolutions.com>
References: <20230808003527.1469175-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1691454932; x=1692059732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+J+Nfka2GbGpC3WrD/WUF8bsx+faJQpmcgbnrvtC+TU=;
 b=nJSuQVsUy7Z+xjE2IkxEWMUfd2893Pdxi0pmBQvc3yjyzagJDKhgyX65erxZfxwAXq
 Fozoi1lkGzZyyMmTF+6y796yl3HIiZ8iIEwljSi98XcN4YZ6BwVA6qQ/ooQQfSkOo6ft
 4MFHZma0VVb3yAcZir2WKt2aOEWScQVj2d/Hw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nJSuQVsU
Subject: [Buildroot] [PATCH/next vRFCv2 2/3] package/depot-tools: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Chromium and Chromium OS use a package of scripts called
depot_tools to manage checkouts and code reviews. This package
also includes the gclient utility.

gclient is a Python script to manage a workspace of modular dependencies that
are each checked out independently from different subversion or git
repositories. Features include:

  - Dependencies can be specified on a per-OS basis.
  - Dependencies can be specified relative to their parent dependency.
  - Variables can be used to abstract concepts.
  - Hooks can be specified to be run after a checkout.
  - .gclient and DEPS are Python scripts. You can hack in easily or add
     additional configuration data.

.gclient file: It's the primary file. It is, in fact, a Python script. It
specifies the following variables:

  - solutions: an array of dictionaries specifying the projects that will be
               fetched.
  - hooks: additional hooks to be run when this meta checkout is synced.
  - target_os: an optional array of (target) operating systems to fetch
               OS-specific dependencies for.
  - cache_dir: Primarily for bots, multiple working sets use a single git
               cache.

gclient is necessary for checking out the flutter-engine source code, as the
release tarballs provided on the flutter-engine github are in no state to
compile. Google expects the use of gclient to download a source directory
structure suitable to build the Flutter engine.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
Changes v1 -> v2"
  - Remove unecessary patch (We aren't using ninjalog)
  - Formatting cleanup [Yann]
  - Remove uncessary environment variables for gclient [Yann]

 DEVELOPERS                           |  3 +++
 package/Config.in.host               |  1 +
 package/depot-tools/Config.in.host   | 10 ++++++++++
 package/depot-tools/depot-tools.hash |  3 +++
 package/depot-tools/depot-tools.mk   | 30 ++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/depot-tools/Config.in.host
 create mode 100644 package/depot-tools/depot-tools.hash
 create mode 100644 package/depot-tools/depot-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9915143a04..2093ad857f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -26,6 +26,9 @@
 #   infrastructure, and will be CC'ed on all patches that add or
 #   modify packages that use this infrastructure.
 
+N:	Adam Duskett <adam.duskett@amarulasolutions.com>
+F:	package/depot-tools
+
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index aa1f15e3ac..8d91f4a888 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -19,6 +19,7 @@ menu "Host utilities"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dbus-python/Config.in.host"
 	source "package/delve/Config.in.host"
+	source "package/depot-tools/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
diff --git a/package/depot-tools/Config.in.host b/package/depot-tools/Config.in.host
new file mode 100644
index 0000000000..935331dedb
--- /dev/null
+++ b/package/depot-tools/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_DEPOT_TOOLS
+	bool "host depot-tools"
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_HOST_PYTHON_SIX
+	help
+	  Chromium and Chromium OS use a package of scripts called
+	  depot_tools to manage checkouts and code reviews.
+
+	  https://www.chromium.org/developers/how-tos/install-depot-tools/
diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
new file mode 100644
index 0000000000..2109096901
--- /dev/null
+++ b/package/depot-tools/depot-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  8e0bccdd6b1231f58d5453dc14a5e1d195295ac8d466dec34961e951e946b50b  depot-tools-4e87f5bfe244e903f712408ea68dc3c3a6fe2d00-br1.tar.gz
+sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
new file mode 100644
index 0000000000..95b7fb84ac
--- /dev/null
+++ b/package/depot-tools/depot-tools.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# depot-tools
+#
+################################################################################
+
+DEPOT_TOOLS_VERSION = 4e87f5bfe244e903f712408ea68dc3c3a6fe2d00
+DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
+DEPOT_TOOLS_SITE_METHOD = git
+DEPOT_TOOLS_LICENSE = BSD-3-Clause
+DEPOT_TOOLS_LICENSE_FILES = LICENSE
+DEPOT_TOOLS_CPE_ID_VENDOR = google
+HOST_DEPOT_TOOLS_DEPENDENCIES = \
+	host-python3 \
+	host-python-httplib2 \
+	host-python-pyparsing \
+	host-python-six
+
+define HOST_DEPOT_TOOLS_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/share/depot_tools
+	cp -dprf $(@D)/* $(HOST_DIR)/share/depot_tools/
+endef
+
+# Helper wrapper to make using gclient easier.
+DEPOT_TOOLS_GCLIENT=\
+	PATH=$(BR_PATH):$(HOST_DIR)/share/depot_tools \
+	DEPOT_TOOLS_UPDATE=0 \
+	$(HOST_DIR)/share/depot_tools/gclient.py
+
+$(eval $(host-generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
