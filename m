From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Jan 2014 08:16:07 +0100
Subject: [Buildroot] [PATCH 2/3] package/wayland: build a host variant
In-Reply-To: <a1289845ae3d28db8bdae6f02adced5db4613bcd.1391033178.git.yann.morin.1998@free.fr>
References: <cover.1391033178.git.yann.morin.1998@free.fr>
 <a1289845ae3d28db8bdae6f02adced5db4613bcd.1391033178.git.yann.morin.1998@free.fr>
Message-ID: <52E9FC37.5080401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/01/14 23:07, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Starting with 1.4.0, weston requires wayland-scanner to build its DT
> So far, we got away with just hand-building wayland-scanner, and made
> that available in HOST_DIR/usr/bin
>
> But now, weston also requires wayland's DTD, which we did not care of
> in our dirty little hack.
>
> So, the best solution is to just build a host-variant of wayland, so
> we get both wayland-scanner, and the DTD.
>
> But then, we do not build the target wayland-scanner (he, wayland tries
> to run it at build time...). So it is a matter of just tweaking a little
> bit the host .pc file (which weston uses to find wayland-scanner, sigh...)
> and fake it as a target .pc file.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> ---
> Changes v1->V2
>   - remove DTD on target  (Thomas)
> ---
>   package/wayland/wayland.mk | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
> index a823d2b..dc64cf4 100644
> --- a/package/wayland/wayland.mk
> +++ b/package/wayland/wayland.mk
> @@ -11,7 +11,8 @@ WAYLAND_LICENSE = MIT
>   WAYLAND_LICENSE_FILES = COPYING
>
>   WAYLAND_INSTALL_STAGING = YES
> -WAYLAND_DEPENDENCIES = libffi host-pkgconf expat host-expat
> +WAYLAND_DEPENDENCIES = libffi host-pkgconf host-wayland expat host-expat
> +HOST_WAYLAND_DEPENDENCIES = host-libffi host-pkgconf host-expat

  The automatic dependencies work here, right? So this is redundant.

>
>   # wayland needs a wayland-scanner program to generate some of its
>   # source code. By default, it builds it with CC, so it doesn't work with
> @@ -19,14 +20,22 @@ WAYLAND_DEPENDENCIES = libffi host-pkgconf expat host-expat
>   # that the tool is already available.
>   WAYLAND_CONF_OPT = --disable-scanner

  Seems to me that this entire comment has become redundant. Instead, you 
can say

# wayland-scanner is only needed for building, not on the target
WAYLAND_CONF_OPT = --disable-scanner

>
> -define WAYLAND_BUILD_SCANNER
> -	(cd $(@D)/src/; \
> -		$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
> -			-o wayland-scanner scanner.c wayland-util.c -lexpat; \
> -	 	$(INSTALL) -m 0755 -D wayland-scanner \
> -			$(HOST_DIR)/usr/bin/wayland-scanner)
> +# And we must provide a specialy-crafted wayland-scanner .pc file

  With my comment above, the "And" is no longer correct.

> +# which we vampirise and adapt from the host-wayland copy
> +define WAYLAND_SCANNER_PC
> +	$(INSTALL) -m 0644 -D $(HOST_DIR)/usr/share/pkgconfig/wayland-scanner.pc \
> +	              $(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
> +	$(SED) 's:^prefix=.*:prefix=/usr:' \
> +	    -e 's:^wayland_scanner=.*:wayland_sanner=$(HOST_DIR)/usr/bin/wayland-scanner:' \

  wayland-sanner?

> +	    $(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
>   endef
> +WAYLAND_POST_INSTALL_STAGING_HOOKS += WAYLAND_SCANNER_PC
>
> -WAYLAND_POST_CONFIGURE_HOOKS += WAYLAND_BUILD_SCANNER
> +# Remove the DTD from the target, it's not needed at runtime
> +define WAYLAND_TARGET_CLEANUP
> +	rm -rf $(TARGET_DIR)/usr/share/wayland
> +endef
> +WAYLAND_POST_INSTALL_TARGET_HOOKS += WAYLAND_TARGET_CLEANUP
>
>   $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
