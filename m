Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6510D68BE8
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 11:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4C5581431;
	Sat, 16 Nov 2024 11:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAkkl9AXueHS; Sat, 16 Nov 2024 11:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA73812E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DA73812E0;
	Sat, 16 Nov 2024 11:09:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82F79B14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 705CF4099F
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hM2Ng8TtrLf for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 11:09:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACFCC409AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACFCC409AD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACFCC409AD
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:09:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0541119F5A5;
 Sat, 16 Nov 2024 12:09:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51304])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 Nov 2024 12:09:30 +0100
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 12:09:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@iliad-free.fr>
In-Reply-To: <20241115235757.43480-2-vjardin@free.fr>
References: <20241115235757.43480-1-vjardin@free.fr>
 <20241115235757.43480-2-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <242c09a1b7395a4c8b342813b97fb67b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731755373;
 bh=dwUB4OarbdgKpdwYYlu0dwkVR7y6okdr/GC9kinDoUg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rsQs1DaFosrXwX65SzyznN3f1wJk061ya4bLaq7ID0CB5UBovgV9qwHSDM62OCPbJ
 +7PBCPv/uLIE7gdS0IC4jHmMjW8B9W1Zw3bSgePRPPS3yV8zD5hX30ClZo/DgZ7Xbe
 7RFB7k0w8vxkeBSIRted6r6jqfsNApdEBNlCdUfrx+olN0+FFM5zC7pY3S7gGLTc8E
 Hvo+i37KLduzt5aZjlscbZX08k7J9AVbVu1Cl3SGaML7N+mepYkBEa0VBk4/XWvOcQ
 tPNvQfHIHlNx8KevTykpXlyyRZcS+SDoqbJccspbRLbB5Phqdg5k/EptlvuLPwVZm+
 ajbb3+IaRAwlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rsQs1DaF
Subject: Re: [Buildroot] [PATCH v1 1/3] package/mstflint: add new package
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

Hi Vincent,

Thank you for the patches!

This patch does not have a .hash file. See:
https://buildroot.org/downloads/manual/manual.html#adding-packages-hash

Could you add one, please?

On 16/11/2024 00:57, Vincent Jardin wrote:
> Collection of debug tools for the systems with a Mellanox/NVIDIA 
> device.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Vincent Jardin <vjardin@iliad-free.fr>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/mstflint/Config.in   | 16 ++++++++++++++
>  package/mstflint/mstflint.mk | 42 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 60 insertions(+)
>  create mode 100644 package/mstflint/Config.in
>  create mode 100644 package/mstflint/mstflint.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3945803d53..32dcff4127 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3285,6 +3285,7 @@ F:	board/nvidia/bf3/
>  F:	configs/nvidia_bf3_defconfig
>  F:	package/bfscripts/
>  F:	package/dpdk/
> +F:	package/mstflint/
> 
>  N:	Vincent Prince <vincent.prince.fr@gmail.com>
>  F:	package/nss-myhostname/
> diff --git a/package/Config.in b/package/Config.in
> index 1eb5e1e020..926e10cdbf 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -569,6 +569,7 @@ endmenu
>  	source "package/mhz/Config.in"
>  	source "package/minicom/Config.in"
>  	source "package/msr-tools/Config.in"
> +	source "package/mstflint/Config.in"
>  	source "package/mxt-app/Config.in"
>  	source "package/nanocom/Config.in"
>  	source "package/neard/Config.in"
> diff --git a/package/mstflint/Config.in b/package/mstflint/Config.in
> new file mode 100644
> index 0000000000..5882c4ac0e
> --- /dev/null
> +++ b/package/mstflint/Config.in
> @@ -0,0 +1,16 @@
> +comment "mstflint needs a toolchain w/ C++, wchar, dynamic library, 
> threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS

Most Buildroot packages put this comment at the end of the Config.in.
Could you move it at the end to keep this consistency?

> +config BR2_PACKAGE_MSTFLINT
> +	bool "mstflint"
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_SQLITE
> +	help
> +	  Collection of Mellanox/NVIDIA firmware tools.
> +
> +	  https://github.com/Mellanox/mstflint
> diff --git a/package/mstflint/mstflint.mk 
> b/package/mstflint/mstflint.mk
> new file mode 100644
> index 0000000000..a250a32310
> --- /dev/null
> +++ b/package/mstflint/mstflint.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# mstflint
> +#
> +################################################################################
> +
> +MSTFLINT_VERSION = v4.30.0-1
> +MSTFLINT_SITE = $(call github,Mellanox,mstflint,$(MSTFLINT_VERSION))
> +MSTFLINT_LICENSE = GPL-2.0
> +MSTFLINT_LICENSE_FILES = LICENSE COPYING

Could you sort the license files alphabetically, please? i.e.
MSTFLINT_LICENSE_FILES = COPYING LICENSE

> +MSTFLINT_INSTALL_STAGING = YES
> +MSTFLINT_AUTORECONF = YES
> +MSTFLINT_DEPENDENCIES = host-pkgconf
> +
> +# Infiniband dependency is not managed
> +MSTFLINT_CONF_OPTS += --disable-inband
> +MSTFLINT_CONF_OPTS += --disable-rdmem

Since there is no _CONF_OPTS yet, there is no need to append (the "+" is
not needed). Could you please change to:

# Infiniband is always disabled
MSTFLINT_CONF_OPTS = \
	--disable-inband \
	--disable-rdmem

> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
> +MSTFLINT_CONF_OPTS += --enable-openssl
> +MSTFLINT_DEPENDENCIES += libopenssl

Could you add the "else" case here?

else
MSTFLINT_CONF_OPTS += --disable-openssl

> +endif
> +
> +ifeq ($(BR2_PACKAGE_EXPAT)$(BR2_PACKAGE_XZ),yy)
> +MSTFLINT_CONF_OPTS += --enable-adb-generic-tools

The link between expact+xz and the "adb-generic-tools" is not
obvious here. I think it would be preferable to add a Config.in
option like BR2_PACKAGE_MSTFLINT_ENABLE_ADB_GENERIC_TOOLS with
a help describing what it is, which will select expat and xz.
Also, the "else" case should be added, with
--disable-adb-generic-tools.

> +MSTFLINT_DEPENDENCIES += expat
> +MSTFLINT_DEPENDENCIES += xz # lzma.h
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_XZ),yy)
> +MSTFLINT_CONF_OPTS += --enable-fw-mgr

Same comment as the previous --enable-adb-generic-tools option.
I think it'll better to add a Config.in option with the corresponding
help text.

> +MSTFLINT_DEPENDENCIES += xz # lzma.h
> +MSTFLINT_DEPENDENCIES += libcurl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +MSTFLINT_CONF_OPTS += --enable-xml2
> +MSTFLINT_DEPENDENCIES += libxml2
> +endif
> +
> +$(eval $(autotools-package))
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
