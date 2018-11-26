From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Nov 2018 08:36:06 -0600
Subject: [Buildroot] [PATCH 1/1] package/gdb: prevent gdbserver being
 selected for RISC-V builds
In-Reply-To: <20181126142438.20337-1-mark.corbin@embecosm.com>
References: <20181126142438.20337-1-mark.corbin@embecosm.com>
Message-ID: <CANQCQpbtJOA68QK2s26rS9dPsev3_VrcEs4V2VFFU0rKioypwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark,

On Mon, Nov 26, 2018 at 8:26 AM Mark Corbin <mark.corbin@embecosm.com> wrote:
>
> There is currently no version of gdbserver for RISC-V. Until this
> is implemented we will prevent both the direct and indirect
> selection of gdbserver for RISC-V builds. In practice this means
> that 'cross gdb for the host' cannot be selected and that
> 'full debugger' must be automatically selected for the gdb target
> package.
>
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  package/gdb/Config.in      | 5 ++++-
>  package/gdb/Config.in.host | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index 55c1b194ce..b3668aeb24 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -24,7 +24,9 @@ config BR2_PACKAGE_GDB
>         # target, we don't allow building a separate gdbserver. The
>         # one from the external toolchain should be used.
>         select BR2_PACKAGE_GDB_SERVER if \
> -               (!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
> +               (!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY && \
> +               !BR2_riscv)
> +       select BR2_PACKAGE_GDB_DEBUGGER if BR2_riscv

At first glance, most other arch would have ended up in the
BR2_PACKAGE_GDB_ARCH_SUPPORTS with no GDB support at all.  Maybe add a
comment above this line so it's clear the reason you're defaulting to
building a target full gdb is because there is no remote gdbserver
support.

>         help
>           GDB, the GNU Project debugger, allows you to see what is
>           going on `inside' another program while it executes -- or
> @@ -46,6 +48,7 @@ if BR2_PACKAGE_GDB
>  config BR2_PACKAGE_GDB_SERVER
>         bool "gdbserver"
>         depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
> +       depends on !BR2_riscv
>         help
>           Build the gdbserver stub to run on the target.
>           A full gdb is needed to debug the progam.
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index df8817d91d..ade2371d5c 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
>         depends on !BR2_microblaze
>         depends on !BR2_nios2
>         depends on !BR2_or1k
> +       depends on !BR2_riscv
>
>  comment "Host GDB Options"
>         depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
> --
> 2.19.1
