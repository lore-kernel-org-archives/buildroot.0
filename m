Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B307FC7EE39
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 20:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62839607DB;
	Sat, 28 Jun 2025 20:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9KlLsfhLgDH; Sat, 28 Jun 2025 20:29:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87E5D60803
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E5D60803;
	Sat, 28 Jun 2025 20:29:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1400A154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05F7140352
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KcVczgm--Cd for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 20:29:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F8854035F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F8854035F
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E7CA84897; Sat, 28 Jun 2025 20:29:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 22:27:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d3ec1fc7f5c761ac76e39ba3323da37f605b445
X-Git-Newrev: d96ddedb4cdab3d50e25048f800416d546700049
X-Patchwork-Hint: ignore
Message-Id: <20250628202921.3E7CA84897@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: add option to specify
 paths to PID and UNIX socket files
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

commit: https://git.buildroot.net/buildroot/commit/?id=d96ddedb4cdab3d50e25048f800416d546700049
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Strongswan allows to specify a path for PID and UNIX socket files at
compile time via the --with-piddir argument.

This is especially useful when Strongswan is running inside a container
where we may not want to share/mount the default path of /var/run inside
the container.

Let's add an option to configure the piddir.

Considering this is a critical path, let's add a default value to the
string option (which is currently the same as strongswan's default when
the option is missing) so that it is stable across strongswan releases
in Buildroot.

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
[Quentin: rewriting of commit title and commit log]
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/strongswan/Config.in     | 10 ++++++++++
 package/strongswan/strongswan.mk |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 047b460be8..10efcc1616 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -63,6 +63,16 @@ config BR2_PACKAGE_STRONGSWAN_WOLFSSL
 
 endchoice
 
+config BR2_PACKAGE_STRONGSWAN_PIDDIR
+	string "piddir"
+	default "/var/run"
+	help
+	  Path for PID and UNIX socket files used by strongswan.
+
+	  Use the empty string to not pass --with-piddir to strongswan
+	  configure, this then defaults to strongswan's source default
+	  which may not be stable across releases.
+
 config BR2_PACKAGE_STRONGSWAN_AF_ALG
 	bool "Enable AF_ALG crypto interface to Linux Crypto API"
 
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 0ee26df43d..9719242327 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -66,6 +66,9 @@ ifeq ($(BR2_PACKAGE_STRONGSWAN_DROP_CAPS),y)
 STRONGSWAN_CONF_OPTS += --with-capabilities=libcap
 endif
 
+# setup piddir if BR2_PACKAGE_STRONGSWAN_PIDDIR is not empty
+STRONGSWAN_CONF_OPTS += $(if $(call qstrip,$(BR2_PACKAGE_STRONGSWAN_PIDDIR)),--with-piddir=$(BR2_PACKAGE_STRONGSWAN_PIDDIR))
+
 ifeq ($(BR2_PACKAGE_STRONGSWAN_NONROOT),y)
 STRONGSWAN_CONF_OPTS += \
 	--with-user=charon \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
