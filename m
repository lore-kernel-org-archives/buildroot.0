Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D657C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 21:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16BCF60ECD;
	Tue, 29 Aug 2023 21:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16BCF60ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clNmzLjfdJml; Tue, 29 Aug 2023 21:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D9FF60FD1;
	Tue, 29 Aug 2023 21:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D9FF60FD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CAF21BF5A8
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46E988211D
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46E988211D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nyy-3JXCkUBC for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 21:37:33 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46DA88210E
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 21:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46DA88210E
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c1e128135aso17439085ad.3
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 14:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693345052; x=1693949852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G9b78flTTHjB4u/weWRZm2WfSPcnVaZi60NmyNrVOEE=;
 b=QoyoNi2kk3k6bJVmigdzxLUhkHP/GMcfpYQLB/ISiGFVSI7De33UZWimVGpigYUNgx
 Euv5VIyR1klPkFk/BM5Ehq0stKdN4Psm60N4lnOVAd5oWnR3eRxUbz0C1gx1DzyoTGCL
 xVrNrDSchjDc8rS5E+XA+NbnMhOtKVpHvCL6TaHkWwZeNWmsqbANe6hlBPo6MOzUsEDe
 3Af7FKPegs9SZAw0UrI/0UejsDWsfz8KkANNx4mXhC89rcsF2ORY5lOEggQFnOJArahR
 bSddy+QfVcUbeEgBaVg+0XH4dVu6pVEzlcz7DkMz6WWjPf8A7hi1X+IJvjEwYnMtTrfO
 g/mw==
X-Gm-Message-State: AOJu0Yz8DeM7pJerJZeLg2S2pvAEOtWE7i7klhD309/PkksyvqJmu5ZR
 gLKo6jsqmIj/hPWibRcnyrf6UkZKrkeMp7V57+o=
X-Google-Smtp-Source: AGHT+IFLA6bzmAASaC/AaNmzlfMFR1td45HdWpHkHZhmsQwepMN5U4XjDG/VQHaxYenwHblbQETA9Q==
X-Received: by 2002:a17:903:487:b0:1bd:ccee:8f26 with SMTP id
 jj7-20020a170903048700b001bdccee8f26mr347171plb.15.1693345052297; 
 Tue, 29 Aug 2023 14:37:32 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902a70500b001ae0152d280sm9691516plq.193.2023.08.29.14.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 14:37:31 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 15:37:21 -0600
Message-ID: <20230829213726.1957587-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
References: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693345052; x=1693949852;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G9b78flTTHjB4u/weWRZm2WfSPcnVaZi60NmyNrVOEE=;
 b=cAh8Kf04RVN1vrvHw4G/9hSMZpwR4g7u06j2rvfeSsQueruo33G845KYF3FIb5l+ws
 MJJyUM4NR2gcPp3qxchusxbzRBTXha+JRfYhS51y1Qn3Vdw7BlpdYvTz7HYLjqM6tr3L
 0joNT2IGg4UyR08B0FpVTq64lEsqMIAvfvzN4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cAh8Kf04
Subject: [Buildroot] [PATCH v7 2/7] package/depot-tools: new package
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
V2 -> V3:
  - Re-added Config.in.host. It needs to select host-python3, host-python3-six,
    and host-python3-ssl

V1 -> V2:
  - Remove Config.in.host
  - Remove DEPOT_TOOLS_GCLIENT helper wrapper as it is unused.

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
index 241de082eb..0373d5243e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -26,6 +26,9 @@
 #   infrastructure, and will be CC'ed on all patches that add or
 #   modify packages that use this infrastructure.
 
+N:	Adam Duskett <adam.duskett@amarulasolutions.com>
+F:	package/depot-tools/
+
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/firewalld/
 
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
