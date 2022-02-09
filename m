Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0611EC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9A534056E;
	Wed,  9 Feb 2022 21:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3wTW-NEnlbm; Wed,  9 Feb 2022 21:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89F4B40523;
	Wed,  9 Feb 2022 21:39:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 617B11BF9C1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07C8D60F62
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kk1C9iyexNv2 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AD3360E43
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A8E9F8323C; Wed,  9 Feb 2022 21:25:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:08:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8af1b5df85d0e9eac8926b1b967d2737d1947a74
X-Git-Newrev: 109ff80fc1159df11ca58df6d3e9669685862cad
X-Patchwork-Hint: ignore
Message-Id: <20220209212559.A8E9F8323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fail2ban: drop python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=109ff80fc1159df11ca58df6d3e9669685862cad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fail2ban/Config.in   | 2 +-
 package/fail2ban/fail2ban.mk | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
index 86e6233793..8a48a8c1d0 100644
--- a/package/fail2ban/Config.in
+++ b/package/fail2ban/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_FAIL2BAN
 	bool "fail2ban"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SYSTEMD if BR2_PACKAGE_SYSTEMD
 	help
 	  Fail2ban scans log files (e.g. /var/log/apache/error_log) and
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 9202dc1ddd..4a08981a97 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -15,15 +15,13 @@ FAIL2BAN_SETUP_TYPE = distutils
 # 0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
 FAIL2BAN_IGNORE_CVES += CVE-2021-32749
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define FAIL2BAN_PYTHON_2TO3
 	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
 endef
-FAIL2BAN_DEPENDENCIES += host-python3
+FAIL2BAN_DEPENDENCIES = host-python3
 # We can't use _POST_PATCH_HOOKS because dependencies are not guaranteed
 # to build and install before _POST_PATCH_HOOKS run.
 FAIL2BAN_PRE_CONFIGURE_HOOKS += FAIL2BAN_PYTHON_2TO3
-endif
 
 define FAIL2BAN_FIX_DEFAULT_CONFIG
 	$(SED) '/^socket/c\socket = /run/fail2ban.sock' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
@@ -34,8 +32,7 @@ FAIL2BAN_POST_INSTALL_TARGET_HOOKS += FAIL2BAN_FIX_DEFAULT_CONFIG
 
 # fail2ban-python points to host python
 define FAIL2BAN_FIX_FAIL2BAN_PYTHON_SYMLINK
-	ln -snf $(if $(BR2_PACKAGE_PYTHON),python,python3) \
-		$(TARGET_DIR)/usr/bin/fail2ban-python
+	ln -snf python3	$(TARGET_DIR)/usr/bin/fail2ban-python
 endef
 FAIL2BAN_POST_INSTALL_TARGET_HOOKS += FAIL2BAN_FIX_FAIL2BAN_PYTHON_SYMLINK
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
