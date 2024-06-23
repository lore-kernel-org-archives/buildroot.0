Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DC6C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 16:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBB4060831;
	Sun, 23 Jun 2024 16:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpshkuAwMo2q; Sun, 23 Jun 2024 16:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E64C607A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E64C607A4;
	Sun, 23 Jun 2024 16:56:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E04D51BF593
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 16:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBDD3817B3
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 16:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDhMpNId6J9j for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 16:56:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12CC1817AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12CC1817AF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12CC1817AF
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 16:56:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb81.dip0.t-ipconnect.de [84.161.187.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0CD80A4C0D1B
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 18:56:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44000)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sLQW7-000000003Qs-13ll
 for buildroot@buildroot.org; Sun, 23 Jun 2024 16:56:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 18:56:39 +0200
Message-Id: <20240623165639.1723393-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719161800;
 bh=wDzBBn+cTdKyeZOGKDG9jhw7ORLae/OUl5ac3OjFd2I=;
 h=From:To:Subject:Date:From;
 b=c+KTXBslWXLwfplgzmFUJeHt58xAZz/dzOeEwMudOE5VrTcBGJmXEt3NPakVqy79X
 Fj7bUGG9fgqcubCjx5jhXQGCyrrco21FIgYAuFW4kgIV/ldjCk6LCuYN32JiWjRumW
 jzlYQpiSUite7v1WN3YI6lalDs4AtYDh3OWCxSS/MB+v6Xy9hh+am7UkY4t+jvd/pr
 ujfECn/gzuitwiXkQJfLqMqkflzouVSP+OF2aT4uYrgWW68L2eCQDxWOQBVsROC1SR
 z7cr3zCTbTHKJQZ1eHZDzqeaYzVmMPGKw2zLt1VCewSkwMuX50Bd6rsUAxfsqiOamX
 bIXi2m9z5QGYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=c+KTXBsl
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
index 49ce47705d..353736f3b2 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.19.6.tar.asc
-sha256  653b52095554dbc223c63b96af5cdf9e98c3e048549c5f56143d3b33dce1cef1  samba-4.19.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.20.2.tar.asc
+sha256  f969ffed58ccf3e85cbbcc0e33a1726d025c2b40f42a653b1125b82b92d2e0e5  samba-4.20.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 994037c84b..5536b6b121 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.19.6
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
