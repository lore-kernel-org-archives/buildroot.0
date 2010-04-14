From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Apr 2010 17:18:21 +0200
Subject: [Buildroot] [PATCH 06/41] Rework icu package on top of the
 generic infrastructure
In-Reply-To: <1271199974-30434-7-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-7-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100414171821.721b5c8e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Apr 2010 01:05:39 +0200
llandwerlin at gmail.com wrote:

> diff --git a/package/icu/icu-4c-3_8_1-fix-compilation-with-gcc-4.4.patch b/package/icu/icu-4c-3_8_1-fix-compilation-with-gcc-4.4.patch
> new file mode 100644
> index 0000000..8c88f1c
> --- /dev/null
> +++ b/package/icu/icu-4c-3_8_1-fix-compilation-with-gcc-4.4.patch

This patch contains a lot of whitespace changes that are not necessary.
If I understand correctly, the patch should just be a one-liner
s/#elif/#else/, shouldn't it ?

> ++GENCCODE = $(BINDIR)-host/genccode
> ++ICUPKG   = $(BINDIR)-host/icupkg
> ++GENCMN   = $(BINDIR)-host/gencmn
> ++GENRB    = $(BINDIR)-host/genrb
> ++PKGDATA  = $(BINDIR)-host/pkgdata

I'm not really a fan of all this. Since you introduce a host-icu
package in icu.mk, why not just use the host icu binaries installed in
$(HOST_DIR)/usr/bin ?

> diff --git a/package/icu/icu-config b/package/icu/icu-config
> new file mode 100755
> index 0000000..d6da4fc

Why do we need this ?

> +define HOST_ICU_CONFIGURE_CMDS
> + (cd $(@D)/$(ICU_SUBDIR); \
> + $(HOST_CONFIGURE_OPTS) \
> + $(HOST_CONFIGURE_ARGS) \
> + $(HOST_CONFIGURE_ENV)  \
> + ./configure $(QUIET) --prefix=/usr)

If icu is an autotools-based package, why not using the AUTOTARGETS
infrastructure ? Of maybe it has a configure script, but it is not a
properly autotools-based one ?

> + ln -sf $(@D)/$(ICU_SUBDIR)/bin $(@D)/$(ICU_SUBDIR)/bin-host

If we install binaries in $(HOST_DIR) as suggested above, can't we get
rid of this ?

> +define HOST_ICU_INSTALL_CMDS
> + make -C $(@D)/$(ICU_SUBDIR) DESTDIR=$(HOST_DIR) install
> + mkdir -p $(HOST_DIR)/usr/sbin
> + cp -f $(addprefix $(@D)/$(ICU_SUBDIR)/bin/,$(ICU_BINARIES)) $(HOST_DIR)/usr/sbin/
> +endef

make install doesn't install the binaries ?

In the mean time, I think these changes still improve the situation, so:
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
