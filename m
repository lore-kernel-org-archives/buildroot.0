From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:19:26 +0200
Subject: [Buildroot] [PATCH 1/1] monkey: new package
In-Reply-To: <db63e621-3318-439a-9bbe-6bbc26980f84@MAIL-SINTERS-01.sinters-int.fr>
References: <db63e621-3318-439a-9bbe-6bbc26980f84@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <20150626201926.1cfe52a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, Morgan,

On Fri, 26 Jun 2015 15:37:36 +0000, Julien CORJON wrote:

> diff --git a/package/monkey/0001-Configure-accept-all-conf.patch b/package/monkey/0001-Configure-accept-all-conf.patch
> new file mode 100644
> index 0000000..471e25b
> --- /dev/null
> +++ b/package/monkey/0001-Configure-accept-all-conf.patch

All patches should have a description + Signed-off-by. See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.


> diff --git a/package/monkey/Config.in b/package/monkey/Config.in
> new file mode 100644
> index 0000000..519fd65
> --- /dev/null
> +++ b/package/monkey/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_MONKEY
> +        bool "monkey"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

Wrong indentation, should be one tab.

> +        help
> +          Money Server is a fast and lightweight web server for Linux platforms.
> +
> +          http://monkey-project.com/
> +
> +comment "monkey needs an (e)glibc toolchain w/ threads, headers >= 2.6"

No need to indicate headers >= 2.6.

> +        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
> diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
> new file mode 100644
> index 0000000..20ce048
> --- /dev/null
> +++ b/package/monkey/monkey.mk
> @@ -0,0 +1,20 @@
> +#############################################################
> +#
> +# monkey
> +#
> +#############################################################

Wrong number of # signs, there should be 80 of them.

> +MONKEY_VERSION_MAJOR = 1
> +MONKEY_VERSION_MINOR = 5
> +MONKEY_VERSION_PATCH = 6
> +MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).$(MONKEY_VERSION_MINOR).$(MONKEY_VERSION_PATCH)

No need to split that much:

MONKEY_VERSION_MAJOR = 1.5
MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).6

> +MONKEY_SOURCE = monkey-$(MONKEY_VERSION).tar.gz
> +MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR).$(MONKEY_VERSION_MINOR)/

And:

MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)/

> +MONKEY_INSTALL_STAGING = YES
> +MONKEY_INSTALL_TARGET = YES

MONKEY_INSTALL_TARGET = YES is not needed, that's the default.

> +
> +# Monkey default memory allocator should be jemalloc
> +# but monkey configure script does not handle
> +# cross-compilation in a good way
> +MONKEY_CONF_OPTS =--malloc-libc
> +
> +$(eval $(call autotools-package))

No need for $(eval $(call ...)), just $(eval $(autotools-package)).

Also, this package is not using the autotools, so please don't use
autotools-package but generic-package instead. This way, your patch
will also no longer be needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
