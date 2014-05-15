From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 May 2014 22:45:20 +0200
Subject: [Buildroot] [PATCH] Add Mono native/managed package.
In-Reply-To: <1400184577-3138-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1400184577-3138-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20140515204520.GC3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2014-05-15 22:09 +0200, Angelo Compagnucci spake thusly:
> This package builds both the native and managed part
> with all standard libraries and provides a complete
> mono environment.

Thank you for this patch! :-)

I have a few comments, see below.

> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/Config.in                         |  1 +
>  package/mono/Config.in                    |  7 +++++++
>  package/mono/mono-managed/mono-managed.mk | 26 ++++++++++++++++++++++++++
>  package/mono/mono-native/mono-native.mk   | 19 +++++++++++++++++++
>  package/mono/mono.mk                      | 17 +++++++++++++++++
>  5 files changed, 70 insertions(+)
>  create mode 100644 package/mono/Config.in
>  create mode 100644 package/mono/mono-managed/mono-managed.mk
>  create mode 100644 package/mono/mono-native/mono-native.mk
>  create mode 100644 package/mono/mono.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 3bc8d24..52dc8f5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -478,6 +478,7 @@ endmenu
>  endif
>  source "package/ruby/Config.in"
>  source "package/tcl/Config.in"
> +source "package/mono/Config.in"

Please keep alphabetical ordering: mono comes between lua and nodejs.

>  if BR2_PACKAGE_TCL
>  menu "tcl libraries/modules"
>  source "package/expect/Config.in"
> diff --git a/package/mono/Config.in b/package/mono/Config.in
> new file mode 100644
> index 0000000..1fd45d9
> --- /dev/null
> +++ b/package/mono/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_MONO
> +	bool "mono"
> +	select BR2_STRIP_none
> +	help
> +		An open source, cross-platform, implementation of C# and the CLR that is binary compatible with Microsoft.NET.
> +
> +		http://download.mono-project.com/sources/mono/

For the help text, theindentation is one tab plus two spaces, not two
tabs.

> diff --git a/package/mono/mono-managed/mono-managed.mk b/package/mono/mono-managed/mono-managed.mk
> new file mode 100644
> index 0000000..94be274
> --- /dev/null
> +++ b/package/mono/mono-managed/mono-managed.mk
> @@ -0,0 +1,26 @@
> +#############################################################
> +#
> +# mono-managed
> +#
> +#############################################################
> +
> +MONO_MANAGED_VERSION          = $(MONO_VERSION)
> +MONO_MANAGED_SITE             = $(MONO_SITE)
> +MONO_MANAGED_SOURCE           = $(MONO_SOURCE)

Do not line-up assignments, just do:

    MONO_MANAGED_VERSION = $(MONO_VERSION)
    MONO_MANAGED_SITE = $(MONO_SITE)
    MONO_MANAGED_SOURCE = $(MONO_SOURCE)

> +HOST_MONO_MANAGED_CONF_OPT = \
> +	$(MONO_CONF_OPT) \
> +	--enable-static

For so few options, put them on a single line:

    HOST_MONO_MANAGED_CONF_OPT = $(MONO_CONF_OPT) --enable-static

Why do you need --enable-static ? Generally, for the host tools, we do
not care that they be shared, and we do usually build them shared.

> +define MONO_MANAGED_GETMONOLITE
> +     $(MAKE) -C $(@D) get-monolite-latest
> +endef

Does it mean that some downloading is done _after_ the configure step?
Can't we do that during the download step, eg:

    define MONO_MANAGED_GET_MONOLITE
        $(call DOWNLOAD,url-of-monolite-archive)
    endef
    MONO_MANAGED_POST_DOWNLOAD_HOOKS += MONO_MANAGED_GET_MONOLITE

Or something like that?

In Buildroot, we expect that running "make source" will download
everything, and no access to the network is needed after that.

> +define MONO_MANAGED_INSTALL
> +     cp -av $(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
> +endef
> +
> +HOST_MONO_MANAGED_POST_CONFIGURE_HOOKS += MONO_MANAGED_GETMONOLITE
> +HOST_MONO_MANAGED_POST_INSTALL_HOOKS   += MONO_MANAGED_INSTALL

Keep the hooks assignments just below the definitions.

> +$(eval $(host-autotools-package))
> diff --git a/package/mono/mono-native/mono-native.mk b/package/mono/mono-native/mono-native.mk
> new file mode 100644
> index 0000000..3d6b3bf
> --- /dev/null
> +++ b/package/mono/mono-native/mono-native.mk
> @@ -0,0 +1,19 @@
> +#############################################################
> +#
> +# mono-native
> +#
> +#############################################################
> +
> +MONO_NATIVE_VERSION = $(MONO_VERSION)
> +MONO_NATIVE_SITE    = $(MONO_SITE)
> +MONO_NATIVE_SOURCE  = $(MONO_SOURCE)
> +MONO_NATIVE_INSTALL_STAGING = $(MONO_INSTALL_STAGING)

Ditto: do not allign assignments.

> +MONO_NATIVE_DEPENDENCIES += host-mono-managed
> +
> +# Disable managed code (mcs folder) from building
> +MONO_NATIVE_CONF_OPT = \
> +	$(MONO_CONF_OPT) \
> +	--disable-mcs-build

Ditto: on a single line.

> +$(eval $(autotools-package))
> diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> new file mode 100644
> index 0000000..7706190
> --- /dev/null
> +++ b/package/mono/mono.mk
> @@ -0,0 +1,17 @@
> +#############################################################
> +#
> +# mono
> +#
> +#############################################################
> +
> +MONO_VERSION	= 3.2.8
> +MONO_SITE	= http://download.mono-project.com/sources/mono/
> +MONO_SOURCE	= mono-$(MONO_VERSION).tar.bz2
> +MONO_INSTALL_STAGING = YES

Ditto alignment.

> +MONO_CONF_OPT = --disable-gtk-doc --with-mcs-docs=no 
> +
> +ifeq ($(BR2_PACKAGE_MONO),y)
> +	include package/mono/*/*.mk
> +	TARGETS += mono-native mono-managed
> +endif

That last assigment to TARGETS in the if-block is absolutely unneeded:
the $(eval $(autotools-package)) lines will do it automatically. You
should just remove the TARGETS assign,ment and the if-block, to keep
only:

    include package/mono/*/*.mk

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
