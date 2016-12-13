From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 22:54:02 +0100
Subject: [Buildroot] [Patch v2 1/9] skalibs: new package
In-Reply-To: <20161211181827.GA23661@itchy>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20161210214641.05e6af92@free-electrons.com>
 <20161211181827.GA23661@itchy>
Message-ID: <20161213225402.37334028@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Dec 2016 19:18:27 +0100, Eric Le Bihan wrote:

> > Have you submitted those patches upstream?  
> 
> I'll re-check with the maintainer: skarnet software is made to be very
> portable, so it should build with *ANY* C compiler. My patches may work
> with GCC/Clang, but not with other compilers.

Maybe they can accept that as an option, like if you're cross-compiling
you can pass an option to tell skalibs to use those tests that may work
only with gcc ?

> > What is this static lib dir thing? If skalibs installs its static
> > libraries in $(STAGING_DIR)/usr/lib/skalibs/ instead of the default
> > $(STAGING_DIR)/usr/lib, then the linker will not find them.  
> 
> The skarnet libraries are installed in a subdirectory of /usr/lib and
> the skarnet build system is able to find them properly. But they won't
> be found when cleaning up the target file system, hence the custom hook.

OK (it would be good to mention that in the commit log perhaps).

And so it's really only the static library that needs to be removed:
the shared library is really not built/installed when shared libraries
are not enabled in the Buildroot configuration?

> > > +define HOST_SKALIBS_BUILD_CMDS
> > > +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)  
> >
> > Why do you have DESTDIR set at build time? You're not passing DESTDIR
> > when building the target variant.

I don't think you replied to this specific question. Did I miss
something?

> > > +endef
> > > +
> > > +define HOST_SKALIBS_INSTALL_CMDS
> > > +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install  
> >
> > If you pass --prefix=$(HOST_DIR)/usr as suggested above, then passing
> > DESTDIR here should no longer be needed.  
> 
> The use of --prefix=/usr and DESTDIR=$(HOST_DIR) was intentional. The
> host variant of s6-rc provides s6-rc-compile, a tool to build the
> service database for the target offline, as well as some execline
> scripts, where the she-bang contains an absolute path to the execlineb
> program.

Which should be fixed afterwards.

> If --prefix=$(HOST_DIR)/usr were to be used, the execline scripts on the
> target file system would refer to the execline program installed on the
> host. This is not what we want.

Indeed, but it should be fixed afterwards. Using --prefix=/usr
DESTDIR=$(HOST_DIR) is really wrong, as it means that those host tools
will be tempted to open things in for example /usr/share/skalibs/,
while they should open in $(HOST_DIR)/usr/share/skalibs/.

So installing host tools with --prefix=$(HOST_DIR)/usr is really
important, even if it means that we have to fix up a few things like
shebangs in generated scripts.

Or better, the process to generate those scripts gets an additional
argument, which is the path of the execline program on the target.

> Besides, some execline helpers use hardcoded paths containing the
> prefix.
> 
> Hence the trick to use --prefix=/usr and DESTDIR at installation time,
> which would lead s6-rc-compile to generate proper scripts and avoid
> helpers location problems (though that would lead to other host variants
> of skarnet programs not working, but we are not interesting in those).
> 
> Anyway, it looks like --prefix=$(HOST_DIR)/usr can be used, as I've
> noticed a very interesting --shebangdir= option in the ./configure
> script of execline. So, I'll rework this part.

Ah, exactly what I was proposing earlier :-)

> > In the commit log, it would be good to mention why a host variant of
> > the package is introduced.  
> 
> Will do!

Thanks!

Do you think you can respin soon those patches? Your previous iteration
was from August this year. I know we are also not very fast at applying
patches, so it's hard to criticize anything here. But when there are
5-6 months between two iterations of a series, we completely lose the
context, and it's almost as-if the review restart from scratch. So if
you can post the new iterations a bit faster, the context is still
fresh, and there's a higher chance that it will get merged soon.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
