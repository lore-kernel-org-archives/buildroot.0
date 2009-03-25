From: Hiroshi Shinji <hiroshi.shinji@gmail.com>
Date: Wed, 25 Mar 2009 13:34:26 +0900
Subject: [Buildroot] svn commit: [25800] trunk/buildroot/package/automake
In-Reply-To: <20090323214637.8287476A00@busybox.osuosl.org>
References: <20090323214637.8287476A00@busybox.osuosl.org>
Message-ID: <d6a0e5a20903242134l26f4e5c4h3a0ae64221f8a00d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried to build iptables-1.4.2, but occured an error that
$(STAGING_DIR)/usr/share/aclocal directory was not found.

> -#############################################################
> -#
> -# automake for the target
> -#
> -#############################################################
> +# variables used by other packages
> +AUTOMAKE:=$(HOST_DIR)/usr/bin/automake
> +ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
                   ~~~~~~~~~~~
> +ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)

And I'm able to build iptables by modifying "STAGING_DIR" to "HOST_DIR".

Please review this modifying.

Regards,



2009/3/24  <jacmet@uclibc.org>:
> Author: jacmet
> Date: 2009-03-23 21:46:37 +0000 (Mon, 23 Mar 2009)
> New Revision: 25800
>
> Log:
> automake: cleanup
>
> - Convert into Makefile.autotools.in format for target build
> - Build host version in BUILD_DIR and install into HOST_DIR
>
> Modified:
>   trunk/buildroot/package/automake/automake.mk
>
>
> Changeset:
> Modified: trunk/buildroot/package/automake/automake.mk
> ===================================================================
> --- trunk/buildroot/package/automake/automake.mk        2009-03-23 21:46:32 UTC (rev 25799)
> +++ trunk/buildroot/package/automake/automake.mk        2009-03-23 21:46:37 UTC (rev 25800)
> @@ -3,139 +3,59 @@
>  # automake
>  #
>  #############################################################
> -AUTOMAKE_VERSION:=1.10
> -AUTOMAKE_SOURCE:=automake-$(AUTOMAKE_VERSION).tar.bz2
> -AUTOMAKE_SITE:=$(BR2_GNU_MIRROR)/automake
> -AUTOMAKE_CAT:=$(BZCAT)
> -AUTOMAKE_SRC_DIR:=$(TOOL_BUILD_DIR)/automake-$(AUTOMAKE_VERSION)
> -AUTOMAKE_DIR:=$(BUILD_DIR)/automake-$(AUTOMAKE_VERSION)
> -AUTOMAKE_HOST_DIR:=$(TOOL_BUILD_DIR)/automake-$(AUTOMAKE_VERSION)-host
> -AUTOMAKE_BINARY:=automake
> -AUTOMAKE_TARGET_BINARY:=usr/bin/automake
> -AUTOMAKE:=$(STAGING_DIR)/usr/bin/automake
> +AUTOMAKE_VERSION = 1.10
> +AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.bz2
> +AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
>
> -# variables used by other packages
> -ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
> -ACLOCAL = aclocal -I $(ACLOCAL_DIR)
> +ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
> +AUTOMAKE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
> +endif
>
> -$(DL_DIR)/$(AUTOMAKE_SOURCE):
> -        $(call DOWNLOAD,$(AUTOMAKE_SITE),$(AUTOMAKE_SOURCE))
> +AUTOMAKE_DEPENDENCIES = uclibc autoconf microperl
>
> -automake-source: $(DL_DIR)/$(AUTOMAKE_SOURCE)
> +$(eval $(call AUTOTARGETS,package,automake))
>
> -$(AUTOMAKE_SRC_DIR)/.unpacked: $(DL_DIR)/$(AUTOMAKE_SOURCE)
> -       $(AUTOMAKE_CAT) $(DL_DIR)/$(AUTOMAKE_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
> -       $(CONFIG_UPDATE) $(AUTOMAKE_SRC_DIR)
> -       touch $@
> +# automake for the host
> +AUTOMAKE_HOST_DIR:=$(BUILD_DIR)/automake-$(AUTOMAKE_VERSION)-host
>
> -#############################################################
> -#
> -# automake for the target
> -#
> -#############################################################
> +# variables used by other packages
> +AUTOMAKE:=$(HOST_DIR)/usr/bin/automake
> +ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
> +ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
>
> -$(AUTOMAKE_DIR)/.configured: $(AUTOMAKE_SRC_DIR)/.unpacked $(AUTOCONF)
> -       mkdir -p $(AUTOMAKE_DIR)
> -       (cd $(AUTOMAKE_DIR); rm -rf config.cache; \
> -               $(TARGET_CONFIGURE_OPTS) \
> -               $(TARGET_CONFIGURE_ARGS) \
> -               WANT_AUTOCONF=2.5 \
> -               $(AUTOMAKE_SRC_DIR)/configure \
> -               --target=$(GNU_TARGET_NAME) \
> -               --host=$(GNU_TARGET_NAME) \
> -               --build=$(GNU_HOST_NAME) \
> -               --prefix=/usr \
> -               --exec-prefix=/usr \
> -               --bindir=/usr/bin \
> -               --sbindir=/usr/sbin \
> -               --libdir=/lib \
> -               --libexecdir=/usr/lib \
> -               --sysconfdir=/etc \
> -               --datadir=/usr/share \
> -               --localstatedir=/var \
> -               --mandir=/usr/share/man \
> -               --infodir=/usr/share/info \
> -               --includedir=/usr/include \
> -       )
> +$(STAMP_DIR)/host_automake_unpacked: $(DL_DIR)/$(AUTOMAKE_SOURCE)
> +       mkdir -p $(AUTOMAKE_HOST_DIR)
> +       $(INFLATE$(suffix $(AUTOMAKE_SOURCE))) $< | \
> +               $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(AUTOMAKE_HOST_DIR) $(TAR_OPTIONS) -
> +       toolchain/patch-kernel.sh $(AUTOMAKE_HOST_DIR) package/automake/ \*.patch
>        touch $@
>
> -$(AUTOMAKE_DIR)/$(AUTOMAKE_BINARY): $(AUTOMAKE_DIR)/.configured
> -       $(MAKE) -C $(AUTOMAKE_DIR)
> -       touch -c $@
> -
> -$(TARGET_DIR)/$(AUTOMAKE_TARGET_BINARY): $(AUTOMAKE_DIR)/$(AUTOMAKE_BINARY)
> -       $(MAKE) \
> -           prefix=$(TARGET_DIR)/usr \
> -           exec_prefix=$(TARGET_DIR)/usr \
> -           bindir=$(TARGET_DIR)/usr/bin \
> -           sbindir=$(TARGET_DIR)/usr/sbin \
> -           libexecdir=$(TARGET_DIR)/usr/lib \
> -           datadir=$(TARGET_DIR)/usr/share \
> -           sysconfdir=$(TARGET_DIR)/etc \
> -           localstatedir=$(TARGET_DIR)/var \
> -           libdir=$(TARGET_DIR)/usr/lib \
> -           infodir=$(TARGET_DIR)/usr/share/info \
> -           mandir=$(TARGET_DIR)/usr/share/man \
> -           includedir=$(TARGET_DIR)/usr/include \
> -           -C $(AUTOMAKE_DIR) install
> -ifneq ($(BR2_HAVE_INFOPAGES),y)
> -       rm -rf $(TARGET_DIR)/usr/share/info
> -endif
> -ifneq ($(BR2_HAVE_MANPAGES),y)
> -       rm -rf $(TARGET_DIR)/usr/share/man
> -endif
> -       rm -rf $(TARGET_DIR)/share/locale
> -       rm -rf $(TARGET_DIR)/usr/share/doc
> -       touch -c $@
> -
> -automake: uclibc autoconf $(TARGET_DIR)/$(AUTOMAKE_TARGET_BINARY)
> -
> -automake-clean:
> -       $(MAKE) DESTDIR=$(TARGET_DIR) -C $(AUTOMAKE_DIR) uninstall
> -       -$(MAKE) -C $(AUTOMAKE_DIR) clean
> -
> -automake-dirclean:
> -       rm -rf $(AUTOMAKE_DIR)
> -
> -#############################################################
> -#
> -# automake for the host
> -#
> -#############################################################
> -
> -$(AUTOMAKE_HOST_DIR)/.configured: $(AUTOMAKE_SRC_DIR)/.unpacked $(AUTOCONF)
> -       mkdir -p $(@D)
> -       (cd $(@D); rm -rf config.cache; \
> +$(STAMP_DIR)/host_automake_configured: $(STAMP_DIR)/host_automake_unpacked
> +       (cd $(AUTOMAKE_HOST_DIR); rm -rf config.cache; \
>                $(HOST_CONFIGURE_OPTS) \
>                CFLAGS="$(HOST_CFLAGS)" \
>                LDFLAGS="$(HOST_LDFLAGS)" \
> -               WANT_AUTOCONF=2.5 \
> -               $(AUTOMAKE_SRC_DIR)/configure \
> -               --prefix=$(STAGING_DIR)/usr \
> +               ./configure \
> +               --prefix="$(HOST_DIR)/usr" \
> +               --sysconfdir="$(HOST_DIR)/etc" \
> +               --disable-static \
>        )
>        touch $@
>
> -$(AUTOMAKE_HOST_DIR)/$(AUTOMAKE_BINARY): $(AUTOMAKE_HOST_DIR)/.configured
> -       $(MAKE) -C $(@D)
> -       touch -c $@
> +$(STAMP_DIR)/host_automake_compiled: $(STAMP_DIR)/host_automake_configured
> +       $(MAKE) -C $(AUTOMAKE_HOST_DIR)
> +       touch $@
>
> -$(AUTOMAKE): $(AUTOMAKE_HOST_DIR)/$(AUTOMAKE_BINARY)
> +$(STAMP_DIR)/host_automake_installed: $(STAMP_DIR)/host_automake_compiled
>        $(MAKE) -C $(AUTOMAKE_HOST_DIR) install
> +       touch $@
>
> -host-automake: host-autoconf host-libtool $(AUTOMAKE)
> +host-automake: $(STAMP_DIR)/host_automake_installed
>
>  host-automake-clean:
> -       $(MAKE) -C $(AUTOMAKE_HOST_DIR) uninstall
> +       rm -f $(addprefix $(STAMP_DIR)/host_automake_,unpacked configured compiled installed)
> +       -$(MAKE) -C $(AUTOMAKE_HOST_DIR) uninstall
>        -$(MAKE) -C $(AUTOMAKE_HOST_DIR) clean
>
>  host-automake-dirclean:
>        rm -rf $(AUTOMAKE_HOST_DIR)
> -
> -#############################################################
> -#
> -# Toplevel Makefile options
> -#
> -#############################################################
> -ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
> -TARGETS+=automake
> -endif
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
?? ?
hiroshi.shinji at gmail.com
http://d.hatena.ne.jp/hshinji/
