Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261B9C79FBD
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 19:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E13AE404B8;
	Mon,  5 Jan 2026 19:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wLPxlaww6UM; Mon,  5 Jan 2026 19:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 030A5404E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767642573;
	bh=JB1eE6nE07JIXuVsfjhFgSPXzCWcaNHz7e18vE53ojU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ygd5TLFekspBiXaVAHwCUWq3xMX1+MWaF/zzbyBnr3lyj+bhyTG+eMc+0FqEH2GFy
	 GMYnJ8MGcyy5PDLYURtEWcnRui2wvv/rpmJkmIidf2P3djCAfG1TUiS8t/6zzxSJWm
	 Io10Aa1cgAw5ZyBZhLsCx+ujMkbl8Ja6dDPk/k8DVZfTZ1MRTUkVbJmB/MJ3Gt5Fo6
	 xiU4T6wOCuFNZkOBbgPiFBE8S6KIrGStLJ+XF8hbkD8c2iKa8j4xmjz++Nv+jXSqaI
	 UCZsG1uHeXAWikhJtQ7mZXByQC0LQDnecVlBTQPKzsk3Kb7KhJSUJpo9gA1o4SvFpn
	 eXtr/e6wX7bPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 030A5404E9;
	Mon,  5 Jan 2026 19:49:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7036E96F
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62189404E9
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9YlaZ-72Syl for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 19:49:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58783404B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58783404B8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58783404B8
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:49:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72E4CA4C3753
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:48:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40420)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcqYq-000000006SQ-0R6x
 for buildroot@buildroot.org; Mon, 05 Jan 2026 19:48:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 20:48:12 +0100
Message-ID: <20260105194813.2157401-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105194813.2157401-1-bernd@kuhls.net>
References: <20260105194813.2157401-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767642496;
 bh=meUli96Psv6DvRWNlpwBlDARELhf+yxCvo76rsVRY6Y=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=VLmBFTeJejs5X14NQAcPpkSOfKPSFPJRLQztFt1mP/QaJBMziy8QDn7grsVVc00L6
 IfNdfqVZCfHgduVXITtuNHrPKqrEXD+E+CpmmqZJNKc/bOBYvk840IMV5ZYnyIZN5W
 T/BVcBFE++yVVt8z7Gq2kfRCRSDUES9hmHme6Ibil6eOgDL/kraJZVRMjqEmgHZ4UM
 m37auI0suFtfmKA/ma2ZL6XCpgK1A3VHk0tGjRGUvrolDwE6gPREmbROZYMdftuFqL
 Fmx7UYarGHDjTeSm3UWwElIA6EblCO3573rVAhkNRHF1ZFlMGd/Fq52WC/9si/fD7U
 T+jMMrV+pJRlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VLmBFTeJ
Subject: [Buildroot] [PATCH 6/6] package/dbus-triggerd: remove package
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

According to https://rg42.org/gitweb/?p=dbustriggerd.git the last commit
to the upstream repo occured 2014.

Musl libc 1.2.5 removed the definition of the basename() function from
string.h and only provides it in libgen.h as the POSIX standard
defines it:

dbus-triggerd.c:150:27: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
  150 |     argv[argc++] = strdup(basename(handler_cmd));

Instead of fixing an unmaintainted package we remove it from buildroot,
no other package depends on it.

Fixes:
https://autobuild.buildroot.net/results/811/81170fe89e1f5b70c63657684de43175e621f762/

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
index 25a06caa4a..18d3e05242 100644
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
