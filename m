Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC484C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 04:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B28540438;
	Sun, 21 Aug 2022 04:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B28540438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUjcNJFXnJHs; Sun, 21 Aug 2022 04:14:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 121AA4010F;
	Sun, 21 Aug 2022 04:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 121AA4010F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2F5A1BF83E
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 04:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B388360B18
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 04:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B388360B18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yHk1qfM6rBRK for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 04:14:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80FE760A72
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80FE760A72
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 04:14:41 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 73so6703698pgb.9
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 21:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=abF8iIdgeyeQaGRuCVXGrKlzvmksRj3QICeSlKN4E6A=;
 b=txCS9Ji4dSAySI3Xo6cuRjpDjAIp4XkhOr3WRtBa6xe0Hp2Zl0QZuYQBbkrQrWX3LM
 hwxObeFklrIvLptFKTvV3GIPzxPTHe8hIm2JKpriEQ54BxtuK8b7mxrPkc4yLiXPjNZp
 OBk9u9tHoCUdPAl0RGK6N1QHcLrkEMo4z6ADZ7RYk043lSMmCHtBZpEJhRBH646p5H5O
 YPGc5YIfYAXrXpEnDvfaHflIUBNzuTB8785L4vpMHJR5Cx6m6Rhc26dHE6hLxgFWpRvz
 MlbveIoYNTu/JIcjFE+L5sxteMP4EDaqYT3Cg8e7CxlZhdc0M1St5OSA8MOD/swUTYnP
 HD0Q==
X-Gm-Message-State: ACgBeo1/1GsVt8/OAhTPYWW6iuzNIXdf8PaWd8duKcn7eK9Kt2MT1OZr
 6Coos41gQwn8eRMOpkFGlujMs/9Dda2CJg==
X-Google-Smtp-Source: AA6agR5wBtYhJ1TvgZxD5aaDwE7V2J9YXgZgVU8THVCU5RBp5VmpP9klQ2M8KTKjfyxeYJcP0rri3Q==
X-Received: by 2002:a63:d448:0:b0:41d:d4e9:b4aa with SMTP id
 i8-20020a63d448000000b0041dd4e9b4aamr11788053pgj.123.1661055280140; 
 Sat, 20 Aug 2022 21:14:40 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 p6-20020a622906000000b0052e8bf1c27fsm6026355pfp.31.2022.08.20.21.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 21:14:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 21:14:17 -0700
Message-Id: <20220821041417.483818-1-christian@paral.in>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/catatonit: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

catatonit is a simple but valid init binary to act as PID 1 for containers.

https://github.com/openSUSE/catatonit

Dependency of podman.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...e.ac-call-AM_INIT_AUTOMAKE-only-once.patch | 39 +++++++++++++++++++
 package/catatonit/Config.in                   |  7 ++++
 package/catatonit/catatonit.hash              |  3 ++
 package/catatonit/catatonit.mk                | 14 +++++++
 6 files changed, 65 insertions(+)
 create mode 100644 package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
 create mode 100644 package/catatonit/Config.in
 create mode 100644 package/catatonit/catatonit.hash
 create mode 100644 package/catatonit/catatonit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..758219913f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -529,6 +529,7 @@ F:	package/python-pylibftdi/
 
 N:	Christian Stewart <christian@paral.in>
 F:	package/batman-adv/
+F:	package/catatonit/
 F:	package/containerd/
 F:	package/delve/
 F:	package/docker-cli/
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..328468d7c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2520,6 +2520,7 @@ comment "Utilities"
 	source "package/apg/Config.in"
 	source "package/at/Config.in"
 	source "package/bash-completion/Config.in"
+	source "package/catatonit/Config.in"
 	source "package/ccrypt/Config.in"
 	source "package/crudini/Config.in"
 	source "package/dialog/Config.in"
diff --git a/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch b/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
new file mode 100644
index 0000000000..bb500df6c7
--- /dev/null
+++ b/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
@@ -0,0 +1,39 @@
+From 99bb9048f532257f3a2c3856cfa19fe957ab6cec Mon Sep 17 00:00:00 2001
+From: Antonio Terceiro <terceiro@debian.org>
+Date: Thu, 4 Nov 2021 07:37:13 -0300
+Subject: [PATCH] configure.ac: call AM_INIT_AUTOMAKE only once
+
+That second call seems to be there since the beginning, and autoconf
+2.69 was fine with it. autoconf 2.71 doesn't allow it anymore:
+
+    $ ./autogen.sh
+    autoreconf: export WARNINGS=
+    autoreconf: Entering directory '.'
+    autoreconf: configure.ac: not using Gettext
+    autoreconf: running: aclocal --force
+    configure.ac:34: error: AM_INIT_AUTOMAKE expanded multiple times
+    /usr/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
+    configure.ac:19: the top level
+    /usr/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
+    configure.ac:34: the top level
+    autom4te: error: /usr/bin/m4 failed with exit status: 1
+    aclocal: error: /usr/bin/autom4te failed with exit status: 1
+    autoreconf: error: aclocal failed with exit status: 1
+
+Signed-off-by: Antonio Terceiro <terceiro@debian.org>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 12c9186..94c5c84 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -31,4 +31,3 @@ AC_FUNC_FORK
+ 
+ AC_CONFIG_FILES([Makefile config.h])
+ AC_OUTPUT
+-AM_INIT_AUTOMAKE
+-- 
+2.37.2
+
diff --git a/package/catatonit/Config.in b/package/catatonit/Config.in
new file mode 100644
index 0000000000..fbc7d90390
--- /dev/null
+++ b/package/catatonit/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CATATONIT
+	bool "catatonit"
+	help
+	  catatonit is a simple but valid init binary to act as
+	  PID 1 for containers.
+
+	  https://github.com/openSUSE/catatonit
diff --git a/package/catatonit/catatonit.hash b/package/catatonit/catatonit.hash
new file mode 100644
index 0000000000..9b7420cdb7
--- /dev/null
+++ b/package/catatonit/catatonit.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e22bc72ebc23762dad8f5d2ed9d5ab1aaad567bdd54422f1d1da775277a93296  catatonit-0.1.7.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/catatonit/catatonit.mk b/package/catatonit/catatonit.mk
new file mode 100644
index 0000000000..3dd58eff1d
--- /dev/null
+++ b/package/catatonit/catatonit.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# catatonit
+#
+################################################################################
+
+CATATONIT_VERSION = 0.1.7
+CATATONIT_SITE = $(call github,openSUSE,catatonit,v$(CATATONIT_VERSION))
+CATATONIT_LICENSE = GPL-3.0+
+CATATONIT_LICENSE_FILES = COPYING
+
+CATATONIT_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
