From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 5 Apr 2019 09:49:19 +0200
Subject: [Buildroot] [PATCH v2] libp11: Add new package for OpenSSL
 PKCS#11 engine
In-Reply-To: <1554412249.27243.12.camel@impinj.com>
References: <20181207181314.24051-1-tpiepho@impinj.com>
 <20190404214556.10f7ef0d@windsurf>
 <1554412249.27243.12.camel@impinj.com>
Message-ID: <20190405094919.40f655c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Trent,

On Thu, 4 Apr 2019 21:10:50 +0000
Trent Piepho <tpiepho@impinj.com> wrote:

> > It also needs host-pkgconf, because pkg-config is used to detect
> > OpenSSL.  
> 
> I had assumed this was implicit in an autotools-package, but I see that
> it is not.

Indeed, host-pkgconf is not in the default dependencies added by
autotools-package, based on the fact that using autotools does not
necessarily implies using host-pkgconf (though admittedly, this is more
and more often the case).

> > Then, even with this fixed, the package didn't build because it was
> > installing its OpenSSL modules in the wrong folder, as pkg-config
> > --variable enginesdir libcrypto returned a bogus value. I fixed that by
> > passing --with-enginesdir.  
> 
> This is interesting, as when I made this patch for an older buildroot,
> pkgconfig would return the correct value.  It was not prefixed with the
> stage.  This is a new behavior.
> 
> And it looks like this already hit a bunch of packages with things like
> the x11 app-defaults dir.  Since "libdir" is in the whitelist of paths
> to prefix, it also hits enginesdir since the latter is based on libdir.
> 
> Maybe that pkg-config whitelist should not affect variables that use
> libdir and only prefix libdir itself?

We have bumped pkg-config not long ago, and indeed its behavior
changed. When you have something like this:

prefix=/usr
libdir=${prefix}/lib
enginesdir=${libdir}/engines

and "libdir" was part of the special list of variables that we want to
prefix with the sysroot, then the old pkg-config would return libdir
prefixed with the sysroot, but not enginesdir.

With the new pkg-config version, the behavior changed, and because
enginesdir is derived from libdir, enginesdir is going to be
sysroot-prefixed.

Overall, the issue is that there is no concept in pkg-config for "the
value of this variable is going to be used at build time" vs "the
value of this variable is going to be used at run time".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
