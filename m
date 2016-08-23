From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 16:12:09 +0200
Subject: [Buildroot] [PATCH] vlc: depends on NPTL
In-Reply-To: <20160821221849.GA8404@waldemar-brodkorb.de>
References: <20160821221849.GA8404@waldemar-brodkorb.de>
Message-ID: <20160823161209.227726ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Aug 2016 00:18:49 +0200, Waldemar Brodkorb wrote:
> VLC requires NPTL.
> 
> Required functions and symbols (_POSIX_CLOCK_SELECTION) are only
> available for NPTL.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/3122287ddea1e316a64ccf0d0dc9415bfefebb49/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I don't think this is the right fix: vlc can fallback to CLOCK_REALTIME
perfectly fine, it just has a bug in its code.

From src/posix/thread.c:

# if (_POSIX_MONOTONIC_CLOCK > 0) && (_POSIX_CLOCK_SELECTION > 0)
/* Compile-time POSIX monotonic clock support */
#  define vlc_clock_id (CLOCK_MONOTONIC)

# elif (_POSIX_MONOTONIC_CLOCK == 0) && (_POSIX_CLOCK_SELECTION > 0)
/* Run-time POSIX monotonic clock support (see clock_setup() below) */
static clockid_t vlc_clock_id;

# else
/* No POSIX monotonic clock support */
#   define vlc_clock_id (CLOCK_REALTIME)
#   warning Monotonic clock not available. Expect timing issues.

# endif /* _POSIX_MONOTONIC_CLOCK */

static void vlc_clock_setup_once (void)
{
# if (_POSIX_MONOTONIC_CLOCK == 0)
    long val = sysconf (_SC_MONOTONIC_CLOCK);
    assert (val != 0);
    vlc_clock_id = (val < 0) ? CLOCK_REALTIME : CLOCK_MONOTONIC;
# endif

The problem is that the vlk_clock_setup_once() code believes
vlc_clock_id is a variable as soon as _POSIX_MONOTONIC_CLOCK == 0.
However, that's not true: it's a variable only if
_POSIX_MONOTONIC_CLOCK == 0 && _POSIX_CLOCK_SELECTION > 0.

So, to fix the build issue, you simply need to:

-# if (_POSIX_MONOTONIC_CLOCK == 0)
+# if (_POSIX_MONOTONIC_CLOCK == 0) && (_POSIX_CLOCK_SELECTION > 0)

However, once you do this, the build goes further up to the link step
of libvlccore, where it fails with:

/home/thomas/projets/buildroot/output/build/vlc-2.2.4/src/.libs/libvlccore.so: undefined reference to `posix_spawnp'
/home/thomas/projets/buildroot/output/build/vlc-2.2.4/src/.libs/libvlccore.so: undefined reference to `posix_spawn_file_actions_adddup2'
/home/thomas/projets/buildroot/output/build/vlc-2.2.4/src/.libs/libvlccore.so: undefined reference to `posix_spawn_file_actions_addopen'

And this is because VLC does not link with librt, which contains those
functions in uClibc. I'm not sure how vlc builds on uClibc with other
toolchains. I'm adding Bernd in Cc: since he is doing most of the VLC
related modifications. Hopefully he can help here.

A configure.ac check needs to be added, probably something like:

  AC_CHECK_LIB(rt, clock_nanosleep, [
    VLC_ADD_LIBS([libvlccore],[-lrt]))

Could you look into this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
