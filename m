Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E29C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 14:23:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FEE7611C3
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 14:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FEE7611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10C4160765;
	Sun, 19 Sep 2021 14:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXagqhxtYcXy; Sun, 19 Sep 2021 14:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 645F06074A;
	Sun, 19 Sep 2021 14:23:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4E8D1BF27A
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 14:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8F53400DE
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 14:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTKPFmGiSEmr for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 14:23:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BFBF400D9
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 14:23:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u18so22185482wrg.5
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+/Bu4nid8CdkAiWV0ojDAHZ2caBrFFIxq4HuIdG7KPE=;
 b=iJ86mailBY+ZKnGbUO2uI5UaQwETwWMerepU6DIH/qTKUhY5ZmnRwNahK/qSb9Ii7Z
 W9BDm78NfB6QYShhji5rgAqe68C/M5Bm3isvDPIy2VfsX+Jjm2BLs6rAwcGhK4K1sY0M
 0rQNETUPHK2pg7HjbvUdqOlijwFq/cnqzg8fqs7CAZga+QqnwEuLviCvqxFmZDubem6x
 bYEn3zpzEH8XfO8WbEjc5/p7fiWLbC/MCrsrYzKXaqixFTDMUTaQ5sWZ8ziiG01U6VH6
 vJID7pO7++rwDGhqYYMF/w4rN0C4otcKV0CoK9R5SFQQhD0sDzuCXowGP6ZDVTp61n3n
 NMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+/Bu4nid8CdkAiWV0ojDAHZ2caBrFFIxq4HuIdG7KPE=;
 b=VPgOmGEhDfP0Jt0c4WFyM9o3O81K1Fh0i7q22Ox1b7pOXtp2CaJnEOhsU3ORjZ7KNI
 o1PLtYIyJldEAy54rnRdae/3yWVIiPKmPJvd6C+gVgb2dpJwv7J1BIS0IUXsjXZFjhuo
 PqoAHx52OQJ85FsCjoGojIee+gKC2AJ8yvVlpqqC5vz1WuNNi5x3imL820gdNjJ0r5Jc
 GuQoaJwR5cAl4NaEFjBpEzSFQlRdwG9sfwMZom1bH9WXCnw6YIeKRs0iHyBXcsC+Q230
 w83icw6ZbqMYnA2tiJny3dXnGY+hGIo6iXzBBjV6Vp13Z7/RcaNjJ6SGs6FPBwg7+yBS
 Quuw==
X-Gm-Message-State: AOAM532z4VSnlSxvNO6Aakk8pg5engIoo7C1lySJHszTuUnvvz+2QSXg
 QSBSeLJWpNvY5JQJ199OuIddf/Ik7EI=
X-Google-Smtp-Source: ABdhPJx8KZWbGeObCrZzfA2PZ28yxCc8PPrIt01QWyhyfM4/lXUcbkQCHJinqitBv9Tlx7Gup+xpng==
X-Received: by 2002:a5d:510b:: with SMTP id s11mr22692136wrt.79.1632061396415; 
 Sun, 19 Sep 2021 07:23:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id a202sm5131016wmd.15.2021.09.19.07.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 07:23:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 16:21:48 +0200
Message-Id: <20210919142149.3298025-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/usbredir: bump to version 0.11.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Switch to meson-package
- Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.11.0/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-meson-add-tests-option.patch         | 46 +++++++++++++++++++
 package/usbredir/usbredir.hash                | 10 ++--
 package/usbredir/usbredir.mk                  | 10 ++--
 3 files changed, 59 insertions(+), 7 deletions(-)
 create mode 100644 package/usbredir/0001-meson-add-tests-option.patch

diff --git a/package/usbredir/0001-meson-add-tests-option.patch b/package/usbredir/0001-meson-add-tests-option.patch
new file mode 100644
index 0000000000..b2df1587b1
--- /dev/null
+++ b/package/usbredir/0001-meson-add-tests-option.patch
@@ -0,0 +1,46 @@
+From 8490a7ac101d4ee0a78c44b252d3b7a6c2508c74 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 21 Aug 2021 11:55:48 +0200
+Subject: [PATCH] meson: add tests option
+
+Add tests option to allow the user to disable them
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.freedesktop.org/spice/usbredir/-/commit/8490a7ac101d4ee0a78c44b252d3b7a6c2508c74]
+---
+ meson.build       | 4 +++-
+ meson_options.txt | 5 +++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 6e773a7..a6d21b8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -106,7 +106,9 @@ if host_machine.system() != 'windows'
+         subdir('fuzzing')
+     endif
+ endif
+-subdir('tests')
++if get_option('tests').enabled()
++    subdir('tests')
++endif
+ subdir('data')
+ 
+ summary(summary_info, bool_yn: true)
+diff --git a/meson_options.txt b/meson_options.txt
+index b35732b..63e8c85 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -21,3 +21,8 @@ option('tools',
+     type : 'feature',
+     value : 'enabled',
+     description : 'Build usbredir\'s tools such as usbredirect')
++
++option('tests',
++    type : 'feature',
++    value : 'enabled',
++    description : 'Build usbredir\'s tests such as filter')
+-- 
+GitLab
+
diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
index 485315d28c..e11d4aa720 100644
--- a/package/usbredir/usbredir.hash
+++ b/package/usbredir/usbredir.hash
@@ -1,4 +1,6 @@
-# locally computed hash
-sha256 87bc9c5a81c982517a1bec70dc8d22e15ae197847643d58f20c0ced3c38c5e00  usbredir-0.8.0.tar.bz2
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LIB
+# https://spice-space.org/download/usbredir/usbredir-0.11.0.tar.xz.sha256sum
+sha256  72dd5f3aa90dfbc0510b5149bb5b1654c8f21fdc405dfce7b5dc163dcff19cba  usbredir-0.11.0.tar.xz
+
+# Hash for license files
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LIB
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 8848670ea9..25c4bb382e 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,13 +4,17 @@
 #
 ################################################################################
 
-USBREDIR_VERSION = 0.8.0
-USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.bz2
+USBREDIR_VERSION = 0.11.0
+USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
 USBREDIR_SITE = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE = LGPL-2.1+ (libraries)
 USBREDIR_LICENSE_FILES = COPYING.LIB
 USBREDIR_INSTALL_STAGING = YES
 USBREDIR_DEPENDENCIES = host-pkgconf libusb
+USBREDIR_CONF_OPTS = \
+	-Dgit_werror=disabled \
+	-Dtests=disabled \
+	-Dtools=disabled
 
 ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
 
@@ -26,4 +30,4 @@ USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
 
 endif # BR2_PACKAGE_USBREDIR_SERVER
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
