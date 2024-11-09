Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539F7D5E381
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 20:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 000B280A95;
	Sat,  9 Nov 2024 20:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52q_OntoVZME; Sat,  9 Nov 2024 20:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2ED480A99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2ED480A99;
	Sat,  9 Nov 2024 20:49:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02992D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB551400CD
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ctm7sxpHpFul for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 20:49:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7CE36401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CE36401F6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CE36401F6
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:49:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 51538B00535;
 Sat,  9 Nov 2024 21:49:44 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43062])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Nov 2024 21:49:44 +0100
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 21:49:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240819080739.147305-1-james.hilliard1@gmail.com>
References: <20240819080739.147305-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <c1975bdda33f49b14ec70070692454b6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731185386;
 bh=fYlYQIRQMaYt7AMJKQeyc4YjjT1vZ4uTa+xIhg4pFlI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vKqPNQ3QNIQeQiAlXCbe6aNihoYveiXOBIwjgwk19DInUy4dsxH2fYcVXv7Jtvm5g
 3/ROrVwo86DxUjXEdrHlmbBtA09uwhAdCcbW47EXjW7X659g6Hz7L8MU1PpmOD6wYS
 92nW9o8VqgPl7z9UOhR/fS3E4bMjkiJYH5jkX4j1nhHjeJvV8RkP98ONErQCKq+oIc
 SqbQb2bqGI91kq2vLzJNPzqC2mSarVyvE62KeTrJwEyFxCeZjE9bho4eWds4oOLG6i
 a1AJS+5oAMdMc1eyCdMVJHvr51inZvuahcWgd9pFwBtvUdXeZXp6tH9swVBZgobfl0
 rdxKOvdGBmYaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vKqPNQ3Q
Subject: Re: [Buildroot] [PATCH 1/1] package/superiotool: new package
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

On 19/08/2024 10:07, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/superiotool/Config.in        |  8 +++++++
>  package/superiotool/superiotool.hash |  3 +++
>  package/superiotool/superiotool.mk   | 36 ++++++++++++++++++++++++++++
>  5 files changed, 49 insertions(+)
>  create mode 100644 package/superiotool/Config.in
>  create mode 100644 package/superiotool/superiotool.hash
>  create mode 100644 package/superiotool/superiotool.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d7d0af3543..84a4aab4f1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1503,6 +1503,7 @@ F:	package/serd/
>  F:	package/sord/
>  F:	package/sratom/
>  F:	package/stb/
> +F:	package/superiotool/
>  F:	package/zchunk/
>  F:	support/testing/tests/package/sample_python_rtoml.py
>  F:	support/testing/tests/package/test_python_rtoml.py
> diff --git a/package/Config.in b/package/Config.in
> index f2c63ffb6e..b284889c63 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -632,6 +632,7 @@ endmenu
>  	source "package/sunxi-cedarx/Config.in"
>  	source "package/sunxi-mali-utgard/Config.in"
>  	source "package/sunxi-mali-utgard-driver/Config.in"
> +	source "package/superiotool/Config.in"
>  	source "package/sysstat/Config.in"
>  	source "package/targetcli-fb/Config.in"
>  	source "package/ti-gfx/Config.in"
> diff --git a/package/superiotool/Config.in 
> b/package/superiotool/Config.in
> new file mode 100644
> index 0000000000..e27ac99bf0
> --- /dev/null
> +++ b/package/superiotool/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_SUPERIOTOOL
> +	bool "superiotool"
> +	depends on BR2_x86_64 || BR2_i386
> +	select BR2_PACKAGE_PCIUTILS
> +	help
> +	  Super I/O detection tool.
> +
> +	  https://www.coreboot.org/Superiotool
> diff --git a/package/superiotool/superiotool.hash 
> b/package/superiotool/superiotool.hash
> new file mode 100644
> index 0000000000..985e54b2a2
> --- /dev/null
> +++ b/package/superiotool/superiotool.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  
> e22afdbac40068ba687fd975f03f6b958599a32e70f539d9d0c74d16a63d7cea  
> coreboot-24.05.tar.xz
> +sha256  
> ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  
> util/superiotool/COPYING
> diff --git a/package/superiotool/superiotool.mk 
> b/package/superiotool/superiotool.mk
> new file mode 100644
> index 0000000000..a73be1d6e7
> --- /dev/null
> +++ b/package/superiotool/superiotool.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# superiotool
> +#
> +################################################################################
> +
> +SUPERIOTOOL_VERSION = 24.05
> +SUPERIOTOOL_SOURCE = coreboot-$(SUPERIOTOOL_VERSION).tar.xz
> +SUPERIOTOOL_SITE = https://coreboot.org/releases
> +SUPERIOTOOL_SUBDIR = util/superiotool
> +SUPERIOTOOL_LICENSE = GPL-2.0+
> +SUPERIOTOOL_LICENSE_FILES = util/superiotool/COPYING
> +SUPERIOTOOL_DEPENDENCIES = pciutils
> +
> +SUPERIOTOOL_CFLAGS = \
> +	$(TARGET_CFLAGS) \
> +	-I$(@D)/src/commonlib/bsd/include \
> +	-DPCI_SUPPORT \
> +	-DSUPERIOTOOL_VERSION=\\\"$(SUPERIOTOOL_VERSION)\\\"
> +
> +SUPERIOTOOL_CONFIGURE_OPTS = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS="$(SUPERIOTOOL_CFLAGS)"
> +
> +define SUPERIOTOOL_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(SUPERIOTOOL_CONFIGURE_OPTS) \
> +		-C $(@D)/$(SUPERIOTOOL_SUBDIR) superiotool
> +endef
> +
> +define SUPERIOTOOL_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(SUPERIOTOOL_CONFIGURE_OPTS) \
> +		-C $(@D)/$(SUPERIOTOOL_SUBDIR) install \
> +		PREFIX=/usr DESTDIR="$(TARGET_DIR)"
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
