Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52898C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:56:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1CCB60E52
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1CCB60E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4EC840411;
	Sat,  7 Aug 2021 08:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0O4hekoRFnu; Sat,  7 Aug 2021 08:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB4A4402C3;
	Sat,  7 Aug 2021 08:55:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 582DA1BF2FA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54C58606AE
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:55:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xYwfuIuPHkB for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 08:55:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EBC5605B0
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 08:55:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f16c:16be:6f47:5c9a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 131EE13F87E;
 Sat,  7 Aug 2021 10:55:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628326554;
 bh=Oldz7Lcnra5v3w+FVl85y7qQmbgiGTcakOV17SOu0WA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h9PAqB7ZteSUURrmG+Icx4fp2vjcc4oAmqcjtX4y3SGQ77RpuaxLE/2/cnobA/wky
 LoPsIF/pJrJ762odnAligUgeV38tqLVRs9VILCJiDE2TfzQYH3rRL4vFlMG2MbB3HD
 V1DMLkajl9khyETFYdGsb2LVIywsBmlYwghGdeeP8XLW2MKfSEy5Ad8iDI3TIck9O6
 eSzn68VG8zu1dkGiX/+h2y8+sePK0muMxFAuSPaXjvPXr9eZfMxIc1UE7mQp4n75Im
 NgNGY8pfHBPUzVAX54Q0G3aFZx8AqQYdZ6FrA6UhXziMz2Le0nN0xQjfEkmjB/gaV4
 +8GeTmE3O8NDQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 10:55:49 +0200
Date: Sat, 7 Aug 2021 10:55:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210807085549.GV27036@scaer>
References: <20210806172638.3566272-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806172638.3566272-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/mutt: link with -latomic if
 needed
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

Fabrice, All,

On 2021-08-06 19:26 +0200, Fabrice Fontaine spake thusly:
> Link with -latomic if needed to avoid the following build failure with
> openssl:
> 
> configure:10549: checking for X509_STORE_CTX_new in -lcrypto
> configure:10574: /tmp/instance-0/output-1/host/bin/sparc-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/tmp/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/include  -static -L/tmp/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib conftest.c -lcrypto -lz  >&5
> /tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /tmp/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(x509cset.o): in function `X509_CRL_up_ref':
> x509cset.c:(.text+0xfc): undefined reference to `__atomic_fetch_add_4'
> 
> Ideally, mutt should use pkg-config but upstream don't want to use it:
> https://gitlab.com/muttmua/mutt/-/merge_requests/25

Too sad... :-/

> Fixes:
>  - http://autobuild.buildroot.org/results/e357984853f8ca879156245717fadbeaa9b0dbae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mutt/mutt.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
> index a8734855f8..66616f032c 100644
> --- a/package/mutt/mutt.mk
> +++ b/package/mutt/mutt.mk
> @@ -12,6 +12,10 @@ MUTT_CPE_ID_VENDOR = mutt
>  MUTT_DEPENDENCIES = ncurses
>  MUTT_CONF_OPTS = --disable-doc --disable-smtp
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +MUTT_CONF_ENV += LIBS=-latomic
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  MUTT_DEPENDENCIES += libiconv
>  MUTT_CONF_OPTS += --enable-iconv
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
