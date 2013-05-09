From: Nathan Lynch <ntl@pobox.com>
Date: Wed, 08 May 2013 22:55:16 -0500
Subject: [Buildroot] [PATCH 2/6] package/libbsd: new package
In-Reply-To: <20130508110837.GC3413@free.fr>
References: <cover.1360433324.git.yann.morin.1998@free.fr>
 <76440f71466575498fd576fc04cbbdc7cda8d6f3.1360433324.git.yann.morin.1998@free.fr>
 <1367978955.3081.49.camel@orca.stoopid.dyndns.org>
 <20130508110837.GC3413@free.fr>
Message-ID: <1368071716.3081.81.camel@orca.stoopid.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2013-05-08 at 13:08 +0200, Yann E. MORIN wrote:
> On Tue, May 07, 2013 at 09:09:15PM -0500, Nathan Lynch wrote:
> 
> > I happen to use libbsd for a mips target but hadn't gotten around to
> > submitting it myself.
> > 
> > I see you've posted patches adding libbsd a few times over the last few
> > months; it looks like it was related to your qemu efforts but not
> > committed so far.  Are you still working on having it included?
> 
> Well, it's been two Buildroot Developpers' Day that we said this stuff
> would be added upstream, so yes, it will eventually get upstreamed.
> 
> But I need to rework all the QEMU patches first, since there has been
> two new versions released since I first started working on it.
> 
> As for the preliminary packages, I'll resubmit them shortly, but I'm
> afraid they won't make it in this cycle, it's a bit too late. But if
> people are interested (like you are), they can help poke Peter to speed
> up inclusion when the next window opens (start of June, after 2013.05 is
> released). ;-)

Sure :-)


> > Any ideas on this libbsd build error with mips (which seems to lack an
> > a.out.h)?
> 
> No, sorry, never ever tried on MIPS. And indeed, MIPS does not install
> a.out.h THere's only 4 archs exporting the a.out.h header: alpha, arm,
> m68k and x86; all other archs supsedly do not support running a.out
> executables, so there is no reason to export a.out.h for those archs.
> 
> > I've hacked around it locally by just hacking nlist.c out of
> > the build, but that's not exactly satisfactory.
> 
> I've looked at how Debian builds libbsd, but they have strictly 0 patch
> on libbsd, and yet they have a MIPS package. Weird...

I think it's a uClibc vs [e]glibc thing.  Looks like the valgrind
package has had a similar issue; see: 

package/valgrind/valgrind-dont-include-a-out-header.patch

and

http://lists.uclibc.org/pipermail/uclibc/2011-November/045920.html


> Can you try to just remove the a.out.h include and see if it still
> compiles?

It does not, it apparently needs the definition of struct nlist, struct
exec, and some constants:

nlist.c:58:39: warning: 'struct nlist' declared inside parameter list [enabled by default]
nlist.c:58:39: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
nlist.c:58:12: error: prototype declaration
nlist.c:129:51: error: invalid application of 'sizeof' to incomplete type 'struct exec' 
nlist.c:154:15: error: dereferencing pointer to incomplete type
nlist.c:193:38: error: 'N_STAB' undeclared (first use in this function)
nlist.c:398:16: error: 'N_UNDF' undeclared (first use in this function)
nlist.c:402:7: error: 'N_FN' undeclared (first use in this function)
nlist.c:402:14: error: 'N_ABS' undeclared (first use in this function)
nlist.c:411:36: error: 'N_DATA' undeclared (first use in this function)
nlist.c:411:45: error: 'N_TEXT' undeclared (first use in this function)
nlist.c:412:37: error: 'N_BSS' undeclared (first use in this function)
nlist.c:419:17: error: 'N_EXT' undeclared (first use in this function)


>  If not, then maybe we should patch configure.ac to check for
> a.out.h, and src/Makefile.am to not add nlist.c to the build if a.out.h
> is not found.
> 
> But I'm afraid nlist.c contains important functions that would be missed
> by other packages, so the best is to somehow getrid of including a.out.h
> in the first place.

I agree.  Perhaps a patch like the one valgrind uses could be an interim
solution.


> Also, has libbsd upstream done something about it yet?

AFAIK this has not been addressed (or reported) upstream.

I'll see what I can figure out on this but it will probably be the
weekend before I have more to report.
