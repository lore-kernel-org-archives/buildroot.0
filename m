From: Qais Yousef <Qais.Yousef@imgtec.com>
Date: Tue, 17 Apr 2012 17:20:18 +0100
Subject: [Buildroot] [PATCH v2] New Package: latencytop
In-Reply-To: <877gxelgk1.fsf@macbook.be.48ers.dk>
References: <1333538160-14091-1-git-send-email-qais.yousef@imgtec.com>
 <877gxelgk1.fsf@macbook.be.48ers.dk>
Message-ID: <0D107966AF6D79418315B7C5549F4B51033CC17F@lemail1.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>  Qais>  menu "Development tools"
>  Qais> diff --git a/package/latencytop/Config.in
> b/package/latencytop/Config.in  Qais> new file mode 100644  Qais>
index
> 0000000..1c120c6  Qais> --- /dev/null  Qais> +++
> b/package/latencytop/Config.in  Qais> @@ -0,0 +1,15 @@  Qais> +config
> BR2_PACKAGE_LATENCYTOP
>  Qais> +	bool "latencytop"
> 
> It uses glib2 and ncurses, so it should select those packages. Glib2
depends
> on USE_WCHAR, so you need to depend on that as well (and show a
> comment if not available similar to how glib2 does).

Done.

>  Qais> +	help
>  Qais> +	  There are many types and causes of latency. LatencyTOP
>  Qais> +	  focuses on the type of latency that causes skips in
audio,
>  Qais> +	  stutters in your desktop experience or that overloads
your
>  Qais> +	  server (while you have plenty of CPU power left).
>  Qais> +
>  Qais> +	  LatencyTOP focuses on the cases where the applications
> want
>  Qais> +	  to run and execute useful code, but there's some
resource
>  Qais> +	  that's not currently available (and the kernel then
blocks
>  Qais> +	  the process). This is done both on a system level and
on a
>  Qais> +	  per process level, so that you can see what's
happening to
>  Qais> +	  the system, and which process is suffering and/or
causing
>  Qais> +	  the delays.
> 
> We normally add the upstream URL at the end
(http://www.latencytop.org)

Done.

>  Qais> diff --git a/package/latencytop/latencytop-makefile.patch
> b/package/latencytop/latencytop-makefile.patch
>  Qais> new file mode 100644
>  Qais> index 0000000..25be244
>  Qais> --- /dev/null
>  Qais> +++ b/package/latencytop/latencytop-makefile.patch
>  Qais> @@ -0,0 +1,46 @@
>  Qais> +pkg-config and gcc are always used, which prevents cross
compiling.
>  Qais> +Use env variables to override the default behaviour.
>  Qais> +
> 
> This patch changes more than needed. I would prefer to keep the patch
as
> small as possible to make it easier to upgrade later.
> 
> Have you sent this patch upstream?

No I didn't. The last upstream commit was back in 2009 so I didn't think
anyone would care much. I'll see if I can find a point of contact.
Latencytop is still a useful package even if it is not actively
maintained, I think ;-)

>  Qais> +Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>  Qais> +
>  Qais> +--- latencytop-0.5/Makefile.old	2012-04-03
14:42:09.135328435 +0100
>  Qais> ++++ latencytop-0.5/Makefile	2012-04-03 15:05:47.878234542
+0100
>  Qais> +@@ -1,16 +1,17 @@
>  Qais> + # FIXME: Use autoconf ?
>  Qais> +-HAS_GTK_GUI = 1
>  Qais> ++HAS_GTK_GUI ?= 1
> 
> Unneeded. Variables on the make command line overrides settings in the
> Makefile.
>
>  Qais> +
>  Qais> +-DESTDIR =
>  Qais> +-SBINDIR = /usr/sbin
>  Qais> +-XCFLAGS = -W  -g `pkg-config --cflags glib-2.0` -
> D_FORTIFY_SOURCE=2 -Wno-sign-compare
>  Qais> +-LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`
-lncursesw
> 
> TARGET_CONFIGURE_OPTS prepends $(HOST_DIR)/usr/bin to the path, so
> the right pkg-config should get picked up without all of this.

Yep, you're right. Fixed both.

>  Qais> ++DESTDIR ?=
>  Qais> ++SBINDIR ?= /usr/sbin
>  Qais> ++PKG_CONFIG ?= pkg-config
>  Qais> ++XCFLAGS += -W  -g `$(PKG_CONFIG) --cflags glib-2.0` -
> D_FORTIFY_SOURCE=2 -Wno-sign-compare
>  Qais> ++LDFLAGS += -Wl,--as-needed `$(PKG_CONFIG) --libs glib-2.0`
-
> lncurses
>  Qais> +
>  Qais> + OBJS= latencytop.o text_display.o translate.o fsync.o  Qais>
+  Qais>
> +-ifdef HAS_GTK_GUI  Qais> +-  XCFLAGS += `pkg-config --cflags
gtk+-2.0` -
> DHAS_GTK_GUI  Qais> +-  LDF += `pkg-config --libs gtk+-2.0`  Qais>
++ifeq
> (HAS_GTK_GUI, 1)
> 
> You need to expand HAS_GTK_GUI - E.G.
> 
> ifeq ($(HAS_GTK_GUI),1)

I used ifneq ($(HAS_GTK_GUI),0) instead. Logically makes more sense I
guess.
 
>  Qais> ++  XCFLAGS += `$(PKG_CONFIG) --cflags gtk+-2.0` -DHAS_GTK_GUI
> Qais> ++  LDFLAGS += `$(PKG_CONFIG) --libs gtk+-2.0`
>  Qais> +   OBJS += gtk_display.o
>  Qais> + endif
>  Qais> +
>  Qais> +@@ -26,10 +27,10 @@
>  Qais> +
>  Qais> + # We write explicity this "implicit rule"
>  Qais> + %.o : %.c
>  Qais> +-	gcc -c $(CFLAGS) $(XCFLAGS) $< -o $@
>  Qais> ++	$(CC) -c $(CFLAGS) $(XCFLAGS) $< -o $@
>  Qais> +
>  Qais> + latencytop:  $(OBJS) latencytop.h Makefile
>  Qais> +-	gcc $(CFLAGS) $(OBJS) $(LDF) -o latencytop
>  Qais> ++	$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) -o latencytop
>  Qais> +
>  Qais> + clean:
>  Qais> + 	rm -f *~ latencytop DEADJOE *.o
> 
> 
> So I think the only things that should get patches are:
> 
> s/ifdef HAS_GTK_GUI/ifeq ($(HAS_GTK_GUI),1)/ s/gcc/$(CC)/

Almost. You missed s/lncursesw/lncurses/ otherwise I would get linking
error.
 
>  Qais> diff --git a/package/latencytop/latencytop.mk
> b/package/latencytop/latencytop.mk
>  Qais> new file mode 100644
>  Qais> index 0000000..f55a564
>  Qais> --- /dev/null
>  Qais> +++ b/package/latencytop/latencytop.mk
>  Qais> @@ -0,0 +1,21 @@
>  Qais>
> +#########################################################
> ####
>  Qais> +#
>  Qais> +# latencytop
>  Qais> +#
>  Qais>
> +#########################################################
> ####
>  Qais> +
>  Qais> +LATENCYTOP_VERSION = 0.5
>  Qais> +LATENCYTOP_SITE = http://www.latencytop.org/download/
>  Qais> +LATENCYTOP_DEPENDENCIES = libglib2 ncurses  Qais> +  Qais> +#
> NOTE: GTK is heavy weight, we intentionally build the text (ncurses)
Qais>
> +# version only
> 
> Not a big deal, but we do have libgtk2 in buildroot, so it would be
nice to build
> the gtk version if libgtk2 is enabled.

It might be a bit difficult for me to get this tested properly so I
avoided it altogether.

>  Qais> +define LATENCYTOP_BUILD_CMDS
>  Qais> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) HAS_GTK_GUI=0 -C
> $(@D)
>  Qais> +endef
>  Qais> +
>  Qais> +define LATENCYTOP_INSTALL_TARGET_CMDS
>  Qais> +	$(MAKE) install -C $(@D) DESTDIR=$(TARGET_DIR)
>  Qais> +endef
>  Qais> +
>  Qais> +$(eval $(call GENTARGETS))
> 
> Care to fix and resend?

Sure, I'll repost the updated patch shortly :-)

Thanks,
Qais

> --
> Bye, Peter Korsgaard
