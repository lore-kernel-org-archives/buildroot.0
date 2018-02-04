From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Feb 2018 16:19:10 +0100
Subject: [Buildroot] [PATCH v2] Change host locale from C to en_US.UTF-8
 for reproducable builds
In-Reply-To: <20180131213629.4385-1-julius@kriukas.lt>
References: <20180128112205.15275-1-julius@kriukas.lt>
 <20180131213629.4385-1-julius@kriukas.lt>
Message-ID: <20180204151910.GD2411@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julius, All,

On 2018-01-31 23:36 +0200, Julius Kriukas spake thusly:
> When BR2_REPRODUCIBLE is enabled building systemd fails with error:
> 
> [1/1080] Generating systemd.bg.catalog with a meson_exe.py custom command.
> FAILED: catalog/systemd.bg.catalog
> /buildroot/output/host/bin/python3 /buildroot/output/host/bin/meson --internal exe /buildroot/output/build/systemd-236/build/meson-private/meson_exe_sed_232a0623cc7ce2cd67ec72ed784b76307102ed76.dat
> Warning: You are using 'ANSI_X3.4-1968' which is not a Unicode-compatible locale.
> You might see errors if you use UTF-8 strings as filenames, as strings, or as file contents.
> Please switch to a UTF-8 locale for your platform.
> ...
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xd0 in position 1079: ordinal not in range(128)
> package/pkg-generic.mk:247: recipe for target '/buildroot/output/build/systemd-236/.stamp_built' failed
> make: *** [/buildroot/output/build/systemd-236/.stamp_built] Error 1
> 
> Other packages using meson build system might fail as well.
> 
> This patch changes default host system locale from C to en_US.UTF-8 to
> fix this issue. It also introduces BR2_NEEDS_HOST_EN_US_UTF8_LOCALE
> hidden flag that checks if this locale is available on the host system.
> If locale is not available error message is show and build process is
> stopped.

Yeah, I like this change.

Yet, people that already use an UTF-8 locale (e.g fr_FR.UTF-8, or
en_GB.UTF-8 or whatever_else.UTF-8) will be very disapointed that their
build now fail when they were previously successful... :-/

But see below...

> diff --git a/Config.in b/Config.in
> index 62d67ce957..bd14226edc 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -94,6 +94,11 @@ config BR2_HOSTARCH_NEEDS_IA32_COMPILER
>  config BR2_NEEDS_HOST_UTF8_LOCALE
>  	bool
>  
> +# Hidden boolean selected by packages that explicitly need en_US.UTF-8 locale 
> +# to be available on host system.
> +config BR2_NEEDS_HOST_EN_US_UTF8_LOCALE
> +	bool

So, this option is supposed to be selectable by packages, but it is only
ever selected by the reproducible option, and never used to directly set
the locale.

What I would have expected, too, would be that systemd also selects
BR2_NEEDS_HOST_EN_US_UTF8_LOCALE, and the build commands for systemd are
changed such as (simplified for brevity):

    SYSTEMD_ENV = $(TARGET_MAKE_ENV) LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

    define SYSTEMD_CONFIGURE_CMDS
        $(SYSTEMD_ENV) meson $(SYSTEMD_CONF_OPTS) $(@D) $(@D)/build
    endef

    define SYSTEMD_BUILD_CMDS
        $(SYSTEMD_ENV) ninja $(SYSTEMD_NINJA_OPTS) -C $(@D)/build
    endef

... and so on...

>  source "arch/Config.in"
>  
>  menu "Build options"
> @@ -715,6 +720,7 @@ config BR2_REPRODUCIBLE
>  	bool "Make the build reproducible (experimental)"
>  	# SOURCE_DATE_EPOCH support in toolchain-wrapper requires GCC 4.4
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
> +	select BR2_NEEDS_HOST_EN_US_UTF8_LOCALE

If it were me, this option would ultimately disappear, and we would only
do reproducible builds. There is no point in hell to generate
non-reproducible builds... :-/

(Yeah, I know, not everyone is at ease reading tools' output messages
not in their language.)

Regards,
Yann E. MORIN.

>  	help
>  	  This option will remove all sources of non-reproducibility
>  	  from the build process. For a given Buildroot configuration,
> diff --git a/Makefile b/Makefile
> index 7d8ab51a8c..5991c6a221 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -250,8 +250,8 @@ endif
>  # timezone and locale may affect build output
>  ifeq ($(BR2_REPRODUCIBLE),y)
>  export TZ = UTC
> -export LANG = C
> -export LC_ALL = C
> +export LANG = en_US.UTF-8
> +export LC_ALL = en_US.UTF-8
>  export GZIP = -n
>  BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
>  export SOURCE_DATE_EPOCH ?= $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index a195c62c8c..4a5b55e9da 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -207,6 +207,19 @@ if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
>  	fi
>  fi
>  
> +if grep ^BR2_NEEDS_HOST_EN_US_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
> +	if ! which locale > /dev/null ; then
> +		echo
> +		echo "You need locale support on your build machine"
> +		exit 1 ;
> +	fi
> +	if ! LC_ALL=en_US.UTF-8 locale -c charmap | grep '^UTF-8$' > /dev/null; then
> +		echo
> +		echo "You need en_US.UTF-8 locale suppport on the host system"
> +		exit 1 ;
> +	fi
> +fi
> +
>  if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
>  	check_prog_host "java"
>  	JAVA_GCJ=$(java -version 2>&1 | grep gcj)
> -- 
> 2.15.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
