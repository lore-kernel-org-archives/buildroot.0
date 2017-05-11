From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 22:33:07 +0200
Subject: [Buildroot] [PATCH] package/libloki: new package
In-Reply-To: <20170506140707.12931-1-romain.naour@gmail.com>
References: <20170506140707.12931-1-romain.naour@gmail.com>
Message-ID: <20170511223307.157be03a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 May 2017 16:07:07 +0200, Romain Naour wrote:

> +# install to TARGET_DIR only the shared library
> +ifeq ($(BR2_STATIC_LIBS),)
> +define LIBLOKI_INSTALL_STAGING_SHARED_LIB
> +	$(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) $(LIBLOKI_INSTALL_TARGETS)
> +endef
> +endif
> +
> +define LIBLOKI_INSTALL_TARGET_CMDS
> +	$(LIBLOKI_INSTALL_STAGING_SHARED_LIB)
> +endef

This was a bit unnecessarily complicated, calling:

	$(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) $(LIBLOKI_INSTALL_TARGETS)

unconditionally is just fine. Yes for static libraries, it means they
will be installed in $(TARGET_DIR), but they are anyway removed in the
target-finalize step. So in such situations, I do prefer to keep a
simple .mk file.

Committed to next with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
