From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Jun 2021 07:45:12 +1000
Subject: [Buildroot] [PATCHv2] package/gdb: enable gdbserver support for
 riscv
In-Reply-To: <20210617214213.75840-1-romain.naour@gmail.com>
References: <20210617214213.75840-1-romain.naour@gmail.com>
Message-ID: <CAKmqyKM=sTvCV3Ai6g0aeno_tvQ1Hwvsg=M6G9YmTKNWJZh8iA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 18, 2021 at 7:42 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> It turn out that gdbserver support for riscv is available since 10.1 release, since commit [1].
>
> Restrict the gdb version choice for riscv to 10.1 for simplicity [2].
>
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=bf84f7066626c78884436e1c39fb60f04c665f21
> [2] http://lists.busybox.net/pipermail/buildroot/2021-June/312681.html
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> git tag --contains bf84f7066626c78884436e1c39fb60f04c665f21
> returns gdb-10.1-release tag as the oldest containing this commit.
>
> v2: restrict the version choice (Arnout)
> ---
>  package/gdb/Config.in      | 3 ---
>  package/gdb/Config.in.host | 9 ++++++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index 262740fc4c..246748131e 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -19,8 +19,6 @@ config BR2_PACKAGE_GDB
>         depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>         depends on BR2_INSTALL_LIBSTDCPP
> -       # no gdbserver on riscv
> -       select BR2_PACKAGE_GDB_DEBUGGER if BR2_riscv
>         # When the external toolchain gdbserver is copied to the
>         # target, we don't allow building a separate gdbserver. The
>         # one from the external toolchain should be used.
> @@ -47,7 +45,6 @@ if BR2_PACKAGE_GDB
>  config BR2_PACKAGE_GDB_SERVER
>         bool "gdbserver"
>         depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
> -       depends on !BR2_riscv
>         help
>           Build the gdbserver stub to run on the target.
>           A full gdb is needed to debug the progam.
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 21e6b34caa..9814f3a79b 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
>         depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
>         depends on !BR2_microblaze
>         depends on !BR2_or1k
> -       depends on !BR2_riscv
>         depends on !BR2_nds32
>
>  comment "Host GDB Options"
> @@ -70,9 +69,13 @@ choice
>
>  config BR2_GDB_VERSION_8_3
>         bool "gdb 8.3.x"
> +       # gdbserver support missing
> +       depends on !BR2_riscv
>
>  config BR2_GDB_VERSION_9_2
>         bool "gdb 9.2.x"
> +       # gdbserver support missing
> +       depends on !BR2_riscv
>
>  config BR2_GDB_VERSION_10
>         bool "gdb 10.x"
> @@ -87,6 +90,6 @@ config BR2_GDB_VERSION
>         default "arc-2020.09-release-gdb" if BR2_arc
>         default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
>         default "8.3.1"    if BR2_GDB_VERSION_8_3
> -       default "9.2"      if BR2_GDB_VERSION_9_2 || !BR2_PACKAGE_HOST_GDB
> -       default "10.1"     if BR2_GDB_VERSION_10
> +       default "9.2"      if BR2_GDB_VERSION_9_2 || (!BR2_PACKAGE_HOST_GDB && !BR2_riscv)
> +       default "10.1"     if BR2_GDB_VERSION_10 || (!BR2_PACKAGE_HOST_GDB && BR2_riscv)
>         depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
> --
> 2.31.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
