From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 17:37:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/raspi2fb: new package
In-Reply-To: <20210507193004.29928-2-dusan.ivanco@gmail.com>
References: <20210507193004.29928-2-dusan.ivanco@gmail.com>
Message-ID: <20210519153737.GD2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Du?an, All,

On 2021-05-07 21:29 +0200, dusan.ivanco at gmail.com spake thusly:
> From: Du?an Ivan?o <dusan.ivanco@gmail.com>

Thanks for your contribution. Please see a few comments below.

Fisrt, the authorship (the From: of the mail, i.e. your git author setup)
of the patch should match your Signed-off-by Line, but the From if
curently "None".

> ---
>  package/Config.in                                 |  1 +
>  package/raspi2fb/0001-vchostif-library-link.patch | 11 +++++++++++
>  package/raspi2fb/Config.in                        |  9 +++++++++
>  package/raspi2fb/raspi2fb.hash                    |  3 +++
>  package/raspi2fb/raspi2fb.mk                      | 13 +++++++++++++
>  5 files changed, 37 insertions(+)
>  create mode 100644 package/raspi2fb/0001-vchostif-library-link.patch
>  create mode 100644 package/raspi2fb/Config.in
>  create mode 100644 package/raspi2fb/raspi2fb.hash
>  create mode 100644 package/raspi2fb/raspi2fb.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index bbb31a66dc..df43a234cb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -536,6 +536,7 @@ endmenu
>  	source "package/pru-software-support/Config.in"
>  	source "package/pulseview/Config.in"
>  	source "package/raspi-gpio/Config.in"
> +	source "package/raspi2fb/Config.in"
>  	source "package/read-edid/Config.in"
>  	source "package/rng-tools/Config.in"
>  	source "package/rpi-userland/Config.in"
> diff --git a/package/raspi2fb/0001-vchostif-library-link.patch b/package/raspi2fb/0001-vchostif-library-link.patch
> new file mode 100644
> index 0000000000..7dc13534e2
> --- /dev/null
> +++ b/package/raspi2fb/0001-vchostif-library-link.patch

Bunddled patches should also have a proper commit log: title,
explanations, and sign-off. And since upstream is a git repository, we
prefer that the bundled patch be git-formatted too.

Also, please try to submit that patch upstream: that way, when we update
raspi2fb in the future, the patch will be applied uptream and we can
drop our bundled one.

> @@ -0,0 +1,11 @@
> +--- a/CMakeLists.txt	2020-01-01 00:00:00.000000000 +0000
> ++++ b/CMakeLists.txt	2020-01-01 00:00:00.000000000 +0000
> +@@ -6,7 +6,7 @@
> + 
> + set(BCM_HOST_INCLUDE_DIRS /opt/vc/include)
> + set(BCM_HOST_LIBRARY_DIRS /opt/vc/lib)
> +-set(BCM_HOST_LIBRARIES bcm_host)
> ++set(BCM_HOST_LIBRARIES bcm_host vchostif)
> + 
> + find_package(PkgConfig)
> + pkg_check_modules(LIBBSD libbsd)
> diff --git a/package/raspi2fb/Config.in b/package/raspi2fb/Config.in
> new file mode 100644
> index 0000000000..ab144c2d1a
> --- /dev/null
> +++ b/package/raspi2fb/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_RASPI2FB
> +	bool "raspi2fb"
> +	select BR2_PACKAGE_LIBBSD
> +	select BR2_PACKAGE_RPI_USERLAND

lbbsd and rpi-userland have depenencies of their own, which are not
automatically propagated when you 'select' them; this must be done
manually, with a comment explaining the dependency:

    depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS  # libbsd
    depends on !BR2_STATIC_LIBS  # libbsd, rpi-userland

and so on...

Can you please fix that and resend?

Regards,
Yann E. MORIN.

> +	help
> +	  Program to copy the Raspberry Pi display
> +	  to a secondary framebuffer.
> +
> +	  https://github.com/AndrewFromMelbourne/raspi2fb
> diff --git a/package/raspi2fb/raspi2fb.hash b/package/raspi2fb/raspi2fb.hash
> new file mode 100644
> index 0000000000..6e14c2f5d1
> --- /dev/null
> +++ b/package/raspi2fb/raspi2fb.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256 713a73e99268ad4557b522513ddaef8de3431aee9f7eb338f3cbff5a036d776f  raspi2fb-7e1bae71c5af88240f7eb89a924161c7ee0b00f5.tar.gz
> +sha256 afbc87568aa5a3108fc85b60015dd9346108dd77f588cd5c62d3385577519c4c  LICENSE
> diff --git a/package/raspi2fb/raspi2fb.mk b/package/raspi2fb/raspi2fb.mk
> new file mode 100644
> index 0000000000..b9732e9a51
> --- /dev/null
> +++ b/package/raspi2fb/raspi2fb.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# raspi2fb
> +#
> +################################################################################
> +
> +RASPI2FB_VERSION = 7e1bae71c5af88240f7eb89a924161c7ee0b00f5
> +RASPI2FB_SITE = $(call github,AndrewFromMelbourne,raspi2fb,$(RASPI2FB_VERSION))
> +RASPI2FB_LICENSE = MIT
> +RASPI2FB_LICENSE_FILES = LICENSE
> +RASPI2FB_DEPENDENCIES = libbsd rpi-userland
> +
> +$(eval $(cmake-package))
> -- 
> 2.21.1 (Apple Git-122.3)
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
