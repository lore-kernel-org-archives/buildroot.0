From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 31 Aug 2007 09:35:51 +0200
Subject: [Buildroot] [PATCH] quagga
In-Reply-To: <864997.9050.qm@web35603.mail.mud.yahoo.com>
References: <864997.9050.qm@web35603.mail.mud.yahoo.com>
Message-ID: <20070831073551.GB29704@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 30, 2007 at 10:32:14PM -0700, Tim Harvey wrote:
>Greetings,
>
>I'm pretty new to buildroot but I've found that a great number of packages
>don't build (at least for my armeb platform).  I'm happy to submit patches for
>those I fix, so let me know if I'm not using the correct format.
>
>Attached is a patch for quagga that addresses the following issues:
> - bumps version to 0.99.8 
>   which fixes the 'error: expected specifier-qualifier-list before '__u64' 
>   build issue
> - fixes link issue of not using MALLOC_GLIBC_COMPAT
> - removes static libs from target after install
>
>Hope this is useful,
>
>Tim
Content-Description: 2255237146-06-quagga.patch
>--- buildroot-svn/package/quagga/quagga.mk	2007-08-30 20:38:18.000000000 -0700
>+++ buildroot-patched/package/quagga/quagga.mk	2007-08-30 22:18:40.000000000 -0700
>@@ -3,7 +3,7 @@
> # quagga suite
> #
> #############################################################
>-QUAGGA_VERSION:=0.99.7
>+QUAGGA_VERSION:=0.99.8
> QUAGGA_SOURCE:=quagga-$(QUAGGA_VERSION).tar.gz
> QUAGGA_SITE:=http://www.quagga.net/download
> QUAGGA_DIR:=$(BUILD_DIR)/quagga-$(QUAGGA_VERSION)
>@@ -138,6 +138,8 @@
> 	(cd $(QUAGGA_DIR); rm -rf config.cache; \
> 		$(TARGET_CONFIGURE_OPTS) \
> 		$(TARGET_CONFIGURE_ARGS) \
>+		ac_cv_func_malloc_0_nonnull=yes \
>+		ac_cv_func_realloc_0_nonnull=yes \

These have to depend on a uClibc setting, IIRC, and should be set to
sensible values in TARGET_CONFIGURE_ARGS for use in all packages.
> 		./configure \
> 		--target=$(GNU_TARGET_NAME) \
> 		--host=$(GNU_TARGET_NAME) \
>@@ -156,6 +158,8 @@
> 
> $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY): $(QUAGGA_BINARY)
> 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(QUAGGA_DIR) install
>+	rm -rf $(TARGET_DIR)/usr/lib/libzebra.a
>+	rm -rf $(TARGET_DIR)/usr/lib/libzebra.la

And I'd like this to depend on a knob that only erases static libs and
headers if an option like BR2_HAVE_STATIC_LIBS (to be introduced) is not
set.

> ifneq ($(BR2_PACKAGE_QUAGGA_HEADERS),y)
> 	rm -rf $(TARGET_DIR)/usr/include/quagga
> endif
