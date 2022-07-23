Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA16C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6116241686;
	Sat, 23 Jul 2022 19:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6116241686
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C45QLiDw8GBv; Sat, 23 Jul 2022 19:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46633400EC;
	Sat, 23 Jul 2022 19:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46633400EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF3991BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A53284C15
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A53284C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y2d3aVnkBc47 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:11:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C910C84B8D
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C910C84B8D
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 59F3784A5B; Sat, 23 Jul 2022 18:57:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:10:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4f8c41b5ecde0b5351042450cc41f9e24e316fc
X-Git-Newrev: 37ac285cc1122b2e6b587988052f7e1e5de8d795
X-Patchwork-Hint: ignore
Message-Id: <20220723185732.59F3784A5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: add
 BR2_PACKAGE_PHP_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=37ac285cc1122b2e6b587988052f7e1e5de8d795
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fiber (https://wiki.php.net/rfc/fibers) has been added in version 8.1.0
with
https://github.com/php/php-src/commit/c276c16b6627222c40bd43907475d664734b9abe

fiber uses asm on supported architectures or needs ucontext since
https://github.com/php/php-src/commit/8fd747a2a0e9f57c12bdad22a1844a736e7b4e57

As result, the following build failure is raised without ucontext_t on
architectures not supported by asm since bump to version 8.1.7 in commit
0ddfece7f7e5b10a5da89f2c462616d5deb5b1ec:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: Zend/zend_fibers.o: in function `zend_fiber_init_context':
zend_fibers.c:(.text+0x68a): undefined reference to `getcontext'

As fiber can't be disabled (only fiber-asm), add
BR2_PACKAGE_PHP_ARCH_SUPPORTS to reflect this new dependency

Fixes:
 - http://autobuild.buildroot.org/results/f4077bae8f879828e343475318cd2ddb99e09ba4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/php/Config.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 226d2d5fd2..69b4268c1d 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -1,5 +1,18 @@
+config BR2_PACKAGE_PHP_ARCH_SUPPORTS
+	bool
+	# see fiber_cpu in configure.ac
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_RISCV_64
+	default y if BR2_s390x
+	default y if BR2_TOOLCHAIN_HAS_UCONTEXT
+
 config BR2_PACKAGE_PHP
 	bool "php"
+	depends on BR2_PACKAGE_PHP_ARCH_SUPPORTS
 	# PHP uses -export-dynamic, which breaks with elf2flt with a
 	# message like "ld.real: section .junk LMA [...,...] overlaps
 	# section .text LMA [...,...]"
@@ -52,5 +65,6 @@ source "package/php/Config.ext"
 endif
 
 comment "php needs a toolchain w/ wchar"
+	depends on BR2_PACKAGE_PHP_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
