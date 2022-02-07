Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77054C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 07:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33E7D81699;
	Mon,  7 Feb 2022 07:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6Ix8mGN1Vcq; Mon,  7 Feb 2022 07:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A1D78151E;
	Mon,  7 Feb 2022 07:37:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E89781BF309
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3C64400E5
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hOVr5e2Pddj8 for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 07:37:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD308400D8
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 07:37:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B5FD482D5B; Mon,  7 Feb 2022 07:30:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 08:37:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c33cecfac4d48346611b56e6f1a553a1fe86d704
X-Git-Newrev: 72308ab9a32de6e8b4b23e42f115ed5ee87e5f33
X-Patchwork-Hint: ignore
Message-Id: <20220207073030.B5FD482D5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: d-bus support is optional
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
Content-Type: multipart/mixed; boundary="===============5259707000026335728=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5259707000026335728==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=72308ab9a32de6e8b4b23e42f115ed5ee87e5f33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out by Jan Lübbe, D-Bus support is optional:

> You can build without D-Bus (./configure --disable-service).

So drop it from the required dependencies and add a RAUC_DBUS sub option
like it is done for network/json.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/Config.in | 8 +++++++-
 package/rauc/rauc.mk   | 9 ++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 676ff42b51..b4f7b81948 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_RAUC
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SQUASHFS # run-time dependency
 	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # run-time dependency
 	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT
@@ -19,6 +18,13 @@ config BR2_PACKAGE_RAUC
 
 if BR2_PACKAGE_RAUC
 
+config BR2_PACKAGE_RAUC_DBUS
+	bool "dbus support"
+	select BR2_PACKAGE_DBUS
+	help
+	  This option enables support for controlling rauc through
+	  D-Bus.
+
 config BR2_PACKAGE_RAUC_NETWORK
 	bool "network support"
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 4fb3ddde3e..99efc16c2f 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -10,7 +10,14 @@ RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
 RAUC_LICENSE_FILES = COPYING
 RAUC_CPE_ID_VENDOR = pengutronix
-RAUC_DEPENDENCIES = host-pkgconf openssl libglib2 dbus
+RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
+
+ifeq ($(BR2_PACKAGE_RAUC_DBUS),y)
+RAUC_CONF_OPTS += --enable-service
+RAUC_DEPENDENCIES += dbus
+else
+RAUC_CONF_OPTS += --disable-service
+endif
 
 ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
 RAUC_CONF_OPTS += --enable-network

--===============5259707000026335728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5259707000026335728==--
