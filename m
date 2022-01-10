Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEB6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A591F8272A;
	Mon, 10 Jan 2022 07:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmP7oUgr5R-p; Mon, 10 Jan 2022 07:19:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0696E824E2;
	Mon, 10 Jan 2022 07:19:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86AB71BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8384E605A2
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v8y7ljEIdzJr for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:19:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 090A060ABB
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:19:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C1D1E82ACC; Mon, 10 Jan 2022 07:13:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 08:17:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4043bc0c9c55e1bcac58677c361cd1b8724716b8
X-Git-Newrev: 89ecfb3c789b57552373eb323e6b2ac9001295a3
X-Patchwork-Hint: ignore
Message-Id: <20220110071316.C1D1E82ACC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hiawatha: disable ASM if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=89ecfb3c789b57552373eb323e6b2ac9001295a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable ASM as already done in mbedtls package to avoid the following
build failure raised since commit
4e36e8f2081a66f477dd038793082045876d65ee:

In file included from /home/buildroot/autobuild/instance-2/output-1/build/hiawatha-11.1/mbedtls/library/bignum.c:41:
/home/buildroot/autobuild/instance-2/output-1/build/hiawatha-11.1/mbedtls/library/bignum.c: In function 'mpi_mul_hlp':
/home/buildroot/autobuild/instance-2/output-1/build/hiawatha-11.1/mbedtls/library/bn_mul.h:86:13: error: the register 'hi' cannot be clobbered in 'asm' for the current target
   86 | #define asm __asm
      |             ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5436b44777c5d417ae427b99602f516fd8f9489d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/hiawatha/hiawatha.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index ed9f8aba54..14d3c9f1ee 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -22,6 +22,24 @@ HIAWATHA_CONF_OPTS = \
 	-DWEBROOT_DIR=/var/www/hiawatha \
 	-DWORK_DIR=/var/lib/hiawatha
 
+define HIAWATHA_MBEDTLS_DISABLE_ASM
+	$(SED) '/^#define MBEDTLS_AESNI_C/d' \
+		$(@D)/mbedtls/include/mbedtls/mbedtls_config.h
+	$(SED) '/^#define MBEDTLS_HAVE_ASM/d' \
+		$(@D)/mbedtls/include/mbedtls/mbedtls_config.h
+	$(SED) '/^#define MBEDTLS_PADLOCK_C/d' \
+		$(@D)/mbedtls/include/mbedtls/mbedtls_config.h
+endef
+
+# ARM in thumb mode breaks debugging with asm optimizations
+# Microblaze asm optimizations are broken in general
+# MIPS R6 asm is not yet supported
+ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
+HIAWATHA_POST_CONFIGURE_HOOKS += HIAWATHA_MBEDTLS_DISABLE_ASM
+else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+HIAWATHA_POST_CONFIGURE_HOOKS += HIAWATHA_MBEDTLS_DISABLE_ASM
+endif
+
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
 HIAWATHA_CONF_OPTS += -DENABLE_TLS=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
