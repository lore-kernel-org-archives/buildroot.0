Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD00C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBDB560B20;
	Tue, 17 May 2022 20:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8DVDvmZXny6o; Tue, 17 May 2022 20:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE51A60BAC;
	Tue, 17 May 2022 20:44:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD0F1BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DD4084054
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bWRBytVdOeJc for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:44:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F54384049
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:44:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 59DCD85F8A; Tue, 17 May 2022 20:33:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 22:44:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 001e0aab23c832579b6a5c046db8f5b0716cea61
X-Git-Newrev: 837e3128687a1c892ff796b80b26edc4b1186d73
X-Patchwork-Hint: ignore
Message-Id: <20220517203344.59DCD85F8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alchemy: add host-pkgconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=837e3128687a1c892ff796b80b26edc4b1186d73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
