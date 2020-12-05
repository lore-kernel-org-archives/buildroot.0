From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 6 Dec 2020 00:14:50 +0100
Subject: [Buildroot] [PATCH 2/2] package/quickjs: depends on glibc
In-Reply-To: <20201205214540.7448387d@windsurf.home>
References: <20201205064442.606683-1-francois.perrad@gadz.org>
 <20201205064442.606683-2-francois.perrad@gadz.org>
 <20201205214540.7448387d@windsurf.home>
Message-ID: <20201206001450.0dfd856b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Francois, Thomas,

On Sat, 5 Dec 2020 21:45:40 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Sat,  5 Dec 2020 07:44:42 +0100
> Francois Perrad <fperrad@gmail.com> wrote:
>
> > fix build http://autobuild.buildroot.org/results/d45/d456eefffd138a714e367f9520adb662f5e0f57e/
>
> Well, this configuration *is* using glibc, so clearly the patch you're
> proposing cannot fix this build failure.
>
> stdatomic.h is provided by gcc, not by the C library, so a C library
> option change most likely cannot be the proper solution.
>
> We already have several atomic-related options in toolchain/Config.in,
> but I'm not sure any of them is correct to express the need for
> <stdatomic.h>. In fact, I'm not quite sure in which circumstances is
> this header not provided by gcc.

According to [1] stdatomic.h is a ISO C11 feature, and despite the gcc info
supporting '-std=c11' since gcc-4.7 [2] the release notes from gcc-4.9 [3]
make mention of stdatomic.h:

	ISO C11 atomics (the _Atomic type specifier and qualifier and the
	<stdatomic.h> header) are now supported.

So a
	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h

should do the job...

Regards,
Peter

[1] https://en.wikipedia.org/wiki/C11_(C_standard_revision)
[2] https://gcc.gnu.org/wiki/C11Status
[3] https://gcc.gnu.org/gcc-4.9/changes.html


>
> Thomas
