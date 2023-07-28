Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46442C001DF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFD6284559;
	Fri, 28 Jul 2023 19:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFD6284559
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6NC792HIUWr; Fri, 28 Jul 2023 19:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 322D18454E;
	Fri, 28 Jul 2023 19:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 322D18454E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46CC51BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BE7040168
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BE7040168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5v5o5tgQFEOu for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:22:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19D8F401E1
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19D8F401E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0846683832; Fri, 28 Jul 2023 19:22:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:22:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e930965f546fde46b17131cf40394e7e8d5a9440
X-Git-Newrev: 0ba58baca6f7077cd163ebccab9b37cd65c74e53
X-Patchwork-Hint: ignore
Message-Id: <20230728192224.0846683832@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: fix libatomic
 dependency for x86 builds
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0ba58baca6f7077cd163ebccab9b37cd65c74e53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
autobuild.buildroot.net/results/ba9/ba926fc27cf3d97274729b3ec1cadb3229bd3af3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0006-Add-linux-x86-latomic-target.patch        | 30 ++++++++++++++++++++++
 package/libopenssl/Config.in                       |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/package/libopenssl/0006-Add-linux-x86-latomic-target.patch b/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
new file mode 100644
index 0000000000..f47eb1d268
--- /dev/null
+++ b/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
@@ -0,0 +1,30 @@
+From c80a60dca209813c33ab3d2794bc32d84c12d033 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 28 Jul 2023 17:11:25 +0200
+Subject: [PATCH 1/1] Add linux-x86-latomic target
+
+Upstream: https://github.com/openssl/openssl/pull/21590
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Configurations/10-main.conf | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Configurations/10-main.conf b/Configurations/10-main.conf
+index 2200a85b16..bcf54a2a53 100644
+--- a/Configurations/10-main.conf
++++ b/Configurations/10-main.conf
+@@ -861,6 +861,10 @@ my %targets = (
+         asm_arch         => 'x86',
+         perlasm_scheme   => "elf",
+     },
++    "linux-x86-latomic" => {
++        inherit_from     => [ "linux-x86" ],
++        ex_libs          => add(threads("-latomic")),
++    },
+     "linux-x86-clang" => {
+         inherit_from     => [ "linux-x86" ],
+         CC               => "clang",
+-- 
+2.39.2
+
diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index fdfa135f52..3199de8cfe 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -20,7 +20,8 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	default "linux-ppc"			if BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
 	default "linux-ppc64"			if BR2_powerpc64
 	default "linux-ppc64le"			if BR2_powerpc64le
-	default "linux-x86"			if BR2_i386
+	default "linux-x86"			if BR2_i386 && !BR2_TOOLCHAIN_HAS_LIBATOMIC
+	default "linux-x86-latomic"		if BR2_i386 && BR2_TOOLCHAIN_HAS_LIBATOMIC
 	default "linux-x86_64"			if BR2_x86_64
 	# no-asm is needed with generic architectures such as
 	# linux-generic{32,64}, see
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
