From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 10 Feb 2016 13:25:49 -0200 (BRST)
Subject: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for
 PowerPC
In-Reply-To: <20160205000613.504940f9@free-electrons.com>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <20160205000613.504940f9@free-electrons.com>
Message-ID: <927354538.1864929.1455117949486.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message -----
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Thursday, February 4, 2016 9:06:13 PM
> Subject: Re: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for PowerPC

> Carlos,
> 
> On Thu, 28 Jan 2016 11:08:35 -0200, Carlos Santos wrote:
>> From: Henrique Marks <henrique.marks@datacom.ind.br>
>> 
>> Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> ---
>>  package/protobuf/0001-PowerPC-Support.patch | 54 +++++++++++++++++++++++++++++
>>  package/protobuf/Config.in                  |  5 ++-
>>  2 files changed, 56 insertions(+), 3 deletions(-)
>>  create mode 100644 package/protobuf/0001-PowerPC-Support.patch
> 
> This patch doesn't actually work. First there are a number of problems:
> 
> - The patch you apply has technically nothing to do with enabling the
>   PowerPC architecture. It seems more related to supporting old
>   compilers.
> 
> - The patch you apply is already applied upstream, so in this case, we
>   prefer to use the upstream patch directly.
> 
> - You change the architecture dependencies in protobuf/Config.in, but
>   forget to propagate this change to the reverse dependencies of
>   protobuf, namely the mosh and ola packages. To make this easier,
>   I've changed protobuf/Config.in to provide a
>   BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS variable, and changed mosh and
>   ola to use it. See commit
>   https://git.busybox.net/buildroot/commit/?id=abdc56006bf253bec393066f96f69f0a6246b896.
> 
> But then, despite those issues, your patch still doesn't build on
> PowerPC with the following defconfig for example:
> 
> BR2_powerpc=y
> BR2_powerpc_8548=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_OLA=y
> BR2_PACKAGE_MOSH=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> It fails with:
> 
> In file included from ./google/protobuf/stubs/once.h:81:0,
>                 from google/protobuf/stubs/common.cc:34:
> ./google/protobuf/stubs/atomicops.h:209:2: error: #error
> GOOGLE_PROTOBUF_ATOMICOPS_ERROR
> In file included from ./google/protobuf/stubs/once.h:81:0,
>                 from google/protobuf/stubs/once.cc:38:
> ./google/protobuf/stubs/atomicops.h:209:2: error: #error
> GOOGLE_PROTOBUF_ATOMICOPS_ERROR
> In file included from
> google/protobuf/stubs/atomicops_internals_x86_msvc.cc:37:0:
> ./google/protobuf/stubs/atomicops.h:209:2: error: #error
> GOOGLE_PROTOBUF_ATOMICOPS_ERROR
> In file included from google/protobuf/stubs/atomicops_internals_x86_gcc.cc:36:0:
> ./google/protobuf/stubs/atomicops.h:209:2: error: #error
> GOOGLE_PROTOBUF_ATOMICOPS_ERROR
> 
> Looking at atomicops.h, I can read:
> 
> #elif defined(__GNUC__)
> #if defined(GOOGLE_PROTOBUF_ARCH_IA32) || defined(GOOGLE_PROTOBUF_ARCH_X64)
> #include <google/protobuf/stubs/atomicops_internals_x86_gcc.h>
> #elif defined(GOOGLE_PROTOBUF_ARCH_ARM) && defined(__linux__)
> #include <google/protobuf/stubs/atomicops_internals_arm_gcc.h>
> #elif defined(GOOGLE_PROTOBUF_ARCH_AARCH64)
> #include <google/protobuf/stubs/atomicops_internals_arm64_gcc.h>
> #elif defined(GOOGLE_PROTOBUF_ARCH_ARM_QNX)
> #include <google/protobuf/stubs/atomicops_internals_arm_qnx.h>
> #elif defined(GOOGLE_PROTOBUF_ARCH_MIPS) || defined(GOOGLE_PROTOBUF_ARCH_MIPS64)
> #include <google/protobuf/stubs/atomicops_internals_mips_gcc.h>
> #elif defined(__native_client__)
> #include <google/protobuf/stubs/atomicops_internals_pnacl.h>
> #elif (((__GNUC__ == 4) && (__GNUC_MINOR__ >= 7)) || (__GNUC__ > 4))
> #include <google/protobuf/stubs/atomicops_internals_generic_gcc.h>
> #elif defined(__clang__)
> #if __has_extension(c_atomic)
> #include <google/protobuf/stubs/atomicops_internals_generic_gcc.h>
> #else
> #error GOOGLE_PROTOBUF_ATOMICOPS_ERROR
> #endif
> #else
> #error GOOGLE_PROTOBUF_ATOMICOPS_ERROR
> #endif
> 
> So it means that on i386, on x86-64, on ARM and on MIPS and MIPS64,
> there are built-in implementation for the atomic operations.
> 
> For all other architectures, it relies on
> atomicops_internals_generic_gcc.h, only when gcc >= 4.7. And indeed my
> tested toolchain only has gcc 4.5.
> 
> In fact atomicops_internals_generic_gcc.h uses the __atomic_*()
> built-ins of the compiler, which indeed are only introduced in gcc 4.7.
> But on some architectures, they require linking with -latomic. See my
> atomic patch series at
> http://lists.busybox.net/pipermail/buildroot/2016-February/151672.html,
> and especially patch
> http://lists.busybox.net/pipermail/buildroot/2016-February/151674.html
> which has all the gory details.
> 
> And in fact, with those atomics, not only PowerPC can be supported, but
> any other architecture (except if protobuf has other
> architecture-specific dependencies elsewhere).
> 
> So, once my atomic patch series is merged, we could do:
> 
> config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>        bool
>        default y if BR2_arm
>        default y if BR2_i386
>        default y if BR2_mipsel
>        default y if BR2_x86_64

These architecture checks would be superseded by the BR2_TOOLCHAIN_HAS_ATOMIC boolean.

>	default y if BR2_TOOLCHAIN_HAS_ATOMIC
>        depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> 
> *and* ensure protobuf gets linked with -latomic.

Hum, this requires a patch on configure.ac that that would hardly be accepted upstream.

> What do you think ?

Ok, I will send a new patch.

Carlos Santos (Casantos)
DATACOM, P&D
