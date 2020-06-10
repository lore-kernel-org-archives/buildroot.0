From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 10 Jun 2020 22:03:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add valgrind support
In-Reply-To: <CADvTj4r_GH3iT=7Qvfv=CEhvmeyrOS0kB748XO8EzAM_p_Q9aA@mail.gmail.com>
References: <20200428052225.121426-1-james.hilliard1@gmail.com>
 <20200428074521.1142454c@windsurf.home>
 <CADvTj4poke9OOMZBz6t+vtb7Mb+nRM9oWKyGw_yqQuzgKDKSDQ@mail.gmail.com>
 <08778ca0-f76f-efbc-7818-f728a5634ad6@gmail.com>
 <CADvTj4r_GH3iT=7Qvfv=CEhvmeyrOS0kB748XO8EzAM_p_Q9aA@mail.gmail.com>
Message-ID: <9fc96d53-3cd6-4692-40d7-686c8a00a562@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

Le 10/06/2020 ? 17:45, James Hilliard a ?crit?:
> On Wed, Jun 10, 2020 at 7:41 AM Romain Naour <romain.naour@gmail.com> wrote:
>>
>> Hi James, Thomas,
>>
>> Le 28/04/2020 ? 07:47, James Hilliard a ?crit :
>>> On Mon, Apr 27, 2020 at 11:45 PM Thomas Petazzoni
>>> <thomas.petazzoni@bootlin.com> wrote:
>>>>
>>>> On Mon, 27 Apr 2020 23:22:25 -0600
>>>> James Hilliard <james.hilliard1@gmail.com> wrote:
>>>>
>>>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>>>> ---
>>>>>  package/mesa3d/mesa3d.mk | 10 ++++++++--
>>>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> Speaking of mesa3d/valgrind, we have this:
>>>>
>>>>   http://autobuild.buildroot.net/results/1b5/1b58d73ecbbe1af2c3e140563d696cf32d1c4a5a/build-end.log
>>>>
>>>> Seems like mesa3d is trying to link with some static libraries from
>>>> valgrind, which are not built with -fPIC. Have you looked into this?
>>> Yeah, I had added this trying to fix that but it didn't seem to help.
>>
>> I spent some time investigating this issue but the problem is that mesa try to
>> link with libcoregrind-<arch>-linux.a to build libgbm.so. But even by hacking
>> the valgrind build system, the build is still failing.
>>
>> I tried with several toolchain (glibc and uclibc).
>>
>> Out of curiosity, what's your use case that require valgrind in mesa3d ?
> Well I sometimes use valgrind for tracing certain bugs, figured since
> mesa3d has a valgrind option we should use it when building valgrind.

Ok

>>
>> Note: The valgrind support is enabled in archlinux and fedora
>>
>> https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/mesa
>>
>> https://src.fedoraproject.org/rpms/valgrind/blob/master/f/valgrind.spec
>>
>> But no problem on their side ?
>>
>> Any idea ? otherwise we have to revert this patch because the build is still
>> failing in the autobuilder.
> The builds were failing before this patch so I don't see how reverting
> would help.

Indeed it's not directly this patch, I thought that because it's a new issue
related to valgrind... but it's more complicated than that. Actually It's a
mesa/valgrind bug. mesa try to build the shared library libgbm.so using the
valgrind static libraries. This should only be possible if valgrind static
libraries are built with -fPIC.

As soon we have BR2_PACKAGE_VALGRIND=y and BR2_PACKAGE_MESA3D_GBM=y, the build
issue should be reproducible.

I can reproduce it with the following defconfig:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_VALGRIND=y
BR2_PACKAGE_VALGRIND_SGCHECK=y
BR2_PACKAGE_VALGRIND_BBV=y
BR2_PACKAGE_VALGRIND_LACKEY=y
BR2_PACKAGE_VALGRIND_NULGRIND=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y

Even before your patch, the problem can be reproduced due to libdrm built with
valgrind support. Added long time ago [1].

Even if -Dvalgrind=false on meson command line to build mesa, the valgrind
libraries come from pkg-config libdrm...

output/host/bin/pkg-config libdrm --libs --static
-L[...]/sysroot/usr/lib -ldrm -lm -L[...]/sysroot/usr/lib/valgrind
-lcoregrind-arm64-linux -lvex-arm64-linux -lgcc

... and break the build.

I tried to modify the valgrind build system to add -fPIC but the problem is
still present.

I don't know how yet how to fix the problem.

[1]
https://git.buildroot.net/buildroot/commit/?id=da3805186a582fc42ec1b935da0ef87529284c6a

Best regards,
Romain

>>
>> Best regards,
>> Romain
>>
>>
>>>>
>>>> Thanks!
>>>>
>>>> Thomas
>>>> --
>>>> Thomas Petazzoni, CTO, Bootlin
>>>> Embedded Linux and Kernel engineering
>>>> https://bootlin.com
>>
