Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E86AC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 15:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E405381AF6;
	Sun, 21 Aug 2022 15:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E405381AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4VX_UcVUMqY; Sun, 21 Aug 2022 15:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 088288144A;
	Sun, 21 Aug 2022 15:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 088288144A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 950741BF5AD
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 708B081AD1
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 708B081AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRDbq6VmCO_8 for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 15:29:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AABF781421
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 15:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AABF781421
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7353187A42; Sun, 21 Aug 2022 15:14:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 17:27:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 638b1422c6bb99f99ee043b79edfd01cdfdf6c2b
X-Git-Newrev: 0b7e7bc70b3b7f3125aa0ef780f4fbf61cd6cd4b
X-Patchwork-Hint: ignore
Message-Id: <20220821151427.7353187A42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/network-manager: add
 optional nmcli support
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b7e7bc70b3b7f3125aa0ef780f4fbf61cd6cd4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The network-manager package builds the nmcli utility when the readline
package is enabled. However, this is not necessarily obvious to the
user. Therefore, this commit adds an explicit option to enable the nmcli
tool, which automatically selects readline.

Signed-off-by: Michael Fischer <mf@go-sys.de>
[yann.morin.1998@free.fr: rewrap commit log and help text]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/network-manager/Config.in          | 8 +++++++-
 package/network-manager/network-manager.mk | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 39114daf18..1a11fc4270 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -33,6 +33,13 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
 	help
 	  This option enables terminal based UI
 
+config BR2_PACKAGE_NETWORK_MANAGER_CLI
+	bool "nmcli support"
+	select BR2_PACKAGE_READLINE
+	help
+	  This option enables support for the NetworkManager Command
+	  Line Interface
+
 config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 	bool "modem-manager support"
 	select BR2_PACKAGE_MODEM_MANAGER
@@ -50,7 +57,6 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	select BR2_PACKAGE_JANSSON
 	help
 	  This option enables support for OpenVSwitch
-
 endif
 
 comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 3c39ce7d6d..92997d1cb6 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -142,7 +142,7 @@ else
 NETWORK_MANAGER_CONF_OPTS += --disable-polkit
 endif
 
-ifeq ($(BR2_PACKAGE_READLINE),y)
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CLI),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
 NETWORK_MANAGER_CONF_OPTS += --with-nmcli
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
