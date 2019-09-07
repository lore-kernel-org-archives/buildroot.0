From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 6 Sep 2019 22:11:44 -0500
Subject: [Buildroot] [PATCH 07/11] package/busybox: fix applets runtime
 issue when building with clang cross-compiler
In-Reply-To: <20190906090947.5476-8-romain.naour@smile.fr>
References: <20190906090947.5476-1-romain.naour@smile.fr>
 <20190906090947.5476-8-romain.naour@smile.fr>
Message-ID: <CANQCQpYDyAcV6HkabqzVOBVPAgs9GA=ZtfronrAV=r=nt9LYVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Fri, Sep 6, 2019 at 4:10 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> Apply a patch contributed by Luis Marques on the Busybox mailing list [1]
> fixing a runtime issue (segfault) when busybox is compiled by Clang.
>
> The patch disable the compiler optimizations for Clang/LLVM only.
>
> Without this patch, busybox segfault with several applets
> (login on aarch64 using Clang 8.0.1, init on x86_64 using Clang 9.0.0rc3)
>
> [1] http://lists.busybox.net/pipermail/busybox/2019-June/087337.html
>

Got a "crtbegin.o no such file or directory" error when I setup a
build using master with qemu_aarch64_virt_defconfig (updated for
prebuilt external toolchain and enabling clang as cross-compiler).
https://paste.ubuntu.com/p/wxrmVTGVvp/

From your comment earlier on irc that you tested with 9.0.1 (x86_64
and aarch64), I wonder if this error is a difference between building
with clang 8.0.1 and 9.

I was able to build compiler-rt & libfuzzer with your series applied
and pass a runtime test (system still cross compiled with gcc but
using "[01/11] package/clang: help host-clang to find our external
toolchain" to find the sysroot).  This was instead of using the -B
option when building libfuzzer as part of the runtime test.

Matt
