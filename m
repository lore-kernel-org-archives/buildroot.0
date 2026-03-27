Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9C110F286F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 21:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA22410DF;
	Fri, 27 Mar 2026 21:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lST-VPVDO86q; Fri, 27 Mar 2026 21:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54389410E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774647660;
	bh=OesjDI1YQS37dBsh/Nn/4pnknaMDqlkcZSeVXJAIR9s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bamxTM9DJlHb3DaiUc6jRxshlwJKe7+ZQaz4CaFtq9ocoVSSpVHpubcS5zxGsEjjq
	 EFHGfqzQfTD3PKRqrLe9jEBtFhrmIz6hL9Xu/oyjcTbMew7OOb1CjnStHeGWK0rrhy
	 6EM8VSf1LV18DT/QrNduzkBXaHIEv07XP3OfWlOvjc93uh6Ikvz25D+YeHJwhH8noi
	 iyZlMLtlAY76+4TAJcBesAT87PwvJXHpyjbSaFnalt7cOUdHZS39hOYQk6owXjk5W9
	 lNTzc90NWBaW5BrXz+v8MthQF/n8Kovrzd1d/9Xi0H4vMIYE4TD7laGAXwWIKhnYTo
	 jHvn7DBHYfP9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54389410E3;
	Fri, 27 Mar 2026 21:41:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13E2A10F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED6616104B
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id todJza-avp8R for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 21:40:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE87860DD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE87860DD4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE87860DD4
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:40:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ba3.dip0.t-ipconnect.de [91.58.11.163])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6BF24A4C0BF9
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 22:40:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34702)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w6EvH-000000004Cm-0FKf
 for buildroot@buildroot.org; Fri, 27 Mar 2026 21:40:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 22:40:54 +0100
Message-ID: <20260327214055.1271678-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774647655;
 bh=zNIFaQUXraXQb97gR7z3yENfs0VFNxG55W/Gj6OKLug=;
 h=From:To:Subject:Date:From;
 b=B1y2uXdSlNVJdLMA3pa1x3zfI2Iej7PBDVvR38OSqPQoj5wxbAbw+advkhIlAJzrv
 qqaft+3PPSW5bBagXwV7T3/HwVuvm9bOockikgq9g8KFfK3kW6GKSkaTdIoKqNB66T
 c+9LtuC0JfhwB+3w0BR6mGtn7fSlsugWnjkRx+1kwarA3Mq/k+t2YQZv5aO93RxDr+
 huCQejROV5IiXfyBO2mEsuFR8AaymVHUdndzn2itf4KsjdEeBXK1FzqaZQc285taFz
 S+QOgWscyxdqEe4SBdEGyguCxPUDaii53taGS0cWwu7NU/ez/jzNebr/uXcmt95/FC
 F5F/H7ZnS7e+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=B1y2uXdS
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.24.0
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

https://www.samba.org/samba/history/samba-4.24.0.html

Removed patch 0002, its content is included in upstream commit
https://gitlab.com/samba-team/devel/samba/-/commit/50604bc027c3d053cafd803ff515e6da881e79a5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...st.c-include-stdint.h-before-cmoka.h.patch | 40 -------------------
 package/samba4/samba4.hash                    |  4 +-
 package/samba4/samba4.mk                      |  2 +-
 4 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index d51af142de..753021325d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -850,7 +850,6 @@ package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
 package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
-package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch lib_patch.Upstream
 package/samba4/S91smb Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/sane-backends/0001-sane_backend-add-missing-config.h.patch lib_patch.Upstream
 package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch lib_patch.Upstream
diff --git a/package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch b/package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
deleted file mode 100644
index e63f43c290..0000000000
--- a/package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b2ea5dc3639d68b878c6534f4992da446dbbf2d4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 16 May 2020 18:15:38 +0200
-Subject: [PATCH] ldap_message_test.c: include stdint.h before cmoka.h
-
-This fix the following build failure on uclibc:
-
-In file included from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/include/stdint.h:9:0,
-                 from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/inttypes.h:27,
-                 from ../../lib/replace/../replace/replace.h:64,
-                 from ../../source4/include/includes.h:23,
-                 from ../../libcli/ldap/tests/ldap_message_test.c:41:
-/home/giuliobenetti/autobuild/run/instance-1/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27: error: conflicting types for 'uintptr_t'
- typedef unsigned long int uintptr_t;
-                           ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/09e84d15efe755bdefa9f8c6b8355c49ddbc2f65
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
----
- libcli/ldap/tests/ldap_message_test.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libcli/ldap/tests/ldap_message_test.c b/libcli/ldap/tests/ldap_message_test.c
-index c5aacd4bc6b..51331e5c600 100644
---- a/libcli/ldap/tests/ldap_message_test.c
-+++ b/libcli/ldap/tests/ldap_message_test.c
-@@ -34,6 +34,7 @@
-  */
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
--- 
-2.26.2
-
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 84ada82bfd..d9bb2eac01 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.6.tar.asc
-sha256  e3dabd8b5e42dc97669fa0faef032510a94e496b58f7067082e5036d88f0e702  samba-4.23.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.0.tar.asc
+sha256  1b1e457fd651a612cd08226cc6efd04e5d01e36d918c8b4c4e470e74e86881ea  samba-4.24.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 89335d9308..293b063345 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.6
+SAMBA4_VERSION = 4.24.0
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
