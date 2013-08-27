From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 27 Aug 2013 16:27:39 +0200
Subject: [Buildroot] [1/1] civetweb: new package
In-Reply-To: <CAG3-AMr2_Aj+Xv0A13fWawcDTUToCnt72LWyzwTLVKK+4m+++w@mail.gmail.com>
References: <CAG3-AMr2_Aj+Xv0A13fWawcDTUToCnt72LWyzwTLVKK+4m+++w@mail.gmail.com>
Message-ID: <CAAXf6LX52MBd8Lrp4eho=Vkdo=QVyZ4=aytMJu3dY6w0EwoJkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Aug 27, 2013 at 3:32 PM, Thomas Davis <sunsetbrew@sunsetbrew.com> wrote:
> Sorry if this a repeat.  I tried submitting this via git like specified in
> the documentation but I think it was not working.  I checked the archive and
> there was no posting for it and not on pachwork either.
>
> Thomas
>
> From 2dbba731f6b647ee0943c4fa46756f1f8c4a76b5 Mon Sep 17 00:00:00 2001
> From: Thomas Davis <sunsetbrew@sunsetbrew.com>
> Date: Sat, 24 Aug 2013 06:43:28 -0400
> Subject: [PATCH 1/1] Added civetweb package
>
>
> Signed-off-by: Thomas Davis <sunsetbrew@sunsetbrew.com>
> ---
>  package/Config.in            |    1 +
>  package/civetweb/Config.in   |   34 +++++++++++++++++++++++++++++
>  package/civetweb/civetweb.mk |   48
> ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 83 insertions(+), 0 deletions(-)
>  create mode 100644 package/civetweb/Config.in
>  create mode 100644 package/civetweb/civetweb.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 7069d77..25433b6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -719,6 +719,7 @@ source "package/bridge-utils/Config.in"
>  source "package/bwm-ng/Config.in"
>  source "package/can-utils/Config.in"
>  source "package/chrony/Config.in"
> +source "package/civetweb/Config.in"
>  source "package/connman/Config.in"
>  source "package/crda/Config.in"
>  source "package/ctorrent/Config.in"
> diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
> new file mode 100644
> index 0000000..5285b09
> --- /dev/null
> +++ b/package/civetweb/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_PACKAGE_CIVETWEB
> + bool "civetweb"
> + depends on BR2_TOOLCHAIN_BUILDROOT_UCLIBC && !BR2_PTHREADS_NONE

What is the reason for this uclibc check?

> + help
> +  Full featured embedded web server with LUA support.
> +
> +  https://sourceforge.net/projects/civetweb
> +
> +if BR2_PACKAGE_CIVETWEB
> +
> + config BR2_CIVETWEB_WITH_IPV6
> + bool "enable IPV6 support"
> + depends on BR2_INET_IPV6
> +
> + config BR2_CIVETWEB_WITH_LUA
> + bool "enable LUA support"
> + depends on BR2_LARGEFILE # util-linux
> +
> + config BR2_CIVETWEB_WITH_SSL
> + bool "enable SSL support"
> + depends on BR2_PACKAGE_OPENSSL
> +
> + comment "civetweb IPV6 support requires IPV6"
> + depends on !BR2_INET_IPV6
> +
> + comment "civetweb LUA support requires large file support"
> + depends on !BR2_LARGEFILE
> +
> + comment "civetweb SSL support requires OpenSSL"
> + depends on !BR2_PACKAGE_OPENSSL
> +endif
> +
> +comment "civetweb requires a toolchain with PTHREAD support"
> + depends on !BR2_TOOLCHAIN_BUILDROOT_UCLIBC || BR2_PTHREADS_NONE
> diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
> new file mode 100644
> index 0000000..3f81aeb
> --- /dev/null
> +++ b/package/civetweb/civetweb.mk
> @@ -0,0 +1,48 @@
> +#
> +# Copyright (c) 2013 No Face Press, LLC
> +# License http://opensource.org/licenses/mit-license.php MIT License

Could you explain why you added this comment?
Do you want to add your copyright statement to this .mk file?

And what about the MIT license? Buildroot is GPL, so any .mk file in
it will also be GPL. Do you want to dual-license this file?

> +#
> +################################################################################
> +#
> +# civetweb
> +#
> +################################################################################
> +
> +CIVETWEB_VERSION = 1.2
> +CIVETWEB_SOURCE = civetweb-$(CIVETWEB_VERSION).tar.gz
> +CIVETWEB_SITE =
> http://github.com/sunsetbrew/civetweb/tarball/v$(CIVETWEB_VERSION)
> +CIVETWEB_LICENSE = MIT
> +CIVETWEB_LICENSE_FILES = LICENSE.md
> +
> +CIVETWEB_COPT = $(TARGET_CFLAGS)
> +CIVETWEB_MOPT = TARGET_OS=LINUX
> +CIVETWEB_LDFLAGS = $(TARGET_LDFLAGS)
> +
> +ifndef BR2_PACKAGE_UTIL_LINUX_FALLOCATE
> + CIVETWEB_COPT += -DHAVE_POSIX_FALLOCATE=0
> +endif
> +
> +ifdef BR2_CIVETWEB_WITH_IPV6
> + CIVETWEB_MOPT += WITH_IPV6=1
> +endif
> +
> +ifdef BR2_CIVETWEB_WITH_LUA
> + CIVETWEB_MOPT += WITH_LUA=1
> +endif
> +
> +ifdef BR2_CIVETWEB_WITH_SSL
> + CIVETWEB_COPT += -DNO_SSL_DL -lcrypt -lssl
> + CIVETWEB_DEPENDENCIES += openssl
> +else
> + CIVETWEB_COPT += -DNO_SSL
> +endif

In general we use the format
ifeq ($(BR2_FOO),y)
...
endif

instead of
ifdef BR2_FOO
...
endif

I don't know if there is a particular reason for it, but I would
advocate to use that for consistency reasons.

> +
> +define CIVETWEB_BUILD_CMDS
> + $(MAKE) CC="$(TARGET_CC)" -C $(@D) all $(CIVETWEB_MOPT)
> COPT="$(CIVETWEB_COPT)"
> +endef
> +
> +define CIVETWEB_INSTALL_TARGET_CMDS
> + $(MAKE) CC="$(TARGET_CC)" -C $(@D) install
> DOCUMENT_ROOT=/usr/local/share/doc/civetweb PREFIX="$(TARGET_DIR)/usr/local"
> $(CIVETWEB_MOPT) COPT='$(CIVETWEB_COPT)'
> +endef
> +
> +$(eval $(generic-package))
> \ No newline at end of file

There is no newline at the end of your .mk file, this should be fixed too.

Best regards,
Thomas
