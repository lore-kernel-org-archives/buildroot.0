From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 May 2013 00:27:17 +0200
Subject: [Buildroot] [PATCH 2/3] package/libedit2: new package
In-Reply-To: <527cc033d0024e5562a9e5984423088bf343921a.1368567696.git.yann.morin.1998@free.fr>
References: <cover.1368567696.git.yann.morin.1998@free.fr>
 <527cc033d0024e5562a9e5984423088bf343921a.1368567696.git.yann.morin.1998@free.fr>
Message-ID: <5192BA45.6010401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Why is it called libedit2? Both NetBSD and Debian call it libedit...


On 14/05/13 23:45, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
[snip]
> diff --git a/package/libedit2/libedit2.mk b/package/libedit2/libedit2.mk
> new file mode 100644
> index 0000000..0916c2e
> --- /dev/null
> +++ b/package/libedit2/libedit2.mk
> @@ -0,0 +1,76 @@
> +#############################################################
> +#
> +# libedit2
> +#
> +#############################################################
> +
> +# Note: libedit2 does not have a regular homepage, and it seems
> +# there is no place where to download a tarball from. That's
> +# why we use the Debian way-back machine.
> +LIBEDIT2_VERSION_MAJOR   = 2
> +LIBEDIT2_VERSION_MINOR   = 11
> +LIBEDIT2_VERSION_EXTRA   = -20080614
> +LIBEDIT2_VERSION         = $(LIBEDIT2_VERSION_MAJOR).$(LIBEDIT2_VERSION_MINOR)

  Why not
LIBEDIT2_VERSION         = $(LIBEDIT2_VERSION_MAJOR).11-20080614
?

> +LIBEDIT2_SOURCE          = libedit_$(LIBEDIT2_VERSION)$(LIBEDIT2_VERSION_EXTRA).orig.tar.bz2
> +LIBEDIT2_SITE            = http://snapshot.debian.org/archive/debian/20120601T033558Z/pool/main/libe/libedit
> +LIBEDIT2_SUBDIR          = libedit
> +LIBEDIT2_PATCH           = libedit_2.11-20080614-5.debian.tar.bz2

  Should be

LIBEDIT2_PATCH           = libedit_2.$(LIBEDIT2_VERSION)-5.debian.tar.bz2

> +LIBEDIT2_INSTALL_STAGING = YES
> +LIBEDIT2_DEPENDENCIES    = host-pmake libbsd ncurses
> +
> +define LIBEDIT2_POST_PATCH_PERMISSIONS
> +	chmod +x $(@D)/libedit/makelist

  Huh? Does pmake require this to be executable? How weird...

> +endef
> +
> +LIBEDIT2_POST_PATCH_HOOKS += LIBEDIT2_POST_PATCH_PERMISSIONS
> +
> +define LIBEDIT2_FIX_VIS_H_INCLUDE
> +	$(SED) 's,^#include <vis\.h>$$,#include <bsd/vis\.h>,;' \
> +	       $(@D)/libedit/filecomplete.c                     \
> +	       $(@D)/libedit/history.c                          \
> +	       $(@D)/libedit/readline.c
> +endef
> +LIBEDIT2_POST_PATCH_HOOKS += LIBEDIT2_FIX_VIS_H_INCLUDE
> +
> +LIBEDIT2_PMAKE_OPTS = MKPROFILE=no MKCATPAGES=no MLINKS= MANPAGES= NOGCCERROR=1         \
> +                      SHLIB_SHFLAGS="-Wl,-soname,libedit.so.${LIBEDIT2_VERSION_MAJOR}"  \
> +
> +define LIBEDIT2_BUILD_CMDS
> +	cd $(@D)/$(LIBEDIT2_SUBDIR); \
> +	$(TARGET_CONFIGURE_OPTS) LDADD="-lbsd -lcurses" pmake $(LIBEDIT2_PMAKE_OPTS)
> +endef
> +
> +LIBEDIT2_MAN_LINKS = el_init el_end el_reset el_gets el_getc el_push el_parse   \
> +                     el_set el_get el_source el_resize el_line el_insertstr     \
> +                     el_deletestr history_init history_end history
> +
> +# $1: DESTDIR to install into
> +# Can't use pmake to install, it wants to be root. sigh... :-(

  How about using host-fakeroot?


  Regards,
  Arnout


> +# We need to create the .so links, otherwise we can't link; and waiting for
> +# ldconfig is too late as it's done just before building the images.
> +define LIBEDIT2_INSTALL_CMDS
> +	$(INSTALL) -D -m 0644 package/libedit2/libedit2.pc $(1)/usr/lib/pkgconfig/libedit2.pc
> +	ln -sf libedit2.pc $(1)/usr/lib/pkgconfig/libedit.pc
> +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.a $(1)/usr/lib/libedit.a
> +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit_pic.a $(1)/usr/lib/libedit_pic.a
> +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.so.2.11 $(1)/usr/lib/libedit.so.2.11
> +	$(INSTALL) -D -m 0644 $(@D)/libedit/histedit.h $(1)/usr/include/histedit.h
> +	ln -sf libedit.so.$(LIBEDIT2_VERSION) $(1)/usr/lib/libedit.so.$(LIBEDIT2_VERSION_MAJOR)
> +	ln -sf libedit.so.$(LIBEDIT2_VERSION_MAJOR) $(1)/usr/lib/libedit.so
> +	$(INSTALL) -D -m 0644 $(@D)/libedit/readline/readline.h $(1)/usr/include/editline/readline.h
> +	$(INSTALL) -v -D -m 0644 $(@D)/libedit/editline.3 $(1)/usr/share/man/man3/editline.3el
> +	$(INSTALL) -v -D -m 0644 $(@D)/libedit/editrc.5 $(1)/usr/share/man/man5/editrc.5el
> +	for lnk in $(LIBEDIT2_MAN_LINKS); do                            \
> +	    ln -sfv editline.3el $(1)/usr/share/man/man3/$${lnk}.3el;   \
> +	done
> +endef
> +
> +define LIBEDIT2_INSTALL_STAGING_CMDS
> +	$(call LIBEDIT2_INSTALL_CMDS,$(STAGING_DIR))
> +endef
> +
> +define LIBEDIT2_INSTALL_TARGET_CMDS
> +	$(call LIBEDIT2_INSTALL_CMDS,$(TARGET_DIR))
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/libedit2/libedit2.pc b/package/libedit2/libedit2.pc
> new file mode 100644
> index 0000000..47ac871
> --- /dev/null
> +++ b/package/libedit2/libedit2.pc
> @@ -0,0 +1,13 @@
> +prefix=/usr
> +exec_prefix=${prefix}
> +libdir=${exec_prefix}/lib
> +includedir=${prefix}/include
> +
> +Name: libedit
> +Description: Not just a replacement library for libreadline and libhistory.
> +Version: 2.11
> +Requires: libbsd ncurses
> +Requires.private:
> +Libs: -L${libdir} -ledit
> +Libs.private:
> +Cflags: -I${includedir}
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
