Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BB0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74D8D8176C;
	Sun, 20 Mar 2022 21:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YeLrKlXk1q-k; Sun, 20 Mar 2022 21:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92C108175A;
	Sun, 20 Mar 2022 21:42:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C80581BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B66FB60B15
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYceLHY9foMu for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 154B460585
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E07E2846A8; Sun, 20 Mar 2022 21:33:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:41:07 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f63050ec64a87da67c0d20c2b800a6b6f5bdcdc0
X-Git-Newrev: dcfccfddf169c6382ef162066a769dc8b28428d7
X-Patchwork-Hint: ignore
Message-Id: <20220320213324.E07E2846A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zynaddsubfx: fix
 atomic linking
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcfccfddf169c6382ef162066a769dc8b28428d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised since the addition of the package
in commit 18a863063735e2c658fa6947a4e540e9dda6c431:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.3.0/../../../../riscv64-buildroot-linux-musl/bin/ld: libzynaddsubfx_core.a(Master.cpp.o): in function `.L1880':
Master.cpp:(.text+0x7cc0): undefined reference to `__atomic_exchange_1'

Fixes:
 - http://autobuild.buildroot.org/results/91b5959ca0eb136c1609462e71d109ff09cca5e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ba7319a06e1b98524fde1384dc570a7f34870881)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zynaddsubfx/zynaddsubfx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index b2eb1921fa..db0459ce62 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -14,7 +14,7 @@ ZYNADDSUBFX_LICENSE_FILES = COPYING
 ZYNADDSUBFX_CONF_OPTS = -DCompileTests=OFF -DPluginEnable=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-ZYNADDSUBFX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+ZYNADDSUBFX_CONF_OPTS += -DOS_LIBRARIES=-latomic
 endif
 
 ZYNADDSUBFX_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
