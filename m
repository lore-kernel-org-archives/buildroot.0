Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D99C4451C
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 12:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AA9780EDC;
	Sat, 18 Jul 2026 12:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9Sg86VIXMql; Sat, 18 Jul 2026 12:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3120880EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784379174;
	bh=Eb4uMBxdevO6u6RAKcQQbCJwC9x/mU6JUoBezVaNC6o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OkOg9ccuWA3wDSSTJCV+p3K+EDbzqhIAzj+xegvvzk71+LEC1RdrcIymeHMQBIgr1
	 T7FIo/fWR0L2leiW+1UFBjbgOtG/rfCI6uHD7+r/+yrvRlsyGqTER5ZoO0MuHqgbp4
	 edrZ5S6Vz08ugT0Tm4/z2o3V1XLR2Wtgx3vau6RrsITXv5cMTK+uBvraMtZy2+eAAC
	 pCgYNdgG0ygZxuv3bt7uuhPjDhkiWCI61DENDsgNFvRQ7Olf8H69JWxHrw8n0TzTGH
	 wD7P0CT8ILXp4LY7CMVXb4I0UxAkcpMvOn4NCFT6DiYpGRQWnjk0gkKxdfm8w0Zyjg
	 kR+AssCGgfa7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3120880EE7;
	Sat, 18 Jul 2026 12:52:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F86A36E
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 12:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1138F4081F
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 12:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BN9ESCTmnJ03 for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 12:52:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D10B44081E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D10B44081E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D10B44081E
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 12:52:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 042745FFA3;
 Sat, 18 Jul 2026 14:52:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jul 2026 14:52:43 +0200
MIME-Version: 1.0
Date: Sat, 18 Jul 2026 14:52:43 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260102182445.365668-2-dario.binacchi@amarulasolutions.com>
References: <20260102182445.365668-1-dario.binacchi@amarulasolutions.com>
 <20260102182445.365668-2-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <3097ff658043b7f41f930738fad533c8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784379169;
 bh=w26q4X4JRfgLDWSJWix8vUhWPJC7d1jlYz9rVDh37n4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SYLZDcgFOWPFFJySGiKOdVQBlQAknfDJ2WI2yjMCr/9pANTmkZ0ENeDBK5S8V6k6d
 47lGqlKbe6zYTilAgpmEvYJvaZkatv+ZvFIdZZ/ntSH6esrE2sNM7ctdNWRwOrjaf7
 9BBNgUP9i4rJ914SKNtn8dFwYBtH+IGaXIu8PTGq38Xvxlhin/f2W/hRgWBHlDmYjp
 iW6yuOelUVZ91yYUgB2cAIoWwsPcrtWUCOq5FE6bG/vX8i1i1cdrAasGdgZluaPFPU
 HAGDMbbkiILDKQTvTeV5QUJ1MXLm4+zApk+D3wi7RJQmqk4EEEaBSe8rm6H1tSOtlW
 cpbnaEUOktNwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SYLZDcgF
Subject: Re: [Buildroot] [PATCH v3 2/2] package/drogon: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

I have few comments. See below.

On 02/01/2026 19:24, Dario Binacchi wrote:
> Drogon is a C++17/20 based HTTP application framework. It can be used 
> to
> easily build various types of web application server programs using 
> C++.
> 
> Project page: https://github.com/drogonframework/drogon
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes v2 -> v3:
> - The PRs related to the patches have all been merged. The first PR was
>   merged by combining the three patches into a single one. Replace all
>   Upstream: links with the link to the final commit.
> - Add help text to the added KConfig options.
> - Select external libraries for BROTLI and YAML_CONFIG options.
> - Drop the host configurations. Files too.
> - Always add -DBUILD_CTL=ON to HOST_DROGON_CONF_OPTS (together with
>   -DBUILD_TESTS=OFF and -DBUILD_EXAMPLES=OFF).
> 
> Changes v1 -> v2:
> - Drop BR2_ARCH_IS_64 dependency. It has been tested on imx6ull 
> platform.
> - Add DROGON_INSTALL_STAGING
> - Add 0004-Fix-building-error-for-Werror-unused-value.patch for trantor
>   submodule.
> 
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  .../0001-Fix-cross-compiling-2389.patch       | 76 +++++++++++++++++++
>  ...ilding-error-for-Werror-unused-value.patch | 42 ++++++++++
>  package/drogon/Config.in                      | 50 ++++++++++++
>  package/drogon/drogon.mk                      | 63 +++++++++++++++
>  6 files changed, 233 insertions(+)
>  create mode 100644 package/drogon/0001-Fix-cross-compiling-2389.patch
>  create mode 100644 
> package/drogon/0002-Fix-building-error-for-Werror-unused-value.patch
>  create mode 100644 package/drogon/Config.in
>  create mode 100644 package/drogon/drogon.mk
[...]
> diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
> new file mode 100644
> index 000000000000..06354280db07
> --- /dev/null
> +++ b/package/drogon/drogon.mk
> @@ -0,0 +1,63 @@
> +################################################################################
> +#
> +# drogon
> +#
> +################################################################################
> +
> +DROGON_VERSION = v1.9.11
> +DROGON_SITE = https://github.com/drogonframework/drogon
> +DROGON_SITE_METHOD = git
> +DROGON_GIT_SUBMODULES = YES
> +DROGON_LICENSE = MIT
> +DROGON_LICENSE_FILES = LICENSE

The drogon.hash file is missing. When running the
command "make drogon-legal-info", we can see the messages:

...
WARNING: no hash file for drogon-v1.9.11-git4.tar.gz
...
WARNING: no hash file for LICENSE

Could you add the hash file please?

Also, this package is introducing build failures. There is probably
missing dependencies.
See: https://gitlab.com/jolivain/buildroot/-/pipelines/2682597534

You can also reproduce locally with the command:
utils/test-pkg -a -p drogon

While fixing those issue, could you bump to the latest 1.9.13. This
should remove some (if not all) package patches.

Could you send an updated patch addressing those issues, please?

> +DROGON_INSTALL_STAGING = YES
> +
> +DROGON_DEPENDENCIES = jsoncpp util-linux zlib
> +HOST_DROGON_DEPENDENCIES = host-jsoncpp host-util-linux host-zlib
> +
> +DROGON_CONF_OPTS = \
> +	-DBUILD_TESTS=OFF
> +
> +HOST_DROGON_CONF_OPTS = \
> +	-DBUILD_CTL=ON \
> +	-DBUILD_EXAMPLES=OFF \
> +	-DBUILD_TESTS=OFF
> +
> +ifeq ($(BR2_PACKAGE_DROGON_BROTLI),y)
> +DROGON_DEPENDENCIES += brotli
> +DROGON_CONF_OPTS += -DBUILD_BROTLI=ON
> +else
> +DROGON_CONF_OPTS += -DBUILD_BROTLI=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DROGON_CTL),y)
> +# When we have drogon_ctl for the target, we need to build the
> +# _drogon_ctl tool with host-drogon support so that it can be
> +# run during the building process
> +DROGON_DEPENDENCIES += host-drogon
> +DROGON_CONF_OPTS += -DBUILD_CTL=ON
> +else
> +DROGON_CONF_OPTS += -DBUILD_CTL=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DROGON_EXAMPLES),y)
> +DROGON_CONF_OPTS += -DBUILD_EXAMPLES=ON
> +else
> +DROGON_CONF_OPTS += -DBUILD_EXMPLES=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DROGON_ORM),y)
> +DROGON_CONF_OPTS += -DBUILD_ORM=ON
> +else
> +DROGON_CONF_OPTS += -DBUILD_ORM=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DROGON_YAML_CONFIG),y)
> +DROGON_DEPENDENCIES += yaml-cpp
> +DROGON_CONF_OPTS += -DBUILD_YAML_CONFIG=ON
> +else
> +DROGON_CONF_OPTS += -DBUILD_YAML_CONFIG=OFF
> +endif
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
