From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 13 Mar 2008 07:25:10 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <47D82041.2060309@carallon.com>
References: <20080312135303.CCD1B120150@busybox.net>
	<47D82041.2060309@carallon.com>
Message-ID: <1205389510.6797.5.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2008-03-12 at 18:26 +0000, Will Wagner wrote:
> ninevoltz at uclibc.org wrote:
> > Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
> > ===================================================================
> > --- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-03-12 13:11:29 UTC (rev 21314)
> > +++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-03-12 13:53:02 UTC (rev 21315)
> 
> snip
> 
> >  
> > -$(QTOPIA4_TARGET_DIR)/.installed: $(QTOPIA4_TARGET_DIR)/.built
> > +$(STAGING_DIR)/usr/lib/libQtCore.la: $(QTOPIA4_TARGET_DIR)/.compiled
> > +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QTOPIA4_TARGET_DIR) install
> 
> Doing a make install seems rather over the top. I don't need all the 
> docs copied into the staging dir for a start. Why do the install at all, 
> qtopia4 worked fine before when just copying the needed parts to the 
> TARGET_DIR
> 

Using copy instead of a proper install is waiting for issues to happen,
unless of course you have full knowledge about what Trolltech does with
their Qt library and how they install it.

> A possible improvement might be to do install_subtargets instead.
> 

That might be an idea, but then again, somebody will need to track any
changes done in Qt Embedded.

> > +
> > +$(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la
> >  	mkdir -p $(TARGET_DIR)/usr/lib/fonts
> >  	touch $(TARGET_DIR)/usr/lib/fonts/fontdir
> > -	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
> > -	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
> > -	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
> > +	cp -dpf $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
> > +	cp -dpf $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
> > +	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
> >  ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
> > -	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
> > -	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.$(QTOPIA4_VERSION)
> > +	cp -dpf $(STAGING_DIR)/usr/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
> > +	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libQt*.so.*
> 
> Why did you change this from $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)?
> 
> $(STRIP) --strip-unneeded fails on my target (arm) as STRIP not defined.
> 

Probably because I am a bit out of sync with upstream, but it should
have been catched in review process before being commited. Easy fix
though.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
