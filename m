Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03606C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A129F83337;
	Mon, 11 Jul 2022 17:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A129F83337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBAE_BVEZdEf; Mon, 11 Jul 2022 17:31:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 410EF8332A;
	Mon, 11 Jul 2022 17:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 410EF8332A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9E4D1BF983
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84E8B60F56
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84E8B60F56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QnDC1M5LFltF for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB6E660F31
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB6E660F31
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F0040837E8; Mon, 11 Jul 2022 17:15:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:09:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 197fa0f944b2d59b5d22485065cc9ca110d88f96
X-Git-Newrev: ec13f64b46060d6fe712a93adfefb032c2ec09fe
X-Patchwork-Hint: ignore
Message-Id: <20220711171516.F0040837E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/scripts/gen-bootlin-toolchains: properly take into account
 !BR2_STATIC_LIBS for glibc toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec13f64b46060d6fe712a93adfefb032c2ec09fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The Config.in options created for each toolchain were properly taking
into account the !BR2_STATIC_LIBS dependency of glibc
toolchains. However, this dependency was not taken into account into
the main BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
option. Consequently, if an architecture is only supported by glibc,
but BR2_STATIC_LIBS is enabled, the main "Bootlin toolchain" option
was visible... but with no selectable toolchain.

We fix this by making sure that
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS is only true for all
architectures supported, taking into account the fact that some
architectures can only be supported if !BR2_STATIC_LIBS, when the only
available C library is glibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fc63ec92928909d34c121817f0aa24d77412667e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/gen-bootlin-toolchains | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index dc173fa949..404f14831e 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -478,7 +478,10 @@ def gen_config_in_options(toolchains, fpath):
         f.write("config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS\n")
         f.write("\tbool\n")
         for arch, details in arches.items():
-            f.write("\tdefault y if %s\n" % " && ".join(details['conditions']))
+            conditions = details['conditions'].copy()
+            if set([t.libc for t in toolchains if t.arch == arch]) == set(['glibc']):
+                conditions.append("!BR2_STATIC_LIBS")
+            f.write("\tdefault y if %s\n" % " && ".join(conditions))
         f.write("\n")
 
         f.write("if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN\n\n")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
