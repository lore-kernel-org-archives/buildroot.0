Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723D0C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E9182081;
	Tue,  8 Aug 2023 18:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28E9182081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HCZ_IHCgXrbO; Tue,  8 Aug 2023 18:51:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ADF58206A;
	Tue,  8 Aug 2023 18:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ADF58206A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1310F1BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E06F88206A
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E06F88206A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tq0BBEg3QY1R for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:51:12 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2492682055
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2492682055
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15701A4C10DA;
 Tue,  8 Aug 2023 20:51:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48850)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTRnQ-0005AS-2V;
 Tue, 08 Aug 2023 20:51:08 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:50:56 +0200
Message-Id: <20230808185108.3787835-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808185108.3787835-1-bernd@kuhls.net>
References: <20230808185108.3787835-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691520669;
 bh=XEYmUQfzVkK7ywe+ptQdxM1lauxTjcchhyyaYZo+HIo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yzmee3fASozgxpTiBy3L28wptH7RV3J3LFl6gE7eBXzwQM4ylmBwJEEBB/vj4VHna
 SngPq4XsdDil3E7lgUb/aky7EmciFNfbAu2pnKO9IYCz9vzxcd/hDpXHZxkttq/9po
 gQVM39+q+VPKRR6wDGJtiKtPwQetV0dPVHAQZUvW0XTUrkWswmP4BVT2KIypW/NOey
 kzq0TV+wzReTwAIc/4wDsdK/DaLQ7Cb3scjyc3oeZf2ux5qxAWbBgzCgV1I1iOn7HM
 ZrfvSJ1ExsZaW0LbcYuAx/L5oMZE78ja9V4ibT8YHWhiGVdzdMw9GCkl42K1/s5BzV
 Q9rhUlAOSTjyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Yzmee3fA
Subject: [Buildroot] [PATCH/next 04/16] package/python3: use upstream build
 system to disable uuid module
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
 ...Add-an-option-to-disable-uuid-module.patch | 33 -------------------
 package/python3/python3.mk                    |  4 +--
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/python3/0027-Add-an-option-to-disable-uuid-module.patch

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
