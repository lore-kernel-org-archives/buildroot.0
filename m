From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 25 Oct 2019 03:06:28 -0500
Subject: [Buildroot] [PATCH 2/2] package/jitterentropy-library: fix
 static build
In-Reply-To: <CANQCQpby27NNoa0_FJ2W-xKJ20EpzRSBfa7nbLb9n2W7_PvvDA@mail.gmail.com>
References: <20191024165913.19081-1-fontaine.fabrice@gmail.com>
 <20191024165913.19081-2-fontaine.fabrice@gmail.com>
 <CANQCQpby27NNoa0_FJ2W-xKJ20EpzRSBfa7nbLb9n2W7_PvvDA@mail.gmail.com>
Message-ID: <CANQCQpY=+HqEFXH1++4M1ObynTQqO3xwUGHZtdTp7WL3JjJXPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,

On Thu, Oct 24, 2019 at 12:07 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Fabrice,
>
> On Thu, Oct 24, 2019 at 11:59 AM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/27b19c964c4457dca69639e1913ce44f010853ac
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

- I tailored the config for a static only, shared only and both
- Verified the installed library file location for each config case
- Checked that rng-tools could detect the jitter library as part of
the configure step for each configuration

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

> > ---
> >  ...efile-add-additional-install-targets.patch | 56 +++++++++++++++++++
> >  .../jitterentropy-library.mk                  | 24 +++++++-
> >  2 files changed, 77 insertions(+), 3 deletions(-)
> >  create mode 100644 package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch
> >
> > diff --git a/package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch b/package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch
> > new file mode 100644
> > index 0000000000..a331c9f33b
> > --- /dev/null
> > +++ b/package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch
> > @@ -0,0 +1,56 @@
> > +From d545d76cb3173cc98e1421604929248f2d882821 Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Thu, 24 Oct 2019 18:48:47 +0200
> > +Subject: [PATCH] Makefile: add additional install targets
>
> Thanks for breaking it out further
>
> > +
> > +Add install-includes, install-man, install-shared and install-static
> > +targets to allow the user to configure what must be installed
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +[Upstream status:
> > +https://github.com/smuellerDD/jitterentropy-library/pull/11]
> > +---
> > + Makefile | 18 ++++++++++++++----
> > + 1 file changed, 14 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 2e78607..41bc4f7 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -57,19 +57,29 @@ scan: $(analyze_plists)
> > + cppcheck:
> > +       cppcheck --force -q --enable=performance --enable=warning --enable=portability *.h *.c
> > +
> > +-install:
> > ++install: install-man install-shared install-includes
> > ++
> > ++install-man:
> > +       install -d -m 0755 $(DESTDIR)$(PREFIX)/share/man/man3
> > +       install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
> > +       gzip -f -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
> > ++
> > ++install-shared:
> > +       install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
> > +       $(INSTALL_STRIP) -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
> > +-      install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
> > +-      install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
> > +-      install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
> > +       $(RM) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
> > +       ln -sf lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
> > +       ln -sf lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
> > +
> > ++install-includes:
> > ++      install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
> > ++      install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
> > ++      install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
> > ++
> > ++install-static:
> > ++      install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
> > ++      install -m 0755 lib$(NAME).a $(DESTDIR)$(PREFIX)/$(LIBDIR)/
> > ++
> > + clean:
> > +       @- $(RM) $(NAME)
> > +       @- $(RM) $(OBJS)
> > +--
> > +2.23.0
> > +
> > diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
> > index 7ce52aa9ad..a8e15ce792 100644
> > --- a/package/jitterentropy-library/jitterentropy-library.mk
> > +++ b/package/jitterentropy-library/jitterentropy-library.mk
> > @@ -9,17 +9,35 @@ JITTERENTROPY_LIBRARY_SITE = $(call github,smuellerDD,$(JITTERENTROPY_LIBRARY_NA
> >  JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0 or BSD-3-Clause
> >  JITTERENTROPY_LIBRARY_LICENSE_FILES = COPYING COPYING.bsd COPYING.gplv2
> >  JITTERENTROPY_LIBRARY_INSTALL_STAGING = YES
> > +JITTERENTROPY_LIBRARY_INSTALL_TARGETS = install-includes
> > +
> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy-static
> > +JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-static
> > +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> > +JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy jitterentropy-static
> > +JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-shared install-static
> > +else ifeq ($(BR2_SHARED_LIBS),y)
> > +JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy
> > +JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-shared
> > +endif
> > +
> >
> >  define JITTERENTROPY_LIBRARY_BUILD_CMDS
> > -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
> > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
>
> I believe you want to move $(TARGET_CONFIGURE_OPTS) before $(MAKE) to
> fix the autobuild mentioned above.

Oops, the autobuild failure I was referring to was not the one above
but this fPIC one but the following.
http://autobuild.buildroot.net/results/505/5059207ec9ab0b502717626cc84956dafd0c3c32/

The order of TARGET_CONFIGURE_OPTS is still an issue but would be a
refactor of the following series
http://patchwork.ozlabs.org/patch/1182068/

>
> > +               $(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
> >  endef
> >
> >  define JITTERENTROPY_LIBRARY_INSTALL_STAGING_CMDS
> > -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) INSTALL_STRIP="install" PREFIX=/usr install
> > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) \
> > +               INSTALL_STRIP="install" PREFIX=/usr \
> > +               $(JITTERENTROPY_LIBRARY_INSTALL_TARGETS)
> >  endef
> >
> >  define JITTERENTROPY_LIBRARY_INSTALL_TARGET_CMDS
> > -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) INSTALL_STRIP="install" PREFIX=/usr install
> > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
> > +               INSTALL_STRIP="install" PREFIX=/usr \
> > +               $(JITTERENTROPY_LIBRARY_INSTALL_TARGETS)
> >  endef
> >
> >  $(eval $(generic-package))
> > --
> > 2.23.0
> >
>
>
> --
>
> Matthew Weber | Associate Director Software Engineer | Commercial Avionics
>
> COLLINS AEROSPACE
>
> 400 Collins Road NE, Cedar Rapids, Iowa 52498, USA
>
> Tel: +1 319 295 7349 | FAX: +1 319 263 6099
>
> matthew.weber at collins.com | collinsaerospace.com
>
>
>
> CONFIDENTIALITY WARNING: This message may contain proprietary and/or
> privileged information of Collins Aerospace and its affiliated
> companies. If you are not the intended recipient, please 1) Do not
> disclose, copy, distribute or use this message or its contents. 2)
> Advise the sender by return email. 3) Delete all copies (including all
> attachments) from your computer. Your cooperation is greatly
> appreciated.
>
>
> Any export restricted material should be shared using my
> matthew.weber at corp.rockwellcollins.com address.



-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
