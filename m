Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5E5C54E60
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A67D5410DC;
	Sat, 16 Mar 2024 22:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aFX7lrm-N3Lp; Sat, 16 Mar 2024 22:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DAA410E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55DAA410E0;
	Sat, 16 Mar 2024 22:01:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CFCF1BF85D
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26CF8607C5
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWyVn-5nAUjp for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F78A60681
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F78A60681
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:00:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AA7D883CE; Sat, 16 Mar 2024 22:00:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 22:07:07 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: a8c61e14ab5e93dc3b38b9cda65701cc1119611c
X-Git-Newrev: 3bdf1310e5566ac6fa3d5a0434370e30c18b376a
X-Patchwork-Hint: ignore
Message-Id: <20240316220050.2AA7D883CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/botan: disable
 neon with arm soft float
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

commit: https://git.buildroot.net/buildroot/commit/?id=3bdf1310e5566ac6fa3d5a0434370e30c18b376a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Disable neon with soft float to fix the following build failure raised
at least since version 2.19.1:

In file included from build/include/botan/internal/simd_32.h:27,
                 from src/lib/block/aes/aes_vperm/aes_vperm.cpp:15:
/home/thomas/autobuild/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/6b311e97484db2b0f8adbda140320d696713b1e0
 - http://autobuild.buildroot.org/results/c309940ea6db0845d8221fb51611d0254222c644

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 48c5053576334d9349180349e58240ea02753188)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/botan.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 52019f36eb..6cc211912c 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -90,6 +90,10 @@ ifeq ($(BR2_ARM_CPU_HAS_NEON),)
 BOTAN_CONF_OPTS += --disable-neon
 endif
 
+ifeq ($(BR2_SOFT_FLOAT),y)
+BOTAN_CONF_OPTS += --disable-neon
+endif
+
 define BOTAN_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure.py $(BOTAN_CONF_OPTS))
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
