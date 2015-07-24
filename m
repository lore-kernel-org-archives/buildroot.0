From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 24 Jul 2015 08:14:26 +0300
Subject: [Buildroot] [PATCH v4 1/1] mosh: new package
In-Reply-To: <1437688804-26537-1-git-send-email-christian@paral.in>
References: <1437688804-26537-1-git-send-email-christian@paral.in>
Message-ID: <20150724051425.GS13027@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Thu, Jul 23, 2015 at 03:00:04PM -0700, Christian Stewart wrote:
> diff --git a/package/mosh/Config.in b/package/mosh/Config.in
> new file mode 100644
> index 0000000..da5aa10
> --- /dev/null
> +++ b/package/mosh/Config.in
> @@ -0,0 +1,28 @@
> +
> +comment "mosh needs openssh and openssl to be built"
> +	depends on !BR2_PACKAGE_OPENSSH || !BR2_PACKAGE_OPENSSL
> +
> +comment "mosh works on arm, i386, mipsel, or x64 architectures"
> +	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64

Target architecture dependency comments are not very helpful, since the user 
can't do much about it is most cases. Moreover the other dependency comment 
should only show when the target architecture is supported.

> +
> +comment "mosh needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "mosh needs a host architecture of x64 or x86"
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +
> +config BR2_PACKAGE_MOSH
> +	bool "mosh"
> +	depends on BR2_PACKAGE_OPENSSL
> +	depends on BR2_PACKAGE_OPENSSH

I still think this two should be 'select'.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	select BR2_PACKAGE_PROTOBUF
> +	select BR2_PACKAGE_NCURSES
> +	help
> +	  Remote terminal application that supports intermittent connectivity,
> +	  allows roaming, and provides speculative local echo and line editing
> +	  of user keystrokes.
> +
> +	  https://github.com/keithw/mosh
> diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
> new file mode 100644
> index 0000000..1dfc1ba
> --- /dev/null
> +++ b/package/mosh/mosh.hash
> @@ -0,0 +1 @@
> +sha256 35025d412046ee5199ebaa8d876131fc683dccedde18b3945b3bc3662bc9f373  mosh-1.2.5.tar.gz

This doesn't match the hash mentioned at 
https://github.com/keithw/mosh/releases/tag/mosh-1.2.5. This is most likely 
due to your use of git checkout. Please use the official release tarballs, 
either https://mosh.mit.edu/mosh-1.2.5.tar.gz or 
https://github.com/keithw/mosh/releases/download/mosh-1.2.5/mosh-1.2.5.tar.gz. 
Both match tag message hash.

> diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
> new file mode 100644
> index 0000000..1c58e05
> --- /dev/null
> +++ b/package/mosh/mosh.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# mosh
> +#
> +################################################################################
> +
> +MOSH_VERSION = 1.2.5
> +MOSH_SITE = $(call github,keithw,mosh,mosh-$(MOSH_VERSION))
> +MOSH_DEPENDENCIES = zlib ncurses protobuf openssl
> +MOSH_LICENSE = GPLv3+

License exceptions?

> +MOSH_LICENSE_FILES = COPYING COPYING.iOS
> +
> +# Necessary as we are pulling from Git.
> +MOSH_AUTORECONF = YES

The official tarball should not need autoreconf.

> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
