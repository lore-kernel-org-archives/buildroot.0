From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 03 Jun 2020 07:35:55 +0300
Subject: [Buildroot] procps-ng: disable for musl libc
In-Reply-To: <CAGt4E5spXtLwd+XTgxQn=89A81LHA13RZzCNiRQvb_3H5ZyFAA@mail.gmail.com>
References: <CAGt4E5sHuMNr38r_adE4Tj2+VmWevAYwyAN9_PSENem4prK0Jw@mail.gmail.com>
 <877dwo7qjq.fsf@tarshish>
 <CAGt4E5svy+bxT=hD_MdR+xjv7uo6UkrAvF+8pq5+KT7_bBLYVg@mail.gmail.com>
 <874krs7pcu.fsf@tarshish>
 <CAGt4E5spXtLwd+XTgxQn=89A81LHA13RZzCNiRQvb_3H5ZyFAA@mail.gmail.com>
Message-ID: <871rmw7olw.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, Jun 03 2020, Markus Mayer wrote:
> On Tue, 2 Jun 2020 at 21:19, Baruch Siach <baruch@tkos.co.il> wrote:
>> On Wed, Jun 03 2020, Markus Mayer wrote:
>> > On Tue, 2 Jun 2020 at 20:54, Baruch Siach <baruch@tkos.co.il> wrote:
>> >> On Wed, Jun 03 2020, Markus Mayer wrote:
>> >> > There is a patch called "procps-ng: disable for musl libc" that was
>> >> > applied to 2018.02.x:
>> >> >
>> >> > https://patchwork.ozlabs.org/project/buildroot/patch/3f2a94307e6c380842726b8158e8ec2e9d24372a.1530616293.git.baruch at tkos.co.il/
>> >> >
>> >> > This patch does not seem to be in any of the following releases nor is
>> >> > it in master.
>> >> >
>> >> > $ for i in 2018 2019 2020; do for j in 02 05 08 11;do echo "$i/$j";
>> >> > git log origin/$i.$j.x | grep 'procps-ng: disable for musl libc';
>> >> > done;done
>> >> > 2018/02
>> >> >     procps-ng: disable for musl libc
>> >> > 2018/05
>> >> > 2018/08
>> >> > 2018/11
>> >> > 2019/02
>> >> > 2019/05
>> >> > 2019/08
>> >> > 2019/11
>> >> > 2020/02
>> >> >
>> >> > Is this on purpose or should this patch be applied to all releases
>> >> > going forward?
>> >>
>> >> This is on purpose.
>> >>
>> >> The commit log you liked to above specifically mentions musl version
>> >> 1.1.8 in 2018.02.x. Later Buildroot releases include newer versions of
>> >> musl that implement the missing fopencookie().
>> >
>> > Interesting. Do I need to turn on anything to enable this feature? I
>> > am still seeing the very same error with 2020.05 and musl.
>> >
>> >   CC       procio.o
>> >   CC       proc/alloc.lo
>> >   CC       proc/devname.lo
>> >   CC       proc/escape.lo
>> >   CC       proc/numa.lo
>> > procio.c:50:8: error: unknown type name 'cookie_io_functions_t'
>> >  static cookie_io_functions_t procio = {
>> >         ^~~~~~~~~~~~~~~~~~~~~
>> > procio.c:51:5: error: field name not in record or union initializer
>> >      .read  = proc_read,
>> >      ^
>> > procio.c:51:5: note: (near initialization for 'procio')
>> > procio.c:51:14: warning: initialization makes integer from pointer
>> > without a cast [-Wint-conversion]
>> >      .read  = proc_read,
>> >               ^~~~~~~~~
>> > procio.c:51:14: note: (near initialization for 'procio')
>> > procio.c:51:14: error: initializer element is not computable at load time
>> > procio.c:51:14: note: (near initialization for 'procio')
>> > procio.c:52:5: error: field name not in record or union initializer
>> >      .write = proc_write,
>> >      ^
>> > procio.c:52:5: note: (near initialization for 'procio')
>> > procio.c:52:14: warning: excess elements in scalar initializer
>> >      .write = proc_write,
>> >               ^~~~~~~~~~
>> > procio.c:52:14: note: (near initialization for 'procio')
>> > procio.c:53:5: error: field name not in record or union initializer
>> >      .seek  = NULL,
>> >      ^
>> > procio.c:53:5: note: (near initialization for 'procio')
>> > procio.c:53:14: warning: excess elements in scalar initializer
>> >      .seek  = NULL,
>> >               ^~~~
>> > procio.c:53:14: note: (near initialization for 'procio')
>> > procio.c:54:5: error: field name not in record or union initializer
>> >      .close = proc_close,
>> >      ^
>> > procio.c:54:5: note: (near initialization for 'procio')
>> > procio.c:54:14: warning: excess elements in scalar initializer
>> >      .close = proc_close,
>> >               ^~~~~~~~~~
>> > procio.c:54:14: note: (near initialization for 'procio')
>> > procio.c: In function 'fprocopen':
>> > procio.c:136:11: warning: implicit declaration of function
>> > 'fopencookie' [-Wimplicit-function-declaration]
>> >   handle = fopencookie(cookie, mode, procio);
>> >            ^~~~~~~~~~~
>> > procio.c:136:9: warning: assignment makes pointer from integer without
>> > a cast [-Wint-conversion]
>> >   handle = fopencookie(cookie, mode, procio);
>> >          ^
>> > Makefile:1501: recipe for target 'procio.o' failed
>> >
>> > It works fine with glibc. I just started experimenting with libmusl.
>>
>> procps-ng builds fine with musl here on master commit
>> c7cd1f0370871b4633. This is my defconfig:
>>
>> BR2_arm=y
>> BR2_cortex_a9=y
>> BR2_ARM_ENABLE_VFP=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2020.02.tar.bz2"
>> BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
>> BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
>> BR2_TOOLCHAIN_EXTERNAL_CXX=y
>> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>> BR2_PACKAGE_PROCPS_NG=y
>>
>> What is yours?
>
> BR2_aarch64=y
> BR2_cortex_a53=y
> BR2_ARM_FPU_FP_ARMV8=y
>
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
> BR2_TOOLCHAIN_EXTERNAL_MUSL=y
> BR2_PACKAGE_HAS_TOOLCHAIN_EXTERNAL=y

So you are using an external musl toolchain. It most likely has a musl
version older than 1.1.19 (Feb 2018) that introduced fopencookie()
implementation.

baruch

> BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL="toolchain-external-custom"
> BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux"
> BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
> BR2_TOOLCHAIN_EXTERNAL_HAS_SSP_STRONG=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
>
> Mine is aarch64. GCC is 6.3 and the kernel is 4.9 (the toolchain is
> configured with 4.1 headers to support 4.1 and 4.9).

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
