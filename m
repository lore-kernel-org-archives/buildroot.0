From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jun 2017 15:53:20 +0200
Subject: [Buildroot] [PATCH] systemd: allow to build with uClibc
 toolchains
In-Reply-To: <20170625110003.GA8387@waldemar-brodkorb.de>
References: <20170625110003.GA8387@waldemar-brodkorb.de>
Message-ID: <20170625155320.2103aa9b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Jun 2017 13:00:04 +0200, Waldemar Brodkorb wrote:
> Both patches where applied upstream.
> We need to disable any systemd parts using either IDN or NSS.
> (IDN in getaddrinfo()/getnaminfo())
> 
> Tested in qemu-system-arm using defconfig.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Nice! Thanks for working on this. A couple of questions/comments below,
though.


> diff --git a/package/systemd/0004-Make-IDN-support-conditional.patch b/package/systemd/0004-Make-IDN-support-conditional.patch
> new file mode 100644
> index 0000000..29afe9c
> --- /dev/null
> +++ b/package/systemd/0004-Make-IDN-support-conditional.patch
> @@ -0,0 +1,71 @@
> +From 6326a143263fc460bbda871d6e74b1d7d2841ea1 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Thu, 15 Jun 2017 17:44:59 +0200
> +Subject: [PATCH] Make IDN support conditional
> +
> +[zj: rename HAVE_IDN to ENABLE_IDN]
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

If those patches are upstream, having the upstream URL in here is nice.

> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 478cc10..e1b66f9 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -188,6 +188,7 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
>  
>  config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
>  	bool "enable myhostname NSS plugin"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>  	default y
>  	help
>  	  nss-myhostname is a plug-in module for the GNU Name Service
> @@ -243,6 +244,7 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
>  
>  config BR2_PACKAGE_SYSTEMD_RESOLVED
>  	bool "enable resolve daemon"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>  	default y
>  	help
>  	  systemd-resolved is a system service that provides network
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 153d615..e8731b6 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -43,6 +43,15 @@ SYSTEMD_CONF_OPTS += \
>  	--with-default-dnssec=no \
>  	--without-python
>  
> +# disable unsupported features using NSS or IDN
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +SYSTEMD_CONF_OPTS += \
> +	--disable-resolved \
> +	--disable-myhostname \
> +	--disable-idn \
> +	--disable-nss-systemd

This is not really good.

First, --disable-resolved and --disable-myhostname are not needed,
because you have added the "depends on !BR2_TOOLCHAIN_USES_UCLIBC" to
those options. Therefore, they cannot be selected, which means the
existing code:

ifeq ($(BR2_PACKAGE_SYSTEMD_MYHOSTNAME),y)
SYSTEMD_CONF_OPTS += --enable-myhostname
else
SYSTEMD_CONF_OPTS += --disable-myhostname
endif

ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
SYSTEMD_CONF_OPTS += --enable-resolved
SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
else
SYSTEMD_CONF_OPTS += --disable-resolved
endif

will already pass --disable-resolved/--disable-myhostname.

For --disable-idn, I'm wondering about the interaction with
--{enable,disable}-libidn that we already have. Are these independent?

Also, can we have both the enable/disable logic for those options,
something like:

ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 ... enable whatever requires glibc specific stuff
else
 ... disable whatever requires glibc specific stuff
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
