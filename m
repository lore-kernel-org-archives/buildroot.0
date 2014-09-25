From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 25 Sep 2014 09:08:48 -0400
Subject: [Buildroot] [PATCH 1/1] tiff: ensure directory exists before
	installing to it
In-Reply-To: <87oau4ysjp.fsf@dell.be.48ers.dk>
References: <1410488467-2093-1-git-send-email-danomimanchego123@gmail.com>
 <87oau4ysjp.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt6KjuN4ObKa8oB0nbDxgE-mV1dJgxz2X-PCe0_3uidBmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Thu, Sep 25, 2014 at 5:10 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:
>
>  > Also, don't ignore errors during installation.
>  > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
>
>  > ---
>  >  package/tiff/tiff.mk |    3 ++-
>  >  1 file changed, 2 insertions(+), 1 deletion(-)
>
>  > diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
>  > index 8d2e087..c61894b 100644
>  > --- a/package/tiff/tiff.mk
>  > +++ b/package/tiff/tiff.mk
>  > @@ -76,7 +76,8 @@ ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
>  >  endif
>
>  >  define TIFF_INSTALL_TARGET_CMDS
>  > -    -cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
>  > +    mkdir -p $(TARGET_DIR)/usr/lib/
>  > +    cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
>
> Hmm, so what happens with a BR2_PREFER_STATIC_LIB=y build?
>
>>>> tiff 4.0.3 Installing to target
> mkdir -p /home/peko/source/buildroot/output/target/usr/lib/
> cp -a /home/peko/source/buildroot/output/build/tiff-4.0.3/libtiff/.libs/libtiff.so* /home/peko/source/buildroot/output/target/usr/lib/
> cp: cannot stat ?/home/peko/source/buildroot/output/build/tiff-4.0.3/libtiff/.libs/libtiff.so*?: No such file or directory
> package/pkg-generic.mk:228: recipe for target '/home/peko/source/buildroot/output/build/tiff-4.0.3/.stamp_target_installed' failed
> make: *** [/home/peko/source/buildroot/output/build/tiff-4.0.3/.stamp_target_installed] Error 1
>
> Not good. Why are we not just using 'make install' and removing whatever
> binaries / extras we don't want like we do for other packages?

Looking throught the git history of tiff.mk, it appears that the
current cp command is a direct descendent of the original
pre-AUTOTARGETS hand written makefile from 2007, which manually
installed the .so and the .a files.  The .a file installation was
dropped in 2008 in commit 9844a8ea2c24f50e3e102eca6562cd879196fcea
when the package was converted to AUTOTARGETS, with the manual cp
command instead of calling 'make install'.  I guess nobody who uses
the prefer-static feature uses tiff.  There are couple other commits
after that that modify the install commands, but the basic cp was
always maintained.  So I imagined that everyone before me just did
what I did - the minimum change to address the issue of the day.

I tried compiling tiff with the TIFF_INSTALL_TARGET_CMDS deleted, and
it seemed to work fine for my configuration - lots of new stuff
installed to /usr/bins, and .a, .la, .so + symlinks installed to
/usr/lib, and a bunch of documentation and man pages.  So, no obvious
disaster.

I could try spinning another patch to use the 'make install'.  But
there are 23 of those tiff bins installed by the default install.
Currently, we have kconfig enables for 2 of those 23.  Should there be
switches for all the other ones, or just a hard-coded deletion
intiff.mk, like libjpeg's bins?

Danomi -


> --
> Bye, Peter Korsgaard
