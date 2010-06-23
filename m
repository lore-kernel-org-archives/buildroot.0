From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 09:00:15 +0200
Subject: [Buildroot] Host libraries - status
In-Reply-To: <201006230045.23043.yann.morin.1998@anciens.enib.fr>
References: <201006230045.23043.yann.morin.1998@anciens.enib.fr>
Message-ID: <20100623090015.199dd823@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

Thanks for jumping into this longstanding issue!

On Wed, 23 Jun 2010 00:45:22 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> To sum up our discussion on IRC yesterday.
> 
> - we are building libraries to run on the host (the machine we build
> on)
> 
> - those libraries get installed in a non-standard place, so the
> dynaminc linker (ld.so) can not find them

Correct.

> - we do not want our executables to runtime-link with standard
> libraries when we have our own versions

Actually, this is what happens today and it doesn't seem to be causing
particular issues. But it's true that if we bother building libraries
for the host in order to be as independent as possible from the build
machine, it'd be better to actually use those libraries. Not counting
issues like the build machine having a different version of the library
than the one we have in Buildroot.

> The issue is not at link-time, but at runtime.

Yes.

> Some plans were devised to overcome this issue:
> 
> - use LD_LIBRARY_PATH to point the linker to the proper place where
> to find our own libraries. Using LD_LIBRARY_PATH has the advantage
> that the libs are searched for in there before the linker attempts
> the standard places. But LD_LIBRARY_PATH breaks mkfontscale (used to
> build fonts for X)

Actually, it doesn't break mkfontscale specifically. mkfontscale is the
test-case I have for the whole problem.

This LD_LIBRARY_PATH solution is the one I implemented in commit
c1b6242fdcf2cff7ebf09fec4cc1be58963e8427.

However, it was causing build issues with 'icu', described in commit
0d1830b07db4ebfd14e77a258de6fb391e57e960. The issue seems to be that
the build was using host libraries instead of target libraries. In this
commit, we removed the passing of LD_LIBRARY_PATH when building target
packages, to avoid the 'icu' build breakage.

> - use the linker arg -rpath. rpath adds the search dir directly into
> the executable in an attribute of the .dynamic section. Passing
> -rpath in the CFLAGS breaks binutils. Passing it in the LDFLAGS
> breaks fakeroot.

The CFLAGS variant was implemented in
6b939d40f6a29a43277566adc9d4312d49cb3abf. This one apparently causes a
build breakage in binutils (cross variant), as reported in
http://lists.busybox.net/pipermail/buildroot/2010-May/034609.html and
https://bugs.busybox.net/show_bug.cgi?id=1789 (the initial bug report).
I have never been able to reproduce this issue, even though I had
tested the exact same BR configuration as the bug reporters.

Then, we tried the LDFLAGS variant (which was never committed), who
worked better for the bug reporters, but was causing a build breakage in
fakeroot. See https://bugs.busybox.net/show_bug.cgi?id=1789#c3. I don't
remember if I tried to reproduce it or not.

The current status is that 6b939d40f6a29a43277566adc9d4312d49cb3abf got
reverted just before the release in order to avoid the reported binutils
build breakage. So the status as of today is the same as the one we had
at the beginning of the whole story :-)

> We still have some options:
> 
> - statically build all host libraries. That would surely fix this
> issue, but could be considered ugly, as *all* dependable libraries
> would have to be specified in the LDFLAGS (Thomas on IRC). Plus the
> fact that we should take care to avoid linking with shared versions
> of those libs if they are present in the standard places (the linker
> prefers .so to .a libs).

I find it rather ugly.

> - fix fakeroot, so it works with rpath. Might require a huge amount of
>   work.

I'm not sure what the exact problem with fakeroot is. Maybe we should
dig into this.

> - a third solution would be to craft a simple wrapper for all host
>   executables we install. That wrapper would be responsible for
> exporting LD_LIBRARY_PATH. That way, LD_LIBRARY_PATH is set only when
> running those executables, for those executables (and their
> children), and whatever calls them does not have to care about it,
> nor be mislead. For the records, I'va had to do that in crosstool-NG,
> and it has worked pretty nicely. I have a shell script version [1]
> and also a C program [2] that implement such a wrapper.

The problem is that in CT-NG, you *know* the list of binaries for which
such a wrapper needs to be created. In BR, we have no idea which
binaries are installed by the various packages. So basically, to
implement this, we would have, after the installation of every package,
to look at all binaries in $(HOST_DIR), and if they are an ELF binary,
replace them with a shell wrapper.

> - anything else I missed ?

 * I have another option running here. It involves using a program
   called "patchelf", that allows to insert a rpath value into an
   existing binary. After the installation of all packages, I run
   "patchelf" on all binaries in $(HOST_DIR) to add an rpath to them.
   So it has the same level of uglyness as creating wrappers in that
   all binaries have to be looked at after the installation of every
   package, but it has the advantage of not requiring the creation of
   shell wrappers.

 * Investigate whether passing LD_RUN_PATH to the linker (which has a
   similar behaviour to -Wl,-rpath) would work better.

 * Actually fix the issue with either LD_LIBRARY_PATH or -Wl,-rpath,
   since those two are the correct way to do this IMO.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
