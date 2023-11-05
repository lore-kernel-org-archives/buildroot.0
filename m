Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB26C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D821640AA2;
	Sun,  5 Nov 2023 20:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D821640AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WEVKdDxpcGCW; Sun,  5 Nov 2023 20:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D655C40AF0;
	Sun,  5 Nov 2023 20:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D655C40AF0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56DF91BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D68C61045
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D68C61045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2cscZCM7Sn-f for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:33 +0000 (UTC)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68C6661040
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68C6661040
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-1cc7077d34aso27375805ad.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215992; x=1699820792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ST7Z3rqLYRDunQd/nQw7anmTuum3cZ1q0dcbN2b0J90=;
 b=WNNh9hs2UtQjzpK5BMPkchOBlBwmVPApiN42pMsMm4Dg5TTnsqJkm9dHnxq9i5TyOj
 WbwYMkoJEanPOIBxMJgFUtXx0H02zhs9XH4v2G0MxhPHuMLfa5mTR+iWwwjDIUvVftni
 jqvoKkqkFByRCggEK6LVBZf3neRRQGQEL50dyv6lmXDQRAG6biJ7m7jw3aAUfjen1teX
 Y9Q2FVB9BxO0oi6exoh9EBii49cklmEpAF5kocMsa389GhqGiOPIIoNTw5A49DrPZ5hZ
 nrFwX68ekZ9GGMcl0QiqFwpNb9+Xfg4R7YCUQ5bcv8DVELtNLKsbP+cEJjXamELtLKgF
 EfpA==
X-Gm-Message-State: AOJu0YwXULkTSfCvrdbANZgvbM99CfVxUwpnWDELY1q8B2WXIC6mX2+e
 9OeojAkjTc1ofyiIy3iwM3FVJPGLyDf8QU4E1xviFD6gnIk=
X-Google-Smtp-Source: AGHT+IGv+fR4lptX0zCVSyLpew7oGRQa8u7GgMvEsW2LkrpfoX1li1ycMZpHEQ0Nua9u/f8n6kCjbQ==
X-Received: by 2002:a17:902:c94d:b0:1cc:4e78:d10f with SMTP id
 i13-20020a170902c94d00b001cc4e78d10fmr20231319pla.8.1699215992390; 
 Sun, 05 Nov 2023 12:26:32 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:32 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:54 -0700
Message-ID: <20231105202555.359391-23-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215992; x=1699820792;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ST7Z3rqLYRDunQd/nQw7anmTuum3cZ1q0dcbN2b0J90=;
 b=FAWyLRr60oAIkJ+/T0J7TyMXdabcHB1vRtc7HRH8NPXv3XWtFvojTM2Vsqg6C2mdFq
 kAJXUjAAQJHWe+9mUX1uNdaA7T7prTLEQfvmEcfWq4jjDvHaj2zR8kqeps6j+o4cZY/6
 g0LM1NpcNOdiOwCT3UuUSJwkiqUoqLx7w3r1g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FAWyLRr6
Subject: [Buildroot] [PATCH v2 23/24] package/python-kmod: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is currently used in Fedora39 to provide python bindings for kmod,
and it is Python 3.12.0 compatible.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Add this package

 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-kmod/Config.in        | 12 ++++++++++++
 package/python-kmod/python-kmod.hash |  3 +++
 package/python-kmod/python-kmod.mk   | 16 ++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/python-kmod/Config.in
 create mode 100644 package/python-kmod/python-kmod.hash
 create mode 100644 package/python-kmod/python-kmod.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5085457276..863b97b0fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/python-kmod/
 F:	package/python-versioneer/
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/Config.in b/package/Config.in
index 5b73a0c918..d5498eb8f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1134,6 +1134,7 @@ menu "External python modules"
 	source "package/python-jsonschema/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-kiwisolver/Config.in"
+	source "package/python-kmod/Config.in"
 	source "package/python-lark/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libevdev/Config.in"
diff --git a/package/python-kmod/Config.in b/package/python-kmod/Config.in
new file mode 100644
index 0000000000..244baee3a0
--- /dev/null
+++ b/package/python-kmod/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_KMOD
+	bool "python-kmod"
+	depends on !BR2_STATIC_LIBS # kmod
+	select BR2_PACKAGE_HOST_PYTHON_CYTHON
+	select BR2_PACKAGE_KMOD
+	help
+	  Python binding for kmod
+
+	  https://github.com/maurizio-lombardi/python-kmod
+
+comment "python-kmod needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/python-kmod/python-kmod.hash b/package/python-kmod/python-kmod.hash
new file mode 100644
index 0000000000..f3cb16ef3f
--- /dev/null
+++ b/package/python-kmod/python-kmod.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256  0100ff27b7030a73e68ec07829d6123f412ce195dc761b954c92a38d18ba8539  python-kmod-0.9.2.tar.gz
+sha256  55f9ca11412f0bb51dc20d45d8b20e72225efb8982386ef175e901caca5ed0d9  COPYING
diff --git a/package/python-kmod/python-kmod.mk b/package/python-kmod/python-kmod.mk
new file mode 100644
index 0000000000..12df0fa413
--- /dev/null
+++ b/package/python-kmod/python-kmod.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-kmod
+#
+################################################################################
+
+# The python-kmod package listed at https://pypi.org/project/kmod/#description
+# is not the same as the one listed below.
+PYTHON_KMOD_VERSION = 0.9.2
+PYTHON_KMOD_SITE = $(call github,maurizio-lombardi,python-kmod,v$(PYTHON_KMOD_VERSION))
+PYTHON_KMOD_SETUP_TYPE = setuptools
+PYTHON_KMOD_LICENSE = LGPL-2.1+
+PYTHON_KMOD_LICENSE_FILES = COPYING
+PYTHON_KMOD_DEPENDENCIES = host-python-cython kmod
+
+$(eval $(python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
