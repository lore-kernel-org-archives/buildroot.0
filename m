Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DDEC3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9884C419BD;
	Fri, 12 Jul 2024 14:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AQJJvcbm6ih; Fri, 12 Jul 2024 14:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E68C419A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E68C419A4;
	Fri, 12 Jul 2024 14:13:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42A411BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E276845FD
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaEdv-vBmd30 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 610B0845FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 610B0845FB
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D5ED80E2B; Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:08:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47976f67fb34fe727543380ea6aa13617cf18aa1
X-Git-Newrev: a341e4fe3e65c86c3402de239f3ea3b098520b2b
X-Patchwork-Hint: ignore
Message-Id: <20240712141303.5D5ED80E2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fail2ban: bump version to 1.1.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a341e4fe3e65c86c3402de239f3ea3b098520b2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fail2ban 1.1.0 brings Python 3.12 compatibility, and removes support
for 2.x. This means 2to3 handling can be dropped.

Unfortunately fail2ban 1.1.0 still relies on asynchat and asyncore,
which have been removed from the Python standard library in
3.12. Depend on the compatibility package python-pyasynchat (which
pulls in python-pyasyncore) and remove copies bundled in upstream
code.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/fail2ban/Config.in     |  1 +
 package/fail2ban/fail2ban.hash |  2 +-
 package/fail2ban/fail2ban.mk   | 14 +++++++-------
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
index 8a48a8c1d0..4c2c56440d 100644
--- a/package/fail2ban/Config.in
+++ b/package/fail2ban/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FAIL2BAN
 	bool "fail2ban"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYASYNCHAT # runtime
 	select BR2_PACKAGE_PYTHON_SYSTEMD if BR2_PACKAGE_SYSTEMD
 	help
 	  Fail2ban scans log files (e.g. /var/log/apache/error_log) and
diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
index b40922e70a..8627e01f05 100644
--- a/package/fail2ban/fail2ban.hash
+++ b/package/fail2ban/fail2ban.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  ae8b0b41f27a7be12d40488789d6c258029b23a01168e3c0d347ee80b325ac23  fail2ban-1.0.2.tar.gz
+sha256  474fcc25afdaf929c74329d1e4d24420caabeea1ef2e041a267ce19269570bae  fail2ban-1.1.0.tar.gz
 sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 0c1208c6fe..a77e5fad6c 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAIL2BAN_VERSION = 1.0.2
+FAIL2BAN_VERSION = 1.1.0
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
@@ -12,13 +12,13 @@ FAIL2BAN_CPE_ID_VENDOR = fail2ban
 FAIL2BAN_SELINUX_MODULES = fail2ban
 FAIL2BAN_SETUP_TYPE = setuptools
 
-define FAIL2BAN_PYTHON_2TO3
-	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
+# fail2ban contains bundled copies of pyasyncore and pyasynchat,
+# remove them so only the packaged versions are installed.
+define FAIL2BAN_REMOVE_BUNDLED_COMPAT
+	$(SED) '/fail2ban\.compat/d' $(@D)/setup.py
+	rm -rf $(@D)/fail2ban/compat
 endef
-FAIL2BAN_DEPENDENCIES = host-python3
-# We can't use _POST_PATCH_HOOKS because dependencies are not guaranteed
-# to build and install before _POST_PATCH_HOOKS run.
-FAIL2BAN_PRE_CONFIGURE_HOOKS += FAIL2BAN_PYTHON_2TO3
+FAIL2BAN_POST_PATCH_HOOKS += FAIL2BAN_REMOVE_BUNDLED_COMPAT
 
 define FAIL2BAN_FIX_DEFAULT_CONFIG
 	$(SED) '/^socket/c\socket = /run/fail2ban.sock' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
