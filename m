Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71FEC27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DCE3404E5;
	Sat, 22 Jun 2024 08:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id clR12Yk-3GeI; Sat, 22 Jun 2024 08:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 814A7404A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 814A7404A5;
	Sat, 22 Jun 2024 08:33:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBC3A1BF5EA
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4DAC404A5
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXO8v5n7MJ2g for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:33:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 960C340185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 960C340185
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 960C340185
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:33:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 37F2CA4C0287
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 10:33:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46458)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwBm-000000000JT-0mCU
 for buildroot@buildroot.org; Sat, 22 Jun 2024 08:33:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:33:38 +0200
Message-Id: <20240622083338.9077-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045219;
 bh=P5LtdgTyJFpaMcae2ixdCtzR1carDyOL13A4Hb6M4ug=;
 h=From:To:Subject:Date:From;
 b=vrLGcUc2MKs3EpRAaCWsgVdOHIpigrvu4ktKVoxyonhCshkRtiLjX7phY4ejkwtGO
 iZJrzMI7KRv7XRE9lhSBbSVLZQhiMVP3Jm2qFEqTjIOiTow07ylLU8o2jqMGEFwjVG
 0lJTI9qI1HEB2XyoyqTj62ZFoeJetVfXFrbR+V6Xvn2GM9JSB8SwiZS7FsnNY71NyC
 BH4LIklcPDnymCwQx2fqqpCPG52Ep1WwCihpNgohkOhpbdpoDtLLmKisdICpDnkMwL
 1ls9r5wX+z638gQG7TVVe7bqTxu1yWrcd5GKI2ErSNai9rpUc7NGhw6ut9m/6ArcuV
 qFa8/h0Dq6HOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=vrLGcUc2
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.20.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in this release.
Renumbered remaining patches.

Release notes:
- https://www.samba.org/samba/history/samba-4.20.0rc1.html
- https://www.samba.org/samba/history/samba-4.20.0rc2.html
- https://www.samba.org/samba/history/samba-4.20.0rc3.html
- https://www.samba.org/samba/history/samba-4.20.0rc4.html
- https://www.samba.org/samba/history/samba-4.20.0.html
- https://www.samba.org/samba/history/samba-4.20.1.html
- https://www.samba.org/samba/history/samba-4.20.2.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  5 +-
 ...ilt-heimdal-build-tools-in-case-of-.patch} |  0
 ...01-libreplace-disable-libbsd-support.patch | 46 -------------------
 ...t.c-include-stdint.h-before-cmoka.h.patch} |  0
 package/samba4/samba4.hash                    |  4 +-
 package/samba4/samba4.mk                      |  2 +-
 6 files changed, 5 insertions(+), 52 deletions(-)
 rename package/samba4/{0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch => 0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch} (100%)
 delete mode 100644 package/samba4/0001-libreplace-disable-libbsd-support.patch
 rename package/samba4/{0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch => 0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch} (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 807cee1a08..be8fbec086 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1339,9 +1339,8 @@ package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
 package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch lib_patch.Upstream
-package/samba4/0001-libreplace-disable-libbsd-support.patch lib_patch.Upstream
-package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
-package/samba4/0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch lib_patch.Upstream
+package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
+package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch lib_patch.Upstream
 package/samba4/S91smb Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/sane-backends/0001-sane_backend-add-missing-config.h.patch lib_patch.Upstream
 package/screen/0001-Do-not-use-memcpy-as-an-alternative-for-bcopy-memmov.patch lib_patch.Upstream
diff --git a/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
similarity index 100%
rename from package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
rename to package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
diff --git a/package/samba4/0001-libreplace-disable-libbsd-support.patch b/package/samba4/0001-libreplace-disable-libbsd-support.patch
deleted file mode 100644
index 8259e91fc6..0000000000
--- a/package/samba4/0001-libreplace-disable-libbsd-support.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4df82c9e03b68dc1621fe4c9ac6a29ae3e64e07e Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 7 Sep 2016 23:03:43 -0300
-Subject: [PATCH] libreplace: disable libbsd support
-
-Disable libbsd support, samba4 uses a global config.h for its own
-codebase and that of heimdal (when building with builtin).
-This causes redefinition conflicts for link(2) when both standard
-unistd.h and bsd/unistd.h get included.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Bernd: rebased for versions 4.7.3, 4.8.0, 4.8.5 & 4.11.13]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- lib/replace/wscript | 15 ---------------
- 1 file changed, 15 deletions(-)
-
-diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 240d730cbee..c6d8df43c74 100644
---- a/lib/replace/wscript
-+++ b/lib/replace/wscript
-@@ -436,21 +436,6 @@ def configure(conf):
- 
-     strlcpy_in_bsd = False
- 
--    # libbsd on some platforms provides strlcpy and strlcat
--    if not conf.CHECK_FUNCS('strlcpy strlcat'):
--        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
--                               checklibc=True):
--            strlcpy_in_bsd = True
--    if not conf.CHECK_FUNCS('getpeereid'):
--        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
--    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
--        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
--    if not conf.CHECK_FUNCS('setproctitle_init'):
--        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
--
--    if not conf.CHECK_FUNCS('closefrom'):
--        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
--
-     conf.CHECK_CODE('''
-                 struct ucred cred;
-                 socklen_t cred_len;
--- 
-2.20.1
-
diff --git a/package/samba4/0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch b/package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
similarity index 100%
rename from package/samba4/0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
rename to package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 457423f9e1..353736f3b2 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.19.7.tar.asc
-sha256  2bbb800af2d6bc7b9c23e708cd58d008da3bfa6ef7e621d9ec8b53387efee445  samba-4.19.7.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.20.2.tar.asc
+sha256  f969ffed58ccf3e85cbbcc0e33a1726d025c2b40f42a653b1125b82b92d2e0e5  samba-4.20.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 72b9d1ae02..5536b6b121 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.19.7
+SAMBA4_VERSION = 4.20.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
