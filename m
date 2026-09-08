Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60958C79F99
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 19:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5AB340693;
	Tue,  8 Sep 2026 19:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKZDl31h-1da; Tue,  8 Sep 2026 19:13:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2B80740692
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788894838;
	b=lNQzpqPgaCULtBjkD4HOWiBWM0cgAlBU2/2vXk39CCQxAxXNQOGJmqsT5NmygMlldHlM
	 tdU3XjGDRDHSGE4qrHm33PIQgGCmem0zkjk3Zmm78baXz9vPff8q26sTey1RsHcHmm0Cz
	 eMaps9khMNZx7SrDTaX1ymIdFwsAU568i8qOS+fzop3jxlzoC9o4cAvJQ683/g/a/3acV
	 G4wIqj05fPkEQ0UJOzBFevuGZc5dwGMbcS0sGGySfaDV/8gEC/08Puhb4IEO5ngOCBaXI
	 N/Fxem+vTRPOUgj1d2hhWTLUdVYUE+lpHr8i6Mrw6o0yImUokruiDxz6GbCv8RN+eGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788894838;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Lt78xCWuOjkvl9T5duMIMnpW7/VSRyR4O6DarBtCLcE=;
	b=rbEUB8BgDQAM7PjJ1B0iNQYF7XcGPLWvzdcrUrJa5HSjoKv6k7msGiigMjYDFf6t8MXc
	 Jxrh04Das1qf5osdXsLiPWEV68L5SgYhrv79+IWfKdjeeu5mwBIFSNF6M/VX4kEveFU4S
	 bFRs1MRPC+vjT9sL+t+pxJSVy8wwcqcHV8Z+eSOLvvrG0n1RQgCTtfboLd+80+Jq2vWvG
	 xHH4XFjbP7T+3Zzs9Tr1xVEvrqNMhDyARhJoWTp8Dva1evsFvg8SmvNKGpU5I4G/3+W/0
	 QHTKjeMqR0aDSUIf2ejND9c/BAWlhmPNso+9jV3lucxdjsLaw7W/WQdKsVcCx25HpfA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788894838;
	bh=Lt78xCWuOjkvl9T5duMIMnpW7/VSRyR4O6DarBtCLcE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OAsUSwEs4A7x8c4vBcQbNWokh1FtlbjHym25jl+JiDwZJhGbrtVaKT0hl5ByC5jc+
	 UecAxnzYVxAFh1ujuPHjd6VgU0q42CBlm5h5DmxFdgS9IETN1YNOYqrjBfbgHCCBhF
	 UqbeZ9yphVwa127wZTigeDp5VqZ9g2WiKKo+9jKR+UVp9UPJ75QZhfAfh1Vg2hc0sh
	 oTEj9i+DqWMpDivbicqk1bnf32Gb1ybML1d4qYRb5RprNwsaNCD6RRYa7xj7G1MnhD
	 lAg5rIR56WcI3kc1ufM3Pgcws4q23ZG0Z+fGtrI9/hz7hmAdf7BfVWgcoUdfFwpsaU
	 IgKJ+zizC/MRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B80740692;
	Tue,  8 Sep 2026 19:13:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F08C2D2
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E955280C4D
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geZ5IIhKA3s6 for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 19:13:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4C89180C47
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788894834;
 b=iZmPVUTIFk2WMYfDa3TwbmsxejVcWRLboUpMcA4HtbuGi4S+4Y9bAuXdEQY67NeDkvP1
 J/4IGT7pAr8iClfLmrxibY7efXrGhtEnKOUWbWybYM4pNSewoj762sjAgFA72lDnBhcRH
 AhgYGrBtwDVPD40g3lDWtPKpmTLOVtDR3hBEr7It1JdlHlCiCM8psfv3lUeDVq8OIaHxg
 QhiFoO7769N12mfXIZ1N/nyT5jXXMDIKADIk2jhiraKe5oPE4rfhyM7k/k4N+71IALdp7
 XXIeNk4WlTxzToaFGE3GainGKjKA1D4BmZMaofrF4omD71NDthR0gLriHIaXKjR3V4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788894834;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=HsMwKs+KjmcgHaOPS+1pFvLJ6ksm9EaChgo3wJmkgcw=;
 b=ONY6ZXJnDs7hQxYsHzdVNUwLFSxHoa2F3Ks2o+3qaK8rgLHJONINB8FQufnodf8Sqz/y
 DZSOzyhDKENwjCjWtxxJR2jAYQxit9R18YT/a5MGkcqU5K6PyV/gIEhKfVU4OqC6B3f11
 o9A2N41Roh7IhcV9DosZauFUcJeuTXc3nh+S6PBRgG9/LoX9HWRAYzyxZO0haAiwpNH0u
 g/Mi+GEYEU1EWzR9pMFfpT9kCOpRIjU/iZfkfzJJqYYV88nAWtQWmw1mkGK+YUNvQ5g84
 w8jERsv9UzbqpmPAS0GgkXAUe3Rf5+pqkyGxNAiR6pFsd/DxnSN+3M8bdcfx14p6+Fg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=O1bDEGNd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=O1bDEGNd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C89180C47
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788894829;
 bh=HsMwKs+KjmcgHaOPS+1pFvLJ6ksm9EaChgo3wJmkgcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=O1bDEGNdWLUiH8F6hqTDBVXj0CUiilzP3J2MmNsBBD7pgog5kAouGoxPqHLzxGd3N
 tCFULGdE8rG8wyIW9+MgOd6tDhZdjkgLMjpVw82X+Q+v9JBLsksOqiBZ5WvXWLyCUJ
 hpx+nabEfYSbXCa2iRY+EwXcFqpdlxN5bNt+Qk+Grrb8ea8ZHlGjmo1OexM70tFglX
 MrQ+LZL3dmmzvc5YOp9/09fuZYK97AZSWSUsysz8rR0ZE8i1rCpxGV3VuccO9utoGB
 1wPyqMnXh1TKif+Zbc0EiOV8FTeLt4ZjjQLiYfYR+41+D1asLaVcoGtuGEfPVLS8LB
 80vdCG837Qusg==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 137FCA4C39FA;
 Tue,  8 Sep 2026 21:13:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41268)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x41GO-000000006av-41nm;
 Tue, 08 Sep 2026 19:13:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Tue,  8 Sep 2026 21:13:47 +0200
Message-ID: <20260908191348.1892945-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908191348.1892945-1-bernd@kuhls.net>
References: <20260908191348.1892945-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/3] package/libest: needs OpenSSL engines
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

Fixes build error:

In file included from client.c:14:
client.c: In function 'JNI_OnLoad':
./../../src/est/est.h:834:10: error: implicit declaration of function 'ERR_load_crypto_strings'; did you mean 'ERR_load_CRYPTO_strings'? [-Wimplicit-function-declaration]
  834 |     do { ERR_load_crypto_strings();      \
      |          ^~~~~~~~~~~~~~~~~~~~~~~
client.c:88:9: note: in expansion of macro 'est_apps_startup'
   88 |         est_apps_startup();
      |         ^~~~~~~~~~~~~~~~
./../../src/est/est.h:836:10: error: implicit declaration of function 'ENGINE_load_builtin_engines' [-Wimplicit-function-declaration]
  836 |          ENGINE_load_builtin_engines();  \
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
client.c:88:9: note: in expansion of macro 'est_apps_startup'
   88 |         est_apps_startup();
      |         ^~~~~~~~~~~~~~~~
client.c: In function 'JNI_OnUnload':
./../../src/est/est.h:860:40: error: implicit declaration of function 'ENGINE_cleanup'; did you mean 'EVP_PBE_cleanup'? [-Wimplicit-function-declaration]
  860 |          OBJ_cleanup(); EVP_cleanup(); ENGINE_cleanup(); \
      |                                        ^~~~~~~~~~~~~~
client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
  101 |         est_apps_shutdown();
      |         ^~~~~~~~~~~~~~~~~
./../../src/est/est.h:862:10: error: implicit declaration of function 'ERR_free_strings'; did you mean 'ERR_load_EC_strings'? [-Wimplicit-function-declaration]
  862 |          ERR_free_strings(); } while (0)
      |          ^~~~~~~~~~~~~~~~
client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
  101 |         est_apps_shutdown();
      |         ^~~~~~~~~~~~~~~~~
client.c: In function 'est_client_raise_exception':
client.c:122:17: error: implicit declaration of function 'ERR_print_errors_fp' [-Wimplicit-function-declaration]
  122 |                 ERR_print_errors_fp(stderr);
      |                 ^~~~~~~~~~~~~~~~~~~

seen with this defconfig

BR2_PACKAGE_OPENJDK=y
BR2_PACKAGE_LIBEST=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commit/bdbdbd0557ae43c5cc6f186ee93a01eb7610c1b5

 package/libest/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libest/Config.in b/package/libest/Config.in
index bd5f40afae..3a0328c2f8 100644
--- a/package/libest/Config.in
+++ b/package/libest/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBEST
 	bool "libest"
 	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
 	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_SAFECLIB
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
