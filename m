Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F59AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC9E640185;
	Sat,  8 Jan 2022 22:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8PW55BOPTIt; Sat,  8 Jan 2022 22:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C220440220;
	Sat,  8 Jan 2022 22:36:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 708FE1BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AFE98148D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j9LbuE1dcv8J for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F0F481465
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 72A05832C8; Sat,  8 Jan 2022 22:29:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:35:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 342fd3e7350479dc368541ac77a5130ebb53194c
X-Git-Newrev: 049ca10248a4c5a808e7d96acd8711563916d318
X-Patchwork-Hint: ignore
Message-Id: <20220108222949.72A05832C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sentry-cli: re-add package
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

commit: https://git.buildroot.net/buildroot/commit/?id=049ca10248a4c5a808e7d96acd8711563916d318
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit d19077677fc71fc8c8cd73945606f773d907a99a, but the
package now uses the cargo-package infrastructure with its vendoring
mechanism, which allows us to avoid the problems that caused the
package to be removed in d19077677fc71fc8c8cd73945606f773d907a99a.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in.host             |  1 +
 package/sentry-cli/Config.in.host  | 10 ++++++++++
 package/sentry-cli/sentry-cli.hash |  3 +++
 package/sentry-cli/sentry-cli.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b80d886809..df7d988279 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1522,6 +1522,7 @@ F:	package/python-schedule/
 F:	package/python-sentry-sdk/
 F:	package/python-websockets/
 F:	package/python-xlib/
+F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 7400da5894..b3e00bb482 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -81,6 +81,7 @@ menu "Host utilities"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
+	source "package/sentry-cli/Config.in.host"
 	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/sentry-cli/Config.in.host b/package/sentry-cli/Config.in.host
new file mode 100644
index 0000000000..3124015367
--- /dev/null
+++ b/package/sentry-cli/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_SENTRY_CLI
+	bool "host sentry-cli"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Official Sentry command line interface
+
+	  For managing debug information files and source maps.
+
+	  https://docs.sentry.io/cli/
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
new file mode 100644
index 0000000000..73f818125f
--- /dev/null
+++ b/package/sentry-cli/sentry-cli.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  d687336379fd96c4ee73f24bd062d31672bd7453af53311b72977be3c8c78fef  sentry-cli-1.59.0.tar.gz
+sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
new file mode 100644
index 0000000000..58f5f1e325
--- /dev/null
+++ b/package/sentry-cli/sentry-cli.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# sentry-cli
+#
+################################################################################
+
+SENTRY_CLI_VERSION = 1.59.0
+SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
+SENTRY_CLI_LICENSE = BSD-3-clause
+SENTRY_CLI_LICENSE_FILES = LICENSE
+
+HOST_SENTRY_CLI_DEPENDENCIES = host-zlib
+
+$(eval $(host-cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
