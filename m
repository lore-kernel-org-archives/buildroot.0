From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Fri, 5 Feb 2016 09:04:53 -0200 (BRST)
Subject: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for
 PowerPC
In-Reply-To: <20160205000613.504940f9@free-electrons.com>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <20160205000613.504940f9@free-electrons.com>
Message-ID: <1851498233.1377552.1454670293384.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I agree with you, but let me say that the original patch just corrects a "syntax error" in the code !

+ #define GOOGLE_PROTOBUF_ATOMICOPS_ERROR \
+-#error "Atomic operations are not supported on your platform"
++"Atomic operations are not supported on your platform"

The macro GOOGLE_PROTOBUF_ATOMICOPS_ERROR expands to "another" pre-processor directive (#error "Message"). So if the Macro gets expanded, it will generate a strange message "error: #error ..."

This syntax error correction was submitted upstream, but wasnt applied to protobuf 2.6.1, just to protobuf 3x series. As we cannot drive the push to protobuf 3.x series right now (but we can in the near future, as soon as the first 3.x appears), we submitted a patch to buildroot.

Despite of this, the solution using the atomic patch you sent seems ok. We are using the patch we submmited for six months now, internally, and we try to send upstream everything, as soon as possible, so that we can keep up with the upstream tree. When your solution goes in, we can remove our internal patch (it is submmited in protobuf upstream 3.x anyway).

Thanks for the analysis


----- Mensagem original -----
> De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Para: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Enviadas: Quinta-feira, 4 de fevereiro de 2016 21:06:13
> Assunto: Re: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for PowerPC

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
>	default y if BR2_TOOLCHAIN_HAS_ATOMIC
>        depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> 
> *and* ensure protobuf gets linked with -latomic.
> 
> What do you think ?
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
