From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Feb 2013 23:41:14 +0100
Subject: [Buildroot] [PATCH 4/7] package/libedit2: new package
In-Reply-To: <d4a01f43840a933d1829c6e453378c995be77f4e.1359993560.git.yann.morin.1998@free.fr>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <d4a01f43840a933d1829c6e453378c995be77f4e.1359993560.git.yann.morin.1998@free.fr>
Message-ID: <5110390A.1040708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/13 17:01, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>   package/Config.in                                  |    1 +
>   package/libedit2/Config.in                         |    9 +++
>   package/libedit2/libedit2-01-Makefile.patch        |   25 +++++++
>   package/libedit2/libedit2-02-el.c-issetugid.patch  |   24 ++++++
>   package/libedit2/libedit2-03-el.c-MAXPATHLEN.patch |   40 +++++++++++
>   .../libedit2/libedit2-04-readline.h-stdio.patch    |   17 +++++
>   .../libedit2/libedit2-08-readline-history.h.patch  |   20 +++++
>   .../libedit2/libedit2-10-define_SIZE_T_MAX.patch   |   18 +++++
>   .../libedit2/libedit2-12-libedit-Makefile.patch    |   54 ++++++++++++++
>   package/libedit2/libedit2-20-fortify.patch         |   23 ++++++

  Any chance of using libedit_2.11-20080614-5.debian.tar.bz2 instead?

[snip]
> diff --git a/package/libedit2/libedit2.mk b/package/libedit2/libedit2.mk
> new file mode 100644
> index 0000000..b9ca41e
> --- /dev/null
> +++ b/package/libedit2/libedit2.mk
> @@ -0,0 +1,75 @@
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
> +LIBEDIT2_VERSION_MINOR   = 11-20080614
> +LIBEDIT2_VERSION         = $(LIBEDIT2_VERSION_MAJOR).$(LIBEDIT2_VERSION_MINOR)
> +LIBEDIT2_SOURCE          = libedit_$(LIBEDIT2_VERSION).orig.tar.bz2
> +LIBEDIT2_SITE            = http://snapshot.debian.org/archive/debian/20120601T033558Z/pool/main/libe/libedit
> +LIBEDIT2_SUBDIR          = libedit
> +LIBEDIT2_INSTALL_STAGING = YES
> +LIBEDIT2_DEPENDENCIES    = host-pmake libbsd ncurses
> +
> +define POST_PATCH_PERMISSIONS

  Start the name with LIBEDIT2

> +	chmod +x $(@D)/libedit/makelist
> +endef
> +
> +LIBEDIT2_POST_PATCH_HOOKS += POST_PATCH_PERMISSIONS
> +
> +define LIBEDIT2_FIX_VIS_H_INCLUDE
> +	$(SED) 's/^#include <vis.h>$$/#include <bsd\/vis.h>/;' $(@D)/libedit/filecomplete.c

  If you use s,foo,bar, instead of s/foo/bar/ you don't need to quote /. 
Also, the ; is redundant.

> +	$(SED) 's/^#include <vis.h>$$/#include <bsd\/vis.h>/;' $(@D)/libedit/history.c
> +	$(SED) 's/^#include <vis.h>$$/#include <bsd\/vis.h>/;' $(@D)/libedit/readline.c

  Three times the same sed rule => just apply once to all files.

> +endef
> +LIBEDIT2_POST_PATCH_HOOKS += LIBEDIT2_FIX_VIS_H_INCLUDE
> +
> +LIBEDIT2_PMAKE_ARGS = MKPROFILE=no MKCATPAGES=no MLINKS= MANPAGES= NOGCCERROR=1         \

  We normally use _OPTS, not _ARGS.  (There is TARGET_CONFIGURE_ARGS but 
it's just plain wrong.)

> +                      SHLIB_SHFLAGS="-Wl,-soname,libedit.so.${LIBEDIT2_VERSION_MAJOR}"  \

  Redundant trailing \.

> +
> +define LIBEDIT2_BUILD_CMDS
> +	cd $(@D)/$(LIBEDIT2_SUBDIR); \
> +	$(TARGET_CONFIGURE_OPTS) LDADD="-lbsd -lcurses" pmake $(LIBEDIT2_PMAKE_ARGS)
> +endef
> +
> +LIBEDIT2_MAN_LINKS = el_init el_end el_reset el_gets el_getc el_push el_parse   \
> +                     el_set el_get el_source el_resize el_line el_insertstr     \
> +                     el_deletestr history_init history_end history
> +
> +# $1: DESTDIR to install into
> +# Can't use pmake to install, it wants to be root. sigh... :-(
> +define LIBEDIT2_INSTALL_CMDS
> +	$(INSTALL) -D -m 0644 package/libedit2/libedit2.pc $(1)/usr/lib/pkgconfig/libedit2.pc
> +	ln -sf libedit2.pc $(1)/usr/lib/pkgconfig/libedit.pc
> +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.a $(1)/usr/lib/libedit.a
> +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit_pic.a $(1)/usr/lib/libedit_pic.a
> +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.so.2.11 $(1)/usr/lib/libedit.so.2.11
> +	$(INSTALL) -D -m 0644 $(@D)/libedit/histedit.h $(1)/usr/include/histedit.h
> +	ln -sf libedit.so.$(LIBEDIT2_VERSION) $(1)/usr/lib/libedit.so.$(LIBEDIT2_VERSION_MAJOR)

  This doesn't seem right: LIBEDIT2_VERSION is 2.11-20080614, but you 
just installed 2.11...

> +	ln -sf libedit.so.$(LIBEDIT2_VERSION_MAJOR) $(1)/usr/lib/libedit.so
> +	$(INSTALL) -D -m 0644 $(@D)/libedit/readline/readline.h $(1)/usr/include/editline/readline.h
> +	if [ "$(BR2_HAVE_DOCUMENTATION)" = "y" ]; then                                              \

  This condition is redundant, because the finalize step will remove man 
anyway if !BR2_HAVE_DOCUMENTATION.

> +	    $(INSTALL) -v -D -m 0644 $(@D)/libedit/editline.3 $(1)/usr/share/man/man3/editline.3el; \
> +	    $(INSTALL) -v -D -m 0644 $(@D)/libedit/editrc.3 $(1)/usr/share/man/man5/editrc.5el;     \
> +	    for lnk in $(LIBEDIT2_MAN_LINKS); do                                                    \
> +	        ln -sfv editline.3el $(1)/usr/share/man/man3/$${lnk}.3el;                           \
> +	    done;                                                                                   \
> +	fi
> +endef

  A perfect candidate to use the unified TARGET/STAGING install commands!

> +#	cd $(@D)/libedit; pmake install incinstall DESTDIR=$(1) $(LIBEDIT2_PMAKE_ARGS)
> +#	cd $(@D)/libedit/readline; pmake incinstall DESTDIR=$(1) $(LIBEDIT2_PMAKE_ARGS)

  Redundant comments.


  Regards,
  Arnout

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


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
