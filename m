From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Jul 2011 09:43:07 +0200
Subject: [Buildroot] [PATCH 2/3] util-linux: convert to autotarget and
	bump to 2.19.1
In-Reply-To: <4E298ED8.5000901@visionsystems.de> (Yegor Yefremov's message of
 "Fri, 22 Jul 2011 16:53:12 +0200")
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de> <4E298ED8.5000901@visionsystems.de>
Message-ID: <87wrf4tbhw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Thanks, committed with some changes (see below).

 Yegor> Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
 Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 Yegor> ---
 Yegor>  package/util-linux/Config.in                                            |  113 ++
 Yegor>  package/util-linux/util-linux-2.13-pre17-hardcode-a-out-constants.patch |   41 
 Yegor>  package/util-linux/util-linux-no-nls-fix.patch                          |   25 
 Yegor>  package/util-linux/util-linux-susv3-legacy.patch                        |  429 ----------
 Yegor>  package/util-linux/util-linux-uclibc-build-fix.patch                    |   16 
 Yegor>  package/util-linux/util-linux-umount2-fix.patch                         |   20 
 Yegor>  package/util-linux/util-linux.mk                                        |  180 ++--
 Yegor>  7 files changed, 230 insertions(+), 594 deletions(-)

 Yegor> Index: b/package/util-linux/Config.in
 Yegor> ===================================================================
 Yegor> --- a/package/util-linux/Config.in
 Yegor> +++ b/package/util-linux/Config.in
 Yegor> @@ -1,4 +1,4 @@
 Yegor> -config BR2_PACKAGE_UTIL-LINUX
 Yegor> +config BR2_PACKAGE_UTIL_LINUX
 Yegor>  	bool "util-linux"
 Yegor>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 Yegor>  	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE

After some tests I see that gettext/libintl/rpc aren't needed, but
instead largefile+wchar+program_invocation are.

 Yegor> @@ -12,3 +12,114 @@
 
 Yegor>  comment "util-linux requires a toolchain with RPC support"
 Yegor>  	depends on !BR2_INET_RPC
 Yegor> +
 Yegor> +menu "util-linux tool support"
 Yegor> +	depends on BR2_PACKAGE_UTIL_LINUX

I dislike all the sub menus, so I instead made all these suboptions to
util-linux instead.

 Yegor> +++ b/package/util-linux/util-linux.mk

 Yegor> +#############################################
 Yegor> +#
 Yegor> +# disable default utilities
 Yegor> +#
 Yegor> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_MOUNT),n)
 Yegor> +UTIL_LINUX_CONF_OPT += --disable-mount
 Yegor>  endif

I've reworked these to the less verbose form:

     $(if $(BR2_PACKAGE_UTIL_LINUX_blah),,--disable-blah)


 Yegor> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),n)
 Yegor> +UTIL_LINUX_CONF_OPT += --disable-libblkid
 Yegor> +endif

Typo.

You seem to have forgotten unshare.

-- 
Bye, Peter Korsgaard
