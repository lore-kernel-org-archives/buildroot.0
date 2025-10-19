Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AF6CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 14:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C41A7821C6;
	Sun, 19 Oct 2025 14:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KomxTXutxYjj; Sun, 19 Oct 2025 14:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6B39821CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6B39821CF;
	Sun, 19 Oct 2025 14:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 671201CC
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 14:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44E32821C6
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 14:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmp1R72m_Ii3 for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 14:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F06B781EA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F06B781EA8
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 14:35:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFC118756E; Sun, 19 Oct 2025 14:35:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 16:33:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33159bb6ccfd3ba465cf17af25ded2d612b85781
X-Git-Newrev: e9bfd38904140c271551b578901ac1697e7d06f3
X-Patchwork-Hint: ignore
Message-Id: <20251019143505.DFC118756E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: fix build on x86
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e9bfd38904140c271551b578901ac1697e7d06f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In some specific configurations (target 32bit x86, disable compiler
optimizations, and openssl binary enabled), the compilation fails
with the error:

/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/i686-buildroot-linux-gnu/14.3.0/../../../../i686-buildroot-linux-gnu/bin/ld: ./libcrypto.so: undefined reference to `ossl_aes_cfb128_vaes_dec'
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/i686-buildroot-linux-gnu/14.3.0/../../../../i686-buildroot-linux-gnu/bin/ld: ./libcrypto.so: undefined reference to `ossl_aes_cfb128_vaes_enc'

The issue can be reproduced with the commands:

    cat >.config <<EOF
    BR2_x86_corei7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_OPTIMIZE_0=y
    BR2_PACKAGE_OPENSSL=y
    BR2_PACKAGE_LIBOPENSSL_BIN=y
    EOF
    make olddefconfig
    make libopenssl

This commit adds a patch to fix the issue.

Fixes:
https://autobuild.buildroot.net/results/214/214b918f6b56e005b180145d245491971f3e3476/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add commands to reproduce the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/libopenssl/0004-Scope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch b/package/libopenssl/0004-Scope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch
new file mode 100644
index 0000000000..ab4cf88a40
--- /dev/null
+++ b/package/libopenssl/0004-Scope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch
@@ -0,0 +1,36 @@
+From a37d316e643a4c2be4708d504cc3ecbf37ec1773 Mon Sep 17 00:00:00 2001
+From: Kai Pastor <dg0yt@darc.de>
+Date: Wed, 8 Oct 2025 18:50:33 +0200
+Subject: [PATCH] Scope aes_cfb128_vaes_encdec_wrapper to x64
+
+This function is only used on x64 and relies on other functions which
+are only implemented for x64.
+Fixes #28745.
+
+Upstream: https://github.com/openssl/openssl/pull/28792
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc b/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc
+index d5577d00f132e..eb8e0164ac9ed 100644
+--- a/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc
++++ b/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc
+@@ -30,6 +30,7 @@
+ static int ossl_aes_cfb8_vaes_eligible(void) { return 0; }
+ static int ossl_aes_cfb1_vaes_eligible(void) { return 0; }
+ 
++#if (defined(__x86_64) || defined(__x86_64__) || defined(_M_AMD64) || defined(_M_X64))
+ /* active in 64-bit builds when AES-NI, AVX512F, and VAES are detected */
+ static int aes_cfb128_vaes_encdec_wrapper(
+     PROV_CIPHER_CTX* dat,
+@@ -56,6 +57,7 @@ static int aes_cfb128_vaes_encdec_wrapper(
+ 
+     return 1;
+ }
++#endif
+  
+ /* generates AES round keys for AES-NI and VAES implementations */
+ static int cipher_hw_aesni_initkey(PROV_CIPHER_CTX *dat,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
