From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 00:04:20 +0100
Subject: [Buildroot] [PATCH v2] python3: add patch to fix PEP 3147 issue
 with automake built packages
In-Reply-To: <20151104225541.15eef643@free-electrons.com>
References: <1441023704-27725-1-git-send-email-cvubrugier@fastmail.fm>
 <20151104225541.15eef643@free-electrons.com>
Message-ID: <20151105000420.5abc2ee1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christophe,

In fact, it seems that this patch might be causing some Python 3 build
issues. See
http://autobuild.buildroot.org/results/06e/06e7c654a10a7618c0c64c57bfd9f27e770138fc/build-end.log.

Can you have a look?

Thanks!

Thomas

On Wed, 4 Nov 2015 22:55:41 +0100, Thomas Petazzoni wrote:
> Dear Christophe Vu-Brugier,
> 
> On Mon, 31 Aug 2015 14:21:44 +0200, Christophe Vu-Brugier wrote:
> > Packages built with automake use a `py-compile` helper to byte-compile
> > Python source files. This script uses the "py_compile" module from the
> > standard library. In turn, the compile() function in the "py_compile"
> > module invokes the cache_from_source() function provided by importlib.
> > 
> > This commit adds a new patch named "020-importlib-no-pep3147.patch"
> > that changes cache_from_source() and source_from_cache() in importlib
> > to get rid of the "__pycache__" directory.
> > 
> > This commit fixes the following import error in kmod when the module
> > is built for Python 3:
> > 
> >   >>> from kmod import Kmod
> >   Traceback (most recent call last):
> >     File "<stdin>", line 1, in <module>
> >   ImportError: cannot import name 'Kmod'
> > 
> > Moreover, this commit removes two patches that are no longer necessary
> > since modifying cache_from_source() and source_from_cache() disables
> > PEP 3147 for the standard library and distutils / setuptools.
> > 
> >  * 004-old-stdlib-cache.patch
> >  * 016-distutils-no-pep3147.patch
> > 
> > Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> > 
> > ---
> > Changes since v1:
> >  * remove patches 004 and 016 as suggested by Thomas Petazzoni
> 
> Applied, thanks.
> 
> Thomas



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
