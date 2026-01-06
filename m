Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D94CEFCFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7C7081DE1;
	Tue,  6 Jan 2026 20:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWHGyFTyvM4o; Tue,  6 Jan 2026 20:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6EDC81DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767729858;
	bh=Eq4sQDJqU242RgErDQOKKyqOCAhtoRc2yKwNrYRlP2U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=psLOjYpcwt/YuKWgpV+y0FIfsctchnZ2yTF7g1hdpw/oHMOeJOmg3iLpiHEK0cUxp
	 iRxtz/BRxAMhrWM3pSjv8K8mURsEtMBCONFYtny/DHH+hkiy0o9McvHDAyjnBKetS+
	 1hURU9ByftGPUrzygev12gmX4rnipFlx56Z2f7LSStGcrIYRGXs0UNbHDJAncxX+4W
	 C0ZFvoVnBFwJdA17GnpNCzHtiA3wn159vPvSEy6qgHRrO94KAZJ7uA8S+0SgvpFTLq
	 XgkL/lnC44Sc0ah+vLvGZ1zNPd+dk3u2bm2aAQQCPVW3Bj9+KfaRMH942+4wAKNj3R
	 30oyQ8Y7zSYpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6EDC81DE3;
	Tue,  6 Jan 2026 20:04:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4273270B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28F8460AC0
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6oEam2Ol2S8h for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:04:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10DDC60B93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10DDC60B93
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10DDC60B93
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74486A4C3997
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:01:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48554)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdDF1-000000002Vv-0Mo5
 for buildroot@buildroot.org; Tue, 06 Jan 2026 20:01:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Jan 2026 21:01:11 +0100
Message-ID: <20260106200115.1985522-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106200115.1985522-1-bernd@kuhls.net>
References: <20260106200115.1985522-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767729679;
 bh=ysKTXOgt41V3zcSDQwgxDwES7tn1okLjm8wQUs0Arlg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=lA8n1AE62m59Hco4igmuBKr1ZEb5h8ujmfGbgHZJBQB35W5htqRmziII+//0YCx1J
 iqqKh61OYRewKxLUbhFcO1jKMf7iv8/lFlXbcEZSOOTX0nE/1ZvTw0HpJ9Mr06FXcP
 oi9URWzAuIAnmmnMaQN3dBBENVaR1LrVY8MEHlXKsVQtF3jl0f1GJXMa4bN0MBjjhd
 n34PT6EtiXbiE+GdZNRah1fKG9ac63UrfhFqqHTncUaA0vjUP7J/m1XyN0fVwXp9dX
 UBs7Bbz2mchjGWNgLfTE1Pc8DuQrBHOLcekhFktIigpemzPlQaXiHUWqaanixJpkod
 dtaJsr1bt79Sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lA8n1AE6
Subject: [Buildroot] [PATCH v2 6/9] package/dbus-triggerd: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Analysis of https://rg42.org/gitweb/?p=dbustriggerd.git:
last commit: 2014

Musl libc 1.2.5 removed the definition of the basename() function from
string.h and only provides it in libgen.h as the POSIX standard
defines it.

Instead of fixing an unmaintainted package we remove it from buildroot,
no other package depends on it.

Fixes:
https://autobuild.buildroot.net/results/811/81170fe89e1f5b70c63657684de43175e621f762/

dbus-triggerd.c:150:27: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
  150 |     argv[argc++] = strdup(basename(handler_cmd));

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                         |  7 +++++++
 package/Config.in                        |  1 -
 package/dbus-triggerd/Config.in          | 15 ---------------
 package/dbus-triggerd/dbus-triggerd.hash |  3 ---
 package/dbus-triggerd/dbus-triggerd.mk   | 21 ---------------------
 5 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 package/dbus-triggerd/Config.in
 delete mode 100644 package/dbus-triggerd/dbus-triggerd.hash
 delete mode 100644 package/dbus-triggerd/dbus-triggerd.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 28919e8594..e97fd0ebb2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_DBUS_TRIGGERD
+	bool "dbus-triggerd removed"
+	select BR2_LEGACY
+	help
+	  dbus-triggerd was no longer maintained upstream, so it has
+	  been dropped.
+
 config BR2_PACKAGE_CVS
 	bool "cvs has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index bbbc04226f..52ca6d19d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -485,7 +485,6 @@ endmenu
 	source "package/dbus-cxx/Config.in"
 	source "package/dbus-glib/Config.in"
 	source "package/dbus-python/Config.in"
-	source "package/dbus-triggerd/Config.in"
 	source "package/dfu-programmer/Config.in"
 	source "package/dfu-util/Config.in"
 	source "package/dmidecode/Config.in"
diff --git a/package/dbus-triggerd/Config.in b/package/dbus-triggerd/Config.in
deleted file mode 100644
index 331c414704..0000000000
--- a/package/dbus-triggerd/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_DBUS_TRIGGERD
-	bool "dbus-triggerd"
-	depends on BR2_USE_MMU # fork(), dbus
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
-	depends on BR2_PACKAGE_DBUS
-	help
-	  dbus-triggerd is a tool to trigger shell-commands upon
-	  receiving a given dbus-signal.
-
-	  http://gareus.org/oss/dbustriggerd/start
-
-comment "dbus-triggerd needs a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_DBUS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbus-triggerd/dbus-triggerd.hash b/package/dbus-triggerd/dbus-triggerd.hash
deleted file mode 100644
index c5127133fb..0000000000
--- a/package/dbus-triggerd/dbus-triggerd.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  73dbd92e89eee223928b5cbf414affb5913f70c1ca7e3f8ab733a4696436dae3  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09-git4.tar.gz
-sha256  30d135650639af9019633690fc1aecbfc150aeeef9446347d4286a58338d10b0  dbus-triggerd.c
diff --git a/package/dbus-triggerd/dbus-triggerd.mk b/package/dbus-triggerd/dbus-triggerd.mk
deleted file mode 100644
index 7d73a6c98f..0000000000
--- a/package/dbus-triggerd/dbus-triggerd.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# dbus-triggerd
-#
-################################################################################
-
-DBUS_TRIGGERD_VERSION = ba3dbec805cb707c94c54de21666bf18b79bcc09
-DBUS_TRIGGERD_SITE = git://rg42.org/dbustriggerd.git
-DBUS_TRIGGERD_LICENSE = GPL-2.0+
-DBUS_TRIGGERD_LICENSE_FILES = dbus-triggerd.c
-DBUS_TRIGGERD_DEPENDENCIES = host-pkgconf dbus
-
-define DBUS_TRIGGERD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
-endef
-
-define DBUS_TRIGGERD_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
-endef
-
-$(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
