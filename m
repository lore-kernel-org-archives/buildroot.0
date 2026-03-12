Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04230FED2D9
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 07:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C6A84D2F;
	Thu, 12 Mar 2026 07:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2dDkoG3zJRN; Thu, 12 Mar 2026 07:11:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DC5284D2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773299474;
	bh=8/rI+90XJkE02Ns7muP5984/cuWixFpCwb2FTPw1vKw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qD6rmJ1Zk8ZpLzKcT6X34qsFzpWUnG3kRlQOqjO7ul+wniZMOsUWPwlqMk056GVVI
	 KM5glYqQkuN9uDDCeYPbCWkPq2TcW4VRoDyT16BuhZdrRdESW4pI7N2Ffxkl5ZUvPK
	 znmUtGr4mgxOTmQ9O33gNacGq8nzbt3dgl/JKEJT1N7XzIv/K+aiC7ALgTWdfj5tW3
	 Jllp5Vh0vkfCz0sTc3b2k1sHhGtbwFmpfny2khjl9ehwMhOgZWhhGc52uBHuHc3dd/
	 AKFL1mDT485HWDT1yLrhadqrl5XbLy+JbLxIzsca3O4vHvbd4E+u2cyTNTXGaA6B5p
	 s757G6lHwPT0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC5284D2B;
	Thu, 12 Mar 2026 07:11:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CECD4282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 07:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4A2941B6A
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 07:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lQfDfhswX6V for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 07:11:11 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90B4041B6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90B4041B6C
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90B4041B6C
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 07:11:09 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 6CCE6BDE3A77;
 Thu, 12 Mar 2026 08:11:06 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 12 Mar 2026 07:11:06 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Cc: buildroot@buildroot.org, guenther.harrasser@mobileye.com, Chris Packham
 <judge.packham@gmail.com>
In-Reply-To: <20260311173338.167112-1-jimmy.wesolowski@mobileye.com>
References: <20260212110116.2451538-1-jimmy.wesolowski@mobileye.com>
 <20260311173338.167112-1-jimmy.wesolowski@mobileye.com>
Message-ID: <0692703c261f86d7f708093b729ec3a8@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773299466; bh=pxlJERUkoKc6VcHuXuyoX9RLyVdXl7Z1yBDUW8QQKVc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=5rXWeQa3eCNq4ReaWS0uH6K4p51/QejsssNffDkZrLjwyEn6UalEKTyt091DSWf2r
 lYnvoViQTbrux1pfJg6cFSjBRcPw6wYQ5MramgwR2inxMogWnjXEJBCOvH6l6D3pTJ
 rBCkmMZgNWXkQDDitYtwQmjQfl1Nh/Fo9QOvY1TI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=5rXWeQa3
Subject: Re: [Buildroot] [PATCH v4] package/coremark: use USE_PTHREAD when
 possible, allow custom CFLAGS
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jimmy, ALL

Sorry for another iteration :-(

On 2026-03-11 17:33, Jimmy Durand Wesolowski wrote:
> This passes -DUSE_PTHREAD to coremark CFLAGS
> BR2_TOOLCHAIN_HAS_THREAD is set, and allows passing any additional 
> custom
> ones defined in the Buildroot configuration.
> 
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> 
> ---
> Changes v1 -> v2:
>   - do not add mips-i6500 through a patch, but copy it through rsync
>     in POST_EXTRACT_HOOKS (suggested by
>     Andreas Ziegler <br025@umbiko.net>)
>   - allow specifying a port directory to use through kconfig, such as
>     mips-i6500. The default stays linux for 32-bits architecture,
>     linux64 for 64.
>   - allow passing extra PORT_CFLAGS through kconfig  (suggested by
>     Andreas Ziegler <br025@umbiko.net>)
> 
> Changes v2 -> v3:
>   - do not include the mips-i6500 files as they are redundant with
>     the linux port. (suggested by Andreas Ziegler <br025@umbiko.net>)
>   - fix indentation in Config.in and coremark.mk
>   - drop the ability to pass custom port (no longer necessary).
>   - adapt the name and description of the patch accordingly.
>   - author and signed-off-by reset due to patch significant changes.
> 
> Changes v3 -> v4:
>   - add -lpthread in CFLAGS (since only CFLAGS are used to compile
>     and link).
> 
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> ---
>  package/coremark/Config.in   | 10 ++++++++++
>  package/coremark/coremark.mk | 14 +++++++++++---
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/package/coremark/Config.in b/package/coremark/Config.in
> index f0e13eda63..2f3b6f9551 100644
> --- a/package/coremark/Config.in
> +++ b/package/coremark/Config.in
> @@ -6,3 +6,13 @@ config BR2_PACKAGE_COREMARK
>  	  used in embedded systems
> 
>  	  https://www.eembc.org/coremark/
> +
> +if BR2_PACKAGE_COREMARK
> +config BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA
> +	string "coremark port extra CFLAGS"
> +	default ""
> +	help
> +	  Additional CFLAGS to pass to CoreMark platform specific port.
> +	  Any additional flags indicated here will be added to the
> +	  CFLAGS_PORT variable.
> +endif
> diff --git a/package/coremark/coremark.mk 
> b/package/coremark/coremark.mk
> index 9ea8693e71..38d8ce99ec 100644
> --- a/package/coremark/coremark.mk
> +++ b/package/coremark/coremark.mk
> @@ -9,14 +9,22 @@ COREMARK_SITE = $(call 
> github,eembc,coremark,v$(COREMARK_VERSION))
>  COREMARK_LICENSE = Apache-2.0
>  COREMARK_LICENSE_FILES = LICENSE.md
> 
> +COREMARK_CFLAGS = \
> +	$(TARGET_CFLAGS) \
> +	$(call qstrip,$(BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA))

Qstrip unfortunately removes _all_ double quotes from the string. 
Escaped strings, as in

BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA="-DUSE_CLOCK=1 
-DMEM_LOCATION='\\\"LPDDR4-3200\\\"'"

(entered as -DUSE_CLOCK=1 -DMEM_LOCATION='\"LPDDR4-3200\"') thus get 
mangled and confuse GCC. Running the string through 'echo' works, it 
just removes the outer quotation.

+	$(shell echo $(BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA))

> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +COREMARK_CFLAGS += -DUSE_PTHREAD -lpthread
> +endif # BR2_TOOLCHAIN_HAS_THREADS=y
> +
>  define COREMARK_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
> -		PORT_CFLAGS="$(TARGET_CFLAGS)" \
> +		PORT_CFLAGS="$(COREMARK_CFLAGS)" \
>  		PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
> -endef
> +endef # COREMARK_BUILD_CMDS
> 
>  define COREMARK_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D $(@D)/coremark $(TARGET_DIR)/usr/bin/coremark
> -endef
> +endef # COREMARK_INSTALL_TARGET_CMDS
> 
>  $(eval $(generic-package))
> --
> 2.43.0

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
