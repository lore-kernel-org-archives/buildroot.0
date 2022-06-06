Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB9AC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E579740408;
	Mon,  6 Jun 2022 13:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SX7h-LG5a-Fd; Mon,  6 Jun 2022 13:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED983400FD;
	Mon,  6 Jun 2022 13:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EF261BF2BC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BAD060BBC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZAfvVHJbBPS for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:16:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D0A960EFA
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:16:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 49B3386DAC; Mon,  6 Jun 2022 13:04:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 15:15:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0b02883148025ea3e62535f237b246818155a99
X-Git-Newrev: fc63ec92928909d34c121817f0aa24d77412667e
X-Patchwork-Hint: ignore
Message-Id: <20220606130446.49B3386DAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 properly take into account !BR2_STATIC_LIBS for glibc toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc63ec92928909d34c121817f0aa24d77412667e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 support/scripts/gen-bootlin-toolchains | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index f9dd9da9a8..97a744340a 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -482,7 +482,10 @@ def gen_config_in_options(toolchains, fpath):
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
