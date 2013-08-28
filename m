From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 13:30:05 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <521DD858.4060105@zacarias.com.ar>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate> <521DD858.4060105@zacarias.com.ar>
Message-ID: <20130828133005.3e63a718@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Fran?ois, Spenser, you're Cc'ed due to a question below.

On Wed, 28 Aug 2013 08:00:40 -0300, Gustavo Zacarias wrote:
> On 08/28/2013 04:08 AM, Thomas Petazzoni wrote:
> 
> >>       bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1d587ef565425b574aeb85e6e2bebd2322634868/
> >>       bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a771c47b8d818245f8b66f128ea49db208fdfe52/
> > 
> > That's the same problem: some parts of alsa-lib require dlopen()
> > functionality, but it isn't available for the FLAT-only bfin toolchain,
> > since it doesn't support shared library.
> > 
> > Should we mark all packages that use dlopen()
> > as !BR2_PREFER_STATIC_LIB ?
> > 
> > (Note: in the specific case of alsa-lib, maybe not the entire package
> > needs to be marked this way, but one of its suboptions).
> 
> IIRC it's some builtin (non-disableable) plugin that fails.
> Since there's an alsa bump in the pipe i can take a look at it.

Good.

> >>       i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/b85caa22ddc13bdaaac25b9016fe902ade5027de/
> > 
> > ./mksyntax -o syntax.c
> > make[1]: execvp: ./mksyntax: Permission denied
> > ./mksignames lsignames.h
> > 
> > Strange. Missing executable permissions on this program? Why does it
> > happen only rarely?
> 
> umask afecting the build?

I don't know, maybe.

> >> microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/519219ec8e4c4aa06baf3353cd2e37bf4fef9362/
> > 
> > ./.libs/libglib-2.0.so: undefined reference to `__sync_fetch_and_or_4'
> > ./.libs/libglib-2.0.so: undefined reference to `__sync_fetch_and_sub_4'
> > ./.libs/libglib-2.0.so: undefined reference to `__sync_fetch_and_xor_4'
> > ./.libs/libglib-2.0.so: undefined reference to `__sync_fetch_and_add_4'
> > ./.libs/libglib-2.0.so: undefined reference to `fallocate64'
> > ./.libs/libglib-2.0.so: undefined reference to `__sync_bool_compare_and_swap_4'
> > ./.libs/libglib-2.0.so: undefined reference to `__sync_fetch_and_and_4'
> > 
> > Too old gcc?
> 
> Yes!

This is annoying. I'm wondering if some of the glib code is not buggy
here, because the usage of those compiler intrinsics is normally
conditional in gatomic.h.

> >>       bfin |                      lua-5.1.5 | NOK | http://autobuild.buildroot.net/results/760bfa75559ec1fe2a7060e9e6792c9789410f2c/
> > 
> > loadlib.c:61:19: error: dlfcn.h: No such file or directory
> > 
> > Uses dlopen() functionality. Should we mark !BR2_PREFER_STATIC_LIB ?
> 
> This is fixable by not defining LUA_USE_DLOPEN, which was the original
> intention of the LUA_SHARED_LIBRARY knob which was removed in 76983349

Fran?ois, can you take care of this one?

> 
> >> microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b95477576f1d3a84951c70ddd158b75e9f19efbd/
> > 
> > sha512-compress.c: In function '_nettle_sha512_compress':
> > sha512-compress.c:180:1: internal compiler error: in reload, at reload1.c:1059
> > Please submit a full bug report,
> > with preprocessed source if appropriate.
> > See <http://gcc.gnu.org/bugs.html> for instructions.
> > 
> > Oops. Not much we can do here.
> > 
> > Should we add an exception in the autobuilder scripts? Or an exception
> > directly within Buildroot between this package and the particular
> > Microblaze toolchain causing the issue?
> 
> It sounds rather harsh but maybe we should just remove microblaze builds
> from the autobuilder - the toolchain is too broken, it fails with
> openssl too for example.

I don't really agree. If we support the architecture, then we should
support it, and therefore try to ensure that things are building. I
don't mind adding more !BR2_microblaze or exclude some toolchain
versions, but either we support Microblaze and have it in the
autobuilders, or we remove support for it.

Spenser, you're the one who added Microblaze support originally. We
have issues with the Microblaze toolchain. What can we do to get more
recent Microblaze toolchains, or get some support from Xilinx about our
issues?

> >>    powerpc |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/9daf0f46642020591731e20d3bf9041ff6259846/
> > 
> > /home/test/test/3/output/host/usr/bin/powerpc-linux-gnu-gcc   example.o lib/libpci.so.3.2.0  -o example
> > /home/test/test/3/output/host/usr/powerpc-buildroot-linux-gnu/sysroot/usr/lib/libkmod.so: undefined reference to `_Static_assert'
> > 
> > No idea, I haven't investigated.
> 
> Old gcc again.
> We need the GCC_AT_LEAST_X_Y for these cases or just kill old gcc versions.

_Static_assert was added in gcc 4.6, I don't think gcc 4.4 or 4.5 are
"too old". I'll cook a patch for kmod.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
