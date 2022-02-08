Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA83C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 22:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB2ED60F3D;
	Tue,  8 Feb 2022 22:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LJ1TvQIFypE; Tue,  8 Feb 2022 22:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D101260F29;
	Tue,  8 Feb 2022 22:20:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 476DB1BF2EF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 22:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 365B2410D8
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 22:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KDaed3iMuL2m for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 22:20:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B777D410C8
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644358825;
 bh=ra9/Z0cs6/ImnsvdN//giN6/sZ6GBf9naGxB2EpqcSo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Mf03D/FdcnctXcRl8Psl3oDTk0C47kpvpN61mm61CMPVNhpT1YGnwIeu5ELliIW5+
 A1FJL10wLqmyG5XdYvExTRMltSUiGyIaiC9/F54kZmam06OTXSnbsWsfhQgYwz4Jw1
 57qLU1JyYM9lpgKVxLGAvKQAtIFKF2m4QsbbRnKU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2wL0-1nKqdI3ZRE-003LHO; Tue, 08
 Feb 2022 23:20:24 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 23:20:24 +0100
Message-Id: <20220208222024.24167-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:ajJImdgX6ghkAeFFOK9175iklnxVt2ZizfwOyYM27zHqZgHmwS0
 WdnvLkxVBWX2JhACBSv62B3G9n9nNxhon+Jb/QHL7ffrm58JWupr5dzB4mz/M/Ond2663nE
 SyDuFnfPFWHmGPXd7DX7AQ5ubXOz/VKE+CJw90NJ+ubdrF7q7OPjhFWjfo9V/WRc/34vt9Q
 rDECsMC88yMRUahCnPWCw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DrIwjwx8Eho=:9idE++o4QIu9fIwKGLBOZA
 hins/UlXtF/klR/HQHPSkDIsjMQ2QG20uL2WzQ1lb6QPZ+7lilJqNzfzqsZMeG4rolZXiPik7
 JwFx4NMPan5KzijV1tCtrG9RLOoWjTHTXQuYtAiq0CKJ7VjFNagYNYV6wog9gYmA5YyoFdyvi
 u7iaPWA0xvgE8EDggCjLSSzSxDCTAF+camQFGFArXiGe4Qc1I0YUlfMXVPVE7bLON2u2jGHxW
 outSBp5yb4rHkJQ+xgXw2ScuASgbLlLScFh3ZWSrXA7KMBUBSyBIloDLLH9MXtfhXBqMTrUKy
 cjvW2f9JY8TCtpGQ1tSno9A2c89ms63rXmB0tsGFKS/rlFJtIPkcJcNnr7Osr3+pWwLojvM8b
 blugSVI71aHuwrfiQvotbJG+W3adTa5wPitpnjW+FYf+Hx1fO5r2pwOLRuXsgID2cp+KsfbVZ
 gROJpOeB9Sz0cgDT3B5jTkSqoHhU2O8SByNg0LA+05HAnqES0I8Rp8y7ddiQOORt9+97Y6OGQ
 el4upbM/qLPDenZTBn46f/2uDGmegeLINqgQahrqVjttoOJ0laW2CrLmEKCU2JV/rnnL03xSm
 27ZwgGhURwuX4LZB/+QEUKBwHTpksqDL9LfqHjD6OCETnS4EwH5+78bsETHExlHqAN9JkjleB
 F/GeecgPsmfWdR5FQJQgijezSwrpC0EqbSbIuxUFvbHu6C10zBrVOnmJ9JOkKdi6GBuf7I58j
 qAzCNkQVTivEPT/IJ0qrInNNbgMglL2LXFYKQjgwYDUT4dhspfsovandNO57rKAHsb6zEhk7E
 LkFet/WHHb9utqG4S6bQZHMaSle75z3St1MGwyv/xBqw1m7rU9aXFpceSaBq77woW3KBOqoJY
 lMTBZJ1VwAtDI1Htu+yc5oB9+dWv/4NxP47lU5OP107TwItY4fQfiE8bq0GHZRwv9Y5IuH12/
 aZhCrqeewWHr0PgMJMsavnA+WBVjoIo5bysiWQxlLTZwkbIneHz8wy1ZoX8zGdwADXHR+QHNs
 cvV5x+tftrMdh51Is2vxlnL7YVfTfBsYqJlVfnGdyb9XU7NzhEF0njt95gFpRJLeXF+pgsXyr
 vPCd7N+2mSOMjw=
Subject: [Buildroot] [PATCH v1] package/libxkbcommon: bump version to 1.4.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 1.4.0

- add new option to select some tools for the target (xkbcli,
  xkbcli-compile-keymap, xkbcli-how-to-type, xkbcli-interactive-evdev,
  xkbcli-interactive-x11, xkbcli-interactive-wayland

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2022-February/042104.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libxkbcommon/Config.in         | 11 +++++++++++
 package/libxkbcommon/libxkbcommon.hash |  4 ++--
 package/libxkbcommon/libxkbcommon.mk   |  8 +++++++-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
index 4e73a24abb..e9f61227a0 100644
--- a/package/libxkbcommon/Config.in
+++ b/package/libxkbcommon/Config.in
@@ -7,3 +7,14 @@ config BR2_PACKAGE_LIBXKBCOMMON
 	  specification.
 
 	  https://xkbcommon.org
+
+if BR2_PACKAGE_LIBXKBCOMMON
+
+config BR2_PACKAGE_LIBXKBCOMMON_TOOLS
+	bool "tools"
+	help
+	  Tools: xkbcli, xkbcli-compile-keymap, xkbcli-how-to-type,
+	  xkbcli-interactive-evdev, xkbcli-interactive-x11,
+	  xkbcli-interactive-wayland
+
+endif
diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index c00fffe706..fff2b7a943 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041976.html
-sha256  b3c710d27a2630054e1e1399c85b7f330ef03359b460f0c1b3b587fd01fe9234  libxkbcommon-1.3.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-February/042104.html
+sha256  106cec5263f9100a7e79b5f7220f889bc78e7d7ffc55d2b6fdb1efefb8024031  libxkbcommon-1.4.0.tar.xz
 
 # License file:
 sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index ee2bc1ee99..f2c49cc700 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 1.3.1
+LIBXKBCOMMON_VERSION = 1.4.0
 LIBXKBCOMMON_SITE = https://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
@@ -23,4 +23,10 @@ else
 LIBXKBCOMMON_CONF_OPTS += -Denable-x11=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_TOOLS),y)
+LIBXKBCOMMON_CONF_OPTS += -Denable-tools=true
+else
+LIBXKBCOMMON_CONF_OPTS += -Denable-tools=false
+endif
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
