Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D758C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E15B860BB4;
	Fri,  4 Sep 2026 11:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjNcEY-86EeW; Fri,  4 Sep 2026 11:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 43E8660BC2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788522881;
	b=qjwMbLS9VTKK14aXGV6bbDxCFTxbUnejTc1Sp1e2eTeunzeGE4hssmqpgF0lr/JNc+oH
	 BADmHICPH9OOl5OksmEjZVNaetKBDz0W3aSi7Mq/YQaclE6kC9m5r7nMQzd0oPNMiyTUA
	 fIGtXjU18RqzfRvptT6lvN9cIETSCnMQMVdlabk90r/iC071cTn/xmpxTccf4SrWYZlmO
	 M9jlil3hm6bNZ9AsqbWBIF93wEo0HRkgYz8fNQPRanCGm0LFvQAfy1vYG+jsW0ZAKFSs2
	 +wSo505pGxWtWzTis9aPiPT0fOCf2HkmMRnx50dhTd3Cz9Akmr3IDfx4dYvb80unTmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788522881;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=tLleOd1geNMwCvmStSs3XIoASaA5YLap6mP4zEPKge0=;
	b=AiutRtEa/1Wxl2mbleqGIgoxWsHLmfa2gw8N/h2ULRR0me5ARF8WzBRxlNbHrhxtg5OH
	 To7UXPy3u2EOg6oGWQn52FypQEP8L1Xu5qWTqxgJXBNfWir35JeNE+FKczyA1vAM63YVu
	 6WRneBiYEDS0h2MlyQ9x/KF2ZDYrSYY4JBbTQunqxFqMJfBBtAbuwmeViBWVKaHZqH9xi
	 v6OpT8o1S1eXkbo1RSNJKqyY0b+nFmlWoktD/4RP/dWq/o7o2Qtr/uAeB6CwTD9PsqoSX
	 AZqS78BZ+kOCNv/NuipArYD+krumhUbZKMY2ghDS48HFqENNEpU7sTJChst3UBnPsGw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788522881;
	bh=tLleOd1geNMwCvmStSs3XIoASaA5YLap6mP4zEPKge0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vl++GbWu0h8e1GBKlcciNJDUO/Mvn+ws4P4YwYb/2HAzzbzX5j1ftSz2eKLoW5DIh
	 xRbxCKna4wfBvnjHnfjlYNDyZA7MHEwUhp2E/trH+aErNek6e07OS7QnNXMuF+GP8A
	 4yqAedu9ULCTTtJbOhRGRnrNbvkVqvpWMd7nIlvteTWJrdNC+BrbjgFNFTzEXKTNFY
	 rPyyFWx6n5gxuE4fCld+QhM3EEYdt6VtGS2rBqTneaB8/kqq+QsVjqASw7fZwfIfck
	 +8TpBHuEZrf4yhIMfbwERp1M9DcP5bQ3YMJVsO+jsOnSwVi093W70vggwnVUn0ykdl
	 DHr4cvfCvcwVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43E8660BC2;
	Fri,  4 Sep 2026 11:54:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D24A32FD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C428D607FF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyOWLwlql62J for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:54:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0A209605A7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788522879;
 b=TYbXTGFRanhzY3FzEjwCBfh3FKixxkNY2l1QW+SVKBT1R5cNu+R0GECootY3CD9NZbtO
 HuBw0JodeupDI7kuju0y9s5Y0BFKrkuRpoEgsbMa/m+PP/g8J7ft8wHY89LCEoXkkkAwD
 NU3rwyXkEMLJd1zZjYoAePHNUHJsgqY4LptX55T94Gc7MDz4ruWiade60fFWIO+sP8Odn
 Mist9fJekfVX6s+0+EQgMbwKhg6myNWKqa2rsZgjnc4pSmD9oiUgnVV8H42iQYtV5s14f
 vh21qQq3n7nogIrTE7kBoBf4cVrqhMEyLAXKT7EeBQotSNKAw2lcgniRo1RGd6TTRCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788522879;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=paNWrKyOd7YpziSCdOsYgncheTnCmaaUOh2FAliq4yA=;
 b=K0fEFjLpa3E+Dg8eR2K7spXbqg3Ae3sQIlCFFB3uM5Pl7u2JKLwjKyi9tKRoIxd3gqpt
 fcO54LndHyBvjZLsOrEQI0rxMuo9J3mmqrPvtjG7oZD4ELL4bJhhFlOTs4M6qz7leucl1
 g85fZgfkHss/AVK09f1bP7o29SLgh8IviSxh4kbTcZGXOi3aDm1t/L2zpRwN86otU6ZxF
 3P8cbU6tiGSdE96yUViXxQ8ZaIDVLnRHqhNfxw2b6iFCjeM8vAIh5vbjR3uYuoiPqD6j/
 qxH4axkDIkzDCr7oBnnADW+fS8P36qCtlQSkG/jpC94a7QNlXOxrlk/3veXBkwp7JCA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A209605A7
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8120E948FE; Fri,  4 Sep 2026 11:53:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Sep 2026 21:08:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c05de97a2bfe51d5d85e3071df3be7eec61a8375
X-Git-Newrev: 5f8d0b78ec32bd35b8a38812c71f33529a2723cb
X-Patchwork-Hint: ignore
Message-Id: <20260904115338.8120E948FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: disable atomic
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5f8d0b78ec32bd35b8a38812c71f33529a2723cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
#define __ATOMIC_ACQ_REL 4
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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 9ddc85c197..9b3eec4baa 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
