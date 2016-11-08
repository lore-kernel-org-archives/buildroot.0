From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 8 Nov 2016 14:44:28 +1100
Subject: [Buildroot] [PATCH 1/1] sdl: fix building on powerpc64 and
 powerpc64le
In-Reply-To: <20161107225106.5e9e61b6@free-electrons.com>
References: <a57a3d0430e248ee08148cef326cbf60283205ad.1478489382.git.sam.bobroff@au1.ibm.com>
 <20161107225106.5e9e61b6@free-electrons.com>
Message-ID: <20161108034428.GA2421@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 07, 2016 at 10:51:06PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon,  7 Nov 2016 14:29:44 +1100, Sam Bobroff wrote:
> > Fixes
> > http://autobuild.buildroot.net/results/70659eead71faa82ccfd0016d04caed134707c24
> > 
> > (The problem was detected when building chocolate-doom but the issue
> > is in sdl.)
> > 
> > Old autotools included with SDL fails to detect dynamic linker support
> > on powerpc64 and powerpc64le.
> > 
> > See SDL bug 3481: https://bugzilla.libsdl.org/show_bug.cgi?id=3481
> > 
> > Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> 
> Thanks, but I have some comments, see below.
> 
> > ---
> > 
> >  package/sdl/0003-fix-configure-powerpc64.patch | 30 ++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >  create mode 100644 package/sdl/0003-fix-configure-powerpc64.patch
> > 
> > diff --git a/package/sdl/0003-fix-configure-powerpc64.patch b/package/sdl/0003-fix-configure-powerpc64.patch
> > new file mode 100644
> > index 0000000..764a947
> > --- /dev/null
> > +++ b/package/sdl/0003-fix-configure-powerpc64.patch
> > @@ -0,0 +1,30 @@
> > +sdl: Add powerpc64 and powerpc64le support to old autotools.
> > +
> > +Fixes build on powerpc64le which doesn't fail but produces a static library
> > +rather than a dynamic one (which causes link errors in some packages using
> > +libsdl).
> > +
> > +Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> > +
> > +*** a/acinclude/libtool.m4	2016-11-07 14:04:47.444117880 +1100
> > +--- b/acinclude/libtool.m4	2016-11-07 14:05:03.652181547 +1100
> > +***************
> > +*** 1302,1308 ****
> > +  	  x86_64-*linux*)
> > +  	    LD="${LD-ld} -m elf_x86_64"
> > +  	    ;;
> > +! 	  ppc*-*linux*|powerpc*-*linux*)
> > +  	    LD="${LD-ld} -m elf64ppc"
> > +  	    ;;
> > +  	  s390*-*linux*|s390*-*tpf*)
> > +--- 1302,1311 ----
> > +  	  x86_64-*linux*)
> > +  	    LD="${LD-ld} -m elf_x86_64"
> > +  	    ;;
> > +! 	  powerpc64le-*linux*)
> > +! 	    LD="${LD-ld} -m elf64lppc"
> > +! 	    ;;
> > +! 	  powerpc64-*linux*)
> > +  	    LD="${LD-ld} -m elf64ppc"
> > +  	    ;;
> > +  	  s390*-*linux*|s390*-*tpf*)
> 
> First, we want all patches formatted as unified diffs, so please use
> this format when generating patches. Suggestion: for packages that
> don't use Git upstream, use quilt to generate your patches.
> 
> Second, this change doesn't make the code look like what libtool.m4 has
> in libtool upstream. It has:
> 
>           powerpc64le-*linux*)
>             LD="${LD-ld} -m elf32lppclinux"
>             ;;
>           powerpc64-*linux*)
>             LD="${LD-ld} -m elf32ppclinux"
>             ;;
> 	[...]
>           powerpcle-*linux*)
>             LD="${LD-ld} -m elf64lppc"
>             ;;
> 
> which is not the same as what your patch adds. Why do we have this
> difference?

Ah, because I had an incomplete understanding of the issue!

I'll restate the bug that needs to be fixed, just to be clear:

Unpatched, the old configure will create a binary and check it to see if
it's 32 bit or 64 bit. In this case it's 64 bit, and the toolchain spec
(which includes "powerpc64le") is matched against
"ppc*-*linux*|powerpc*-*linux*", which matches, and the linker is called
with "-m elf64ppc", which fails because that's big endian on a little
endian toolchain. Configure interprets this to mean that dynamic linking
isn't supported. (This isn't apparent with some distro toolchains, I
think because because they support BE and LE in the same toolchain, so
the wrong option is passed during this test but it works anyway, hiding
the problem.)

My patch added matches that would select the correct linker option but,
as you point out, that's not what was done upstream. What I didn't know
was that we should instead be omitting the emulation mode flag all
together unless we need to build 32 bit on 64 or the the other way
round. We can apparently rely on the toolchain doing the correct thing
without an emultion mode being specified, as long as it's producing the
desired 32 or 64 bit binaries by default.

So let's do it the upstream way. I'm not convinced that it will
work on every possible toolchain configuration but if autotools are
happy then it's fine with me. It certainly works for my tests with
buildroot. I'll either post a v2 or incorporate it into some more
generic fix if that's possible.

> Also, are we going to need to patch libtool.m4 in each and every
> package around? libtool.m4 from sdl is from libtool 2.2 which is not
> _that_ old (by the standards of libtool upgrade speed, of course), so
> we're likely to find many other packages in the same situation, aren't
> we?
> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
