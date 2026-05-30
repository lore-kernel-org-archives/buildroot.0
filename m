Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC364CD6E52
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9131B4089C;
	Sat, 30 May 2026 12:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYgyfnnhIyOB; Sat, 30 May 2026 12:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64BCB408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780144576;
	bh=ai8ItsHYIQoAGrBSFMn4NvNxb5YukLqXnnK4TvQLEhs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=joHTkb5Zdj380HqbBh2takl68XxlTLCu92siUUBuEWk+KUkxZ7MYmuTA3jUCHrH+x
	 UrnSkSaMVAE0AfW4+6IaJUzparV/+mPeF6i69Z+Y2gf0G2w0dkSPaUZk34W5Tw2YEY
	 3fWYnK0o93g2L7871EqOIDjVkXGDckIYLrYQdEQAKzSuZUAzPZN7CImcckLHupeQ78
	 DOcSEm2+P5t1QwGYoysGI5RVjH2hXNDNmLqeP11wDjkTgv3iAQDagOw2QfU5IhkBJj
	 OT9V33/SRTotz4nntKHhqS+rhDN9iFtAhTHxzY7/vMimhU1gBUcVNQkFXR/oEe9WIf
	 8rmf7ZgNXDy/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64BCB408B2;
	Sat, 30 May 2026 12:36:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3F36D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E195B4081F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xM6PDLrFntW for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:36:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33A6F407FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33A6F407FD
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33A6F407FD
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:36:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 61E8DB97C713; Sat, 30 May 2026 11:29:45 +0200 (CEST)
Message-ID: <7dae61db-68ba-4465-b963-95fcad071961@rnout.be>
Date: Sat, 30 May 2026 11:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20260518205030.2285607-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260518205030.2285607-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780133385; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=+/7GMxDnwv8zhG+V1G5UgvBXxVTgQsg9m0gciG2YeKo=;
 b=ISTVOK2VBeHN5w7k7p+fxZ6yfRw80h9rmkcvO4TVL9qmXTY5ZL24mEmmxA5j4RYKUELvI9
 2fXcV5Q5aRqAW88Q9CJXJ4cIfB8oDUPZsQy65lg6KrlX0BctV16rt9vklJlkcCRj83yEh2
 Dzmn64qZtT64fg3gsv6gbBCVqmvzVk7CeYdkZIYNFSGc6i/GwPtY3oPJFHYi/bVyK3BdMj
 VlikIYleCtCkT2KtFd/8tbYhfC7afnSsxMflY3/my88/mmU+dcntINF2YB5cG0p8Jj9Tg7
 Q78FzTsSbwLcLnmBQy0OP7GXAR/CmQKfDWyKujdJJ18DVG3Sggh6IYCwFbi2+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=ISTVOK2V
Subject: Re: [Buildroot] [PATCH 1/1] package/netatalk: security bump version
 to 4.4.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/05/2026 22:50, Bernd Kuhls wrote:
> https://github.com/Netatalk/netatalk/blob/netatalk-4-4-3/NEWS.md
> 
> The bump from 4.4.2 to 4.4.3 fixes these CVEs:
> CVE-2026-44047, CVE-2026-44048, CVE-2026-44049, CVE-2026-44050,
> CVE-2026-44051, CVE-2026-44052, CVE-2026-44054, CVE-2026-44055,
> CVE-2026-44057, CVE-2026-44060, CVE-2026-44062, CVE-2026-44064,
> CVE-2026-44066, CVE-2026-44068, CVE-2026-44076, CVE-2026-45354,
> CVE-2026-45355, CVE-2026-45356, CVE-2026-45698, CVE-2026-45699
> 
> Version 3.2.8 fixes these CVEs:
> CVE-2024-1544, CVE-2024-5288, CVE-2024-5991, CVE-2024-5814
> 
> Version 3.2.1 fixes these CVEs:
> CVE-2024-38439, CVE-2024-38440, CVE-2024-38441
> 
> Updated project URL in Config.in help text.
> 
> Removed md5 tarball hash and added sha256 and sha512 tarball hashes
> provided by upstream.
> 
> Updated license hash due to upstream commits:
> https://github.com/Netatalk/netatalk/commit/06e427ea02bbcea13edd9e5e0235a7d122b171b7
> https://github.com/Netatalk/netatalk/commit/934495d9e145e46a473e32c6dfd3b9aad8d612c2
> 
> Switched _SITE to https.
> 
> Version 4.0.0 removed autotools and kept only meson as build system.
> 
> Reworked dependencies, sorted NETATALK_DEPENDENCIES.
> Iniparser was added as mandatory dependency in 4.2.0.
> Added optional dependencies to cracklib and openldap.
> 
> Disabled usage of libiconv for uClibc due to different definitions of
> iconv_t (uClibc: typedef long vs. glibc: typedef void) which causes
> a build error after the switch to meson.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.
  Regards,
  Arnout

> ---
>   package/netatalk/Config.in     |  3 +-
>   package/netatalk/netatalk.hash | 12 +++---
>   package/netatalk/netatalk.mk   | 78 +++++++++++++++++++++++-----------
>   3 files changed, 62 insertions(+), 31 deletions(-)
> 
> diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
> index 225d5891c7..16543d0ea4 100644
> --- a/package/netatalk/Config.in
> +++ b/package/netatalk/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_NETATALK
>   	depends on BR2_USE_MMU # fork()
>   	depends on !BR2_STATIC_LIBS
>   	select BR2_PACKAGE_BERKELEYDB
> +	select BR2_PACKAGE_INIPARSER
>   	select BR2_PACKAGE_OPENSSL
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST if BR2_PACKAGE_LIBOPENSSL
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
> @@ -16,7 +17,7 @@ config BR2_PACKAGE_NETATALK
>   	  extremely high-performance and reliable file server for
>   	  Macintosh computers.
>   
> -	  http://netatalk.sourceforge.net/
> +	  https://netatalk.io/
>   
>   comment "netatalk needs a toolchain w/ threads, dynamic library"
>   	depends on BR2_USE_MMU
> diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
> index 285484ed2c..5705867802 100644
> --- a/package/netatalk/netatalk.hash
> +++ b/package/netatalk/netatalk.hash
> @@ -1,7 +1,9 @@
> -# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.19/
> -md5  4861f0c2450ac7a6094e51090e6fdc75  netatalk-3.1.19.tar.xz
> -sha1  16900b3b14da9c2f40e1267ecb3e68021cc794b0  netatalk-3.1.19.tar.xz
> +# From https://sourceforge.net/projects/netatalk/files/netatalk-4-4-3/
> +sha1  31ccb1a14ee976e2bf16aef7c8be8620236e36cc  netatalk-4.4.3.tar.xz
> +# From https://github.com/Netatalk/netatalk/releases/download/netatalk-4-4-3/netatalk-4.4.3.tar.xz.sha256sum
> +sha256  863d640ecc99f4923ead6c58e8d3406ab3a1ca9dd3b0d47ccdf6fdebb6efe3ab  netatalk-4.4.3.tar.xz
> +# From https://github.com/Netatalk/netatalk/releases/download/netatalk-4-4-3/netatalk-4.4.3.tar.xz.sha512sum
> +sha512  24702be0325a6071ab97951dfb3e0525c7c8997310602a9007ed246470638d66999f59ca0d5bae0457e777e08f79b45edd572b61c9263e412ba88b402b54d0c3  netatalk-4.4.3.tar.xz
>   # Locally computed
> -sha256  433fa87ac23bc18a9acb0769b4f7f4047eeb14e02e0607ecd3a051c31859164f  netatalk-3.1.19.tar.xz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -sha256  7599ae145e53be03a08f8b558b2f2e0c828e1630f1843cc04f41981b8cefcd65  COPYRIGHT
> +sha256  d13add335381938da94820bf1dfc65b2801dbff94b80d6c56b5c4e3ab996924c  COPYRIGHT
> diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
> index b6f9c3fa59..86bdedcd91 100644
> --- a/package/netatalk/netatalk.mk
> +++ b/package/netatalk/netatalk.mk
> @@ -4,51 +4,79 @@
>   #
>   ################################################################################
>   
> -NETATALK_VERSION = 3.1.19
> -NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk-$(subst .,-,$(NETATALK_VERSION))
> +NETATALK_VERSION = 4.4.3
> +NETATALK_SITE = https://downloads.sourceforge.net/project/netatalk/netatalk-$(subst .,-,$(NETATALK_VERSION))
>   NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.xz
>   NETATALK_CONFIG_SCRIPTS = netatalk-config
> -NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
> -	libevent
> +NETATALK_DEPENDENCIES = \
> +	host-pkgconf \
> +	berkeleydb \
> +	iniparser \
> +	libevent \
> +	libgcrypt \
> +	libgpg-error \
> +	openssl
>   NETATALK_LICENSE = GPL-2.0+, LGPL-3.0+, MIT-like
>   NETATALK_LICENSE_FILES = COPYING COPYRIGHT
>   NETATALK_CPE_ID_VENDOR = netatalk
>   
> -# Don't run ldconfig!
> -NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
> -	ac_cv_path_NETA_LDCONFIG=""
>   NETATALK_CONF_OPTS += \
> -	--with-cnid-cdb-backend \
> -	--with-bdb=$(STAGING_DIR)/usr \
> -	--with-ssl-dir=$(STAGING_DIR)/usr \
> -	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
> -	--with-shadow \
> -	--disable-shell-check \
> -	--without-kerberos \
> -	--without-pam \
> -	--with-libevent=no \
> -	--with-dtrace=no \
> -	--with-mysql-config=no
> +	-Dwith-init-style=none \
> +	-Dwith-afpstats=false \
> +	-Dwith-cnid-backends=dbd \
> +	-Dwith-bdb-path=$(STAGING_DIR)/usr \
> +	-Dwith-libgcrypt-path=$(STAGING_DIR)/usr \
> +	-Dwith-shell-check=false \
> +	-Dwith-gssapi=false \
> +	-Dwith-kerberos=false \
> +	-Dwith-krbV-uam=false \
> +	-Dwith-pam=false \
> +	-Dwith-quota=false \
> +	-Dwith-dtrace=false \
> +	-Dwith-spotlight=false \
> +	-Dwith-docs="" \
> +	-Dwith-tcp-wrappers=false
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +NETATALK_CONF_OPTS += -Dwith-libiconv=false
> +else
> +NETATALK_CONF_OPTS += -Dwith-libiconv=true
> +endif
>   
>   ifeq ($(BR2_PACKAGE_ACL),y)
>   NETATALK_DEPENDENCIES += acl
> +NETATALK_CONF_OPTS += -Dwith-acls=true
>   else
> -NETATALK_CONF_OPTS += --with-acls=no
> +NETATALK_CONF_OPTS += -Dwith-acls=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
>   NETATALK_DEPENDENCIES += avahi
> -NETATALK_CONF_OPTS += --enable-zeroconf=$(STAGING_DIR)/usr
> +NETATALK_CONF_OPTS += -Dwith-zeroconf=true
>   else
> -NETATALK_CONF_OPTS += --disable-zeroconf
> +NETATALK_CONF_OPTS += -Dwith-zeroconf=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CRACKLIB),y)
> +NETATALK_DEPENDENCIES += cracklib
> +NETATALK_CONF_OPTS += -Dwith-cracklib=true
> +else
> +NETATALK_CONF_OPTS += -Dwith-cracklib=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_CUPS),y)
>   NETATALK_DEPENDENCIES += cups
> -NETATALK_CONF_ENV += ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
> -NETATALK_CONF_OPTS += --enable-cups
> +NETATALK_CONF_OPTS += -Dwith-appletalk=true -Dwith-cups=true
> +NETATALK_MESON_EXTRA_BINARIES += cups-config='$(STAGING_DIR)/usr/bin/cups-config'
> +else
> +NETATALK_CONF_OPTS += -Dwith-appletalk=false -Dwith-cups=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENLDAP),y)
> +NETATALK_DEPENDENCIES += openldap
> +NETATALK_CONF_OPTS += -Dwith-ldap=true
>   else
> -NETATALK_CONF_OPTS += --disable-cups
> +NETATALK_CONF_OPTS += -Dwith-ldap=false
>   endif
>   
>   define NETATALK_INSTALL_INIT_SYSV
> @@ -56,4 +84,4 @@ define NETATALK_INSTALL_INIT_SYSV
>   		$(TARGET_DIR)/etc/init.d/S50netatalk
>   endef
>   
> -$(eval $(autotools-package))
> +$(eval $(meson-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
