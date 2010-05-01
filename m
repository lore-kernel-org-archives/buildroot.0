From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 May 2010 13:06:51 +0200
Subject: [Buildroot] [PATCH 1/2] ncurses: convert to autotools
 infrastructure
In-Reply-To: <1272588128-20047-2-git-send-email-llandwerlin@gmail.com>
References: <1272588128-20047-1-git-send-email-llandwerlin@gmail.com>
	<1272588128-20047-2-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100501130651.546a957a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Apr 2010 02:42:07 +0200
llandwerlin at gmail.com wrote:

> -	#use the local tic and not whatever the build system was going to find.
> -	$(SED) 's~\$$srcdir/shlib tic\$$suffix~/usr/bin/tic~' \
> -		$(NCURSES_DIR)/misc/run_tic.in

Was this useless ?

> -$(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VERSION): $(NCURSES_DIR)/.configured
> -	$(MAKE1) DESTDIR=$(STAGING_DIR) -C $(NCURSES_DIR) \
> -		libs panel menu form headers

It looks like a non-parallel make was used to build ncurses. Does using
the default make works ?

> +define NCURSES_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/lib
> +	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/
> +	$(NCURSES_INSTALL_TARGET_PANEL)
> +	$(NCURSES_INSTALL_TARGET_FORM)
> +	$(BR2_PACKAGE_NCURSES_TARGET_MENU)

This should be NCURSES_INSTALL_TARGET_MENU

Once this last point is fixed:
 Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
