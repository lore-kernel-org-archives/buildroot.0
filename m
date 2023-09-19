Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68090CE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 20:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0965983592;
	Tue, 19 Sep 2023 20:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0965983592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06mzJgx0WNVb; Tue, 19 Sep 2023 20:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10EC683443;
	Tue, 19 Sep 2023 20:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10EC683443
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C11C1BF20B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 128B540C01
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 128B540C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sU0sOv-WFVkR for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 20:42:58 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC7A74039D
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 20:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC7A74039D
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-690bc3f8326so1528861b3a.0
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 13:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695156178; x=1695760978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2DCbtVTr214beKlEH3G5n5ZZQIdeCmVlc27+54N4Vvg=;
 b=Ampv18pNrDd4K3PNRDgKiSJ7TuVg/mg9LM1DNe1G5Ny626m+jqtiPRh0ETA3o1vfxk
 o9NOfEPpiuSXFDxK0O9E0/Y3iqqspSSqrVSdIArCfDc1T3zH+TrJkCpaK4hZCwB9YVED
 QD44MkKMrnOWGU9OMDo/VDqDHILZx5IXZOKUJWh/ZeGErvMEwJFF1eKZADeJYhzIHwM+
 20Y/y0x9OLUGccQhwtsZcAuwMvfRuH5R91cn7jSTMxcRMvlk/hxlMSGfP4KdVnoKLV2Q
 qwxouUz97EKXlPQFOX7Kz5mtpInvHU98xtWgqpumYl36hNJuaYoSYBiEwO039O4VCY05
 Yetg==
X-Gm-Message-State: AOJu0YxXyZssNDyWANuJ4MYOPzZGlfRRm00JwIHrvYIjO8+nrDj4k8DJ
 OsPhFNZELMBKmWZpQ3GjVkVUgtBxo4N+s/KjEsD+uQ==
X-Google-Smtp-Source: AGHT+IFq4fujanXltJSgdYNLrsUDZ7xh+UXqIIk5QrR8eglyAwLAQUcUrIDXDksdPTrC1i7dBDMNTQ==
X-Received: by 2002:a05:6a20:3ca7:b0:159:b4ba:a5bf with SMTP id
 b39-20020a056a203ca700b00159b4baa5bfmr730394pzj.13.1695156177913; 
 Tue, 19 Sep 2023 13:42:57 -0700 (PDT)
Received: from Adam-laptop.amarulasolutions.com ([172.56.201.58])
 by smtp.gmail.com with ESMTPSA id
 18-20020a056a00073200b0068844ee18dfsm8918700pfm.83.2023.09.19.13.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 13:42:57 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 14:42:47 -0600
Message-Id: <20230919204252.2272594-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
References: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695156178; x=1695760978;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2DCbtVTr214beKlEH3G5n5ZZQIdeCmVlc27+54N4Vvg=;
 b=lRncArXYNKlcCpONu+238GKwfEDlQjAAwRya0Wn62Inmy0yccVUoMUXidtGGN5p04I
 SuV8AZ2IkIN+3wiORaAyqpUV2Cd1QUOWxxAbGtmvozWZG4Aw4VMh7t6Ig7Ers2V40JFs
 K+yuMaVFSP4vlS8QiAEMMBrcegymek5m1jKqo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lRncArXY
Subject: [Buildroot] [PATCH v9 2/7] package/depot-tools: new package
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
 DEVELOPERS                           |  3 +++
 package/Config.in.host               |  1 +
 package/depot-tools/Config.in.host   | 10 ++++++++++
 package/depot-tools/depot-tools.hash |  3 +++
 package/depot-tools/depot-tools.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/depot-tools/Config.in.host
 create mode 100644 package/depot-tools/depot-tools.hash
 create mode 100644 package/depot-tools/depot-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e8b78a8d46..057e740fb8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -31,6 +31,9 @@ F:	package/firewalld/
 F:	package/vulkan-loader/
 F:	package/vulkan-tools/
 
+N:	Adam Duskett <adam.duskett@amarulasolutions.com>
+F:	package/depot-tools/
+
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 22e0dc64d4..377dbed7d3 100644
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
index 0000000000..e3b840f29a
--- /dev/null
+++ b/package/depot-tools/depot-tools.mk
@@ -0,0 +1,25 @@
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
+
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
+$(eval $(host-generic-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
