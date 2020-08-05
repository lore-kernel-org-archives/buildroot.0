From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 5 Aug 2020 17:55:24 +0200
Subject: [Buildroot] Status of LLVM
In-Reply-To: <20200805173122.0d201e51@windsurf.home>
References: <CAGt4E5vRu+xVXtaze8+6CmWFXSmzJx2PV46bC7STiDnKCqksRw@mail.gmail.com>
 <31f39a1d-1436-0952-43e8-561135e6aa60@gmail.com>
 <e54d173f-533b-1abf-1b74-ea8286fe88a2@gmail.com>
 <20200805173122.0d201e51@windsurf.home>
Message-ID: <00b3fc14-ee83-91a4-827d-988b13254bc9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 05/08/2020 ? 17:31, Thomas Petazzoni a ?crit?:
> On Wed, 5 Aug 2020 16:36:12 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Last year I was able to build an aarch64 system with clang 8 (rootfs + kernel)
>> on a Potato Board.
>>
>> Recently I tried again with a riscv64 target running under qemu:
>>
>> https://asciinema.org/a/DDspJVktlVl1Rh97dwLgtYcRY
>>
>> Clang: 10.0
>> kernel: 5.7.12
>> Busybox: 1.31.1 + patch
>> gcc toolchain: Bootlin riscv64--glibc--bleeding-edge-2020.02-2.defconfig
>>
>> I need some time to continue to work on this series and convince upstream to add
>> cland support in Buildroot. But it means more maintenance work for Buildroot
>> maintainers/contributors to fix all packages that fail to build with clang.
>> At least, we need to enable autobuilders testing with clang if this support is
>> added.
> 
> I think it makes sense to have support for clang in Buildroot, and we
> can certainly add testing for clang configurations in our autobuilders.
> 
> The one thing that was still a bit unclear for me is whether it is
> possible to build a system with just clang, without a gcc compiler at
> all. Indeed, Buildroot isn't really suited/designed for building two
> different compilers/toolchains.

From my testing, we can build the kernel on x86, Aarch64 and riscv64 if we use a
recent enough version (5.7 for riscv64 only with clang 10).

We need the gcc toolchain to provide the libc and other object files
(crtbegin.o) not provided by LLVM/Clang. But the series replace GCC compiler by
clang in the package infrastructure, so we can even remove gcc from host
directory (I tested).

We don't need to build a toolchain with Buildroot, we can use an external
toolchain (I used the Bootlin riscv64 prebuilt toolchain).

For now, we are building host-llvm and host-clang for each build.
It would be interesting to allow an external prebuilt Clang toolchain.

About bootloaders, I didn't test to build them with clang.
Maybe for some packages, we still need a gcc compiler.

Best regards,
Romain


> 
> Thomas
> 
