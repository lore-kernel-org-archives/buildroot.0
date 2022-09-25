Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB95FC6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 08:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09AAA41744;
	Sun, 25 Sep 2022 08:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09AAA41744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1ghFhe79ETa; Sun, 25 Sep 2022 08:20:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF11F4174D;
	Sun, 25 Sep 2022 08:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF11F4174D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 519721BF4DD
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39C5C402BC
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C5C402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEA65npIgQMN for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 08:20:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67BBE40191
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67BBE40191
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5702885FCF; Sun, 25 Sep 2022 08:20:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 10:19:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec5589611ad79664bc5bf238cc786a65458f3c93
X-Git-Newrev: 1facb09b94bf806b301868539185c0ff9ddffee2
X-Patchwork-Hint: ignore
Message-Id: <20220925082044.5702885FCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: build host-nodejs only if
 we're installing modules with NPM
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

commit: https://git.buildroot.net/buildroot/commit/?id=1facb09b94bf806b301868539185c0ff9ddffee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building host-nodejs is no longer needed to build the target nodejs,
unless npm is needed during the build, which happens when
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL is used.

We need to make that host-python3 is built with bz2 and ssl
support. Until now, it was done by the BR2_PACKAGE_HOST_NODEJS option,
but now that the target nodejs no longer depends on host-nodejs, we
are no longer guaranteed to have a host-python3 with bz2/ssl. To make
sure it is the case, we select the relevant options from
BR2_PACKAGE_NODEJS.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/Config.in | 5 ++++-
 package/nodejs/nodejs.mk | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 016aeb4e1a..8d0bd8fd60 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -27,7 +27,10 @@ config BR2_PACKAGE_NODEJS
 	# uses dlopen(). On ARMv5, we could technically support static
 	# linking, but that's too much of a corner case to support it.
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_HOST_NODEJS
+	select BR2_PACKAGE_HOST_NODEJS if BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL != ""
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_ZLIB
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 92a9493e25..e9fe96812f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -8,7 +8,6 @@ NODEJS_VERSION = 16.16.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
-	host-nodejs \
 	host-ninja \
 	host-pkgconf \
 	host-python3 \
@@ -240,6 +239,7 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
 # We can only call NPM if there's something to install.
 #
 ifneq ($(NODEJS_MODULES_LIST),)
+NODEJS_DEPENDENCIES += host-nodejs
 define NODEJS_INSTALL_MODULES
 	# If you're having trouble with module installation, adding -d to the
 	# npm install call below and setting npm_config_rollback=false can both
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
