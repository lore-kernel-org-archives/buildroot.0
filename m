Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BB6C43334
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 18:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 696956058B;
	Thu, 23 Jun 2022 18:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 696956058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rmAJAc8Bycj; Thu, 23 Jun 2022 18:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FE6D61422;
	Thu, 23 Jun 2022 18:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FE6D61422
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A7CF1BF303
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 18:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 647ED4057F
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 18:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 647ED4057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3yBJuCc5KV1K for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 18:05:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C81D140474
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C81D140474
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 18:05:42 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id n185so11469859wmn.4
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 11:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qC6iDkgLy50bay8xsCHkt+wr9KoTY4ufZSNzQWpk0t0=;
 b=mYW2CrQs35u1TGDrXQjkokoDLei1Ni1LeS75+2iz5b/DSA+ZNQmiiFvoD1f0GCXbfD
 CST32X8pbEPmumOapK0kUxt4aKnRxW7o17YBLX0CVHLm8To72a/Gf4lIz3YnEO2wxYns
 foonp7eet5yN7FwOJJLe+VQANob+nHITmBAUDP/YckUn0kIR/wfWQTt+99iCgGABVzN0
 10biQ4WGuUP+2JHNLXAaoE+CrvOCIym/WV3lbuSuJMShVRPjpDen4uih0AGnarOf1kzo
 LF+U4zC7I/iq7Hoa7uWbuQeaAXsYuC5gQ9s4TeaOLF6tmFwGKRnn5kDyWmvZ2nRyqs4e
 B81w==
X-Gm-Message-State: AJIora+wBtli+/pVohxDa/qCkwOwZaZgUQww0wpAbsPRcx6D65W9/+nW
 QoCdTVHQ6rIPG8Bs00vabG1WwswO2DI=
X-Google-Smtp-Source: AGRyM1vv5nJ/f7MhU3MogAyKB8Bhkg1XH0B635ufCAurVS9dcjuFfOIiKAJ0MHKfEfphGOY5iWZ1eA==
X-Received: by 2002:a05:600c:149:b0:3a0:2e60:8daa with SMTP id
 w9-20020a05600c014900b003a02e608daamr5514650wmm.126.1656007540599; 
 Thu, 23 Jun 2022 11:05:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5d44c2000000b0021a3d94c7bdsm86512wrr.28.2022.06.23.11.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 11:05:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Jun 2022 20:02:53 +0200
Message-Id: <20220623180253.429711-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qC6iDkgLy50bay8xsCHkt+wr9KoTY4ufZSNzQWpk0t0=;
 b=Yn9GShAtCW4ln6ZvGyx3znbLMfoPGi/VYAa4j5LJWz5GHtvC6mOZoVmzRc4uV94kg6
 OjMyPw2EPLKnO/dmcdJMd7wlsNF86zcf5XOyi+6aVP5WTE7VzZqRz8aHNRnZUJRuYoa9
 QMj4j1UWv7gKl88npfclubqPUw+GMjhtx+b8BDxHxmZAI/DYP0+jJUY+IWuiUdtVUva6
 O+GvdCB9kUYAmvtcXX7pzwk5/sde0mJoGr3hOcy349S/rkm35/mkqpX42nrq/3jNWVES
 aar930H4l+GkamQA4nLtTMDN9fuH21laHUB0Ie1O7UYorkCxYiF9MuBC1OwsKInWlEQm
 4Zog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Yn9GShAt
Subject: [Buildroot] [PATCH 1/1] package/irqbalance: bump to version 1.9.0
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
Cc: Karoly Kasza <kaszak@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (not needed since
https://github.com/Irqbalance/irqbalance/commit/bc16d7d4d5e478f44a89b93f3d7fd460268769dd)

https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...igure.ac-use-pkg-config-to-find-numa.patch | 38 -------------------
 package/irqbalance/irqbalance.hash            |  2 +-
 package/irqbalance/irqbalance.mk              |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 package/irqbalance/0001-configure.ac-use-pkg-config-to-find-numa.patch

diff --git a/package/irqbalance/0001-configure.ac-use-pkg-config-to-find-numa.patch b/package/irqbalance/0001-configure.ac-use-pkg-config-to-find-numa.patch
deleted file mode 100644
index 751367ccfb..0000000000
--- a/package/irqbalance/0001-configure.ac-use-pkg-config-to-find-numa.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 274cb8ea470a10ce46b783e77784b0eb08cf20d8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 1 Aug 2021 23:26:01 +0200
-Subject: [PATCH] configure.ac: use pkg-config to find numa
-
-Use pkg-config to find numa and fallback to current mechanism.
-Thanks to pkg-config, numa dependencies such as -latomic will be
-retrieved.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/Irqbalance/irqbalance/pull/188]
----
- configure.ac | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c45b9ce..50c62ba 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -23,7 +23,14 @@ AC_CHECK_HEADERS([numa.h])
- 
- AC_CHECK_FUNCS(getopt_long)
- 
--AC_CHECK_LIB(numa, numa_available)
-+PKG_CHECK_MODULES([NUMA], [numa], [has_numa=yes], [AC_CHECK_LIB(numa, numa_available)])
-+AS_IF([test "x$has_numa" = "xyes"], [
-+  AC_SUBST([NUMA_CFLAGS])
-+  AC_SUBST([NUMA_LIBS])
-+  LIBS="$LIBS $NUMA_LIBS"
-+  AC_SUBST([LIBS])
-+])
-+
- AC_CHECK_LIB(m, floor)
- 
- PKG_CHECK_MODULES([GLIB2], [glib-2.0], [], [AC_MSG_ERROR([glib-2.0 is required])])
--- 
-2.30.2
-
diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index 49118f8c7d..3dd83a017f 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2e7ddb9687a6a5cc1f41626659eac2ad9d6b5875629156b92f693bd404d8ae63  irqbalance-1.8.0.tar.gz
+sha256  883d3f6296f7e4a17e09dc2c91bd972e110fe574c119d9e45ec0c4e35c7317bb  irqbalance-1.9.0.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 1efc0b7fa2..abd64e6b9e 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = 1.8.0
+IRQBALANCE_VERSION = 1.9.0
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
