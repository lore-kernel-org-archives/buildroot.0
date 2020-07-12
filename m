From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:57:28 +0200
Subject: [Buildroot] [PATCH 1/1] parprouted: new package
In-Reply-To: <20200702035327.1733341-1-owen@walpole.dev>
References: <20200702035327.1733341-1-owen@walpole.dev>
Message-ID: <20200712235728.6de37171@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Owen,

Thanks for your contribution! I have applied, with a good number of
changes. See below for the details!

On Wed,  1 Jul 2020 22:53:27 -0500
Owen Walpole <owen@walpole.dev> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 4b6a346a05..c43e80193e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1924,6 +1924,9 @@ F:	package/openjpeg/
>  N:	Olivier Singla <olivier.singla@gmail.com>
>  F:	package/shellinabox/
>  
> +N:  Owen Walpole <owen@walpole.dev>
> +F:  package/parprouted/

Indentation was not correct here, it didn't follow what is used in the
rest of this file.

> diff --git a/package/Config.in b/package/Config.in
> index 6a34a895af..7186134a0e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2150,6 +2150,7 @@ endif
>  	source "package/openswan/Config.in"
>  	source "package/openvpn/Config.in"
>  	source "package/p910nd/Config.in"
> +    source "package/parprouted/Config.in"

Same here, issue with the indentation.

>  	source "package/phidgetwebservice/Config.in"
>  	source "package/phytool/Config.in"
>  	source "package/pimd/Config.in"
> diff --git a/package/parprouted/Config.in b/package/parprouted/Config.in
> new file mode 100644
> index 0000000000..fddd8de7d4
> --- /dev/null
> +++ b/package/parprouted/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_PARPROUTED
> +	bool "parprouted"
> +	depends on BR2_USE_MMU # fork()

You had a comment about a dependency on NPTL, but there was no actual
"depends on" here about NPTL.

But in fact, I tried building with a non-NPTL toolchain, and it built
just fine for me. So I've added a:

	depends on BR2_TOOLCHAIN_HAS_THREADS

here.

> +	help
> +	  parprouted is a daemon for transparent IP (Layer 3) proxy ARP
> +	  bridging. This is useful for creation of transparent firewalls
> +	  and bridging networks with different MAC protocols. Also,
> +	  unlike standard bridging, proxy ARP bridging allows to bridge
> +	  Ethernet networks behind wireless nodes without using WDS or
> +	  layer 2 bridging.
> +
> +	  https://www.hazard.maks.net/parprouted
> +
> +comment "parprouted needs a toolchain w/ NPTL"

changed this to "w/ threads"

> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL

And this to:

	depends on !BR2_TOOLCHAIN_HAS_THREADS

> diff --git a/package/parprouted/parprouted.hash b/package/parprouted/parprouted.hash
> new file mode 100644
> index 0000000000..4ac46a9230
> --- /dev/null
> +++ b/package/parprouted/parprouted.hash
> @@ -0,0 +1,7 @@
> +# Locally computed:
> +sha256  4b8cb2c801047f26b63aefaa8d69adc8552fb7c8a8f5d851798a48f841948d36  parprouted-0.65.tar.gz
> +sha512 801e5caf02960acfcea1729d146ac6f9e181873be6880f4433ea897119aa127f75809c6bfbffe6dc6fde5fd08e5f092e799925552ec8d5d289958383d0f9695a  parprouted-0.65.tar.gz
> +
> +# Hash for license files:
> +sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
> +sha512  4113ed89fc91f55762e1deeb2b7e43af124eba2e037e13b7fe794ee33f40a8b218112b8ab167b5d8778cd5532d6f2c19058df7a24799ba29ff0be2d4004262e4  COPYING

We usually have only sha256 hashes, so I dropped the sha512 hashes.

> +PARPROUTED_VERSION = 0.65

There is a newer 0.7 version, so I used that one. However, even the 0.7
version is from 2008, so it looks like this is unmaintained software,
which isn't good at all :-/

> +PARPROUTED_SITE = https://www.hazard.maks.net/parprouted
> +PARPROUTED_LICENSE = GPL-2.0

Interestingly, the COPYING file says GPL-2.0, but the actual source
code says LGPL-2.0. Since GPL-2.0 is more restrictive, I've kept that
for the license information.

> +PARPROUTED_LICENSE_FILES = COPYING
> +
> +define PARPROUTED_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> +endef
> +
> +define PARPROUTED_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/parprouted $(TARGET_DIR)/usr/sbin

Should have been:

	$(INSTALL) -D -m 0755 $(@D)/parprouted $(TARGET_DIR)/usr/sbin/parprouted

otherwise, if $(TARGET_DIR)/usr/sbin doesn't exist as a directory, you
would get a nice binary called "sbin" installed in $(TARGET_DIR)/usr !

Again, thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
