From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 17 Apr 2008 05:11:46 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package:  axel
In-Reply-To: <20080417045258.41B6D3C61D@busybox.net>
References: <20080417045258.41B6D3C61D@busybox.net>
Message-ID: <1208409106.17959.28.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Log:
> Added package for axel download accelerator
> 

> Added: trunk/buildroot/package/axel/axel.mk
> ===================================================================
> --- trunk/buildroot/package/axel/axel.mk	                        (rev 0)
> +++ trunk/buildroot/package/axel/axel.mk	2008-04-17 04:52:57 UTC (rev 21752)
> @@ -0,0 +1,55 @@
> +#############################################################
> +#
> +# axel
> +#
> +#############################################################
> +AXEL_VERSION:=1.1
> +AXEL_SOURCE:=axel-$(AXEL_VERSION).tar.gz
> +AXEL_SITE:=http://alioth.debian.org/frs/download.php/2287
> +AXEL_CAT:=$(ZCAT)
> +AXEL_DIR:=$(BUILD_DIR)/axel-$(AXEL_VERSION)
> +AXEL_BINARY:=axel
> +AXEL_TARGET_BINARY:=usr/bin/axel
> +
> +$(DL_DIR)/$(AXEL_SOURCE):
> +	 $(WGET) -P $(DL_DIR) $(AXEL_SITE)/$(AXEL_SOURCE)
> +
> +axel-source: $(DL_DIR)/$(AXEL_SOURCE)
> +
> +$(AXEL_DIR)/.unpacked: $(DL_DIR)/$(AXEL_SOURCE)
> +	$(AXEL_CAT) $(DL_DIR)/$(AXEL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> +	#toolchain/patch-kernel.sh $(AXEL_DIR) package/axel axel\*.patch
> +	touch $@
> +
> +$(AXEL_DIR)/Makefile.settings: $(AXEL_DIR)/.unpacked
> +	(cd $(AXEL_DIR); \
> +		./configure --enable-i18n=0 --prefix=/usr \
> +	)
> +	touch $@
> +
> +$(AXEL_DIR)/$(AXEL_BINARY): $(AXEL_DIR)/Makefile.settings
> +	$(MAKE) CC="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" -C $(AXEL_DIR)
> +
> +$(TARGET_DIR)/$(AXEL_TARGET_BINARY): $(AXEL_DIR)/$(AXEL_BINARY)
> +	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) install-bin
> +ifeq ($(BR2_HAVE_MANPAGES),y)
> +	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) install-man
> +endif
> +
> +axel: uclibc $(TARGET_DIR)/$(AXEL_TARGET_BINARY)
> +
> +axel-clean:
> +	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) uninstall
> +	-$(MAKE) -C $(AXEL_DIR) clean
> +
> +axel-dirclean:
> +	rm -rf $(AXEL_DIR)
> +
> +#############################################################
> +#
> +# Toplevel Makefile options
> +#
> +#############################################################
> +ifeq ($(strip $(BR2_PACKAGE_AXEL)),y)
> +TARGETS+=axel
> +endif

Can you not use autotools?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080417/b2987528/attachment.pgp 
