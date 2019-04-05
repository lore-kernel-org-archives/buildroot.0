From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 5 Apr 2019 17:57:02 +0000
Subject: [Buildroot] [PATCH v2] libp11: Add new package for OpenSSL
 PKCS#11 engine
In-Reply-To: <20190405094919.40f655c2@windsurf>
References: <20181207181314.24051-1-tpiepho@impinj.com>
 <20190404214556.10f7ef0d@windsurf> <1554412249.27243.12.camel@impinj.com>
 <20190405094919.40f655c2@windsurf>
Message-ID: <1554487021.27243.30.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2019-04-05 at 09:49 +0200, Thomas Petazzoni wrote:
> On Thu, 4 Apr 2019 21:10:50 +0000
> Trent Piepho <tpiepho@impinj.com> wrote:
> Then, even with this fixed, the package didn't build because it was
> > > installing its OpenSSL modules in the wrong folder, as pkg-config
> > > --variable enginesdir libcrypto returned a bogus value. I fixed that by
> > > passing --with-enginesdir.  
> > 
> > This is interesting, as when I made this patch for an older buildroot,
> > pkgconfig would return the correct value.  It was not prefixed with the
> > stage.  This is a new behavior.
> > 
> > And it looks like this already hit a bunch of packages with things like
> > the x11 app-defaults dir.  Since "libdir" is in the whitelist of paths
> > to prefix, it also hits enginesdir since the latter is based on libdir.
> > 
> > Maybe that pkg-config whitelist should not affect variables that use
> > libdir and only prefix libdir itself?
> 
> We have bumped pkg-config not long ago, and indeed its behavior
> changed. When you have something like this:
> 
> prefix=/usr
> libdir=${prefix}/lib
> enginesdir=${libdir}/engines

I suppose another fix would be to patch the libcrypto pc file to use
${prefix}/lib/engines.  If there were more consumers of enginesdir,
then perhaps better to fix it once at the source than in each user?

> and "libdir" was part of the special list of variables that we want to
> prefix with the sysroot, then the old pkg-config would return libdir
> prefixed with the sysroot, but not enginesdir.

I assume there are packages which install libraries to the stage in
sub-directories based on libdir, and this new pkg-config behavior is
better for those cases, while worse for cases like enginesdir.

Maybe some kind of run time control of pkg-config would allow it to
work better?  For instance, an environment variable with some kind of
white/black list of variables to prefix.  Default value would prefix
libdir, etc.  But it could be tweaked on by intfras and/or packages. 
Kind of like:

LIBP11_PKGCONFIG_NOT_STAGE_VARS = enginesdir

Maybe the plumbing costs of this aren't worth making a few packages
simpler.

> Overall, the issue is that there is no concept in pkg-config for "the
> value of this variable is going to be used at build time" vs "the
> value of this variable is going to be used at run time".

Shame.  Maybe buildroot should create a new build system, to replace
autotools, cmake, and meson, that knows about all the issues of cross
building?  Yes, huge project.  Need macos and windows support.  But
think of how much easier buildroot would be if you didn't have to fight
autotools and cmake!
