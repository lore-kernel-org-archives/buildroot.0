From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 6 Sep 2019 22:17:32 -0500
Subject: [Buildroot] [PATCH 07/11] package/busybox: fix applets runtime
 issue when building with clang cross-compiler
In-Reply-To: <CANQCQpYDyAcV6HkabqzVOBVPAgs9GA=ZtfronrAV=r=nt9LYVQ@mail.gmail.com>
References: <20190906090947.5476-1-romain.naour@smile.fr>
 <20190906090947.5476-8-romain.naour@smile.fr>
 <CANQCQpYDyAcV6HkabqzVOBVPAgs9GA=ZtfronrAV=r=nt9LYVQ@mail.gmail.com>
Message-ID: <CANQCQpY_hVuJxHU-H--80pb+NfPQaJg9aREjO0TaoYc-arWqjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Fri, Sep 6, 2019 at 10:11 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Romain,
>
> On Fri, Sep 6, 2019 at 4:10 AM Romain Naour <romain.naour@smile.fr> wrote:
> >
> > Apply a patch contributed by Luis Marques on the Busybox mailing list [1]
> > fixing a runtime issue (segfault) when busybox is compiled by Clang.
> >
> > The patch disable the compiler optimizations for Clang/LLVM only.
> >
> > Without this patch, busybox segfault with several applets
> > (login on aarch64 using Clang 8.0.1, init on x86_64 using Clang 9.0.0rc3)
> >
> > [1] http://lists.busybox.net/pipermail/busybox/2019-June/087337.html
> >
>
> Got a "crtbegin.o no such file or directory" error when I setup a
> build using master with qemu_aarch64_virt_defconfig (updated for
> prebuilt external toolchain and enabling clang as cross-compiler).
> https://paste.ubuntu.com/p/wxrmVTGVvp/
>

# find output/host/ -name  crtbegin.o
output/host/opt/ext-toolchain/lib/gcc/aarch64-linux-gnu/8.3.0/crtbegin.o
# output/host/bin/clang -print-search-dirs
programs: =/accts/mlweber1/tmp.M0HlOc7IKF-buildroot/output/host/bin:/..//bin
libraries: =/accts/mlweber1/tmp.M0HlOc7IKF-buildroot/output/host/lib/clang/8.0.1:/accts/mlweber1/tmp.M0HlOc7IKF-buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/lib/../lib64:/accts/mlweber1/tmp.M0HlOc7IKF-buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64:/accts/mlweber1/tmp.M0HlOc7IKF-buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/lib:/accts/mlweber1/tmp.M0HlOc7IKF-buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib


> From your comment earlier on irc that you tested with 9.0.1 (x86_64
> and aarch64), I wonder if this error is a difference between building
> with clang 8.0.1 and 9.
>
> I was able to build compiler-rt & libfuzzer with your series applied
> and pass a runtime test (system still cross compiled with gcc but
> using "[01/11] package/clang: help host-clang to find our external
> toolchain" to find the sysroot).  This was instead of using the -B
> option when building libfuzzer as part of the runtime test.
>
> Matt



-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
