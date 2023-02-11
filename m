Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2185C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 16:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BC6F40459;
	Sat, 11 Feb 2023 16:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BC6F40459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vQqR8WNnM3l; Sat, 11 Feb 2023 16:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70CBE4044D;
	Sat, 11 Feb 2023 16:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70CBE4044D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D637A1BF2BF
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 16:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD3C981E40
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 16:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD3C981E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VMdbu1weYIBV for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 16:49:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9596881E1C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9596881E1C
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 16:49:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8B17A5FF33;
 Sat, 11 Feb 2023 17:49:26 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Feb 2023 17:49:26 +0100
Date: Sat, 11 Feb 2023 17:49:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230211164926.GI2796@scaer>
References: <20230211163202.25627-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211163202.25627-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676134168;
 bh=RSfdWjeebJZgfyl2fIReOToqEe0UtWckEUoslAg7x7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u8P5M8QJmQApYYWgG3hJa90wWTw9C3X67qLsnyPbdTmXuMLoRvefucVZUDeSPPt/a
 zRENu5lLoNRrlbT575kP3G0U52d5AAJDsMCxbnhiheI9w3xGK/ah6FBCtTucN2oVjP
 /tD0iPf0bmFEwYcV5lHIB1eqeTPpAdKbJ/Vx+uD0KDPK3NkcJN5dVlkt+4iHu/e15V
 nvt1MI+lFuVS3KEb8Bvppay++dVfWTts3+U2txHKkN+5dT8syam/aN2TitOA8in0KC
 ZIROx1PDL+9vWbkdlmrmxhJ8kjpN3BIpkZrQFRJXcf/DwlSG1HQishjj+E3aMfU2KU
 5Zxx4dYJSJxtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u8P5M8QJ
Subject: Re: [Buildroot] [PATCH v1] package/ntpsec: fix Stack Smashing
 Protection detection
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-02-11 17:32 +0100, Peter Seiderer spake thusly:
> Fix SSP missdetection (compiler supports '-fstack-protector-all' command
> line argument but selected libc/toolchain does not support SSP,
> e.g. i686-musl.
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/ded9ad5badbcfa6552443d3ce0866722becfefbd
> 
>   [...]
>   Checking if C compiler supports -fstack-protector-all : yes
>   [...]
>   Checking for type struct timex                                  : no
>   The configuration failed
>   (complete log in .../build/ntpsec-1_2_2/build/config.log)
> 
>   And from build/ntpsec-1_2_2/build/config.log:
> 
>   err: .../host/lib/gcc/i686-buildroot-linux-musl/12.2.0/../../../../i686-buildroot-linux-musl/bin/ld: test.c.1.o: in function `main':
>   test.c:(.text.startup+0x2a): undefined reference to `__stack_chk_fail_local'
>   .../host/lib/gcc/i686-buildroot-linux-musl/12.2.0/../../../../i686-buildroot-linux-musl/bin/ld: .../build/ntpsec-1_2_2/build/.conf_check_01f3f794d5b6ffb7add7ce130581ae04/testbuild/main/testprog: hidden symbol `__stack_chk_fail_local' isn't defined
>   .../host/lib/gcc/i686-buildroot-linux-musl/12.2.0/../../../../i686-buildroot-linux-musl/bin/ld: final link failed: bad value
>   collect2: error: ld returned 1 exit status
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/ntpsec/ntpsec.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
> index c7fa2f85a8..18a8353900 100644
> --- a/package/ntpsec/ntpsec.mk
> +++ b/package/ntpsec/ntpsec.mk
> @@ -30,6 +30,15 @@ NTPSEC_DEPENDENCIES = \
>  	libcap \
>  	openssl
>  
> +# prevent '-fstack-protector-all' compiler flag detection without
> +# ssp support (e.g. i686-musl)
> +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
> +define NTPSEC_FORCE_DISABLE_SSP
> +	$(SED) s/fstack-protector-all/fstack-protector-all-disabled/g $(@D)/wscript
> +endef
> +endif
> +NTPSEC_PRE_CONFIGURE_HOOKS += NTPSEC_FORCE_DISABLE_SSP

Assigning to hooks should be done in the conditional if-block, not
outside.

But in Buildroot, the SSP flags are automatically handled by the
wrapper, so we should just unconditionally remove said flags as set by
the package, like was done in 50cbac5099b1 (package/sysvinit: add patch
to fix compile without stack-protector support) for example (and no,
that commit was not chosen totally at random ;-) ).

Regards,
Yann E. MORIN.

>  # CC="$(HOSTCC)" is strange but needed to build some host tools, the
>  # cross-compiler will properly be used to build target code thanks to
>  # --cross-compiler
> -- 
> 2.39.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
