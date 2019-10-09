From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Oct 2019 14:25:45 +0200
Subject: [Buildroot] [PATCH v2 3/9] package/libavl: add package
In-Reply-To: <20191009112656.21232-4-heiko.thiery@gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-4-heiko.thiery@gmail.com>
Message-ID: <20191009142545.15c32ee6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

On Wed,  9 Oct 2019 13:26:50 +0200
heiko.thiery at gmail.com wrote:

> From: Michael Walle <michael@walle.cc>
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> ---
>  package/Config.in                      |  1 +
>  package/libavl/0001-fix-makefile.patch | 49 ++++++++++++++++++++++++++
>  package/libavl/Config.in               | 13 +++++++
>  package/libavl/libavl.hash             |  5 +++
>  package/libavl/libavl.mk               | 43 ++++++++++++++++++++++
>  5 files changed, 111 insertions(+)
>  create mode 100644 package/libavl/0001-fix-makefile.patch
>  create mode 100644 package/libavl/Config.in
>  create mode 100644 package/libavl/libavl.hash
>  create mode 100644 package/libavl/libavl.mk

And entry to the DEVELOPERS file needs to be added.


> diff --git a/package/libavl/0001-fix-makefile.patch b/package/libavl/0001-fix-makefile.patch
> new file mode 100644
> index 0000000000..6cc96e5f74
> --- /dev/null
> +++ b/package/libavl/0001-fix-makefile.patch
> @@ -0,0 +1,49 @@
> +makefile: fix compilation and installation
> +
> +This was originally taken from:
> +https://sources.debian.org/data/main/liba/libavl/0.3.5-4/debian/patches/fix-makefile
> +
> +Unfortunately, the URL does not end in ".patch", therefore we cannot
> +use it in the FOO_PATCH variable directly.
> +
> +Signed-off-by: Michael Walle <michael@walle.cc>

We need your Signed-off-by below this one.

> +
> +--- a/GNUmakefile
> ++++ b/GNUmakefile
> +@@ -6,7 +6,8 @@
> + LDCONFIG ?= /sbin/ldconfig
> + 
> + # Some suggestions: (-mcpu= generates i386 compatible code)
> +-CFLAGS ?= -O2 -fomit-frame-pointer -pipe -mcpu=i686 -w
> ++CFLAGS ?= -O2 -pipe -Wall -Werror
> ++CFLAGS += -fPIC

So this change is not really useful, because you anyway override
CFLAGS. But if that's the patch as it is in Debian, please keep it
as-is.


> diff --git a/package/libavl/libavl.mk b/package/libavl/libavl.mk
> new file mode 100644
> index 0000000000..ad561c43bf
> --- /dev/null
> +++ b/package/libavl/libavl.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# libavl
> +#
> +################################################################################
> +
> +LIBAVL_VERSION = 0.3.5
> +LIBAVL_SITE = http://ftp.debian.org/debian/pool/main/liba/libavl

URLs on ftp.debian.org are unfortunately not stable. We use
snapshot.debian.org instead. Do a "git grep snapshot.debian.org" in
Buildroot to see how other packages fetching from the Debian archive
are doing this.

> +LIBAVL_SOURCE = libavl_$(LIBAVL_VERSION).orig.tar.gz
> +LIBAVL_LICENSE = LGPL-2.0+
> +LIBAVL_LICENSE_FILES = COPYING
> +LIBAVL_INSTALL_STAGING = YES
> +
> +LIBAVL_CFLAGS = -fPIC

Please use:

LIBAVL_CFLAGS = $(TARGET_CFLAGS) -fPIC

> +HOST_LIBAVL_CFLAGS = -fPIC

HOST_LIBAVL_CFLAGS = $(HOST_CFLAGS) -fPIC

> +
> +define LIBAVL_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> +		CFLAGS="$(LIBAVL_CFLAGS)"
> +endef
> +
> +define LIBAVL_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install \
> +		prefix=/usr DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define LIBAVL_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install \
> +		prefix=/usr DESTDIR=$(TARGET_DIR)
> +endef
> +
> +define HOST_LIBAVL_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
> +		CFLAGS="$(HOST_LIBAVL_CFLAGS)"
> +endef
> +
> +define HOST_LIBAVL_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) install \
> +		prefix=/usr DESTDIR=$(HOST_DIR)

For the host build/installation, semantically speaking, the correct
thing is:

	prefix=$(HOST_DIR)

Indeed, we don't have any "usr" in $(HOST_DIR), and prefix indicates
where the software will be executing from.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
