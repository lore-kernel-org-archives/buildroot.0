Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B416CCDB479
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 18:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5417760A52;
	Wed, 24 Jun 2026 18:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuXi86a9QmeY; Wed, 24 Jun 2026 18:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E107E60BE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782326409;
	bh=8dzOsPSuAu4BKyiClcjN7G5VVWcSA5Lno+ubbw5o3Ys=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pwwt4OudOciPvX/3u5qOtUjIrxHx+wLquob7oKFMVK3/+OvOxHEuRHLY0L4xdOEJU
	 gkI6Xk1FZVZJZUy4w3QziRrAT/hAYseVbshv0BJAgOMoAfgxkWmr9Xd0h2O7rggZac
	 R+vx5+dXfUILtaeLFn92Ynm4iUGvH7ulTBrUe6G5zIOrcjkdpNEbORIdPAbosAPLTG
	 gcelApIcVhMVLWO65F3cpg2B3EVBghdj+6OtuFG2CXX5P1bizCNEhjzbFXF+ySyA7B
	 VkxfSQ77BXjWtGSt2G+RB27VTaL6P1YNA0dwHytkxWwbXxXkv/7iX1qJGXYBCNEing
	 dZ9Eafz7oNebw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E107E60BE6;
	Wed, 24 Jun 2026 18:40:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 819C2367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F86740B4B
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpJRhiZLUsUJ for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 18:40:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6508440B47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6508440B47
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6508440B47
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:40:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c817.dip0.t-ipconnect.de [79.214.200.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3F78AA4C21E5;
 Wed, 24 Jun 2026 20:40:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54004)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wcSW0-000000002xJ-2ydv;
 Wed, 24 Jun 2026 18:40:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2026 20:40:00 +0200
Message-ID: <20260624184000.1059838-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782326401;
 bh=dRm4vpa68bQxPpg3PfBMtcO1gALI7tY1yh0v4sP0zxs=;
 h=From:To:Cc:Subject:Date:From;
 b=U8zg/1pZp5a7P6r6PMJyuwvwglZFigYcSj6GJqeRE28fTGpToGAh903SqsjXGRYvU
 SvfvJ9aAx+UDzKu02+9pv7n3VFfPsotqKgb/agchjSBbCHHMO/uhQYXd25rZSH3/jC
 2UcgN9cv4VlNiBaIOmtY2+SaD5jO+AlJQKl/P5Fl3WWyfUO+ikk4TR2qQM3dYXt55E
 20qv1SkkaUb8pemOG4eZDAWtEhqXG1cuW950wrLj+3J3qw+VSKdWa5zcRRSNLMSrnP
 8izhEY3SX/BO2t/GnLhsfidhZ+dHviEtGJ9TCZyU3lD6T3Rtm3+/0qpV4xPcDuyy7Z
 HBwxiwx+UYwdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=U8zg/1pZ
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: disable atomic
 operations for m68k Coldfire
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes a build error with OpenSSL-enabled libcurl which was
detected by the Gitlab pipelines:

checking for openssl options with pkg-config... found
configure: pkg-config: SSL_LIBS: "-lssl -lcrypto -pthread"
configure: pkg-config: SSL_LDFLAGS: "-L/builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib"
configure: pkg-config: SSL_CPPFLAGS: ""
checking for HMAC_Update in -lcrypto... no
checking for HMAC_Init_ex in -lcrypto... no
checking OpenSSL linking with -ldl... no
checking OpenSSL linking with -ldl and -lpthread... no
checking for SSL_set_quic_use_legacy_codepoint... no
checking for SSL_set_quic_tls_cbs... no
configure: OpenSSL version does not speak any known QUIC API
configure: OPT_OPENSSL: /builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/host/m68k-buildroot-uclinux-uclibc/sysroot/usr
configure: OPENSSL_ENABLED:
configure: error: --with-openssl was given but OpenSSL could not be detected
make[1]: *** [package/pkg-generic.mk:263: /builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/build/libcurl-8.21.0/.stamp_configured] Error 1

Although OpenSSL was found using pkg-config the build tests fail.

A local build shows the concrete error in config.log, for example:

configure:27577: checking for HMAC_Update in -lcrypto
configure:27599: /home/bernd/buildroot/output/host/bin/m68k-linux-gcc
 -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 -D_FILE_OFFSET_BITS=64 -O2 -g0 -fno-dwarf2-cfi-asm -Wl,-elf2flt=-r
 -static -Werror-implicit-function-declaration -Wno-system-headers
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 -D_GNU_SOURCE     -Wl,-elf2flt=-r -static
 -L/home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib
 -L/home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib
 conftest.c -lcrypto  -lssl -lcrypto -lz -pthread -lz  >&5
/home/bernd/buildroot/output/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real:
 /home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libcrypto.a(libcrypto-lib-threads_pthread.o):
 in function `ossl_rcu_read_lock':
threads_pthread.c:(.text+0xa4): undefined reference to `__atomic_fetch_add_8'

This error occurs many times for various atomic operations:

$ grep "undefined reference to \`__atomic" output/build/libcurl-8.20.0/config.log | sort -u | grep -v real
threads_pthread.c:(.text+0x28a): undefined reference to `__atomic_fetch_sub_8'
threads_pthread.c:(.text+0x3b4): undefined reference to `__atomic_fetch_add_8'
threads_pthread.c:(.text+0x9c8): undefined reference to `__atomic_is_lock_free'
threads_pthread.c:(.text+0xa4): undefined reference to `__atomic_fetch_add_8'
threads_pthread.c:(.text+0xa9c): undefined reference to `__atomic_is_lock_free'
threads_pthread.c:(.text+0xb66): undefined reference to `__atomic_is_lock_free'
threads_pthread.c:(.text+0xc30): undefined reference to `__atomic_is_lock_free'
threads_pthread.c:(.text+0xcdc): undefined reference to `__atomic_is_lock_free'

The build error can be reproduced with the current buildroot tree using
this defconfig:

BR2_m68k=y
BR2_m68k_cf5208=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBCURL=y

Although the toolchain lacks atomics support

$ grep ATOMIC .config
$

it emits atomic-related defines, for example:

$ echo | output/host/bin/m68k-linux-gcc -dM -E - | grep __ATOMIC_ACQ_REL
$

This specific define __ATOMIC_ACQ_REL is used in OpenSSL to enable
atomic support at various places:
https://github.com/openssl/openssl/blob/openssl-3.6.3/crypto/threads_pthread.c

causing the build errors we see with the mentioned defconfig.

To fix the problem we use an OpenSSL-provided define to forcefully
disable the usage of atomic intrinsics.

The misdetection of atomic intrinsics for m68k coldfire is not a new
problem:
https://lists.buildroot.org/pipermail/buildroot/2017-May/180841.html
https://lists.buildroot.org/pipermail/buildroot/2026-May/803110.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/437e928ff4b0b70583da018c47292fa86f93b57c

 package/libopenssl/libopenssl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index e9f795832a..019ab778be 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_m68k_cf),y)
 LIBOPENSSL_CFLAGS += -mxgot
 # resolves an assembler "out of range error" with blake2 and sha512 algorithms
 LIBOPENSSL_CFLAGS += -DOPENSSL_SMALL_FOOTPRINT
+# disable atomic operations
+ifeq ($(BR2_TOOLCHAIN_HAS_ATOMIC),)
+LIBOPENSSL_CFLAGS += -DBROKEN_CLANG_ATOMICS
+endif
 endif
 
 ifeq ($(BR2_USE_MMU),)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
