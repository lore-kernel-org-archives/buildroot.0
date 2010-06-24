From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jun 2010 09:38:29 +0200
Subject: [Buildroot] Host libraries - status
In-Reply-To: <AANLkTil-7ims-WsQ2LeTvjmHhVCOUDtkWHpZjr9vT67U@mail.gmail.com>
References: <AANLkTil-7ims-WsQ2LeTvjmHhVCOUDtkWHpZjr9vT67U@mail.gmail.com>
Message-ID: <20100624093829.33d0eaf1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Jun 2010 12:21:28 +1000
Mitch Davis <mjd+buildroot@afork.com> wrote:

> Yesterday I got bitten by the "mkfontscale" shared library problem
> which was discussed in this thread:
> 
>   http://lists.busybox.net/pipermail/buildroot/2010-June/035581.html
> 
> I also don't think futzing with the rpath is the right solution.  (The
> Debian people discuss it here):
> 
>   http://wiki.debian.org/RpathIssue

The problem they are describing only occurs when there are migrations
from one library version to another, which is something that never
occurs in Buildroot: we build a single version of a given library, and
all packages that use this library use the same version of the library.

> One idea is to have a make var that says how to set the environment
> when calling host binaries that we've compiled, something along the
> lines of $(HOST_MAKE_ENV).  For each package which calls a host exe
> we've compiled, we can overload the calling of that executable with
> that var, which would set LD_LIBRARY_PATH just for running that exe.

We already tried this, see

 http://git.buildroot.net/buildroot/commit/?id=c1b6242fdcf2cff7ebf09fec4cc1be58963e8427

Unfortunately, it was causing issues, so it got removed:

 http://git.buildroot.net/buildroot/commit/?id=0d1830b07db4ebfd14e77a258de6fb391e57e960

> Here's another idea: We already set PATH to pick up our compiled host
> binaries.  And if those binaries expect shared libs in a certain
> place, then shouldn't we also set LD_LIBRARY_PATH at the same time as
> PATH?  And if not, why not?  Otherwise how are those exes ever
> supposed to run?

See above :-)

> This would solve the mkfontscale problem, and I don't think this
> approach would stop fakeroot from working.  Not sure about the icu
> stuff.

Theorically, yes, using LD_LIBRARY_PATH should work, but we have seen
it causing strange libtool issues. See
http://lists.busybox.net/pipermail/buildroot/2010-May/034163.html for
an example of an issue that was solved by *removing* this
LD_LIBRARY_PATH thing.

But those issues can of course be investigated before we decide to go
with the rpath way or the LD_LIBRARY_PATH way.

> Anyway, there may be poor people out there who, like me, are trying to
> get 2010.05 working.  I've attached a patch, that while it's not
> ideal, it at least Works For Me[tm], and so it may be useful for
> others.  One problem with this solution is that people who need more
> fonts than me would need to alter more .mk files, whereas setting
> LD_LIBRARY_PATH at the same time as PATH wouldn't require this.

I'm sorry, but this patch isn't correct, for two reasons:

 * It is using $(HOST_MAKE_ENV) when doing the installation of *target*
   packages, while HOST_MAKE_ENV, is, as its name suggest, reserved for
   *host* packages. We have $(TARGET_MAKE_ENV) for target packages (see
   references to patches above)

 * It is only using $(HOST_MAKE_ENV) for the installation. Which solves
   the problem you have if the host utility is used at install time and
   not at build time. Adding LD_LIBRARY_PATH to TARGET_MAKE_ENV is
   therefore the appropriate way of doing this. But it unfortunately
   was causing some issues.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
