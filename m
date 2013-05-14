From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 May 2013 00:42:14 +0200
Subject: [Buildroot] [PATCH 2/3] package/libedit2: new package
In-Reply-To: <5192BA45.6010401@mind.be>
References: <cover.1368567696.git.yann.morin.1998@free.fr>
 <527cc033d0024e5562a9e5984423088bf343921a.1368567696.git.yann.morin.1998@free.fr>
 <5192BA45.6010401@mind.be>
Message-ID: <20130514224214.GB8043@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-05-15 00:27 +0200, Arnout Vandecappelle spake thusly:
>  Why is it called libedit2? Both NetBSD and Debian call it libedit...

Debian actually calls it:
    libedit2        
    libedit-dev
See: http://packages.debian.org/search?keywords=libedit

> On 14/05/13 23:45, Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Cc: Arnout Vandecappelle <arnout@mind.be>
> [snip]
> >diff --git a/package/libedit2/libedit2.mk b/package/libedit2/libedit2.mk
> >new file mode 100644
> >index 0000000..0916c2e
> >--- /dev/null
> >+++ b/package/libedit2/libedit2.mk
> >@@ -0,0 +1,76 @@
> >+#############################################################
> >+#
> >+# libedit2
> >+#
> >+#############################################################
> >+
> >+# Note: libedit2 does not have a regular homepage, and it seems
> >+# there is no place where to download a tarball from. That's
> >+# why we use the Debian way-back machine.
> >+LIBEDIT2_VERSION_MAJOR   = 2
> >+LIBEDIT2_VERSION_MINOR   = 11
> >+LIBEDIT2_VERSION_EXTRA   = -20080614
> >+LIBEDIT2_VERSION         = $(LIBEDIT2_VERSION_MAJOR).$(LIBEDIT2_VERSION_MINOR)
> 
>  Why not
> LIBEDIT2_VERSION         = $(LIBEDIT2_VERSION_MAJOR).11-20080614
> ?

Pshhh... Why not. :-)

> >+LIBEDIT2_SOURCE          = libedit_$(LIBEDIT2_VERSION)$(LIBEDIT2_VERSION_EXTRA).orig.tar.bz2
> >+LIBEDIT2_SITE            = http://snapshot.debian.org/archive/debian/20120601T033558Z/pool/main/libe/libedit
> >+LIBEDIT2_SUBDIR          = libedit
> >+LIBEDIT2_PATCH           = libedit_2.11-20080614-5.debian.tar.bz2
> 
>  Should be
> 
> LIBEDIT2_PATCH           = libedit_2.$(LIBEDIT2_VERSION)-5.debian.tar.bz2

Almost: s/_2\.//
Otherwise: indeed! :-)

> >+LIBEDIT2_INSTALL_STAGING = YES
> >+LIBEDIT2_DEPENDENCIES    = host-pmake libbsd ncurses
> >+
> >+define LIBEDIT2_POST_PATCH_PERMISSIONS
> >+	chmod +x $(@D)/libedit/makelist
> 
>  Huh? Does pmake require this to be executable? How weird...

As far as I remember, yes. I'll double check to be sure (hey! this has
been first dealt with last August! I don't remember all the details,
hence I should have added a comment. I'm served. :-) )

> >+endef
> >+
> >+LIBEDIT2_POST_PATCH_HOOKS += LIBEDIT2_POST_PATCH_PERMISSIONS
> >+
> >+define LIBEDIT2_FIX_VIS_H_INCLUDE
> >+	$(SED) 's,^#include <vis\.h>$$,#include <bsd/vis\.h>,;' \
> >+	       $(@D)/libedit/filecomplete.c                     \
> >+	       $(@D)/libedit/history.c                          \
> >+	       $(@D)/libedit/readline.c
> >+endef
> >+LIBEDIT2_POST_PATCH_HOOKS += LIBEDIT2_FIX_VIS_H_INCLUDE
> >+
> >+LIBEDIT2_PMAKE_OPTS = MKPROFILE=no MKCATPAGES=no MLINKS= MANPAGES= NOGCCERROR=1         \
> >+                      SHLIB_SHFLAGS="-Wl,-soname,libedit.so.${LIBEDIT2_VERSION_MAJOR}"  \
> >+
> >+define LIBEDIT2_BUILD_CMDS
> >+	cd $(@D)/$(LIBEDIT2_SUBDIR); \
> >+	$(TARGET_CONFIGURE_OPTS) LDADD="-lbsd -lcurses" pmake $(LIBEDIT2_PMAKE_OPTS)
> >+endef
> >+
> >+LIBEDIT2_MAN_LINKS = el_init el_end el_reset el_gets el_getc el_push el_parse   \
> >+                     el_set el_get el_source el_resize el_line el_insertstr     \
> >+                     el_deletestr history_init history_end history
> >+
> >+# $1: DESTDIR to install into
> >+# Can't use pmake to install, it wants to be root. sigh... :-(
> 
>  How about using host-fakeroot?

Meh... No other package depend on host-fakeroot so far, I did not want
to be the first. And since pmake is anyway a pita to work with, the less
we have to use it, the better we'll feel, I can promise you! :-)

I will update with your comments before resubmitting later tomorrow
evening (might not even be before the WE now, I'll be very busy with
real life matters until saturday morrning...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
