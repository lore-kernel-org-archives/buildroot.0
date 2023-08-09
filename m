Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059AAC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2CE612AB;
	Wed,  9 Aug 2023 21:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2CE612AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id avzVmK3se4gh; Wed,  9 Aug 2023 21:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C34AC610B4;
	Wed,  9 Aug 2023 21:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C34AC610B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0DDD1BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A95C4063C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A95C4063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wLoOOpOW-K4h for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:16:20 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A68AD400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A68AD400D9
Received: from fli4l.lan.fli4l (p4fd6c449.dip0.t-ipconnect.de [79.214.196.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DBF6CA4C1118;
 Wed,  9 Aug 2023 23:14:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57460)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTqVF-0001EZ-2l;
 Wed, 09 Aug 2023 23:14:01 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:13:49 +0200
Message-Id: <20230809211401.3587177-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809211401.3587177-1-bernd@kuhls.net>
References: <20230809211401.3587177-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691615643;
 bh=SzzBp2TrUwecvNg8YMJmNWnMcq6FTBvVrL231gRqVVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LxOgtyy2qlWp25Y3ErxaYso0aRmsA7v7L1iY03VdQfHeB3T5OBVl369YOO0ucg3qa
 Zrezv9ips/D14AqZ91bTJDd+HFVc7MmgtCecs02dtD/1f1PY++cRdlGXff+idcaFRh
 T8dFp/yIZeL0dg4m4h8vq5EL9rjR/DVzmq51NkG6wx8uFOuYZx2kzUzg1BCjE7EYm4
 fShl61IfSI4+SyJXVvH5iEGcSTsyfIn0vphYunZuU6U4KXdE+LXpNyJZMycV1vuNsn
 e3XAZ8yvqPSCEISVflSEGzf8LcNvDo8O6+sDdR3MZkIhpAPlXGbRKj3gfhPFjsp5hS
 h5OAihm/SGHOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=LxOgtyy2
Subject: [Buildroot] [PATCH/next v3 02/14] package/python3: use upstream
 build system to disable uuid module
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...Add-an-option-to-disable-uuid-module.patch | 33 -------------------
 package/python3/python3.mk                    |  4 +--
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/python3/0027-Add-an-option-to-disable-uuid-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 303eb4ccad..91f351f87b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1235,7 +1235,6 @@ package/python3/0023-Add-an-option-to-disable-openssl-support.patch Upstream
 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch Upstream
 package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
-package/python3/0027-Add-an-option-to-disable-uuid-module.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
 package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch Upstream
diff --git a/package/python3/0027-Add-an-option-to-disable-uuid-module.patch b/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
deleted file mode 100644
index a9501ec189..0000000000
--- a/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 58027d25c3cabcf654cb0b31a61d7cbd53dc68c0 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 18 Aug 2018 10:54:56 +0200
-Subject: [PATCH] Add an option to disable uuid module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index ca6c16491a..ed03b27fb1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4267,6 +4267,15 @@ if test "$CURSES" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
- fi
- 
-+AC_SUBST(UUID)
-+AC_ARG_ENABLE(uuid,
-+	AS_HELP_STRING([--disable-uuid], [disable uuid]),
-+	[ UUID="${enableval}" ], [ UUID=yes ])
-+
-+if test "$UUID" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 494c66c0b1..5d36917817 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -31,7 +31,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--enable-unicodedata \
 	--disable-test-modules \
 	--disable-idle3 \
-	--disable-uuid \
 	--disable-ossaudiodev
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
@@ -41,6 +40,7 @@ HOST_PYTHON3_CONF_OPTS += \
 # communicate over the network during the build.
 HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
+	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
@@ -128,7 +128,7 @@ endif
 # Disable auto-detection of uuid.h (util-linux)
 # which would add _uuid module support, instead
 # default to the pure python implementation
-PYTHON3_CONF_OPTS += --disable-uuid
+PYTHON3_CONF_ENV += py_cv_module__uuid=n/a
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
