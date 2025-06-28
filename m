Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A59C54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 20:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBE3541201;
	Sat, 28 Jun 2025 20:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmIUtt5TI9gJ; Sat, 28 Jun 2025 20:29:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E2A40E1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79E2A40E1F;
	Sat, 28 Jun 2025 20:29:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1431D154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0689260803
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJfk7KiddT-4 for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 20:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 541F8607DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 541F8607DB
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3113384893; Sat, 28 Jun 2025 20:29:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 17:29:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7ca2197c49822087fab36e3eb6af4182082d9f3
X-Git-Newrev: 1d3ec1fc7f5c761ac76e39ba3323da37f605b445
X-Patchwork-Hint: ignore
Message-Id: <20250628202921.3113384893@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: allow non-root
 user/group to own IKE charon daemon
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d3ec1fc7f5c761ac76e39ba3323da37f605b445
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Strongswan allows[1] to run the IKE charon daemon as non-root (defaults
to running as root) user/group, so let's allow that.

[1] https://docs.strongswan.org/docs/latest/install/reducedPrivileges.html#_running_strongswan_as_non_root
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/strongswan/Config.in     |  5 +++++
 package/strongswan/strongswan.mk | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index feaf714213..047b460be8 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -204,6 +204,11 @@ config BR2_PACKAGE_STRONGSWAN_SQL
 config BR2_PACKAGE_STRONGSWAN_BYPASS_LAN
 	bool "Enable BYPASS-LAN plugin"
 
+config BR2_PACKAGE_STRONGSWAN_NONROOT
+	bool "Run as non-root"
+	help
+	  This allows running the IKE charon daemon as the non-root
+	  user/group charon/charon.
 endif
 
 config BR2_PACKAGE_STRONGSWAN_PKI
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 072d8681d4..0ee26df43d 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -66,6 +66,16 @@ ifeq ($(BR2_PACKAGE_STRONGSWAN_DROP_CAPS),y)
 STRONGSWAN_CONF_OPTS += --with-capabilities=libcap
 endif
 
+ifeq ($(BR2_PACKAGE_STRONGSWAN_NONROOT),y)
+STRONGSWAN_CONF_OPTS += \
+	--with-user=charon \
+	--with-group=charon
+
+define STRONGSWAN_USERS
+	charon -1 charon -1 * - - -
+endef
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
