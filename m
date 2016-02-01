From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 16:19:26 +0100
Subject: [Buildroot] [PATCH v2 00/17] Rework atomic handling
In-Reply-To: <20160201144730.7ca660e9@pcviktorin.fit.vutbr.cz>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160201144730.7ca660e9@pcviktorin.fit.vutbr.cz>
Message-ID: <20160201161926.3b2488f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan,

On Mon, 1 Feb 2016 14:47:30 +0100, Jan Viktorin wrote:

> recently, I was doing some tests on MicroBlaze and discovered that I
> am missing the atomic operations there. Then I could see this patch
> series. Thanks for that, however, I have still issues with this.

Ah, so you're doing some Microblaze stuff? If so, some help would
definitely be welcome to maintain this platform.

> The libatomic_ops claims to not support MicroBlaze in its Config.in.

Right.

> So it is not possible to use either __sync_* ones nor __atomic_* ones.

This has nothing to do with libatomic_ops or not.

__sync and __atomic built-ins are provided by gcc, the compiler.

They are completely orthogonal to libatomic_ops. Programs/libraries
using __sync* or __atomic* functions do not need libatomic_ops. 

> Even if I change this and enable it for BR2_microblaze, I am unable to
> compile the libatomic_ops properly (with the Buildroot toolchain 4.9.x).

There is no support for Microblaze in libatomic_ops, so this is not
surprising. See src/atomic_ops/sysdeps/gcc/ in the libatomic_ops
sources.

Maybe with generic.h / generic-small.h, libatomic_ops can rely on the
__sync or __atomic built-ins, but I haven't tried this possibility.

> Moreover, I've read somewhere that the new GCC connects the __sync_*
> interface to the __atomic_* interface internally. Is it true?

I don't know how things are implemented internally in gcc.

> Is this done by the libatomic_ops library? I am confused by this
> situation... I made some wrappers doing the __sync_* to __atomic_*
> translation but still with no success.

Are you use you are not confusing libatomic_ops and libatomic ?

libatomic_ops is a separate project, which has nothing to do with gcc.

libatomic is a library part of gcc, which exists since gcc 4.7, and
provided as part of the gcc runtime on the target.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
