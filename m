From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Aug 2016 12:52:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/simh: new package
In-Reply-To: <1471297357-11637-1-git-send-email-lothar.felten@gmail.com>
References: <1471297357-11637-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160816105238.GA10734@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lothar, All,

On 2016-08-15 23:42 +0200, Lothar Felten spake thusly:
> This package provides the simh multi-system emulator.

As discussed on IRC, there are too many issues with this package.

For example, it does not support cross-compilation at all; its Makefile
is so borked that it looks for build system libs and headers; it also
searches the build system for necessary programs.

I can't see an easy solution to use that package as-is to make it
behave properly (if at all). It does not seem it would be overly complex
to rewrite a buildsystem for it from scratch, using one of the usual
buildsystems: autotools or cmake for example.

Until then, and according to our discussion on IRC I've marked this
patch as rejected in our patchwork.

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>  package/Config.in      |  1 +
>  package/simh/Config.in |  6 ++++++
>  package/simh/simh.hash |  2 ++
>  package/simh/simh.mk   | 21 +++++++++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/simh/Config.in
>  create mode 100644 package/simh/simh.hash
>  create mode 100644 package/simh/simh.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 645fa29..993b446 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -219,6 +219,7 @@ menu "Games"
>  	source "package/opentyrian-data/Config.in"
>  	source "package/prboom/Config.in"
>  	source "package/rubix/Config.in"
> +	source "package/simh/Config.in"
>  	source "package/sl/Config.in"
>  	source "package/stella/Config.in"
>  	source "package/supertuxkart/Config.in"
> diff --git a/package/simh/Config.in b/package/simh/Config.in
> new file mode 100644
> index 0000000..bcf6a3d
> --- /dev/null
> +++ b/package/simh/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_SIMH
> +	bool "simh"
> +	help
> +	  SIMH is a highly portable, multi-system simulator.
> +
> +	  http://simh.trailing-edge.com
> diff --git a/package/simh/simh.hash b/package/simh/simh.hash
> new file mode 100644
> index 0000000..b9fd211
> --- /dev/null
> +++ b/package/simh/simh.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 fd960602a3996b387066e9458e22d3bea940e88378afddc6ee81f33bf854efb9 simh-e93b55b4887dfcf1d0dd6ff86f94470e42a10702.tar.gz
> diff --git a/package/simh/simh.mk b/package/simh/simh.mk
> new file mode 100644
> index 0000000..f650c69
> --- /dev/null
> +++ b/package/simh/simh.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# simh
> +#
> +################################################################################
> +
> +SIMH_VERSION = e93b55b4887dfcf1d0dd6ff86f94470e42a10702
> +SIMH_SITE = https://github.com/simh/simh
> +SIMH_SITE_METHOD = git
> +SIMH_LICENSE = simh license
> +SIMH_LICENSE_FILES = README
> +
> +define SIMH_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define SIMH_INSTALL_TARGET_CMDS
> +	cp -dpf $(@D)/BIN/* $(TARGET_DIR)/usr/bin/
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.9.1
> 
> _______________________________________________
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
