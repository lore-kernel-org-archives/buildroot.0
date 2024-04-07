Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B412CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1AB540801;
	Sun,  7 Apr 2024 15:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OYZocCqHenj; Sun,  7 Apr 2024 15:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E7A408A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E7A408A3;
	Sun,  7 Apr 2024 15:37:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39F7D1BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5901F60A45
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEUHaXTOS6Aq for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80AC960A50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80AC960A50
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7887F81623; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:34:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5e31164c9a58a9a252bef1153d9af876deaa702
X-Git-Newrev: e4eda364a2f80e3d1883f85e997a89f0f1dd6365
X-Patchwork-Hint: ignore
Message-Id: <20240407153657.7887F81623@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/thttpd: add libxcrypt optional
 dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e4eda364a2f80e3d1883f85e997a89f0f1dd6365
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-14/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/12.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: libhttpd.o: in function `auth_check2':
libhttpd.c:(.text+0x3d50): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/bfb8a115edf71b1852cc8585c00eb9f0e801a955

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/thttpd/Config.in | 1 +
 package/thttpd/thttpd.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/thttpd/Config.in b/package/thttpd/Config.in
index 66537aa270..bd97bc7a75 100644
--- a/package/thttpd/Config.in
+++ b/package/thttpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_THTTPD
 	bool "thttpd"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  thttpd is a simple, small, portable, fast, and secure HTTP
 	  server
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 3815705b58..d9cb5c9071 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -12,6 +12,10 @@ THTTPD_CPE_ID_VENDOR = acme
 
 THTTPD_MAKE = $(MAKE1)
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+THTTPD_DEPENDENCIES += libxcrypt
+endif
+
 define THTTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/thttpd $(TARGET_DIR)/usr/sbin/thttpd
 	$(INSTALL) -D -m 0755 $(@D)/extras/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
