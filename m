Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A73AC52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 21:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6C9C61318;
	Fri,  9 Aug 2024 21:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uArRkoS8iZI; Fri,  9 Aug 2024 21:14:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE8256134C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE8256134C;
	Fri,  9 Aug 2024 21:14:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED2761BF286
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 21:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7B6D4023B
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 21:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFjkvt22wQNV for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 21:14:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CED2B4018E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CED2B4018E
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 21:14:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C516E84E64; Fri,  9 Aug 2024 21:14:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 23:06:23 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: a3ec7bb68fd0f650f4c8aa2d78ad67d0592d66f6
X-Git-Newrev: d3b6f8fa3cbc9c245c85a0963a8b446455f15e6c
X-Patchwork-Hint: ignore
Message-Id: <20240809211416.C516E84E64@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/openssl: add and
 use BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3b6f8fa3cbc9c245c85a0963a8b446455f15e6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

libressl doesn't support all architectures since bump to version 3.8.2
in commit 21eca49ed5110872407b76ab9337d2877c4cda24 and
https://github.com/libressl/portable/commit/b98c56fd5e86fa76eb55a98a2266a923f64f705c
https://github.com/libressl/portable/commit/71ce0b8c3e07079a40011d2f3515969e3bdf302e:

In file included from /home/autobuild/autobuild/instance-4/output-1/build/libressl-3.8.2/crypto/rc4/rc4_enc.c:61:
/home/autobuild/autobuild/instance-4/output-1/build/libressl-3.8.2/crypto/../include/openssl/rc4.h:75:9: error: unknown type name 'RC4_INT'
   75 |         RC4_INT x, y;
      |         ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1f6ac121b3771ccc4b0e846c061b7002ccb63963

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 080f2d94b7ac6e8ed5aef99000ec35a001186ed9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index c7641ecefa..30db152fad 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,3 +1,14 @@
+config BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
+	bool
+	# see include/CMakeLists.txt
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_RISCV_64
+	default y if BR2_sparc64
+
 config BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	bool
 
@@ -32,6 +43,7 @@ source "package/libopenssl/Config.in"
 
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
+	depends on BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uClibc doesn't provide __register_atfork() without NPTL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
