Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE56C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 07:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AAD1813DE;
	Fri, 13 May 2022 07:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYgnW_ajlzbP; Fri, 13 May 2022 07:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9403781350;
	Fri, 13 May 2022 07:11:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 590091BF357
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D07F410C6
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r30Nn8kcQVe9 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 07:11:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E071410C1
 for <buildroot@buildroot.org>; Fri, 13 May 2022 07:11:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id kq17so14469697ejb.4
 for <buildroot@buildroot.org>; Fri, 13 May 2022 00:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ySXsW4bS0B6lIlnBJctCShG+KN8QGGB3cJ3H03wjdBc=;
 b=gaVq8ns6NmfaoDKvSaFGr+IDCmJW/TDPTRegnRhf6Otx+0m/qdYAe4nOX1xIpqBbL0
 0fR6AOu04Elv8kbTSR5wVpDyKNFk0UGvCmWeiGvE34wWw+o1IZcRbjkjf7lNAMzR5zVO
 I9e5J3l9ja9d0PBZ9LVwEWtRrAVpGMcoxiIfoeGSlzX+l/pJ6iqx5jJI0UPTwsOSWEmi
 9ceQT9gnHk1tya3xqvBjB6iq88HKDq9c5naSeF3rKs7gLKQ04ZPj/wYSH0lykapC8rm1
 +jLcsGHgFADfLoeITKia3VKtGudEG6TENw7ILKvkvb1H3tAJXyzze6lij11bBtAaFOns
 BETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ySXsW4bS0B6lIlnBJctCShG+KN8QGGB3cJ3H03wjdBc=;
 b=hfle0riRsDAK5N9DoVUxF90N4Kp3Zys6fM/mh2M7u4pgOk5NOUrXjzuPvtJDvRQrm7
 kGrne6Zubixd5ccOCFhscr/mrqEyjIu6g0KfhPWKko9Q2u5jgASK8BW4bAodziNmzg5F
 wVVa9eWon0XwtazJcROsOUzsNFpftp28xMcAWkFtYLL1uI2rOnSzBul7aYkkNq26xORJ
 ok++rpFN2m7wKX29rnTjo1WIpShg+X+b7tR0/RFBJse1vckZSZOc0foxhtP1FEeqIZgW
 FCg+3kw+G/2qhWLRSRHcJaxqY7GlSTq66hNduOWOH3DDNOAMRRnlDEzM0Bq1wjy4W/dr
 iTlg==
X-Gm-Message-State: AOAM530zK9mWC04LXdQ7n5ZPhpxetgmPmThwsvHvM4g8k4/YTgFZFriE
 w6NcDwYZMkkdRklz1wFg170YrpwUQTAsdQ==
X-Google-Smtp-Source: ABdhPJzab2GPd89hU1BcUnNt02ZrSMUDRgYOBrs7zTJ5mlVnqYlUO5CfOSR9ByptU1nleXKFzdoJyA==
X-Received: by 2002:a17:907:1c98:b0:6f4:5001:6751 with SMTP id
 nb24-20020a1709071c9800b006f450016751mr2947858ejc.498.1652425875769; 
 Fri, 13 May 2022 00:11:15 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 ml13-20020a170906cc0d00b006f3ef214e63sm443183ejb.201.2022.05.13.00.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 00:11:14 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 09:10:47 +0200
Message-Id: <20220513071046.18618-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220513071046.18618-1-heiko.thiery@gmail.com>
References: <20220513071046.18618-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/sysrepo: bump version to 2.1.42
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch that is now fixed upstream. Add a dependency to sytemd if
enabled so cmake can find libsystemd and install the systemd service file.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...uild-with-musl-libc-fails-due-to-unk.patch | 42 -------------------
 package/sysrepo/sysrepo.hash                  |  2 +-
 package/sysrepo/sysrepo.mk                    |  6 ++-
 3 files changed, 6 insertions(+), 44 deletions(-)
 delete mode 100644 package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch

diff --git a/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch b/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch
deleted file mode 100644
index 784cfb1445..0000000000
--- a/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 896dc6aee38898fe1c6822ee6a4a4989d21c650b Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Thu, 25 Nov 2021 12:18:06 +0100
-Subject: [PATCH] sysrepo BUGFIX build with musl libc fails due to unknown type
- name 'mode_t'
-
-When building against the musl libc the build will fail due to the
-missing sys/type.h include.
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- src/plugins_datastore.h    | 1 +
- src/plugins_notification.h | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/plugins_datastore.h b/src/plugins_datastore.h
-index a64e4131..d577e929 100644
---- a/src/plugins_datastore.h
-+++ b/src/plugins_datastore.h
-@@ -18,6 +18,7 @@
- #define _SYSREPO_PLUGINS_DATASTORE_H
- 
- #include <stdint.h>
-+#include <sys/types.h>
- 
- #include <libyang/libyang.h>
- 
-diff --git a/src/plugins_notification.h b/src/plugins_notification.h
-index 2099db62..f410e8d9 100644
---- a/src/plugins_notification.h
-+++ b/src/plugins_notification.h
-@@ -18,6 +18,7 @@
- #define _SYSREPO_PLUGINS_NOTIFICATION_H
- 
- #include <stdint.h>
-+#include <sys/types.h>
- 
- #include <libyang/libyang.h>
- 
--- 
-2.30.2
-
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index b382c16036..7232711b46 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe09da5f40fb53e3fb97268a134cc0ed3003f0018d0d117c73e81e1553a11f30  sysrepo-2.0.53.tar.gz
+sha256  1182b9d5e1178ad74b3bde6d282b86d17b60e206cd8a014895f74252492d96ab  sysrepo-2.1.42.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index acb3052023..c999bd0ea7 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.0.53
+SYSREPO_VERSION = 2.1.42
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
@@ -12,6 +12,10 @@ SYSREPO_LICENSE_FILES = LICENSE
 SYSREPO_DEPENDENCIES = libyang pcre2 host-sysrepo
 HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre2
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+SYSREPO_DEPENDENCIES += systemd
+endif
+
 SYSREPO_CONF_OPTS = \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
 	-DENABLE_TESTS=OFF \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
