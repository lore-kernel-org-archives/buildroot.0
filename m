From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 21:50:22 +0200
Subject: [Buildroot] [PATCH] portmap not building static
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C68C8AD593@ex-mb3.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C68C8AD593@ex-mb3.corp.adtran.com>
Message-ID: <20140908215022.41793f48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ANDY KENNEDY,

The title of the patch should be:

	portmap: fix static linking

On Mon, 8 Sep 2014 15:46:51 +0000, ANDY KENNEDY wrote:
> Portmap builds and links, however, does not get built correctly when
> BR2_PREFER_STATIC_LIB is selected.  There are no dynamic libraries in 
> rootfs.tar, however, portmap gets linked dynamically without regards to
> the PREFER_STATIC_LIB tags.  LDFLAGS was not being passed into the build of
> portmap.  Fixed.

Remove the "Fixed." from the commit log, this is not needed.

> diff -Naur a/package/portmap/portmap.mk b/package/portmap/portmap.mk
> --- a/package/portmap/portmap.mk        2014-02-27 14:51:23.000000000 -0600
> +++ b/package/portmap/portmap.mk        2014-09-08 10:38:06.264120676 -0500
> @@ -15,7 +15,7 @@
>  endif
>  
>  define PORTMAP_BUILD_CMDS
> -       CFLAGS="$(TARGET_CFLAGS)" \
> +       CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
>         $(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
>  endef

I would prefer the following fix:

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 8203555..0189597 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -17,8 +17,7 @@ PORTMAP_FLAGS += NO_FORK=1
 endif
 
 define PORTMAP_BUILD_CMDS
-       CFLAGS="$(TARGET_CFLAGS)" \
-       $(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
+       $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(PORTMAP_FLAGS)
 endef
 
 define PORTMAP_INSTALL_TARGET_CMDS

By using $(TARGET_CONFIGURE_OPTS), we ensure that all usually useful
variables are passed.

Can you resend an updated version with those changes?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
