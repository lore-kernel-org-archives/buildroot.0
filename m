Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AD7C36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 09:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CACB60B67;
	Fri,  4 Apr 2025 09:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F39mHGK7r49g; Fri,  4 Apr 2025 09:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 582BA60B97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 582BA60B97;
	Fri,  4 Apr 2025 09:50:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95D841C4
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 09:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8707B80D7B
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 09:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Va4FrtGMjdKB for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 09:50:21 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DF438132E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DF438132E
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DF438132E
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 09:50:20 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 7DD87BDE5300;
 Fri,  4 Apr 2025 11:50:16 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br015@umbiko.net>
Date: Fri,  4 Apr 2025 11:50:00 +0200
Message-ID: <20250404095000.2957868-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1743760216; bh=8iJ7aK/4pcGf+R1MpGc+D3VEpA05ZGzscJBmFGfS3hE=;
 h=From:To:Cc:Subject:Date;
 b=RJzErqZZmOIH++8Irbufs7yBiJdDIDGL5p043BtclYyFPR3+fT4byhqoZxLsFJZiw
 437ZpbFkKlRFFTY7XVuIuGso0iGpp1iANKnPgEnUDkcVO3ukDMj62sQILhCiE6pUJa
 h1PEa3svUwdQObfz5568eArP9zUIYSCameF+qwx8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=RJzErqZZ
Subject: [Buildroot] [PATCH 1/1] package/openssl: static build w/ libgcrypt:
 prevent selection of libressl
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

Both libgcrypt and libressl export symbols sha3_update and sha3_final, that 
cannot be hidden in static builds and cause linker errors:

/home/buildroot/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/11.4.0/../../../../armeb-buildroot-linux-musleabi/bin/ld: /home/buildroot/instance-0/output-1/host/armeb-buildroot-linux-musleabi/sysroot/usr/lib/libgcrypt.a(rndjent.o): in function `sha3_update':
/home/buildroot/instance-0/output-1/build/libgcrypt-1.10.3/random/./jitterentropy-sha3.c:281: multiple definition of `sha3_update'; /home/buildroot/instance-0/output-1/host/armeb-buildroot-linux-musleabi/sysroot/usr/lib/libcrypto.a(sha3.c.o):/home/buildroot/instance-0/output-1/build/libressl-3.8.4/crypto/sha/sha3.c:137: first defined here
/home/buildroot/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/11.4.0/../../../../armeb-buildroot-linux-musleabi/bin/ld: /home/buildroot/instance-0/output-1/host/armeb-buildroot-linux-musleabi/sysroot/usr/lib/libgcrypt.a(rndjent.o): in function `sha3_final':
/home/buildroot/instance-0/output-1/build/libgcrypt-1.10.3/random/./jitterentropy-sha3.c:324: multiple definition of `sha3_final'; /home/buildroot/instance-0/output-1/host/armeb-buildroot-linux-musleabi/sysroot/usr/lib/libcrypto.a(sha3.c.o):/home/buildroot/instance-0/output-1/build/libressl-3.8.4/crypto/sha/sha3.c:155: first defined here

Prevent selection of libressl as the openssl provider in static build if 
libgcrypt is selected.

Fixes: https://autobuild.buildroot.org/results/ea5621b044c14aad51384cf164695e026dfc2586

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/openssl/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index d255a05596..556406d1d1 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -48,6 +48,8 @@ config BR2_PACKAGE_LIBRESSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uClibc doesn't provide __register_atfork() without NPTL
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	# multiple definition of symbols in statically linked libraries
+	depends on !(BR2_PACKAGE_LIBGCRYPT && BR2_STATIC_LIBS)
 	help
 	  LibreSSL is a version of the TLS/crypto stack forked from
 	  OpenSSL in 2014, with goals of modernizing the codebase,
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
