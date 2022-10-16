Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCC9C4167B
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 17:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D73681771;
	Sun, 16 Oct 2022 17:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D73681771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R1h5a7imzKba; Sun, 16 Oct 2022 17:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A358A8176E;
	Sun, 16 Oct 2022 17:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A358A8176E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D60171BF46A
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 17:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADFFE410C5
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 17:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADFFE410C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y5-QrubMTyEw for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 17:22:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48286409FC
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48286409FC
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 17:22:47 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id r14so13077979edc.7
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 10:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/qXOu37WhvtRR8ghDswDErUScdU/RSec1LPB1U+T4G8=;
 b=X1Wqxfve4hPf2GhfLvibA6Kimbs9eZLFbsqcV8HA9MZwYt3ESmZ68Jyo6NG1VheVDX
 i4HtaPf3jdKqDZDFhhTHJ+y+O1OVKzemWRapGS2CDMBQBoWMwACs6PULhyjUcb/n/ztX
 kM/Bj6kO9Q4vVzsqSsfFg9IH6Kb5/z9xhKJa+DkvW8Lx8EDXtQC+WerKZY2V6wuXQkZB
 j/dyVC9dj+LaT4EBC0CXgED1Fr84pOzkOZrx+sDup59G24Jd5lW7R/5gwTkp+WhcfYAz
 97O0ClTlNssOUwcR6QwxgJ0E6eEQKo08ul+hOY7LJdfHJMgeYRP1YrcP3d/9fcgzveWL
 BRUA==
X-Gm-Message-State: ACrzQf0I9tIqt9JjslxOyvgSKVRsoTNN4IzQVEQSJs88DcC8yqGzZRKn
 5Hxc6/gWgeOBSLLdo82t6879YZihZIF3lA==
X-Google-Smtp-Source: AMsMyM5anNX+wLCBkUJHHx+wVQA0wJZE2hjyzQQ9g8SSdUOPGEdKzU3Ia70uJA2BX0UPjnxzS057pw==
X-Received: by 2002:a05:6402:46:b0:45c:bd68:6ab0 with SMTP id
 f6-20020a056402004600b0045cbd686ab0mr6951995edu.16.1665940965158; 
 Sun, 16 Oct 2022 10:22:45 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 d20-20020a170906c21400b00731803d4d04sm4900608ejz.82.2022.10.16.10.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 10:22:44 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 19:22:41 +0200
Message-Id: <20221016172241.17083-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/qXOu37WhvtRR8ghDswDErUScdU/RSec1LPB1U+T4G8=;
 b=JM32hZgRwEs0lCVaBwiLee4WT0k8ymQX23trIeJl8ksGQyJyGaiJaaW4jatYVtwoO5
 y8QooiyebTVyqNastEPgkQSjMa6bSeNQPf+wSVyfnuwdLfkKZIpQcmoIsKas0SdwX7Hb
 yP8AzZ+D+1LzU4Lo6iScQenBudzcyK64H2fT8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JM32hZgR
Subject: [Buildroot] [PATCH v2] package/cutekeyboard: new package
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
 package/Config.in                      |  1 +
 package/cutekeyboard/Config.in         | 18 ++++++++++++++++++
 package/cutekeyboard/cutekeyboard.hash |  3 +++
 package/cutekeyboard/cutekeyboard.mk   | 18 ++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/cutekeyboard/Config.in
 create mode 100644 package/cutekeyboard/cutekeyboard.hash
 create mode 100644 package/cutekeyboard/cutekeyboard.mk

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
