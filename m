From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:43:21 +0200
Subject: [Buildroot] [PATCH 1/1] introduce nwipe package
In-Reply-To: <1444796918-22912-1-git-send-email-chaduffy@cisco.com>
References: <1444796918-22912-1-git-send-email-chaduffy@cisco.com>
Message-ID: <20151014234321.2c404ee5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Duffy,

Thanks for your contribution. See some comments below.

On Tue, 13 Oct 2015 23:28:38 -0500, Charles Duffy wrote:

> diff --git a/package/nwipe/Config.in b/package/nwipe/Config.in
> new file mode 100644
> index 0000000..0cecd25
> --- /dev/null
> +++ b/package/nwipe/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_NWIPE
> +	bool "nwipe"
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_NCURSES

You also need to select parted here if you depend on it, as suggested
by your NWIPE_DEPENDENCIES variable below.

> +	help
> +	  nwipe thoroughly overwrites block devices, forked from a component at
> +	  the core of the venerable DBAN.
> +	
> +	  https://github.com/martijnvanbrummelen/nwipe
> diff --git a/package/nwipe/nwipe.mk b/package/nwipe/nwipe.mk
> new file mode 100644
> index 0000000..18efb22
> --- /dev/null
> +++ b/package/nwipe/nwipe.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# nwipe
> +#
> +################################################################################
> +
> +NWIPE_VERSION = 0.17
> +NWIPE_SITE = https://github.com/martijnvanbrummelen/nwipe
> +NWIPE_SITE_METHOD = git

Use the github helper function instead. This way, you can remove the
NWIPE_SITE_METHOD variable and simply do:

NWIPE_SITE = $(call github,martijnvanbrummelen,nwipe,$(NWIPE_VERSION))

> +NWIPE_DEPENDENCIES = ncurses parted
> +NWIPE_CONF_OPTS = --bindir=/bin

Why do you need to override --bindir ?

> +NWIPE_LICENSE = GPL

You should specify the GPL version. In the case of this program, it's
GPLv2.

> +NWIPE_LICENSE_FILES = LICENCE

There is no file named 'LICENCE' in the repository. Use COPYING instead.

> +
> +define NWIPE_RUN_AUTOGEN
> +	cd $(@D) && { printf '%s\n' '44a' 'AC_CHECK_LIB([intl], [libintl_dgettext]) # needed by static builds of libparted' 'AC_CHECK_LIB([uuid], [uuid_generate]) # needed by static builds of libparted' '.' 'w' | edit configure.ac; }

Ouch, this is not pretty. What are you trying to do here exactly ?
Could you instead do a patch ?

> +	cd $(@D) && PATH=$(BR_PATH) ./init.sh

Please use:

NWIPE_AUTORECONF = YES

instead. Your solution doesn't work because you do not have the
guarantee that autoconf/automake/libtool will be available, while
<pkg>_AUTORECONF =  YES ensures that all the necessary dependencies
will be available.

> +endef
> +NWIPE_PRE_CONFIGURE_HOOKS += NWIPE_RUN_AUTOGEN
> +
> +# to fix support for MUSL
> +define NWIPE_USE_OFF64T
> +	cd $(@D) && find . -type f -name '*.[ch]' -exec sed -i -r -e 's/loff_t/off64_t/g' -- '{}' +

Same, could you do a patch instead, and submit it upstream? github
makes it very easy to submit pull requests to the projects. I see you
already submitted an issue
(https://github.com/martijnvanbrummelen/nwipe/issues/11), but maybe a
pull request with a patch would help?

Regarding https://github.com/martijnvanbrummelen/nwipe/issues/12 (i.e
missing intl and uuid), I think the proper solution is not your patch,
but instead to use pkg-config to detect parted. I.e, replace:

AC_CHECK_LIB([parted], [ped_device_probe_all], ,[AC_MSG_ERROR([parted development library not found])])

by something like:

PKG_CHECK_MODULES([PARTED], [libparted])

Also, I see that the configure.ac already uses PKG_CHECK_MODULES() for
other libraries, so you should add host-pkgconf in NWIPE_DEPENDENCIES.

Finally, please add a nwipe.hash file that contains the sha256 hash of
the downloaded tarball (yes, when you use the github helper function as
suggested above, it's really a tarball that gets downloaded over HTTP,
and not a Git clone that gets done).

Could you submit an updated version of your patch that takes into
account those comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
