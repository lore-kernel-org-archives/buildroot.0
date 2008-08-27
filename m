From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 27 Aug 2008 10:15:59 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
In-Reply-To: <20080827072921.BE910F8014@busybox.net>
References: <20080827072921.BE910F8014@busybox.net>
Message-ID: <20080827081559.GA25436@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 27, 2008 at 12:29:21AM -0700, jacmet at uclibc.org wrote:
>Author: jacmet
>Date: 2008-08-27 00:29:20 -0700 (Wed, 27 Aug 2008)
>New Revision: 23235

>Modified: trunk/buildroot/package/avahi/avahi.mk
>===================================================================
>--- trunk/buildroot/package/avahi/avahi.mk	2008-08-27 07:29:16 UTC (rev 23234)
>+++ trunk/buildroot/package/avahi/avahi.mk	2008-08-27 07:29:20 UTC (rev 23235)
>@@ -142,7 +142,7 @@
> 	touch $@
> 
> $(AVAHI_DIR)/.compiled: $(AVAHI_DIR)/.configured
>-	$(MAKE) -C $(AVAHI_DIR)
>+	$(MAKE) -C $(AVAHI_DIR) $(if $(BR2_ENABLE_LOCALE),LIBS=-lintl)
> 	touch $@
> 
> $(AVAHI_DIR)/.installed: $(AVAHI_DIR)/.compiled
>@@ -180,7 +180,7 @@
> 		 $(TARGET_DIR)/usr/sbin/avahi-daemon
> 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
> 
>-avahi: uclibc libdaemon $(AVAHI_TARGETS)
>+avahi: uclibc libdaemon $(AVAHI_TARGETS) $(if $(BR2_ENABLE_LOCALE),gettext libintl)

are you sure that the order is correct? Getting this proper for toplevel
parallel make would be fun:

# make sure to set JLEVEL=1
$ make oldconfig
$ rm -rf {toolchain,build,project}_*
$ make -j avahi
