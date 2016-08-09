From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 10:09:12 +0200
Subject: [Buildroot] [PATCH 2/9] execline: new package
In-Reply-To: <1470690140-18803-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1470690140-18803-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160809100912.0f7738b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Aug 2016 23:02:13 +0200, Eric Le Bihan wrote:
> This package provides execline, a (non-interactive) scripting language,
> like sh, used in the s6 supervision system.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in               |  1 +
>  package/execline/Config.in      | 15 +++++++++
>  package/execline/Config.in.host |  7 +++++

Why do we need an option visible in menuconfig to enable this as a host
package? Why do we need the host package at all?

> diff --git a/package/execline/Config.in b/package/execline/Config.in
> new file mode 100644
> index 0000000..a9e0a88
> --- /dev/null
> +++ b/package/execline/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_EXECLINE
> +	bool "execline"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
> +	select BR2_PACKAGE_SKALIBS
> +	help
> +	  execline is a (non-interactive) scripting language, like sh ; but its
> +	  syntax is quite different from a traditional shell syntax.
> +	  The execlineb program is meant to be used as an interpreter for a text
> +	  file; the other commands are essentially useful inside an execlineb
> +	  script.
> +
> +	  http://skarnet.org/software/execline/
> +
> +comment "execline needs an (e)glibc or musl toolchain"

(e)glibc -> glibc

> +EXECLINE_VERSION = v2.1.5.0
> +EXECLINE_SITE = git://git.skarnet.org/execline.git

Please use the tarball.

> +EXECLINE_LICENSE = ISC
> +EXECLINE_LICENSE_FILES = COPYING
> +EXECLINE_INSTALL_STAGING = YES
> +EXECLINE_DEPENDENCIES = skalibs
> +
> +EXECLINE_CONFIGURE_OPTS = \
> +	--prefix=/usr \
> +	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
> +	--with-include=$(STAGING_DIR)/usr/include \
> +	--with-dynlib=$(STAGING_DIR)/usr/lib \
> +	--with-lib=$(STAGING_DIR)/usr/lib/skalibs
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +EXECLINE_CONFIGURE_OPTS +=  --enable-static --disable-shared
> +else
> +EXECLINE_CONFIGURE_OPTS +=  --disable-static --enable-shared --disable-allstatic
> +endif

Handle the shared+static case.

> +
> +define EXECLINE_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(EXECLINE_CONFIGURE_OPTS))
> +endef
> +
> +define EXECLINE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
> +endef
> +
> +define EXECLINE_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install

You're using MAKE1 to build the target variant, but MAKE to build the
host variant. Is this expected?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
