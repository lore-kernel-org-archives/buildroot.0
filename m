Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB857C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 908D683E5A;
	Fri,  4 Jul 2025 06:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLU3GRuHOY0A; Fri,  4 Jul 2025 06:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89F6B83E41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89F6B83E41;
	Fri,  4 Jul 2025 06:25:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1056F7AD
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFC2560B65
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kGM8KUSJW07 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB8B760B6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB8B760B6B
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9A9E85E0B; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 10:57:38 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 418051aeb2c0d91c40137efdf178f59e31c2b9dc
X-Git-Newrev: 140afe490de5e219ceade24cfeab3b5a5e76b973
X-Patchwork-Hint: ignore
Message-Id: <20250704062432.E9A9E85E0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 package/gcc/Config.in.host: hide gcc version for unsupported CPUs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=140afe490de5e219ceade24cfeab3b5a5e76b973
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

When a new gcc version is introduced, for example gcc 15 in
commit [1], it should have also added a "depends on
!BR2_ARCH_NEEDS_GCC_AT_LEAST_15" to the previous gcc version.

This logic is described for external toolchains in commit [2],
for example. The internal Buildroot toolchains should have the
same logic. This logic existed for previous gcc version. See for
example the removal of gcc 12 in commit [3].

There is usually no problem, because all the three latest active gcc
versions supports all CPUs present in Buildroot.

However, the commit [4] recently added the support for the Arm
Cortex-A720 CPU, which needs at least gcc 14. Since there is no
logic preventing the selection of the gcc version, it is possible
to select an unsupported gcc version (i.e. gcc 13).

In such a case, the host-gcc-initial package configuration fails
with output:

    Unknown cpu used in --with-cpu=cortex-a720

This commit fixes the issue by adding those missing dependencies.

Fixes:
https://autobuild.buildroot.org/results/918b90aee0b65f01efc241622015cb847b4e23a8/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/75891397abe60dbe3d82a1ec39654ff81d1b1406
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/f577d8218f3f18016aa084255e337a7f589eeed1
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/58cf7c51da3ae4804332f68ee934e153d695d047#66f7e875db173e5538d3511c8297acc1ba30da33_27_25
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/de374e06d856dd5079fc792c883b06563af950b0

Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6f231d3003502282710a0da7ecd98344ec868095)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gcc/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 10fe4bf609..b6b159224e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -34,6 +34,7 @@ config BR2_GCC_VERSION_12_X
 
 config BR2_GCC_VERSION_13_X
 	bool "gcc 13.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
@@ -41,6 +42,7 @@ config BR2_GCC_VERSION_13_X
 
 config BR2_GCC_VERSION_14_X
 	bool "gcc 14.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
