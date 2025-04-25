Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADC7C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 19:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B3742EF5;
	Fri, 25 Apr 2025 19:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfANPzSd6Ba5; Fri, 25 Apr 2025 19:16:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0897542452
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0897542452;
	Fri, 25 Apr 2025 19:16:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51E8C159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 445ED403AC
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wM9cqgpvjJd2 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 19:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 639E44029F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 639E44029F
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:16:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51BCD863A2; Fri, 25 Apr 2025 19:16:38 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Apr 2025 21:15:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 294e3a40bb7e0fe3af8fb4689529e595d6895099
X-Git-Newrev: 6c183754342e6bb73aeab3c8731789c73fcae4ad
X-Patchwork-Hint: ignore
Message-Id: <20250425191638.51BCD863A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: fix build w/ wolfssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c183754342e6bb73aeab3c8731789c73fcae4ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package strongswan relies on the `wc_RsaKeyToDer` & `wc_MakeRsaKey`
functions of WolfSSL. Building this package with the WolfSSL backend
by selecting the variable `BR2_PACKAGE_STRONGSWAN_WOLFSSL` would give
the following error:

```
libtool: compile:  /home/buildroot/instance-0/output-1/host/bin/sparc-linux-gcc -DHAVE_CONFIG_H -I. -I../../../.. -I../../../../src/libstrongswan -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DWC_NO_RNG -rdynamic -Wno-format -Wno-format-security -Wno-implicit-fallthrough -Wno-missing-field-initializers -Wno-pointer-sign -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Og -g0 -include /home/buildroot/instance-0/output-1/build/strongswan-5.9.14/config.h -c wolfssl_ed_public_key.c -o wolfssl_ed_public_key.o >/dev/null 2>&1
wolfssl_rsa_private_key.c: In function 'get_encoding':
wolfssl_rsa_private_key.c:366:31: error: implicit declaration of function 'wc_RsaKeyToDer'; did you mean 'wc_EccKeyToDer'? [-Wimplicit-function-declaration]
  366 |                         len = wc_RsaKeyToDer(&this->rsa, encoding->ptr, len);
      |                               ^~~~~~~~~~~~~~
      |                               wc_EccKeyToDer
libtool: compile:  /home/buildroot/instance-0/output-1/host/bin/sparc-linux-gcc -DHAVE_CONFIG_H -I. -I../../../.. -I../../../../src/libstrongswan -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DWC_NO_RNG -rdynamic -Wno-format -Wno-format-security -Wno-implicit-fallthrough -Wno-missing-field-initializers -Wno-pointer-sign -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Og -g0 -include /home/buildroot/instance-0/output-1/build/strongswan-5.9.14/config.h -c wolfssl_ec_private_key.c -o wolfssl_ec_private_key.o >/dev/null 2>&1
wolfssl_rsa_private_key.c: In function 'wolfssl_rsa_private_key_gen':
wolfssl_rsa_private_key.c:490:13: error: implicit declaration of function 'wc_MakeRsaKey'; did you mean 'wc_FreeRsaKey'? [-Wimplicit-function-declaration]
  490 |         if (wc_MakeRsaKey(&this->rsa, key_size, WC_RSA_EXPONENT, &this->rng) < 0)
      |             ^~~~~~~~~~~~~
      |             wc_FreeRsaKey
```

Those functions are only present when building the WolfSSL library with
the keygen supports (`--enable-keygen`).

This patch change the selected package to enable all the option of
WolfSSL, which include the keygen as well.

Fixes:
  - https://autobuild.buildroot.org/results/d0e/d0e94f501ad1afd25ae4112443f9af101dfa5dea

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/strongswan/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index a62688f9c3..22caa2a573 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -59,6 +59,7 @@ config BR2_PACKAGE_STRONGSWAN_GMP
 config BR2_PACKAGE_STRONGSWAN_WOLFSSL
 	bool "wolfssl"
 	select BR2_PACKAGE_WOLFSSL
+	select BR2_PACKAGE_WOLFSSL_ALL
 
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
