Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52161EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 23:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E972B405BC;
	Thu, 20 Jul 2023 23:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E972B405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oIGnutx3V5xi; Thu, 20 Jul 2023 23:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4A6C41733;
	Thu, 20 Jul 2023 23:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4A6C41733
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1AF1BF39A
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 23:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33E4A405E3
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 23:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33E4A405E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2aUtl4Bqagx for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 23:36:54 +0000 (UTC)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FB4440519
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 23:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FB4440519
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-55af0a816e4so739948a12.1
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 16:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689896213; x=1690501013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHdQ+/x58IcJ1emsfrbp94ATnMLDwlBF3lQ22akVWjI=;
 b=WillYSNxzzjXte92jTwQgOJLVxP9y+RDMKPwrY+wW2gf//uD8o0O0tD8mifCWibQxp
 quZ7M03RobHqrw0Q+yPFYTjRhBTanfJEX7lw8NaYL3HVcwMO0TwH1GIN+4aDjyQWIQwE
 hbJSYW2e5X2255iOwc1vqKv9mkgYZ+6LS6UwAxeQe5+oFuLVLA1ti7ddF2CHJlIcOsoU
 PjOFspTN3rCOkOT5fKWCveLd+6Xdv8sp5p8+JAEgfgMizfZAEDTa3rqzDRtiIvKwEekW
 B7oQwJChsDKJcPUscwLJJm3Tx06y3fTrR2QMc4yxD24ZyzDnqo22mlNS77qroDopxpYB
 s5Sg==
X-Gm-Message-State: ABy/qLbQPFpJ1LWEOrlz9VZBgZAqdLmqREndaw+Y4AvRxXhHI4W35F0F
 wK1qQYo2h2M9IKGPhn1jNSMFYteKA9n1d0HYfyg7Rg==
X-Google-Smtp-Source: APBJJlGN7mdod9N/I+0NfF/z0IZS/WhIKU0Rb9fBq6Df7UJ8/CU1Q/ZSWIY0G2v9trErCr9lcCE2rQ==
X-Received: by 2002:a05:6a20:3207:b0:12c:de85:94eb with SMTP id
 hl7-20020a056a20320700b0012cde8594ebmr273504pzc.17.1689896213613; 
 Thu, 20 Jul 2023 16:36:53 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([2601:603:217f:25e0::99d])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a170902cec300b001b89b7e208fsm1981790plg.88.2023.07.20.16.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 16:36:53 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 16:36:28 -0700
Message-ID: <20230720233629.1642220-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
References: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689896213; x=1690501013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHdQ+/x58IcJ1emsfrbp94ATnMLDwlBF3lQ22akVWjI=;
 b=i8jZ+U7AfPFLU6Urg1A/RLB/LkZ/CO6zRMkYyr4rDMNTUuGGl1AYkr5zlGXTn7uU14
 mv1+TS+dW57JFd+w051GE4OVTOMfrI4Bxzxh6JGUMWQUJ/C1nb0HJFHtLk7tiKebObGj
 qwJ4M252W3Scpr/NumJiVoieyv0qZ9d/DBYLk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=i8jZ+U7A
Subject: [Buildroot] [PATCH vRFC 2/3] package/depot-tools: new package
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
 DEVELOPERS                                    |  3 ++
 package/Config.in.host                        |  1 +
 .../0001-Disable-ninjalog-upload.patch        | 35 +++++++++++++++++++
 package/depot-tools/Config.in.host            | 10 ++++++
 package/depot-tools/depot-tools.hash          |  3 ++
 package/depot-tools/depot-tools.mk            | 33 +++++++++++++++++
 6 files changed, 85 insertions(+)
 create mode 100644 package/depot-tools/0001-Disable-ninjalog-upload.patch
 create mode 100644 package/depot-tools/Config.in.host
 create mode 100644 package/depot-tools/depot-tools.hash
 create mode 100644 package/depot-tools/depot-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 43058cedf9..38db2dd345 100644
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
index 9addc88522..6eb5d5be1d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -18,6 +18,7 @@ menu "Host utilities"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dbus-python/Config.in.host"
 	source "package/delve/Config.in.host"
+	source "package/depot-tools/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
diff --git a/package/depot-tools/0001-Disable-ninjalog-upload.patch b/package/depot-tools/0001-Disable-ninjalog-upload.patch
new file mode 100644
index 0000000000..55fd78247f
--- /dev/null
+++ b/package/depot-tools/0001-Disable-ninjalog-upload.patch
@@ -0,0 +1,35 @@
+From eeea6ad620b88a81a4b05d49f32a375b4bbcef36 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Thu, 13 Jul 2023 15:50:25 -0700
+Subject: [PATCH] Disable ninjalog upload
+
+Google doesn't need the ninja logs.
+
+Upstream: buildroot-specific.
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ autoninja | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/autoninja b/autoninja
+index 06d45d1..354a2f1 100755
+--- a/autoninja
++++ b/autoninja
+@@ -30,12 +30,12 @@ if eval "$command"; then
+   fi
+ 
+   # Collect ninjalog from googler.
+-  python3 "$(dirname -- "$0")/ninjalog_uploader_wrapper.py" --cmd $command
++  # python3 "$(dirname -- "$0")/ninjalog_uploader_wrapper.py" --cmd $command
+   exit
+ fi
+ 
+ # Collect ninjalog from googler.
+-python3 "$(dirname -- "$0")/ninjalog_uploader_wrapper.py" --cmd $command
++# python3 "$(dirname -- "$0")/ninjalog_uploader_wrapper.py" --cmd $command
+ 
+ # Return an error code of 1 so that if a developer types:
+ # "autoninja chrome && chrome" then chrome won't run if the build fails.
+-- 
+2.41.0
+
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
index 0000000000..906340016c
--- /dev/null
+++ b/package/depot-tools/depot-tools.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# depot-tools
+#
+################################################################################
+
+DEPOT_TOOLS_VERSION = 4e87f5bfe244e903f712408ea68dc3c3a6fe2d00
+DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
+DEPOT_TOOLS_SITE_METHOD = git
+DEPOT_TOOLS_LICENSE = Chromium
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
+	LD_LIBRARY_PATH=$(HOST_DIR)/lib \
+	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
+	DEPOT_TOOLS_UPDATE=0 \
+	PYTHONDONTWRITEBYTECODE=1 \
+	$(HOST_DIR)/share/depot_tools/gclient.py
+
+$(eval $(host-generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
