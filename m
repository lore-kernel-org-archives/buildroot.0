From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 11 Dec 2016 19:18:27 +0100
Subject: [Buildroot] [Patch v2 1/9] skalibs: new package
In-Reply-To: <20161210214641.05e6af92@free-electrons.com>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20161210214641.05e6af92@free-electrons.com>
Message-ID: <20161211181827.GA23661@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On 16-12-10 21:46:41, Thomas Petazzoni wrote:

[...]

> > diff --git a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
> > new file mode 100644
> > index 0000000..c58af33
> > --- /dev/null
> > +++ b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
> > @@ -0,0 +1,52 @@
> > +From d868600a3f437750bc44a783d677a25a48100096 Mon Sep 17 00:00:00 2001
> > +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > +Date: Sun, 4 Dec 2016 19:11:25 +0100
> > +Subject: [PATCH 2/2] No runtime tests for type sizes
> > +
> > +Replace build and execution of runtime test programs for determining
> > +some type sizes of the target with compile time test programs.
> > +
> > +This improves support for cross-compilation.
>
> Same comments: git format-patch -N + SoB.
>
> Have you submitted those patches upstream?

I'll re-check with the maintainer: skarnet software is made to be very
portable, so it should build with *ANY* C compiler. My patches may work
with GCC/Clang, but not with other compilers.

[...]

> > +define SKALIBS_REMOVE_STATIC_LIB_DIR
> > +	rm -rf $(TARGET_DIR)/usr/lib/skalibs
> > +endef
> > +
> > +SKALIBS_POST_INSTALL_TARGET_HOOKS += SKALIBS_REMOVE_STATIC_LIB_DIR
>
> What is this static lib dir thing? If skalibs installs its static
> libraries in $(STAGING_DIR)/usr/lib/skalibs/ instead of the default
> $(STAGING_DIR)/usr/lib, then the linker will not find them.

The skarnet libraries are installed in a subdirectory of /usr/lib and
the skarnet build system is able to find them properly. But they won't
be found when cleaning up the target file system, hence the custom hook.

> > +HOST_SKALIBS_CONF_OPTS = \
> > +	--prefix=/usr \
>
> This should be:
>
> 	--prefix=$(HOST_DIR)/usr
>
> > +	--disable-static \
> > +	--enable-shared \
> > +	--disable-allstatic
> > +
> > +define HOST_SKALIBS_CONFIGURE_CMDS
> > +	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_SKALIBS_CONF_OPTS))
> > +endef
> > +
> > +define HOST_SKALIBS_BUILD_CMDS
> > +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)
>
> Why do you have DESTDIR set at build time? You're not passing DESTDIR
> when building the target variant.
>
> > +endef
> > +
> > +define HOST_SKALIBS_INSTALL_CMDS
> > +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
>
> If you pass --prefix=$(HOST_DIR)/usr as suggested above, then passing
> DESTDIR here should no longer be needed.

The use of --prefix=/usr and DESTDIR=$(HOST_DIR) was intentional. The
host variant of s6-rc provides s6-rc-compile, a tool to build the
service database for the target offline, as well as some execline
scripts, where the she-bang contains an absolute path to the execlineb
program.

If --prefix=$(HOST_DIR)/usr were to be used, the execline scripts on the
target file system would refer to the execline program installed on the
host. This is not what we want.

Besides, some execline helpers use hardcoded paths containing the
prefix.

Hence the trick to use --prefix=/usr and DESTDIR at installation time,
which would lead s6-rc-compile to generate proper scripts and avoid
helpers location problems (though that would lead to other host variants
of skarnet programs not working, but we are not interesting in those).

Anyway, it looks like --prefix=$(HOST_DIR)/usr can be used, as I've
noticed a very interesting --shebangdir= option in the ./configure
script of execline. So, I'll rework this part.

> In the commit log, it would be good to mention why a host variant of
> the package is introduced.

Will do!

Thanks for the review.

--
ELB
