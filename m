From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 10:12:59 +0200
Subject: [Buildroot] [PATCH v2] libp11: Add new package for OpenSSL
 PKCS#11 engine
In-Reply-To: <1554487021.27243.30.camel@impinj.com>
References: <20181207181314.24051-1-tpiepho@impinj.com>
 <20190404214556.10f7ef0d@windsurf>
 <1554412249.27243.12.camel@impinj.com>
 <20190405094919.40f655c2@windsurf>
 <1554487021.27243.30.camel@impinj.com>
Message-ID: <20190426101259.73916e0a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Trent,

On Fri, 5 Apr 2019 17:57:02 +0000
Trent Piepho <tpiepho@impinj.com> wrote:

> > prefix=/usr
> > libdir=${prefix}/lib
> > enginesdir=${libdir}/engines  
> 
> I suppose another fix would be to patch the libcrypto pc file to use
> ${prefix}/lib/engines.  If there were more consumers of enginesdir,
> then perhaps better to fix it once at the source than in each user?

Yes, that could be one option. But it's clearly not upstreamable, as
it's a hack that depends on some custom changes we (Buildroot) make to
pkg-config.

> > and "libdir" was part of the special list of variables that we want to
> > prefix with the sysroot, then the old pkg-config would return libdir
> > prefixed with the sysroot, but not enginesdir.  
> 
> I assume there are packages which install libraries to the stage in
> sub-directories based on libdir, and this new pkg-config behavior is
> better for those cases, while worse for cases like enginesdir.

Exactly. In general, "libdir" needs to be prefixed with the sysroot
directory, because libdir is typically used to build -L gcc arguments,
where we need paths to be prefixed by the sysroot.

> Maybe some kind of run time control of pkg-config would allow it to
> work better?  For instance, an environment variable with some kind of
> white/black list of variables to prefix.  Default value would prefix
> libdir, etc.  But it could be tweaked on by intfras and/or packages. 
> Kind of like:
> 
> LIBP11_PKGCONFIG_NOT_STAGE_VARS = enginesdir

Well, this is already what we do in some sense: pkg-config has a list
of variables that it will prefix with the sysroot (see
0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch). The
problem is that the new implementation of pkg-config does the
resolution of variable values differently than it used to, and if
enginesdir is expressed in terms of libdir, then the fact that libdir
is sysroot-prefixed will affect the final value of enginesdir.

So basically, the problem is not so much expressing *which* variables
need to be sysrooted or not, but rather to make sure that the
pkg-config logic does it properly.

So maybe it's "just" a matter of tweaking the pkg-config logic to
really not sysroot-prefix any path when the initial variable requested
is not in the white-list of variables that must be sysroot-prefixed.

> > Overall, the issue is that there is no concept in pkg-config for "the
> > value of this variable is going to be used at build time" vs "the
> > value of this variable is going to be used at run time".  
> 
> Shame.  Maybe buildroot should create a new build system, to replace
> autotools, cmake, and meson, that knows about all the issues of cross
> building?  Yes, huge project.  Need macos and windows support.  But
> think of how much easier buildroot would be if you didn't have to fight
> autotools and cmake!

Well :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
