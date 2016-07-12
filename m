From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 22:44:36 +0200
Subject: [Buildroot] help please
In-Reply-To: <CAAfO8NyXP5-PFMoC3bN7v8NRD+jzcvgtBfgZZXKijGquARhU8Q@mail.gmail.com>
References: <CAAfO8NyXP5-PFMoC3bN7v8NRD+jzcvgtBfgZZXKijGquARhU8Q@mail.gmail.com>
Message-ID: <20160712204436.GE3680@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, All,

On 2016-07-12 15:06 -0400, Mike King spake thusly:
> I am hoping someone will help me.  I am trying to create a package for
> linux-gpib.

Reminds me of something... ;-)

> I can get it to configure and build but not install. I
> have listed below the package files that I have created. I am not an
> autotools expert.

Pease also paste the build log (what you see in the console) starting
with the message:

    >>> linux-gpib 4.0.3 Configuring

up until the bottom.

> ###Config.in FILE###
> config BR2_PACKAGE_LINUX_GPIB
> bool "linux-gpib"

It also probably needs to depend on BR2_LINUX_KERNEL since it builds a
kernel module.

> help
>  The Linux GPIB Package is a support package for GPIB (IEEE 488) hardware.
>  The package contains kernel driver modules, and a C user-space library with
>  Guile, Perl, PHP, Python and TCL bindings. The API of the C library is intended
>  to be compatible with National Instrument's GPIB library.
> 
>  http://linux-gpib.sourceforge.net
> 
> ###linux-gpib.mk FILE###
> ################################################################################
> #
> # linux-gpib
> #
> ################################################################################
> 
> LINUX_GPIB_VERSION = 4.0.3
> LINUX_GPIB_SITE = http://downloads.sourceforge.net/project/linux-gpib/linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/$(LINUX_GPIB_VERSION)
> LINUX_GPIB_SOURCE = linux-gpib-$(LINUX_GPIB_VERSION).tar.gz
> LINUX_GPIB_LICENSE = GPLv2
> LINUX_GPIB_LICENSE_FILES = COPYING
> LINUX_GPIB_INSTALL_STAGING = YES
> LINUX_GPIB_AUTORECONF = YES
> LINUX_GPIB_CONF_OPTS = --with-linux-srcdir=$(LINUX_DIR)/
> 
> $(eval $(autotools-package))

Nothing really awfull here. Looks sane.

> ###PATCH FILE###
> --- linux-gpib-4.0.3/configure.ac 2016-04-09 13:34:55.000000000 +0000
> +++ linux-gpib-4.0.3/configure.ac.new 2016-07-05 01:37:47.524290832 +0000
> @@ -30,9 +30,10 @@
>  [ISODATE=`date +%Y-%m-%d`]
>  AC_SUBST([ISODATE])
> 
> -AC_CHECK_FILE([util/.scm_version.tmp],
> -  [SCM_VERSION=[$VERSION"\ [r"`cat util/.scm_version.tmp`"]"]],
> -  [SCM_VERSION=$VERSION])
> +#AC_CHECK_FILE([util/.scm_version.tmp],
> +#  [SCM_VERSION=[$VERSION"\ [r"`cat util/.scm_version.tmp`"]"]],
> +#  [SCM_VERSION=$VERSION])
> +SCM_VERSION=4.0.3
> 
>  AC_SUBST(SCM_VERSION)
> 
> --- linux-gpib-4.0.3/drivers/Makefile.am 2016-04-09 09:33:14.000000000 -0400
> +++ linux-gpib-4.0.3/drivers/Makefile.am.new 2016-07-09 11:13:37.356298300 -0400
> @@ -28,7 +28,7 @@
>   CC="$(LINUX_CC) -I at abs_top_srcdir@
> -I at abs_top_srcdir@/drivers/gpib/include -I at abs_top_srcdir@/include" \
>   SUBDIRS="$(GPIB_ABS_MODULE_SUBDIR)"
> 
> -install-data-hook: device-file-check /etc/gpib.conf
> +install-data-hook:
>   $(MAKE) -C $(LINUX_SRCDIR) V=1 modules_install\
>   CC="$(LINUX_CC) -I at abs_top_srcdir@ -I at abs_top_srcdir@/driver/include
> -I at abs_top_srcdir@/include" \
>   SUBDIRS="$(GPIB_ABS_MODULE_SUBDIR)" INSTALL_MOD_DIR="gpib"

Hmm... If this command is actually executed at install time, then it
looks like it is trying to install in the build machine's modules dir,
since it does not specify INSTALL_MOD_PATH

Is that the command that fails?

As stated above, please post the full build log, starting with the
configure message. It will easier to help if we can *see* the actual
error.

Otherwise, we also have an infrastructure to build a kernel module,
similar to the other package infras. Look for 'kernel-module' in the
manual.

Regards,
Yann E. MORIN.

> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
