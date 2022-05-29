Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845EEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 411F2849ED;
	Sun, 29 May 2022 08:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2EsuJd8UQ7u; Sun, 29 May 2022 08:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43A5C84B15;
	Sun, 29 May 2022 08:55:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 041B41BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F276419C4
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMOzG7mreNaj for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:54:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A816141A02
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:54:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2DF9A86316; Sun, 29 May 2022 08:43:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 10:47:50 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 49e573fc67c9065b9b71b4c4545a6a0e6aacc1de
X-Git-Newrev: 238be7ae978c706ff8d9c189443ca032d4cfc95a
X-Patchwork-Hint: ignore
Message-Id: <20220529084303.2DF9A86316@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/alchemy: add
 host-pkgconf dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=238be7ae978c706ff8d9c189443ca032d4cfc95a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

host-pkgconf is a mandatory dependency since the addition of the package
in commit 7f1f3f87868fa333833dbba9f4f07adc338b34ed resulting in the
following ulog build failure:

/home/buildroot/autobuild/run/instance-0/output-1/per-package/ulog/host/opt/alchemy/check.mk:36: *** 'pkg-config' is required.  Stop.

An other option would be to set TARGET_OS to baremetal but it could have
unexpected side-effects such as removing -fPIC for arm targets

Fixes:
 - http://autobuild.buildroot.org/results/c731fe0e9bdbfce0823f9c48641f1ed710fa6125

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 837e3128687a1c892ff796b80b26edc4b1186d73)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alchemy/alchemy.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/alchemy/alchemy.mk b/package/alchemy/alchemy.mk
index 18cdd0a645..10d1068ac4 100644
--- a/package/alchemy/alchemy.mk
+++ b/package/alchemy/alchemy.mk
@@ -8,7 +8,7 @@ ALCHEMY_VERSION = d95b3c38cd37814a1b98d0bbf813de7adaaecfbc
 ALCHEMY_SITE = $(call github,Parrot-Developers,alchemy,$(ALCHEMY_VERSION))
 ALCHEMY_LICENSE = BSD-3-Clause (Alchemy), GPL-2.0 (kconfig)
 ALCHEMY_LICENSE_FILES = COPYING README
-HOST_ALCHEMY_DEPENDENCIES = host-python3
+HOST_ALCHEMY_DEPENDENCIES = host-pkgconf host-python3
 
 ALCHEMY_HOME = $(HOST_DIR)/opt/alchemy
 ALCHEMY_SDK_BASEDIR = $(STAGING_DIR)/usr/lib/alchemy/sdk
@@ -35,6 +35,7 @@ ALCHEMY_TARGET_ENV = \
 	ALCHEMY_HOME=$(ALCHEMY_HOME) \
 	ALCHEMY_WORKSPACE_DIR="$(@D)" \
 	ALCHEMY_TARGET_OUT=alchemy-out \
+	PKGCONFIG_BIN=$(PKG_CONFIG_HOST_BINARY) \
 	TARGET_OS=linux \
 	TARGET_OS_FLAVOUR=buildroot \
 	TARGET_CROSS="$(TARGET_CROSS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
