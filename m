From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri, 20 Nov 2015 21:20:33 -0200
Subject: [Buildroot] [PATCH] ustr: using debian patches to compile w/
	GCC 5.x
In-Reply-To: <564F9306.3090608@mind.be>
References: <1447983556-28274-1-git-send-email-ryanbarnett3@gmail.com>
 <564F9306.3090608@mind.be>
Message-ID: <CANu7NGtL+e0ppZ+jO8dhOWzRoTKVQ+y6Hxp_w84aVuZhMr5eNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout and Ryan,

I have just prepared a patch to fix this problem. It is just a matter of
passing -std=gnu89 to CFLAGS. That's because GCC5 defaults to gnu11 and
handles "inline" constructs differently.

Do you want me to send this patch or are you going to apply the Debian
patches?

Regards,

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-11-20 19:39 GMT-02:00 Arnout Vandecappelle <arnout@mind.be>:

> On 20-11-15 02:39, Ryan Barnett wrote:
> > To fix issues with compiling with GCC 5.x, switch to utilzing the
> > debian patches for cross compiling. The debian tar was tired but the
> > series file in the folder is not compatiable with buildroot as it has
> > a 'p1' after each file.
>
>  Peter merged 7caf46439 (apply-patches.sh: use everything from the series
> file)
> so this should no longer be the case. Could you give it another go?
>
> > This means the patches are individually
> > listed.
> >
> > Fixes:
> >
> http://autobuild.buildroot.net/results/150/150fa803fc3b65f75dce2847907ee768fc94c7a7
> >
> http://autobuild.buildroot.net/results/150/150fa803fc3b65f75dce2847907ee768fc94c7a7
> >   ...and many more
> >
> > Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> > ---
> >  .../ustr/0001-cross-compile-modifications.patch    | 144
> ---------------------
> >  package/ustr/ustr.hash                             |   6 +
> >  package/ustr/ustr.mk                               |  50 ++-----
> >  3 files changed, 16 insertions(+), 184 deletions(-)
> >  delete mode 100644 package/ustr/0001-cross-compile-modifications.patch
> >
> > diff --git a/package/ustr/0001-cross-compile-modifications.patch
> b/package/ustr/0001-cross-compile-modifications.patch
> > deleted file mode 100644
> > index ab75b44..0000000
> > --- a/package/ustr/0001-cross-compile-modifications.patch
> > +++ /dev/null
> > @@ -1,144 +0,0 @@
> > -Changes are to allow ustr version 1.0.4 to cross compile in buildroot.
>
>  Commit log should explicitly mention that this patch (or an equivalent)
> is part
> of the debian patches. If the debian patch is different, also mention
> explicitly
> what the difference is.
>
> > -
> > -Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>
> > -
> [snip]
> > diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
> > index 3144c0b..0daed3f 100644
> > --- a/package/ustr/ustr.mk
> > +++ b/package/ustr/ustr.mk
> > @@ -9,46 +9,16 @@ USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
> >  USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)
> >  USTR_LICENSE = BSD-2c MIT LGPLv2+
> >  USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
> > +USTR_AUTORECONF = YES
> > +USTR_PATCH = \
> > +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/autoconf.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> \
> > +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/doc-html-local-css.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> \
> > +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/gnu-inline.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> \
> > +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/nonlinux.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> \
> > +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/stdarg-va_copy.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> \
> > +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/unused-vars.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> >
> >  USTR_INSTALL_STAGING = YES
> >
> > -ifeq ($(BR2_STATIC_LIBS),y)
> > -USTR_BUILD_TARGETS = all
> > -USTR_INSTALL_TARGETS = install
> > -else ifeq ($(BR2_SHARED_LIBS),y)
> > -USTR_BUILD_TARGETS = all-shared
> > -USTR_INSTALL_TARGETS = install-shared
> > -else
> > -USTR_BUILD_TARGETS = all all-shared
> > -USTR_INSTALL_TARGETS = all install-shared
> > -endif
> > -
> > -define USTR_BUILD_CMDS
> > -     $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) $(USTR_BUILD_TARGETS)
> > -endef
> > -
> > -define USTR_INSTALL_STAGING_CMDS
> > -     $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
> > -             $(USTR_INSTALL_TARGETS)
> > -     $(RM) -f $(STAGING_DIR)/usr/lib/libustr-debug*
> > -     $(RM) -f $(STAGING_DIR)/usr/lib/pkgconfig/libustr-debug.pc
> > -endef
> > -
> > -define USTR_INSTALL_TARGET_CMDS
> > -     $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
> > -             $(USTR_INSTALL_TARGETS)
> > -     $(RM) -f $(TARGET_DIR)/usr/lib/libustr-debug*
> > -     $(RM) -rf $(TARGET_DIR)/usr/share/ustr-$(USTR_VERSION)
> > -endef
> > -
> > -define HOST_USTR_BUILD_CMDS
> > -     $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) all-shared
> > -endef
> > -
> > -define HOST_USTR_INSTALL_CMDS
> > -     $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) \
> > -             install-shared
> > -endef
> > -
> > -$(eval $(generic-package))
> > -$(eval $(host-generic-package))
> > +$(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
>
>  Wow, so there's a Debian patch that converts it into an autotools package?
> That's definitely worth mentioning explicitly in the commit log.
>
>  Regards,
>  Arnout
>
> >
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151120/b14aee68/attachment.html>
