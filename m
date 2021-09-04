Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045BBC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:19:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBBE560F3A
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBBE560F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9825440765;
	Sat,  4 Sep 2021 20:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-YHKrGzV636; Sat,  4 Sep 2021 20:19:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7044036F;
	Sat,  4 Sep 2021 20:19:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07FA41BF95F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 042834014E
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ox8_jkjT3DYO for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:17:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A61B4013C
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:17:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A9CD88842F; Sat,  4 Sep 2021 20:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 21:50:58 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 32fead8f2848c72ba2e685799041f05a85233193
X-Git-Newrev: 8ec21bd179b66cc3ca97c432be593f783607b8bc
X-Patchwork-Hint: ignore
Message-Id: <20210904201606.A9CD88842F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/qt5/qt5base: fix
 libatomic handling to not affect host builds
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ec21bd179b66cc3ca97c432be593f783607b8bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

qt5declarative builds qmltyperegistrar for the host as part of its build
process.
When building qt target packages (which is the case for qt5declarative),
-spec devices/linux-buildroot-g++ is passed to qmake in QT5_QMAKE
variable and this spec currently has -latomic in its LIBS.

This -latomic makes it to the build of the host build of
qmltyperegistrar which is not useful.

This was discovered on Fedora 34 where libatomic is not pulled with gcc
package, therefore was missing on the host machine.

This makes sure that -latomic is not added for host build of qt
packages.

Fixes: 7d286be4f9 ("package/qt5base: link with -latomic when needed")

Cc: Quentin Schulz <foss@0leil.net>
Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2d991fd7b23f66e3a88c02177bf28d5587061ac8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 84e9fa4edb..7897e4294a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -277,7 +277,7 @@ QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 # Qt 5.8 needs atomics, which on various architectures are in -latomic
 define QT5BASE_CONFIGURE_ARCH_CONFIG
-	printf 'LIBS += -latomic\n' >$(QT5BASE_ARCH_CONFIG_FILE)
+	printf '!host_build { \n LIBS += -latomic\n }' >$(QT5BASE_ARCH_CONFIG_FILE)
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
