Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EAAC67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 21:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C02F981469;
	Tue,  9 Apr 2024 21:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0I6NvoB5nHrF; Tue,  9 Apr 2024 21:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B52381586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B52381586;
	Tue,  9 Apr 2024 21:56:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED7011BF969
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E76F381586
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSVRScJVH1TM for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 21:56:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D804A81469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D804A81469
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D804A81469
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 21:56:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9FE5A13F86E;
 Tue,  9 Apr 2024 23:56:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 Apr 2024 23:56:40 +0200
Date: Tue, 9 Apr 2024 23:56:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZhW5mPPJpbhA1D0i@landeda>
References: <20240408205742.1422545-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408205742.1422545-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712699803;
 bh=Ojpj4F09V6o1x6HUj1PfIF2Tbry1b6Fi0AQLYi73Pe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q7JOOcEfrXrLgLLuHkDRWCSU5vwu5wDAyopMBAMKFcb8NhsrsY6Z2jRUP9sxvEbPI
 R49OF1mN8dEVa+7jFJqEFQtiQR5cdxpCNw3lsia8XPP4/81OpjHt7A+Po2xLKK/MdM
 GF4Wz4buo8cbb7sZzV7azC9kDdKjAPy5J9uMKwSG7Y57MSwpErYbNeok+ifJVcB/vx
 yaPsA4VmNaeQOkoQb6qVhn7mb+D+5ebQG0YN+S774EPciu2SQU2ah6vmEsizjjUk3Z
 pYluJ7ImrGGGG0Srzu/WxfF4Ni9YBzOtxCB05tZW2iLFd9JiWZLW42B3I/ZMy48+UU
 Nz9Rj01KlJiNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q7JOOcEf
Subject: Re: [Buildroot] [PATCH] toolchain/external: remove libcrypt from
 glibc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-04-08 22:57 +0200, Yann E. MORIN spake thusly:
> Note: this commit only deals with glibc and its internal libcrypt (or
> lack thereof); other C libraries, musl and uClibc-NG, are not considered.
[--SNIP--]
> So, we remove from staging whatever could be used to compile and link
> with libcrypt. We however keep the SO_NAME file, if it exists, and we
> also install it in target/, for those pre-built binaries that may be
> linked with it [1]. The glibc SO_NAME has always been libcrypt.so.1, so
> this is what we copy exactly, to avoid copying the libxcrypt one, which
> is libcrypt.so.2.
> 
> [0] that could happen if a toolchain provider tried to be helpful and
> suplies a toolchain with libxcrypt to be trasnparent to users, in which
> case that would conflict with ours...
> 
> [1] if such a prebuilt binary (executable or library) is used with a
> glibc 2.39 or later toolchain, it will obviously not work at all.
> libxcrypt is supposed to be a drop-in replacement for glibc's libcrypt,
> so we could look into symlinking libcrypt.so.1 to libcrypt.so.2. In a
> later patch, maybe...
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, with the fixes pointed out by Thomas, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../pkg-toolchain-external.mk                  | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index ddf1d70ab4..9b0652c4e5 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -120,7 +120,7 @@ TOOLCHAIN_EXTERNAL_LIBS += libssp.so.*
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
> -TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
> +TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  TOOLCHAIN_EXTERNAL_LIBS += libpthread.so.*
>  ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
> @@ -129,8 +129,23 @@ endif # gdbserver
>  endif # ! no threads
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
> +# uClibc, though mono-lib, still has a separate libcrypt as a stub
> +TOOLCHAIN_EXTERNAL_LIBS += libcrypt.so.*
> +endif
> +
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
>  TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.* libmvec.so.* libanl.so.*
> +# Note: explicitly do copy libcrypt*.so.* even for glibc: it is not the same
> +# SONAME as the one from libxcrypt, so no conflict, but some prebuilt binaries
> +# may have it in their DT_NEEDED. However, do remove the headers, static lib,
> +# and symlink to avoid conflict, as they are not needed at buildtime.
> +TOOLCHAIN_EXTERNAL_LIBS += libcrypt.so.1
> +define TOOLCHAIN_EXTERNAL_GLIBC_NO_LIBCRYPT
> +	rm -f $(STAGING_DIR)/usr/include/crypt.h \
> +		$(STAGING_DIR)/usr/lib/libcrypt.so \
> +		$(STAGING_DIR)/usr/lib/libcrypt.a
> +endef
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
> @@ -599,6 +614,7 @@ define $(2)_INSTALL_STAGING_CMDS
>  	$$(TOOLCHAIN_WRAPPER_INSTALL)
>  	$$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
> +	$$(TOOLCHAIN_EXTERNAL_GLIBC_NO_LIBCRYPT)
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
>  	$$(TOOLCHAIN_EXTERNAL_FIXUP_PRETTY_PRINTER_LOADER)
> -- 
> 2.44.0
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
