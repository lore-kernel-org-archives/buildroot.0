From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 12 Mar 2008 18:26:09 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <20080312135303.CCD1B120150@busybox.net>
References: <20080312135303.CCD1B120150@busybox.net>
Message-ID: <47D82041.2060309@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ninevoltz at uclibc.org wrote:
> Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
> ===================================================================
> --- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-03-12 13:11:29 UTC (rev 21314)
> +++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-03-12 13:53:02 UTC (rev 21315)

snip

>  
> -$(QTOPIA4_TARGET_DIR)/.installed: $(QTOPIA4_TARGET_DIR)/.built
> +$(STAGING_DIR)/usr/lib/libQtCore.la: $(QTOPIA4_TARGET_DIR)/.compiled
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QTOPIA4_TARGET_DIR) install

Doing a make install seems rather over the top. I don't need all the 
docs copied into the staging dir for a start. Why do the install at all, 
qtopia4 worked fine before when just copying the needed parts to the 
TARGET_DIR

A possible improvement might be to do install_subtargets instead.

> +
> +$(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la
>  	mkdir -p $(TARGET_DIR)/usr/lib/fonts
>  	touch $(TARGET_DIR)/usr/lib/fonts/fontdir
> -	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
> -	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
> -	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
> +	cp -dpf $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
> +	cp -dpf $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
> +	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
>  ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
> -	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
> -	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.$(QTOPIA4_VERSION)
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
> +	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libQt*.so.*

Why did you change this from $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)?

$(STRIP) --strip-unneeded fails on my target (arm) as STRIP not defined.

>  endif
>  	# Install image plugins if they are built
> -	if [ -d $(QTOPIA4_TARGET_DIR)/plugins/imageformats ]; then \
> -		mkdir -p $(TARGET_DIR)/usr/lib/qt4/plugins; \
> -		cp -dpfr $(QTOPIA4_TARGET_DIR)/plugins/imageformats $(TARGET_DIR)/usr/lib/qt4/plugins; \
> -		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/qt4/plugins/imageformats/*; \
> +	if [ -d $(STAGING_DIR)/usr/plugins/imageformats ]; then \
> +		mkdir -p $(TARGET_DIR)/usr/plugins; \
> +		cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
> +		$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/plugins/imageformats/*; \
>  	fi
> +ifneq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
>  	# Remove Sql libraries, not needed
>  	-rm $(TARGET_DIR)/usr/lib/libQtSql*
> +endif
>  	# Remove Svg libraries, not needed
>  	-rm $(TARGET_DIR)/usr/lib/libQtSvg*
> -	touch $@
>  
> +qtopia4: uclibc zlib $(QTOPIA4_DEP_LIBS) $(TARGET_DIR)/usr/lib/libQtCore.so.4
>  
> -qtopia4: uclibc zlib $(QTOPIA4_DEP_LIBS) $(QTOPIA4_TARGET_DIR)/.installed
> -
>  qtopia4-clean:
>  	-$(MAKE) -C $(QTOPIA4_TARGET_DIR) clean
>  
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
