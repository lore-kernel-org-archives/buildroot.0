Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3957C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:02:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D9F760F35
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D9F760F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CDB440524;
	Tue, 17 Aug 2021 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RbiNcI-myP66; Tue, 17 Aug 2021 20:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA7044074B;
	Tue, 17 Aug 2021 20:02:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 608351BF86D
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BFEA80D62
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVTzG-S9qAOx for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 20:02:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A23B980D3A
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 20:02:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8b4:21c0:9a77:1566])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8ECE0B0055A;
 Tue, 17 Aug 2021 22:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629230534;
 bh=WiI9BLa2Dx86WUTJbGyWiXq52Nf8mtpUpb9I93LGUM0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=thfF4K3A2cWmOVtj57VMCm7TYfTRrql+Lm7YKYnQ97HO/IH2Sw8fILsdQAmXUV5UE
 ih0XJl+RnV+LjnzDzkHqW3GzFBnABUPg5zn543/kzv1nje69W3ZDW2o4cYIkU7dxUD
 wCuZtXFgxz267q071xdbPuxdw48M9VmtXoDm2VUhYyVtR/2H/Kglm+LNk116srWwPF
 iZzVoDeQOCDJv0nFlNKb8TKl22CzHn/gB+erWPenX3WJ4Pta1YGmHZSH5+k9/RUiWl
 GmZQBKoBM1kAsGCiULihQhTbs9q2IiMemB+/wGMfpAXcko6ysib3fSDI3GrwTWz7Yx
 6TMz+22Pu8Tgg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 Aug 2021 22:02:10 +0200
Date: Tue, 17 Aug 2021 22:02:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20210817200210.GW27036@scaer>
References: <20210817163733.57255-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817163733.57255-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.6.7
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Bernd, All,

On 2021-08-17 18:37 +0200, Bernd Kuhls spake thusly:
> Fixes CVE-2021-38385: https://blog.torproject.org/node/2062
> 
> Rebased patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tor/0001-Fix-static-linking-with-OpenSSL.patch | 10 +++++-----
>  package/tor/tor.hash                                   |  2 +-
>  package/tor/tor.mk                                     |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
> index 8385c28972..26ed6fe819 100644
> --- a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
> +++ b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
> @@ -9,7 +9,7 @@ and remove host paths when looking for openssl.
>  [Vincent:
>   - Adapt the patch to make it apply on the new version.]
>  [Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7, 0.3.2.10,
> -        0.3.4.8, 0.3.5.7, 0.4.4.5 & 0.4.5.6]
> +        0.3.4.8, 0.3.5.7, 0.4.4.5, 0.4.5.6 & 0.4.6.7]
>  [Fabrice: fix detection of openssl functions in 0.3.5.8]
>  Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> @@ -24,7 +24,7 @@ diff --git a/configure.ac b/configure.ac
>  index 05e1392cf..580befa6b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1056,7 +1056,7 @@ AC_ARG_WITH(ssl-dir,
> +@@ -1074,7 +1074,7 @@ AC_ARG_WITH(ssl-dir,
>     ])
>   
>   AC_MSG_NOTICE([Now, we'll look for OpenSSL >= 1.0.1])
> @@ -33,7 +33,7 @@ index 05e1392cf..580befa6b 100644
>       [#include <openssl/ssl.h>
>        char *getenv(const char *);],
>       [struct ssl_cipher_st;
> -@@ -1086,7 +1086,7 @@ dnl Now check for particular openssl functions.
> +@@ -1104,7 +1104,7 @@ dnl Now check for particular openssl functions.
>   save_LIBS="$LIBS"
>   save_LDFLAGS="$LDFLAGS"
>   save_CPPFLAGS="$CPPFLAGS"
> @@ -46,7 +46,7 @@ diff --git a/src/test/include.am b/src/test/include.am
>  index ecb768957..39a622e88 100644
>  --- a/src/test/include.am
>  +++ b/src/test/include.am
> -@@ -404,8 +404,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
> +@@ -399,8 +399,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
>   src_test_test_ntor_cl_LDADD = \
>   	libtor.a \
>   	$(rust_ldadd) \
> @@ -57,7 +57,7 @@ index ecb768957..39a622e88 100644
>   	@CURVE25519_LIBS@ @TOR_LZMA_LIBS@ @TOR_TRACE_LIBS@
>   src_test_test_ntor_cl_AM_CPPFLAGS =	       \
>   	$(AM_CPPFLAGS)
> -@@ -414,8 +414,8 @@
> +@@ -409,8 +409,8 @@
>   src_test_test_hs_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
>   src_test_test_hs_ntor_cl_LDADD = \
>   	libtor.a \
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index 564e0e7ecb..72bdc4a2ee 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  3423189ba455372021ed44e0be576d181f2908cbd9bdef202d9c11c950882e12  tor-0.4.6.6.tar.gz
> +sha256  ff665ce121b2952110bd98b9c8741b5593bf6c01ac09033ad848ed92c2510f9a  tor-0.4.6.7.tar.gz
>  sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 30ad34115f..54c8506f46 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.6.6
> +TOR_VERSION = 0.4.6.7
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
