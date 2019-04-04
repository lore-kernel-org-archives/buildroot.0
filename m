From: Trent Piepho <tpiepho@impinj.com>
Date: Thu, 4 Apr 2019 21:10:50 +0000
Subject: [Buildroot] [PATCH v2] libp11: Add new package for OpenSSL
 PKCS#11 engine
In-Reply-To: <20190404214556.10f7ef0d@windsurf>
References: <20181207181314.24051-1-tpiepho@impinj.com>
 <20190404214556.10f7ef0d@windsurf>
Message-ID: <1554412249.27243.12.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2019-04-04 at 21:45 +0200, Thomas Petazzoni wrote:
> 
> > Library for using PKCS#11, which includes an engine for OpenSSL that
> > lets it use PKCS#11 modules.  Which is really what this package is
> > about, not that libp11 library itself, which has no users outside the of
> > OpenSSL engine.
> > 
> > 
> It also needs host-pkgconf, because pkg-config is used to detect
> OpenSSL.

I had assumed this was implicit in an autotools-package, but I see that
it is not.

> 
> Then, even with this fixed, the package didn't build because it was
> installing its OpenSSL modules in the wrong folder, as pkg-config
> --variable enginesdir libcrypto returned a bogus value. I fixed that by
> passing --with-enginesdir.

This is interesting, as when I made this patch for an older buildroot,
pkgconfig would return the correct value.  It was not prefixed with the
stage.  This is a new behavior.

And it looks like this already hit a bunch of packages with things like
the x11 app-defaults dir.  Since "libdir" is in the whitelist of paths
to prefix, it also hits enginesdir since the latter is based on libdir.

Maybe that pkg-config whitelist should not affect variables that use
libdir and only prefix libdir itself?
