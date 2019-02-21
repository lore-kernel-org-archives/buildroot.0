From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Thu, 21 Feb 2019 10:03:53 +0100
Subject: [Buildroot] [RFC v2] localedef: update to glibc-2.28 and
 various fixes
In-Reply-To: <bd705cbfb38c68f68bd6a07dfc03ffd5655c0984.camel@mendozajonas.com>
References: <20181206191009.3830-1-ps.report@gmx.net>
 <a0bbfbe40541bfc99f07a9d3b1b99e2647e8c796.camel@mendozajonas.com>
 <bd705cbfb38c68f68bd6a07dfc03ffd5655c0984.camel@mendozajonas.com>
Message-ID: <CABhNV22zvfBCYe8Og4iRXJQer6pFvBQ__JmekQVUFwd1tmR1BQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Just my 2 cents. Feel free to do whatever you want with that.
I've been using this patch for about a month with great success.

I like that patch, but it uses $(@)/build 4 times instead of just setting
HOST_LOCALEDEF_BUILDDIR and using that.

I also doubt that we need to build with -O2 and bash. That was a requirement
for eglibc 6 years ago, but we aren't supporting that anymore.
The glibc configure mentions multiple shells, and the patch is eglibc only.
It has been like that in package/glibc/glibc.mk since that file was created
(but I only tried -OS on my machine, so I may be bullshitting here).

Cheers,
Einar J?n

Offtopic: Another (unrelated) refactoring would be to add
pkg-autotools support for
*_SUPPORTS_IN_SOURCE_BUILD like in pkg-cmake, so we don't have
to redefine *_CONFIGURE_CMDS

Something like
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 45de993..70c251d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -152,6 +152,14 @@ ifndef $(2)_GETTEXTIZE
  endif
 endif

+$(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
+
+ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
+$(2)_BUILDDIR                  = $$($(2)_SRCDIR)
+else
+$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/buildroot-build
+endif
+
 ifeq ($(4),host)
  $(2)_GETTEXTIZE_OPTS ?= $$($(3)_GETTEXTIZE_OPTS)
 endif
@@ -178,12 +186,13 @@ ifeq ($(4),target)

 # Configure package for target
 define $(2)_CONFIGURE_CMDS
-       (cd $$($$(PKG)_SRCDIR) && rm -rf config.cache && \
+       (mkdir -p $$($$(PKG)_BUILDDIR) && \
+       cd $$($$(PKG)_BUILDDIR) && rm -rf config.cache && \
        $$(TARGET_CONFIGURE_OPTS) \
        $$(TARGET_CONFIGURE_ARGS) \
        $$($$(PKG)_CONF_ENV) \
        CONFIG_SITE=/dev/null \
-       ./configure \
+      $$($$(PKG)_SRCDIR)/configure \
                --target=$$(GNU_TARGET_NAME) \
                --host=$$(GNU_TARGET_NAME) \
                --build=$$(GNU_HOST_NAME) \

# repeat for host

On Tue, 19 Feb 2019 at 00:31, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
>
> On Tue, 2018-12-11 at 14:49 +1100, Samuel Mendoza-Jonas wrote:
> > On Thu, 2018-12-06 at 20:10 +0100, Peter Seiderer wrote:
> > > Follow up on original patch [1], various fixes and update according
> > > to the given comments:
> > >
> > > - update to glibc-2.28
> > >
> > > - add ptxdist patch 0001-HACK-only-build-and-install-localedef.patch,
> > >   needed for make target locale/others
> > >
> > > - use make target locale/others (like ptxdist does)
> > >
> > > - add 0002-HACK-accept-old-toolchains.patch, fix configure for old
> > >   host toolchains
> > >
> > > - remove various target related options
> > >
> > > - remove stubs.h header creation
> > >
> > > - do not change '--prefix=/usr' to '--prefix=$(HOST_DIR)', otherwise
> > >   leads to the following failure:
> > >
> > >   Generating locale en_US.UTF-8
> > >   cannot create temporary file: .../target/home/seiderer/Buildroot-2018-11/build_2018_11_002/host/lib/locale/locale-archive.wXbLbC: No such file or directory
> > >   Makefile:715: recipe for target 'target-finalize' failed
> > >   make[1]: *** [target-finalize] Error 1
> > >   Makefile:23: recipe for target '_all' failed
> > >   make: *** [_all] Error 2
> > >
> > > - remove uselsess '$(eval $(autotools-package))'
> > >
> > > [1] https://patchwork.ozlabs.org/patch/950717/
> > >
> > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >
> > Tested-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> >
> > Thanks for picking this up Peter. I asked briefly on the glibc mailing
> > list as well if there is a nicer path to this but so far it doesn't sound
> > promising; this may be the way we have to go.
> > https://sourceware.org/ml/libc-help/2018-12/msg00000.html
>
> I stumbled across Einar's email[0] this morning just as I was about to pick up
> this issue again. What are we thinking about Peter's fix? I can hack around
> this in my own tree but it would be good to have an upstream
> solution/workaround.
>
> Cheers,
> Sam
>
> [0]
> http://lists.busybox.net/pipermail/buildroot/2019-February/242724.html
>
> >
> > > ---
> > > Changes v1 -> v2:
> > >   - remove patch duplicate 0001-accept-old-as.patch-001
> > >   - fix LOCALEDEF_SITE (GLIBC_VERSION vs. LOCALEDEF_VERSION)
> > >   - update 0001-HACK-only-build-and-install-localedef.patch (add upstream
> > >     url and signed-of-by)
> > >   - update 0002-HACK-accept-old-toolchains.patch (convert to git patch,
> > >     add signed-of-by)
> > >
> > > Notes:
> > >
> > >     The following programs shows the failure with Buildroot-2018.11/glibc-2.28:
> > >
> > >       #include <stdio.h>
> > >       #include <string.h>
> > >       #include <locale.h>
> > >
> > >       int main(int argc, char *argv[])
> > >       {
> > >           const char* set_locale = setlocale(LC_ALL, "");
> > >           printf("set_locale: %s\n", set_locale);
> > >
> > >           int delta = strcoll("a", "A");
> > >           printf("strcoll(a, A): %d\n", delta);
> > >
> > >           delta = strcoll("A", "a");
> > >           printf("strcoll(A, a): %d\n", delta);
> > >
> > >           return 0;
> > >       }
> > >
> > >             $ ./test
> > >     set_locale: C
> > >     strcoll(a, A): 32
> > >     strcoll(A, a): -32
> > >
> > >     This one should give the same output as the one with LC_COLLATE=en_US.UTF-8, but failes to do so:
> > >             $ LC_ALL=en_US.UTF-8 ./test
> > >     set_locale: (null)
> > >     strcoll(a, A): 32
> > >     strcoll(A, a): -32
> > >
> > >             $ LC_COLLATE=en_US.UTF-8 ./test
> > >     set_locale: LC_CTYPE=C;LC_NUMERIC=C;LC_TIME=C;LC_COLLATE=en_US.UTF-8;LC_MONETARY=C;LC_MESSAGES=C;LC_PAPER=C;LC_NAME=C;LC_ADDRESS=C;LC_TELEPHONE=C;LC_MEASUREMENT=C;LC_IDENTIFICATION=C
> > >     strcoll(a, A): -5
> > >     strcoll(A, a): 5
> > > ---
> > >  ...ACK-only-build-and-install-localedef.patch | 63 +++++++++++++++++++
> > >  .../0002-HACK-accept-old-toolchains.patch     | 44 +++++++++++++
> > >  package/localedef/localedef.hash              |  2 +-
> > >  package/localedef/localedef.mk                | 47 +++-----------
> > >  4 files changed, 116 insertions(+), 40 deletions(-)
> > >  create mode 100644 package/localedef/0001-HACK-only-build-and-install-localedef.patch
> > >  create mode 100644 package/localedef/0002-HACK-accept-old-toolchains.patch
> > >
> > > diff --git a/package/localedef/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
> > > new file mode 100644
> > > index 0000000000..8d5fefbb82
> > > --- /dev/null
> > > +++ b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
> > > @@ -0,0 +1,63 @@
> > > +From 3a32e5840048ef7db7858ce324731be7a82ddf90 Mon Sep 17 00:00:00 2001
> > > +From: Michael Olbrich <m.olbrich@pengutronix.de>
> > > +Date: Mon, 21 May 2018 16:45:02 +0200
> > > +Subject: [PATCH] HACK: only build and install localedef
> > > +
> > > +Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
> > > +
> > > +Upstream: https://git.pengutronix.de/cgit/ptxdist/plain/patches/localedef-glibc-2.27/0001-HACK-only-build-and-install-localedef.patch?id=47116f66f411d4dadfce42c2fdd6d41b351ccfd4
> > > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > +---
> > > + Rules           | 14 ++++++++++----
> > > + locale/Makefile |  6 +++---
> > > + 2 files changed, 13 insertions(+), 7 deletions(-)
> > > +
> > > +diff --git a/Rules b/Rules
> > > +index 706c8a74..04f3f333 100644
> > > +--- a/Rules
> > > ++++ b/Rules
> > > +@@ -188,10 +188,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
> > > +                                  $(binaries-all-notests))
> > > +
> > > + ifneq "$(strip $(binaries-shared-notests))" ""
> > > +-$(addprefix $(objpfx),$(binaries-shared-notests)): %: %.o \
> > > +-  $(sort $(filter $(common-objpfx)lib%,$(link-libc))) \
> > > +-  $(addprefix $(csu-objpfx),start.o) $(+preinit) $(+postinit)
> > > +-  $(+link)
> > > ++$(addprefix $(objpfx),$(binaries-shared-notests)): %: %.o
> > > ++  $(CC) -o $@ \
> > > ++        $(sysdep-LDFLAGS) $(LDFLAGS) $(LDFLAGS-$(@F)) \
> > > ++        $(combreloc-LDFLAGS) $(relro-LDFLAGS) $(hashstyle-LDFLAGS) \
> > > ++        $(filter-out $(addprefix $(csu-objpfx),start.o \
> > > ++                                               $(start-installed-name))\
> > > ++                     $(+preinit) \
> > > ++                     $(link-extra-libs) \
> > > ++                     $(common-objpfx)libc% $(+postinit),$^) \
> > > ++        $(link-extra-libs)
> > > + endif
> > > +
> > > + ifneq "$(strip $(binaries-shared-tests))" ""
> > > +diff --git a/locale/Makefile b/locale/Makefile
> > > +index fd997227..a8541593 100644
> > > +--- a/locale/Makefile
> > > ++++ b/locale/Makefile
> > > +@@ -32,13 +32,13 @@ categories     = ctype messages monetary numeric time paper name \
> > > +             address telephone measurement identification collate
> > > + aux               = $(categories:%=lc-%) $(categories:%=C-%) SYS_libc C_name \
> > > +             xlocale localename global-locale coll-lookup
> > > +-others            = localedef locale
> > > ++others            = localedef
> > > + #others-static    = localedef locale
> > > +-install-bin       = localedef locale
> > > ++install-bin       = localedef
> > > + extra-objs        = $(localedef-modules:=.o) $(localedef-aux:=.o) \
> > > +             $(locale-modules:=.o) $(lib-modules:=.o)
> > > +
> > > +-extra-libs        = libBrokenLocale
> > > ++#extra-libs       = libBrokenLocale
> > > + extra-libs-others = $(extra-libs)
> > > +
> > > + libBrokenLocale-routines = broken_cur_max
> > > +--
> > > +2.19.2
