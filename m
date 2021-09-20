Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76772C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 12:03:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B6A6109D
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 12:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9B6A6109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDCB40459;
	Mon, 20 Sep 2021 12:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGCBYus5WhtQ; Mon, 20 Sep 2021 12:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9484640448;
	Mon, 20 Sep 2021 12:03:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62C621BF2AB
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 12:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E3914044D
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 12:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jaJRZxigWrUT for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 12:03:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13B9740448
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:03:06 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id r75so4039863iod.7
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gWEldGvYuPXt3aPksIA2hgaegvd5xYUfNO5hn76xviQ=;
 b=B8wDlx9BtXYlRpT0kvaZW7DedGWYcNolYNwtnE81QWQElY+Bn/F5p2omUFHsmZQdQI
 mXMSIt194u0RbhWYll6sYVdzXlnVNT2Bv5NUI3Mmwv/ervYYx7wmlXZ11Y1JbXK7lq3a
 IBMU9IGCe5rWw9ot/h9sZRhzpt9UqJ2rAUVddM/v8sBHcfZZypb8fu4OrQL0YQALmQUO
 T1z2z+75x5ZY9NWqKvB60hzrUAbQnT7hp3DQYBz2uPQxhH8HyLbWx9IyTwmJiJV/bWWn
 geInx+2haFIOIbTKNCd6DyqQNKhK/XrMIUIzaDKGKF4P25+TdYl7OTJcAKwkP4p7tWLs
 pkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gWEldGvYuPXt3aPksIA2hgaegvd5xYUfNO5hn76xviQ=;
 b=djiwjQdCyPgUUrPV0RDDFTSzUYT7LzO6BoIyH266hqholOWpFgs/fyWCwWqJjiuFki
 U/pQmf0g9+X8s1i5luzMEudcElQxnQRzIG8kbEzAUFv9oFwvT6DUsr9BkgzM27BlW8sS
 cWwE3/KJNKIH+p9a+gMeJmwiHbrIvOYXADOPfkEjdIt7UK6o4EX3MwkmmvltVDKfCUh6
 8YRMLamuzIiur91Ha3l2R6yWXsDPHwJgLnkdAK/8lE55JIIOoUKfLnsW5mBTl+BBh/Uo
 rCY9IlgdXu77nsynhtdq5VMB8QRTExegz+8jsMsvtdqLHHdSI63QqF2cFWEuTwYIezui
 dhZg==
X-Gm-Message-State: AOAM532nAQOFERV/P6N6/F39i/4BmTsgCwW4W9fcqV0CKpoHV7LIqA9X
 /6Gd699KME6Q0agSQC3fUuoBeCPTNFE=
X-Google-Smtp-Source: ABdhPJyNKg+aFlPSrvEgEou1zyzLOk+hT+tJQP1B8JOX98HZthMA5+PR7bx8UfL5GW2ao6aFKGWUjQ==
X-Received: by 2002:a5e:d711:: with SMTP id v17mr10817656iom.93.1632139385685; 
 Mon, 20 Sep 2021 05:03:05 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id v8sm8371172ilg.25.2021.09.20.05.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 05:03:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 06:02:47 -0600
Message-Id: <20210920120247.4017959-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zbar: bump to version 0.23.90
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Volkov Viacheslav <sv99@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Drop patches that are now upstream.

Enable python module when available as it should now work with
python3.9 as of this release.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...zbarcam-zbarimg-get-rid-of-gettext-h.patch | 45 ---------------
 ...-zbar-cam-img-.c-fix-build-with-musl.patch | 55 -------------------
 package/zbar/zbar.hash                        |  2 +-
 package/zbar/zbar.mk                          | 10 +++-
 4 files changed, 9 insertions(+), 103 deletions(-)
 delete mode 100644 package/zbar/0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch
 delete mode 100644 package/zbar/0002-zbarcam-zbar-cam-img-.c-fix-build-with-musl.patch

diff --git a/package/zbar/0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch b/package/zbar/0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch
deleted file mode 100644
index 009fd5f96f..0000000000
--- a/package/zbar/0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From a133aea7880bbb56d75535e534716d0e16a3b61a Mon Sep 17 00:00:00 2001
-From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
-Date: Tue, 28 Jul 2020 09:47:03 +0200
-Subject: [PATCH] zbarcam, zbarimg: get rid of gettext.h
-
-This doesn't seem to be needed at all for translations to
-work. Also, gettext.h uses a different license. So, let's get
-rid of it.
-
-Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
-[Retrieved (and updated to remove gettext.h which is not in the
-tarball):
-https://github.com/mchehab/zbar/commit/a133aea7880bbb56d75535e534716d0e16a3b61a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- zbar/gettext.h    | 294 ----------------------------------------------
- zbarcam/zbarcam.c |   1 -
- zbarimg/zbarimg.c |   1 -
- 3 files changed, 296 deletions(-)
- delete mode 100644 zbar/gettext.h
-
-diff --git a/zbarcam/zbarcam.c b/zbarcam/zbarcam.c
-index f7ea281..ad30101 100644
---- a/zbarcam/zbarcam.c
-+++ b/zbarcam/zbarcam.c
-@@ -35,7 +35,6 @@
- #include <zbar.h>
- 
- #ifdef ENABLE_NLS
--#include "../zbar/gettext.h"
- # include <libintl.h>
- # define _(string) gettext(string)
- #else
-diff --git a/zbarimg/zbarimg.c b/zbarimg/zbarimg.c
-index 0796fd8..d05d832 100644
---- a/zbarimg/zbarimg.c
-+++ b/zbarimg/zbarimg.c
-@@ -40,7 +40,6 @@
- #include <zbar.h>
- 
- #ifdef ENABLE_NLS
--#include "../zbar/gettext.h"
- # include <libintl.h>
- # define _(string) gettext(string)
- #else
diff --git a/package/zbar/0002-zbarcam-zbar-cam-img-.c-fix-build-with-musl.patch b/package/zbar/0002-zbarcam-zbar-cam-img-.c-fix-build-with-musl.patch
deleted file mode 100644
index fe62c1649c..0000000000
--- a/package/zbar/0002-zbarcam-zbar-cam-img-.c-fix-build-with-musl.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From ecf90fcff066c06eda1fb931d08fadf5989ecb36 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 29 Aug 2020 14:23:04 +0200
-Subject: [PATCH] zbarcam/zbar{cam,img}.c: fix build with musl
-
-setlocale is used since version 0.23.1 and
-https://git.linuxtv.org/zbar.git/commit/id=d05911f8d5fb8c1e064bd93ed9ec9f038c5da096
-
-Include locale.h to avoid the following build failure on musl:
-
-zbarcam/zbarcam.c:168:5: warning: implicit declaration of function 'setlocale'; did you mean 'setstate'? [-Wimplicit-function-declaration]
-     setlocale (LC_ALL, "");
-     ^~~~~~~~~
-     setstate
-zbarcam/zbarcam.c:168:16: error: 'LC_ALL' undeclared (first use in this function)
-     setlocale (LC_ALL, "");
-                ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/b93ce5430bf22ddda94ee30882a883348617f5b1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mchehab/zbar/pull/115]
----
- zbarcam/zbarcam.c | 1 +
- zbarimg/zbarimg.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/zbarcam/zbarcam.c b/zbarcam/zbarcam.c
-index 6e13c8c..b8bc732 100644
---- a/zbarcam/zbarcam.c
-+++ b/zbarcam/zbarcam.c
-@@ -36,6 +36,7 @@
- 
- #ifdef ENABLE_NLS
- # include <libintl.h>
-+# include <locale.h>
- # define _(string) gettext(string)
- #else
- # define _(string) string
-diff --git a/zbarimg/zbarimg.c b/zbarimg/zbarimg.c
-index d05d832..52502b2 100644
---- a/zbarimg/zbarimg.c
-+++ b/zbarimg/zbarimg.c
-@@ -41,6 +41,7 @@
- 
- #ifdef ENABLE_NLS
- # include <libintl.h>
-+# include <locale.h>
- # define _(string) gettext(string)
- #else
- # define _(string) string
--- 
-2.28.0
-
diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
index 4277091892..a4303266db 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dad260b47ef887a639e840a89e5e6e132217b6bba2a8473565d1f459bcb97c1f  zbar-0.23.1.tar.bz2
+sha256  9152c8fb302b3891e1cb9cc719883d2f4ccd2483e3430783a2cf2d93bd5901ad  zbar-0.23.90.tar.bz2
 sha256  44260f9252c7fe38ba8dfb645330504f4a375e3a5e9dd7d5d6b9f04adb4952f1  LICENSE.md
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index f75741ded9..5554dca6a1 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZBAR_VERSION = 0.23.1
+ZBAR_VERSION = 0.23.90
 ZBAR_SOURCE = zbar-$(ZBAR_VERSION).tar.bz2
 ZBAR_SITE = https://www.linuxtv.org/downloads/zbar
 ZBAR_LICENSE = LGPL-2.1+
@@ -21,7 +21,6 @@ ZBAR_CONF_OPTS = \
 	--without-qt \
 	--without-qt5 \
 	--without-gtk \
-	--without-python \
 	--without-x \
 	--without-java
 
@@ -32,4 +31,11 @@ else
 ZBAR_CONF_OPTS += --without-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ZBAR_DEPENDENCIES += host-python3 python3
+ZBAR_CONF_OPTS += --with-python=python3
+else
+ZBAR_CONF_OPTS += --with-python=no
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
