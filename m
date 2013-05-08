From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 May 2013 13:08:37 +0200
Subject: [Buildroot] [PATCH 2/6] package/libbsd: new package
In-Reply-To: <1367978955.3081.49.camel@orca.stoopid.dyndns.org>
References: <cover.1360433324.git.yann.morin.1998@free.fr>
 <76440f71466575498fd576fc04cbbdc7cda8d6f3.1360433324.git.yann.morin.1998@free.fr>
 <1367978955.3081.49.camel@orca.stoopid.dyndns.org>
Message-ID: <20130508110837.GC3413@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathan, All,

On Tue, May 07, 2013 at 09:09:15PM -0500, Nathan Lynch wrote:
> On Sat, 2013-02-09 at 19:09 +0100, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  package/Config.in        |    1 +
> >  package/libbsd/Config.in |   10 ++++++++++
> >  package/libbsd/libbsd.mk |   21 +++++++++++++++++++++
> >  3 files changed, 32 insertions(+), 0 deletions(-)
> >  create mode 100644 package/libbsd/Config.in
> >  create mode 100644 package/libbsd/libbsd.mk
> 
> This is a few months old by now, but for what it's worth:
> 
> Acked-by: Nathan Lynch <ntl@pobox.com>

Thanks. :-)

> I happen to use libbsd for a mips target but hadn't gotten around to
> submitting it myself.
> 
> I see you've posted patches adding libbsd a few times over the last few
> months; it looks like it was related to your qemu efforts but not
> committed so far.  Are you still working on having it included?

Well, it's been two Buildroot Developpers' Day that we said this stuff
would be added upstream, so yes, it will eventually get upstreamed.

But I need to rework all the QEMU patches first, since there has been
two new versions released since I first started working on it.

As for the preliminary packages, I'll resubmit them shortly, but I'm
afraid they won't make it in this cycle, it's a bit too late. But if
people are interested (like you are), they can help poke Peter to speed
up inclusion when the next window opens (start of June, after 2013.05 is
released). ;-)

> Any ideas on this libbsd build error with mips (which seems to lack an
> a.out.h)?

No, sorry, never ever tried on MIPS. And indeed, MIPS does not install
a.out.h THere's only 4 archs exporting the a.out.h header: alpha, arm,
m68k and x86; all other archs supsedly do not support running a.out
executables, so there is no reason to export a.out.h for those archs.

> I've hacked around it locally by just hacking nlist.c out of
> the build, but that's not exactly satisfactory.

I've looked at how Debian builds libbsd, but they have strictly 0 patch
on libbsd, and yet they have a MIPS package. Weird...

Can you try to just remove the a.out.h include and see if it still
compiles? If not, then maybe we should patch configure.ac to check for
a.out.h, and src/Makefile.am to not add nlist.c to the build if a.out.h
is not found.

But I'm afraid nlist.c contains important functions that would be missed
by other packages, so the best is to somehow getrid of including a.out.h
in the first place.

Also, has libbsd upstream done something about it yet?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
