From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 21:49:01 +0100
Subject: [Buildroot] [Patch v2 2/9] execline: new package
In-Reply-To: <1481397650-14664-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20161210214901.084d27e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Dec 2016 20:20:43 +0100, Eric Le Bihan wrote:

> diff --git a/package/execline/Config.in.host b/package/execline/Config.in.host
> new file mode 100644
> index 0000000..4e188e1
> --- /dev/null
> +++ b/package/execline/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_EXECLINE
> +	bool "host execline"
> +	help
> +	  Host version of execline, a (non-interactive) scripting language,
> +	  like sh.
> +
> +	  http://skarnet.org/software/execline/

Do we really a menuconfig-visible option for the host variant?

If so, then please explain why in the commit log. Also mentioning in
the commit log why a host variant is introduced would be nice.

> +EXECLINE_CONF_OPTS = \
> +	--prefix=/usr \
> +	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
> +	--with-include=$(STAGING_DIR)/usr/include \
> +	--with-dynlib=$(STAGING_DIR)/usr/lib \
> +	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \

Ah, ok, so that's how it finds the static libraries?

> +HOST_EXECLINE_DEPENDENCIES = host-skalibs
> +
> +HOST_EXECLINE_CONF_OPTS = \
> +	--prefix=/usr \

Should be --prefix=$(HOST_DIR)/usr

> +	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
> +	--with-include=$(HOST_DIR)/usr/include \
> +	--with-dynlib=$(HOST_DIR)/usr/lib \
> +	--disable-static \
> +	--enable-shared \
> +	--disable-allstatic
> +
> +define HOST_EXECLINE_CONFIGURE_CMDS
> +	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_EXECLINE_CONF_OPTS))
> +endef
> +
> +define HOST_EXECLINE_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)

DESTDIR= should not be needed.

> +endef
> +
> +define HOST_EXECLINE_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install

DESTDIR= is no longer needed with --prefix=$(HOST_DIR)/usr.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
