Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65C6CD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 19:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C99940530;
	Sun, 17 Sep 2023 19:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C99940530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLUz-smlpBrw; Sun, 17 Sep 2023 19:32:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27E784053D;
	Sun, 17 Sep 2023 19:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27E784053D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5E71BF3C9
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 257B960BB0
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 257B960BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TXFCbN_cBl4I for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 19:32:47 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4401C60B19
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 19:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4401C60B19
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5310a63cf7bso480635a12.1
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694979165; x=1695583965;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rOQae1eweOh96xJCIgAXUVirMCS9rt1wu55nSSQ8iyE=;
 b=YHy6v/48Jlogpr9CH7VGrRc3c1Ea1TBA7GTGcFBJ3y1uJjOrlW1G+AXdgTerpki8Il
 MHZizEPIECabLC6zWHKwpI2DHC7BXHyFTcI5S4BmdSWEOiOP29lnr73Sv7gN4nKBTNZ8
 EhvWTXz9ZuLVt4QDVIiqDAlWZvtKGP08U0FDaWcs69eZsDVsREmmdJg9uBn7vUUerqf0
 NViKB8+7ErFZu27mkjGlQHRKY6NRp7PiDQb6DRq1G9Qi0Wb3DwF5u+tKhW64D6XL5kOr
 vFJkxLgTlge/HgAvZ9lELDElVi3Cbuv1b7K61wrng2nRbHPET2r7ha43FQUGhTiOC/D+
 wVkA==
X-Gm-Message-State: AOJu0YxGeJZrp76nZRIBy58JvMU1m+3x1HQSIueQsUaskUpzgGZcSGnI
 uqWpjdlN9e9SrV5UN1gdiFtr97GPQYNpJaA9Nz8=
X-Google-Smtp-Source: AGHT+IEf2p30+tMTr8VwdUjNfpXZ+6gwBw+Nu6KXwSKnFcaEfbhrViIhhuU5TgA8jyPsI3iPrdPraQ==
X-Received: by 2002:a05:6402:12cf:b0:522:3a89:a79d with SMTP id
 k15-20020a05640212cf00b005223a89a79dmr5845704edx.2.1694979165179; 
 Sun, 17 Sep 2023 12:32:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a056402321000b00530cf354746sm2087191eda.48.2023.09.17.12.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 12:32:44 -0700 (PDT)
Message-ID: <23f8c528-9158-07ae-615e-e2ca44c842e8@mind.be>
Date: Sun, 17 Sep 2023 21:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20230917152303.1300577-1-yann.morin.1998@free.fr>
In-Reply-To: <20230917152303.1300577-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1694979165; x=1695583965; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rOQae1eweOh96xJCIgAXUVirMCS9rt1wu55nSSQ8iyE=;
 b=hG0SMuthGcXIjZc4iOHnG38TFAC28bDwEgljzRj01HkS560dmTdoHLifvoKqESK6VO
 uAWiwvh9hjg4k6TGQS0TXHOQkbz8w7Oqhg8gV4lnxXXJqh3x7unvccPRgbfTc4q1JfhX
 P1NKo5ZIpMR8ufLtIfWtDZhHr2Xi8RPSITbgcMtTBtz92Og3BnWvRAB8GYmsVXbBEoWW
 rhhz+7oVqQW2Vz1sr5s12VSsin2qpsoG+uFfR5cZpQdTSjAoeVBdsi+3H2b1JjmBN6Ck
 w6sNsorU6bfD5n+lMOMMndYOLXBGnOPNOLH1XyabkR1vxze+cnv7jsFp4tlOcJJYsYn5
 X4Bg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hG0SMuth
Subject: Re: [Buildroot] [PATCH] package/gdb: gdbserver does not need zlib
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2023 17:23, Yann E. MORIN wrote:
> Since 3341ceb1e585 (package/gdb: zlib is mandatory, not optional), zlib
> has become a mandatory dependencies of the gdb package.
> 
> However, zlib is only needed for the debugger, gdb itself, while the
> server, gdbserver, does not use it.
> 
> This means that, when building an SDK to be later reused as an external
> toolchain, the zlib headers and libraries are present in the sysroot of
> the toolchain, tainting the toolchain and making it unsuitable to be
> reused.
> 
> As Julien noticed, for example, tcl will try and link with zlib if
> available, and at build time it is. But at runtime, it is not, and thus
> tclsh fails to run; see 7af8dee3a8a0 (package/tcl: add mandatory
> dependency to zlib)

  So this commit should be reverted now?


> When we only need to build gdbserver, we still need to configure and
> build the whole gdb distribution, which means we call the top-level
> configure script; that script has no option to disable the detection
> of zlib: it wants to either use a system one, or it will build the
> bundled one.
> 
> So, when we onlyt build gdbserver, we tell configure to not use a system
> zlib, which triggers a build of the bundled one, which we do not use...

  I didn't think this paragraph was very clear, so I reformulated it a little, 
and applied to master, thanks.

  Regards,
  Arnout

> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/gdb/Config.in |  2 +-
>   package/gdb/gdb.mk    | 14 ++++++++++----
>   2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index 20fd262c93..e4ab39a2bd 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -24,7 +24,6 @@ config BR2_PACKAGE_GDB
>   	# The or1k musl port is incomplete, elf_gregset_t definition is missing:
>   	# https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3
>   	depends on !BR2_or1k || !BR2_TOOLCHAIN_USES_MUSL
> -	select BR2_PACKAGE_ZLIB
>   	# When the external toolchain gdbserver is copied to the
>   	# target, we don't allow building a separate gdbserver. The
>   	# one from the external toolchain should be used.
> @@ -61,6 +60,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
>   	depends on !BR2_sh
>   	select BR2_PACKAGE_GMP if !BR2_arc
>   	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_ZLIB
>   
>   comment "full gdb on target needs a toolchain w/ wchar"
>   	depends on !BR2_sh
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 0d41548ed0..070598b385 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -32,7 +32,6 @@ GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
>   # also need ncurses.
>   # As for libiberty, gdb may use a system-installed one if present, so
>   # we must ensure ours is installed first.
> -GDB_DEPENDENCIES = zlib
>   HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses host-zlib
>   
>   # Disable building documentation
> @@ -131,22 +130,29 @@ GDB_CONF_OPTS = \
>   	--disable-sim \
>   	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
>   	--without-included-gettext \
> -	--with-system-zlib \
>   	--disable-werror \
>   	--enable-static \
>   	--without-mpfr \
>   	--disable-source-highlight
>   
>   ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
> +GDB_DEPENDENCIES += zlib
>   GDB_CONF_OPTS += \
>   	--enable-gdb \
> -	--with-curses
> +	--with-curses \
> +	--with-system-zlib
>   GDB_DEPENDENCIES += ncurses \
>   	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
>   else
> +# When only building gdbserver, we don't need zlib. But we have no way to
> +# tell the top-level configure that we don't need zlib: it either wants to
> +# build the bundled one, or use the system one.
> +# Since we're going to only install the gdbserver to the target, we don't
> +# care that the bundled zlib is built, as it is not used.
>   GDB_CONF_OPTS += \
>   	--disable-gdb \
> -	--without-curses
> +	--without-curses \
> +	--without-system-zlib
>   endif
>   
>   # Starting from GDB 11.x, gmp is needed as a dependency to build full
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
