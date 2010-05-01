From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 01 May 2010 15:46:01 +0200
Subject: [Buildroot] [PATCH 1/2] ncurses: convert to autotools
 infrastructure
In-Reply-To: <20100501130651.546a957a@surf>
References: <1272588128-20047-1-git-send-email-llandwerlin@gmail.com>
	<1272588128-20047-2-git-send-email-llandwerlin@gmail.com>
	<20100501130651.546a957a@surf>
Message-ID: <1272721561.6613.27.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 01 mai 2010 ? 13:06 +0200, Thomas Petazzoni a ?crit :
> On Fri, 30 Apr 2010 02:42:07 +0200
> llandwerlin at gmail.com wrote:
> 
> > -	#use the local tic and not whatever the build system was going to find.
> > -	$(SED) 's~\$$srcdir/shlib tic\$$suffix~/usr/bin/tic~' \
> > -		$(NCURSES_DIR)/misc/run_tic.in
> 
> Was this useless ?

It's now using $(HOST_DIR)/usr/bin/tic instead. It will be detected when
running configure.

> 
> > -$(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VERSION): $(NCURSES_DIR)/.configured
> > -	$(MAKE1) DESTDIR=$(STAGING_DIR) -C $(NCURSES_DIR) \
> > -		libs panel menu form headers
> 
> It looks like a non-parallel make was used to build ncurses. Does using
> the default make works ?

Will change back to $(MAKE1).

> 
> > +define NCURSES_INSTALL_TARGET_CMDS
> > +	mkdir -p $(TARGET_DIR)/usr/lib
> > +	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/
> > +	$(NCURSES_INSTALL_TARGET_PANEL)
> > +	$(NCURSES_INSTALL_TARGET_FORM)
> > +	$(BR2_PACKAGE_NCURSES_TARGET_MENU)
> 
> This should be NCURSES_INSTALL_TARGET_MENU

damn !

> 
> Once this last point is fixed:
>  Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Thomas
