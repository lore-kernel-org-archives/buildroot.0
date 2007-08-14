From: Benjamin Tietz <benjamin@micronet24.de>
Date: Tue, 14 Aug 2007 16:26:55 +0200
Subject: [Buildroot] [RFC] configure options & install targets
In-Reply-To: <0708121107001.12015@somehost>
References: <0708121107001.12015@somehost>
Message-ID: <20070814142654.GB4242@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 12, 2007 at 11:30:21AM +0200, Cristian Ionescu-Idbohrn wrote:
> Noticed a few questionable things the wrapper makefiles do (in this
> example package/bison/bison.mk) and wonder:
> 
> ,----
> | --- package/bison/bison.mk	(revision 19307)
> | +++ package/bison/bison.mk	(working copy)
> |
> 
> The canonical place for man, info and doc is under /usr/share, isn't it?
That would be right, but read below

> 
> |  		--sysconfdir=/etc \
> |  		--datadir=/usr/share \
> |  		--localstatedir=/var \
> | -		--mandir=/usr/man \
> | -		--infodir=/usr/info \
> | +		--mandir=/usr/share/man \
> | +		--infodir=/usr/share/info \
> 
> Stuff is removed using a machete instead of knife :(
> See example below.  Is that the intended behavior?
The advantage of the machete is that really all installed man and
info-pages get destroyed. Since there is no support for any of the tools
up to now, you don't get stuff you can't used.
> 
> |  $(TARGET_DIR)/$(BISON_TARGET_BINARY): $(BISON_DIR)/$(BISON_BINARY)
> |  	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BISON_DIR) install
> | -	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
> | -		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
> | +	rm -f $(TARGET_DIR)/share/locale/*/LC_MESSAGES/bison*
> | +	rm -f $(TARGET_DIR)/usr/info/bison*
> | +	rm -f $(TARGET_DIR)/usr/share/man/man?/bison*
> | +	rm -rf $(TARGET_DIR)/usr/share/bison*
> | +	rm -rf $(TARGET_DIR)/usr/share/doc/bison*
> `----
> 
> 
regards,
Benjamin

> Cheers,
> 
> -- 
> Cristian
> Index: package/bison/bison.mk
> ===================================================================
> --- package/bison/bison.mk	(revision 19307)
> +++ package/bison/bison.mk	(working copy)
> @@ -19,7 +19,7 @@
>  $(BISON_DIR)/.unpacked: $(DL_DIR)/$(BISON_SOURCE)
>  	$(BISON_CAT) $(DL_DIR)/$(BISON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>  	$(CONFIG_UPDATE) $(BISON_DIR)/build-aux
> -	touch $(BISON_DIR)/.unpacked
> +	touch $@
>  
>  $(BISON_DIR)/.configured: $(BISON_DIR)/.unpacked
>  	(cd $(BISON_DIR); rm -rf config.cache; \
> @@ -39,20 +39,23 @@
>  		--sysconfdir=/etc \
>  		--datadir=/usr/share \
>  		--localstatedir=/var \
> -		--mandir=/usr/man \
> -		--infodir=/usr/info \
> +		--mandir=/usr/share/man \
> +		--infodir=/usr/share/info \
>  		$(DISABLE_NLS) \
> -	);
> +	)
>  	echo 'all install:' > $(BISON_DIR)/examples/Makefile
> -	touch $(BISON_DIR)/.configured
> +	touch $@
>  
>  $(BISON_DIR)/$(BISON_BINARY): $(BISON_DIR)/.configured
>  	$(MAKE) CC=$(TARGET_CC) -C $(BISON_DIR)
>  
>  $(TARGET_DIR)/$(BISON_TARGET_BINARY): $(BISON_DIR)/$(BISON_BINARY)
>  	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BISON_DIR) install
> -	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
> -		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
> +	rm -f $(TARGET_DIR)/share/locale/*/LC_MESSAGES/bison*
> +	rm -f $(TARGET_DIR)/usr/info/bison*
> +	rm -f $(TARGET_DIR)/usr/share/man/man?/bison*
> +	rm -rf $(TARGET_DIR)/usr/share/bison*
> +	rm -rf $(TARGET_DIR)/usr/share/doc/bison*
>  	cp -a package/bison/yacc $(TARGET_DIR)/usr/bin/yacc
>  
>  bison: uclibc $(TARGET_DIR)/$(BISON_TARGET_BINARY)

> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
