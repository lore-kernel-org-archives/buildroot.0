Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6447BEF48CC
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 07:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF18760668;
	Fri, 13 Feb 2026 07:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDfaacvD8VhO; Fri, 13 Feb 2026 07:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF23B6077B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770967359;
	bh=5A1dbJwOJNZrYeS5TYNvvZJRs8l5i9flLMI6MyRbqSo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I75FsRw5KbbWUBG7p3AAAKydmnRmgICjyoEcRN4Mvx1fwSv3DCrKA1oFg/d1LxggT
	 1q+wvlsdjq7C1akG6u419cXlPPesZAjMzyTzwxgcyVVjWwDG5eBOqIbqOHaIUSqicy
	 LAzQukxBM8QUDe27y4eT9zqsj+aplU9lGHA5//TxT2SevhFMOmBf+AaGAEnq0hOm1g
	 UU4UI9cBI7PX33HiY3UVP1YL/1WgjB2TgZPcbXc5LDqr120PfF5oHclzw+SnbPI/fS
	 PWzy9D8n5C9MG+y3NIJLRHp+D8ZIucTKUhmyR3BzME7UskNhmU7oqsk8tAzOn1kktI
	 29iIHUOWELUoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF23B6077B;
	Fri, 13 Feb 2026 07:22:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 218A0EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 07:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06A916077B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 07:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_eDaGV1GFjC for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 07:22:36 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 03EDC60668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03EDC60668
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03EDC60668
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 07:22:35 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id D1E00BDE2F84;
 Fri, 13 Feb 2026 08:22:31 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 13 Feb 2026 07:22:31 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Cc: buildroot@buildroot.org, guenther.harrasser@mobileye.com, Chris Packham
 <judge.packham@gmail.com>
In-Reply-To: <20260212110116.2451538-1-jimmy.wesolowski@mobileye.com>
References: <20260202155535.3412990-1-jimmy.wesolowski@mobileye.com>
 <20260212110116.2451538-1-jimmy.wesolowski@mobileye.com>
Message-ID: <fcb4f17935672617f0cbe8b9dbf82eda@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1770967352; bh=CoaPiuClNa5D0/TWt89X5teJLvCRfQRJ+gX04js8j5g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=nPYMyHpM0UWxgYKaoyjfJqivWxtJLRy7XM9FgLb+RqWDHuC9uBS6JFg/k8tcbtJ/+
 gIW7qbXS9VSNkyWTjYyoAE47wM+TNWFo6qW8WiH0r5E4f5wemuCmtmiRgEmPuVNtxv
 3igx5eDGSmF9uWFZ42a7agNZOgzoEBMzRxap0M98=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=nPYMyHpM
Subject: Re: [Buildroot] [PATCH v3 1/1] package/coremark: use USE_PTHREAD
 when possible, allow custom CFLAGS
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

Hi Jimmy, all

looks good to me.

On 2026-02-12 11:01, Jimmy Durand Wesolowski wrote:
> This passes -DUSE_PTHREAD to coremark CFLAGS
> BR2_TOOLCHAIN_HAS_THREAD is set, and allows passing any additional 
> custom
> ones defined in the Buildroot configuration.
> 
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Acked-by: Andreas Ziegler <br025@umbiko.net>
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
> index 9ea8693e71..e1c6e7e00e 100644
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
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +COREMARK_CFLAGS += -DUSE_PTHREAD
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
