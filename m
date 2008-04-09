From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 10 Apr 2008 08:35:52 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
In-Reply-To: <20080409113849.004993C4BA@busybox.net>
References: <20080409113849.004993C4BA@busybox.net>
Message-ID: <20080409223551.GC4582@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 09, 2008 at 04:38:48AM -0700, nkukard at uclibc.org wrote:
> Author: nkukard
> Date: 2008-04-09 04:38:48 -0700 (Wed, 09 Apr 2008)
> New Revision: 21682
> 
> Log:
> Some package use ncurses libpanel/libform/libmenu, this config allows to selectively
> copy them to the target filesystem at the same time at the main library is installed.
> -Patch by Michel (BusError)
> 
> 
> Modified:
>    trunk/buildroot/package/ncurses/Config.in
>    trunk/buildroot/package/ncurses/ncurses.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/ncurses/Config.in
> ===================================================================
> --- trunk/buildroot/package/ncurses/Config.in	2008-04-09 10:22:22 UTC (rev 21681)
> +++ trunk/buildroot/package/ncurses/Config.in	2008-04-09 11:38:48 UTC (rev 21682)
> @@ -7,6 +7,28 @@
>  
>  	  http://www.gnu.org/software/ncurses/
>  
> +config BR2_PACKAGE_NCURSES_TARGET_PANEL
> +	bool "ncurses libpanel in target"
> +	default n
> +	depends on BR2_PACKAGE_NCURSES
> +	help
> +	  Ncurses headers in target
          ^^^^^^^^^^^^^^^^^^^^^^^^^
> +	  Includes ncurses dynamic libpanel in target

This looks like a copy/paste error.

> + 
> +config BR2_PACKAGE_NCURSES_TARGET_FORM
> +	bool "ncurses libform in target"
> +	default n
> +	depends on BR2_PACKAGE_NCURSES
> +	help
> +	  Includes ncurses dynamic libform in target
> + 
> +config BR2_PACKAGE_NCURSES_TARGET_MENU
> +        bool "ncurses libmenu in target"
> +        default n
> +        depends on BR2_PACKAGE_NCURSES
> +        help
> + 	  Includes ncurses dynamic libmenu in target

Weird tab/spaces mix here.

>  $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION): $(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
>  	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
> +ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_PANEL)),y)
> +	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/lib/
> +endif
> +ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_FORM)),y)
> +	cp -dpf $(NCURSES_DIR)/lib/libform.so* $(TARGET_DIR)/lib/
> +endif
> +ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_MENU)),y)
> +	cp -dpf $(NCURSES_DIR)/lib/libmenu.so* $(TARGET_DIR)/lib/
> +endif

Should be /usr/lib rather than /lib?

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
