From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Nov 2013 12:09:04 +0100
Subject: [Buildroot] [PATCH 2 of 2] infra: remove usage of pkgparentdir
 in favor of pkgdir
In-Reply-To: <CAAXf6LVMJ-EQemvYkvujm+zypQO_cufQq5=z7zz_tto2hug=Aw@mail.gmail.com>
References: <patchbomb.1384170790@argentina>
 <8953db252a5816d2e988.1384170792@argentina>
 <52816529.9010704@mind.be>
 <CAAXf6LVMJ-EQemvYkvujm+zypQO_cufQq5=z7zz_tto2hug=Aw@mail.gmail.com>
Message-ID: <20131112120904.4e65d13f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 12 Nov 2013 09:56:37 +0100, Thomas De Schampheleire wrote:

> >  I think it's a better idea to choose a new name - if only to help
> > people who are using this variable in custom packages. Or better
> > yet, remove it completely - it's anyway not used anymore.
> 
> The only remaining place is in the foo-patch block, to get the
> location of patches for that package.
> That is outside the inner-generic-package, so we cannot use $(4)
> anymore. How do you propose to solve that?

Currently:

 <foo>_DIR => build directory

 <foo>_DIR_PREFIX => prefix of the package directory in Buildroot
                     sources

 <foo>_DL_DIR => location of the package download directory, for
                 git/cvs downloads (apparently not used consistently)

I think it would make a lot more sense to have:

 <foo>_DIR => points to the package directory in Buildroot sources, e.g
              package/busybox/ for Busybox. This would allow packages
              to easily reference their own directory, to get access to
              configuration files and others, instead of having to know
              they are located in package/busybox/. This could also be
              used in the patching step instead of the DIR_PREFIX thing.

 <foo>_BUILDDIR => points to the package build directory in $(BUILD_DIR)

 <foo>_SRCDIR => points to the package source directory (currently
                 identical to <foo>_BUILDDIR, would change when we
                 introduce OOT build for packages). Actually, more than
                 half of the patch set I have to introduce OOT is about
                 using <foo>_SRCDIR vs <foo>_BUILDDIR in the right
                 places.

 <foo>_DL_DIR => same as before.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
