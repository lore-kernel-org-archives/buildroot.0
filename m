From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 10 Dec 2013 12:50:11 +0100
Subject: [Buildroot] [PATCH v4 1/1] ktap: new package
In-Reply-To: <1386665365-16005-1-git-send-email-anders@chargestorm.se>
References: <1386665365-16005-1-git-send-email-anders@chargestorm.se>
Message-ID: <CAAXf6LVmuF+WEGti_SOgJGsL2yCYa7fkJxqznuwPhgpa-zwZxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anders,

On Tue, Dec 10, 2013 at 9:49 AM, Anders Darander <anders@chargestorm.se> wrote:
> Add ktap, a script-based dynamic tracing tool.
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>
> Changes v3 -> v4:
>         - Rename patches to start with package name.
>         - Fix language in Config.in help text. (I.e.
>         fix typos from ktap README).
>         - Remove alignment of =
>         - Use the new github helper to retrieve tarball.
>
> Changes v2 -> v3:
>         - Fix typo in TARGET_CONFIGURE_OPTS. The typo was added after
>         building and running on a beaglebone, but prior to pure build
>         testing on another target. ktap successfully built, but for the
>         host arch...
>
>         No update to ktap v0.4, as this will require more configure options
>         to get a deterministic build. I'll update to v0.4 as soon as my
>         schedule allows me some time for testing.
>
> Changes v1 -> v2:
>         - Change {} to () around e.g. LINUX_VERSION_PROBED
>         - Use TARGET_CONFIGURE_OPTS instead of setting CC
>         - Explicitly install to file instead of directory
>         - Add depends on BR2_TOOLCHAIN_HAS_THREADS
>
>  package/Config.in                                  |  1 +
>  package/ktap/Config.in                             | 26 ++++++++++++++++++++
>  ...p-0001-interpreter-vm.c-include-uaccess.h.patch | 27 +++++++++++++++++++++
>  package/ktap/ktap-0002-Set-PWD-in-Makefile.patch   | 28 ++++++++++++++++++++++
>  package/ktap/ktap.mk                               | 25 +++++++++++++++++++
>  5 files changed, 107 insertions(+)
>  create mode 100644 package/ktap/Config.in
>  create mode 100644 package/ktap/ktap-0001-interpreter-vm.c-include-uaccess.h.patch
>  create mode 100644 package/ktap/ktap-0002-Set-PWD-in-Makefile.patch
>  create mode 100644 package/ktap/ktap.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index aa928ec..40c9e31 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -50,6 +50,7 @@ source "package/duma/Config.in"
>  source "package/gdb/Config.in"
>  source "package/iozone/Config.in"
>  source "package/kexec/Config.in"
> +source "package/ktap/Config.in"
>  source "package/latencytop/Config.in"
>  source "package/lmbench/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> diff --git a/package/ktap/Config.in b/package/ktap/Config.in
> new file mode 100644
> index 0000000..866245e
> --- /dev/null
> +++ b/package/ktap/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_KTAP
> +       bool "ktap"
> +       depends on BR2_LINUX_KERNEL
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       help
> +         ktap is a script-based dynamic tracing tool for Linux
> +
> +         It uses a scripting language and lets users trace the Linux kernel
> +         dynamically. ktap is designed to give operational insights with
> +         interoperability that allows users to tune, troubleshoot and extend
> +         kernel and application. It's similar to Linux Systemtap and
> +         Solaris Dtrace.
> +
> +         ktap doesn't support kernels older than 3.1.
> +
> +         Your kernel must have CONFIG_EVENT_TRACING,

There seems to be a trailing space on this line...

Other than that:
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(compile tested for an ARM1176 target, Sourcery toolchain)
