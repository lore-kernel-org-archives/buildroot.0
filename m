Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E82CC4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 17:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2D3B4146F;
	Sun, 16 Oct 2022 17:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2D3B4146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4TzmrEZbgjUB; Sun, 16 Oct 2022 17:50:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F86410B7;
	Sun, 16 Oct 2022 17:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72F86410B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 694631BF46A
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 17:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4536760784
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 17:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4536760784
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nVR_t8T2tS6 for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 17:50:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 340AB600B5
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 340AB600B5
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 17:50:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id d26so20339794eje.10
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 10:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jERnjteSDmtzgoqWgYexKzyRrb6BixZVs4Oukle6ZOI=;
 b=plcd10DvRZrfP/Sk8DnmMEOP7Tc/IIfG9+l7b3V7bmaF6I4Dx19bq+Ra7/+YKOLYt8
 6D38ixf5EfD2kS9FMSD7piAG/Xh19z99AwzkAcBp5u98RH8MVDmJxL4UijhHXH1DCG3T
 yN2OubPVL1SDSTzrqZPamtItTILUzavSkIrn25sz8vGkIU3W2PYLKdhl16m4RBCWSiVO
 U/ogW2/5sC6gZLsZfhNtigVlkhfjWnKOCzldHFrvYVO8tq0DWq4MkHe7rrs2ty1eu30G
 vLLzXMrM9n4nBxN32M4nXvr5sdkptGqYCzDJHPtrNoYZyZnoLkw28nIRJFLdgyJQYaCY
 t5HQ==
X-Gm-Message-State: ACrzQf1+lt1KAIu2ZK1iuDltTVfcFVUKVEr2ufH+9IltVfXyYF3WJRFm
 uGu6uppDK7inOYs18x18AhLQmSvnOCTqOg==
X-Google-Smtp-Source: AMsMyM5APuq7Z4PHadb65XRMhqDvkQHw5EVVFE3x/uo6DhtmO++kK8fnroH27pvxZMqvtHqEUlbmqg==
X-Received: by 2002:a17:906:fe45:b0:788:15a5:7495 with SMTP id
 wz5-20020a170906fe4500b0078815a57495mr6117287ejb.633.1665942628929; 
 Sun, 16 Oct 2022 10:50:28 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 ky23-20020a170907779700b0078a86e013c4sm4930986ejc.61.2022.10.16.10.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 10:50:28 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 19:50:25 +0200
Message-Id: <20221016175025.22545-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jERnjteSDmtzgoqWgYexKzyRrb6BixZVs4Oukle6ZOI=;
 b=hodF+wvfRlHA5ZL5APD430mwUMIlbvJ7v4WHbcMYqmsn3EOg0M4LZVD6OnmXEJs6Bp
 E3EywNDLLcXK/q5bu63YD9+7H38ewtgeQCdPMKdce5fgyUjuiPUf+4ti9okvzL/Ninsp
 6sASN5APQVg3RTuKMGX5/xympZ1MDzSrUKrUg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hodF+wvf
Subject: [Buildroot] [PATCH v3] package/cutekeyboard: new package
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
Cc: andrea.ricchi@amarulasolutions.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CuteKeyboard is a Qt virtual keyboard plugin for embedded applications

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v2:
* bump to verison v1.0.1
v3:
* Adding me to developers file

 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/cutekeyboard/Config.in         | 18 ++++++++++++++++++
 package/cutekeyboard/cutekeyboard.hash |  3 +++
 package/cutekeyboard/cutekeyboard.mk   | 18 ++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/cutekeyboard/Config.in
 create mode 100644 package/cutekeyboard/cutekeyboard.hash
 create mode 100644 package/cutekeyboard/cutekeyboard.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0e6f8bbef..4640abe3b2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -158,6 +158,7 @@ F:	package/apparmor/
 F:	package/corkscrew/
 F:	package/cups/
 F:	package/cups-filters/
+F:	package/cutekeyboard/
 F:	package/fail2ban/
 F:	package/grep/
 F:	package/htpdate/
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..f11210d313 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1522,6 +1522,7 @@ menu "Graphics"
 	source "package/cairo/Config.in"
 	source "package/cairomm/Config.in"
 	source "package/chipmunk/Config.in"
+	source "package/cutekeyboard/Config.in"
 	source "package/exempi/Config.in"
 	source "package/exiv2/Config.in"
 	source "package/fltk/Config.in"
diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.in
new file mode 100644
index 0000000000..389c583313
--- /dev/null
+++ b/package/cutekeyboard/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_CUTEKEYBOARD
+	bool "cutekeyboard"
+	depends on BR2_PACKAGE_QT5DECLARATIVE
+	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	depends on BR2_PACKAGE_QT5QUICKCONTROLS2
+	help
+	  CuteKeyboard is a Qt virtual keyboard plugin for embedded applications.
+
+	  https://amarula.github.io/cutekeyboard/
+
+if BR2_PACKAGE_CUTEKEYBOARD
+
+config BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES
+	bool "cutekeyboard example"
+	help
+	  Compile also application example
+
+endif
diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
new file mode 100644
index 0000000000..4720d7ec40
--- /dev/null
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  1c7950d176678e82f99e8a6f67cac2e030f623f1ea40937f12c3dbdd6f0c701f  cutekeyboard-v1.0.1.tar.gz
+sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
new file mode 100644
index 0000000000..b43595075a
--- /dev/null
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# cutekeyboard
+#
+################################################################################
+
+CUTEKEYBOARD_VERSION = v1.0.1
+CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
+CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
+CUTEKEYBOARD_INSTALL_STAGING = YES
+CUTEKEYBOARD_LICENSE = MIT
+CUTEKEYBOARD_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES),y)
+CUTEKEYBOARD_CONF_OPTS += CONFIG+=BUILD_EXAMPLES
+endif
+
+$(eval $(qmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
