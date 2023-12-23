Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86829C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 10:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 188F360BE8;
	Sat, 23 Dec 2023 10:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 188F360BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mfE6zR3hWBJ1; Sat, 23 Dec 2023 10:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E6E60BBC;
	Sat, 23 Dec 2023 10:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69E6E60BBC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE3981BF408
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C746742149
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C746742149
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJgkeAz5t-3x for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 10:44:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 105C14213B
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 10:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 105C14213B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDEC187BF7; Sat, 23 Dec 2023 10:44:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 11:39:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 088ac834b7deac1f96d0c769aca015bd8dc99075
X-Git-Newrev: fc8eff0c76ab35db7d783ce7959193ff4c30a01e
X-Patchwork-Hint: ignore
Message-Id: <20231223104438.EDEC187BF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: use riscv-specific
 configure target
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc8eff0c76ab35db7d783ce7959193ff4c30a01e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH for riscv32 and riscv64.
Otherwise, riscv targets fall back to the linux-generic libopenssl
configs. This exacerbates the issue partially addressed in
openssl/openssl#22871 which causes build failures.

Fixes a mispelling in upstream causing 0builds for riscv32 to fail when
linking.

Signed-off-by: Grant Nichol <me@grantnichol.com>
[yann.morin.1998@free.fr: squash the two commits together]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...cv-Fix-mispelling-of-extension-test-macro.patch | 30 ++++++++++++++++++++++
 package/libopenssl/Config.in                       |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch b/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch
new file mode 100644
index 0000000000..93b191a61c
--- /dev/null
+++ b/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch
@@ -0,0 +1,30 @@
+From 68c549df05892c16b99603b9a831c79c540f268c Mon Sep 17 00:00:00 2001
+From: Grant Nichol <me@grantnichol.com>
+Date: Fri, 22 Dec 2023 23:46:39 -0600
+Subject: [PATCH] riscv: Fix mispelling of extension test macro
+
+When refactoring the riscv extension test macros,
+RISCV_HAS_ZKND_AND_ZKNE was mispelled.
+
+Upstream: https://github.com/openssl/openssl/pull/23139
+Signed-off-by: Grant Nichol <me@grantnichol.com>
+---
+ providers/implementations/ciphers/cipher_aes_xts_hw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/providers/implementations/ciphers/cipher_aes_xts_hw.c b/providers/implementations/ciphers/cipher_aes_xts_hw.c
+index b35b71020e..65adc47d1f 100644
+--- a/providers/implementations/ciphers/cipher_aes_xts_hw.c
++++ b/providers/implementations/ciphers/cipher_aes_xts_hw.c
+@@ -285,7 +285,7 @@ static const PROV_CIPHER_HW aes_xts_rv32i_zbkb_zknd_zkne = {                   \
+ # define PROV_CIPHER_HW_select_xts()                                           \
+ if (RISCV_HAS_ZBKB_AND_ZKND_AND_ZKNE())                                        \
+     return &aes_xts_rv32i_zbkb_zknd_zkne;                                      \
+-if (RISCV_HAS_ZKND_ZKNE())                                                     \
++if (RISCV_HAS_ZKND_AND_ZKNE())                                                     \
+     return &aes_xts_rv32i_zknd_zkne;
+ # else
+ /* The generic case */
+--
+2.43.0
+
diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 3199de8cfe..49958d9fd6 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -23,6 +23,8 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	default "linux-x86"			if BR2_i386 && !BR2_TOOLCHAIN_HAS_LIBATOMIC
 	default "linux-x86-latomic"		if BR2_i386 && BR2_TOOLCHAIN_HAS_LIBATOMIC
 	default "linux-x86_64"			if BR2_x86_64
+	default "linux64-riscv64"               if BR2_riscv && BR2_ARCH_IS_64
+	default "linux32-riscv32"               if BR2_riscv && !BR2_ARCH_IS_64
 	# no-asm is needed with generic architectures such as
 	# linux-generic{32,64}, see
 	# https://github.com/openssl/openssl/issues/9839
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
