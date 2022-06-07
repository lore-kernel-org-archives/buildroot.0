Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE21CCA481
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 20:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DDC460D76;
	Tue,  7 Jun 2022 20:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60GnIHyN4d37; Tue,  7 Jun 2022 20:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A30B560E5D;
	Tue,  7 Jun 2022 20:36:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C717F1BF9B4
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B662F40332
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVeTT-HIegJk for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 20:36:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92F3640123
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 20:36:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 440B6240007;
 Tue,  7 Jun 2022 20:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654634166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IyRcw2DWR6EK7FJXsKViuaSmSBOaeS6AfHNk7L51KNk=;
 b=MH7HGsXJTfyByjZKD1A1nVJc1zZSsWO1YUD/zcngi04exs6KfOSehrJiCiVtGQ96qaWdEZ
 uMYDyAqWo1rYMEQQHz2uJo38aH/QMBn+YCO3OrJWPpsarz4Gajqix2O4VMtI+LSkMxIIcO
 SZBdxDFCYMC/zNWVjV0wSAEjrwwsr2X+oRq1RzglCWMDMffdkaHix4ADU2FAGHZD4bhIb4
 er5YnyPTsSR7BkqQBMGNIqRstu10C34PPC/dIzxPdjX0oJMrjZ4mJ3V2O79BB9l63vjUu0
 Za8jKHxgN8MDdqhqv9w0Gjg7Jk9LQX3WOE5IV0YaXeM1ySCi1+FvLIuiTBXCYg==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Tue,  7 Jun 2022 22:35:42 +0200
Message-Id: <20220607203553.3307479-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
References: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/11] support/scripts/gen-bootlin-toolchains:
 fix RISC-V 64-bit toolchain description
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We now support both MMU-enabled and MMU-less RISC-V 64-bit
configurations. However, the Bootlin toolchain for RISC-V 64-bit only
supports MMU-enabled configurations, but the current logic in
toolchain/toolchain-external/toolchain-external-bootlin/ does not take
this into account, and allows selecting the Booltin toolchain for
MMU-less RISC-V 64-bit configurations.

To fix this, the gen-bootlin-toolchains script is modified to add the
BR2_USE_MMU dependency to the description of the RISC-V 64-bit
toolchain.

However, the BR2_USE_MMU dependency was also added for glibc and musl
toolchains unconditionally, so to avoid duplicating the dependency, we
now only add it only if not already present in the list of
dependencies for this toolchain.

This will allow to fix:

  http://autobuild.buildroot.net/results/d6aee9b275b1ec399aea59758ac8f69fdc5691fc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 97a744340a..16773cd9cb 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -159,7 +159,7 @@ arches = {
         'prefix': 'riscv32',
     },
     'riscv64-lp64d': {
-        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_64', 'BR2_RISCV_ABI_LP64D'],
+        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_64', 'BR2_RISCV_ABI_LP64D', 'BR2_USE_MMU'],
         'prefix': 'riscv64',
     },
     's390x-z13': {
@@ -312,13 +312,15 @@ class Toolchain:
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_UCLIBC")
             elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC"):
                 # glibc needs mmu support
-                depends.append("BR2_USE_MMU")
+                if "BR2_USE_MMU" not in depends:
+                    depends.append("BR2_USE_MMU")
                 # glibc doesn't support static only configuration
                 depends.append("!BR2_STATIC_LIBS")
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_GLIBC")
             elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL"):
                 # musl needs mmu support
-                depends.append("BR2_USE_MMU")
+                if "BR2_USE_MMU" not in depends:
+                    depends.append("BR2_USE_MMU")
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_MUSL")
 
             # gcc version
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
