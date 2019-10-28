From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 28 Oct 2019 17:39:39 -0500
Subject: [Buildroot] [PATCH 1/3] package/netdata: new package
In-Reply-To: <20191028161418.163056-1-m.niestroj@grinn-global.com>
References: <20191028161418.163056-1-m.niestroj@grinn-global.com>
Message-ID: <CANQCQpYq+R-Mk+MsFtdeO8_QAPzpjWhgUvkapnZWhGCttopRBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcin,

On Mon, Oct 28, 2019 at 11:14 AM Marcin Niestroj
<m.niestroj@grinn-global.com> wrote:
>
> Always provide --disable-dbengine configuration option, because we do
> not support libjudy dependency that is required otherwise.
>
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/Config.in            |  1 +
>  package/netdata/Config.in    | 24 ++++++++++++++++++++++++
>  package/netdata/netdata.hash |  3 +++
>  package/netdata/netdata.mk   | 15 +++++++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 package/netdata/Config.in
>  create mode 100644 package/netdata/netdata.hash
>  create mode 100644 package/netdata/netdata.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index a1ac5069aa..e1e72beb2e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1875,6 +1875,7 @@ menu "Miscellaneous"
>         source "package/linux-syscall-support/Config.in"
>         source "package/mcrypt/Config.in"
>         source "package/mobile-broadband-provider-info/Config.in"
> +       source "package/netdata/Config.in"
>         source "package/proj/Config.in"
>         source "package/qemu/Config.in"
>         source "package/qpdf/Config.in"
> diff --git a/package/netdata/Config.in b/package/netdata/Config.in
> new file mode 100644
> index 0000000000..622f63e84a
> --- /dev/null
> +++ b/package/netdata/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_NETDATA
> +       bool "netdata"
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c and libuv
> +       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv -> pthread_barrier_*
> +       depends on BR2_USE_MMU # libuv -> fork()
> +       depends on !BR2_STATIC_LIBS # libuv
> +       select BR2_PACKAGE_JSON_C
> +       select BR2_PACKAGE_LIBUV
> +       select BR2_PACKAGE_LZ4
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_UTIL_LINUX
> +       select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +       help
> +         Netdata is distributed, real-time, performance and health
> +         monitoring for systems and applications. It is a highly
> +         optimized monitoring agent you install on all your systems and
> +         containers.
> +
> +         https://github.com/netdata/netdata
> +
> +comment "netdata needs a toolchain w/ NPTL, dynamic library"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> +       depends on BR2_USE_MMU
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> diff --git a/package/netdata/netdata.hash b/package/netdata/netdata.hash
> new file mode 100644
> index 0000000000..e3147a4af5
> --- /dev/null
> +++ b/package/netdata/netdata.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 c788ec01f5228768cbf5032324e041defbac3aaa57a074b98038444fc46ba2d4  netdata-1.18.1.tar.gz
> +sha256 0e5fd9d833efe9b79f784d1903281554af82d1b4261af67d35455728e5572aa6  LICENSE
> diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
> new file mode 100644
> index 0000000000..ddef56c74d
> --- /dev/null
> +++ b/package/netdata/netdata.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# netdata
> +#
> +################################################################################
> +
> +NETDATA_VERSION = 1.18.1
> +NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
> +NETDATA_LICENSE = GPL-3.0
> +NETDATA_LICENSE_FILES = LICENSE
> +NETDATA_DEPENDENCIES = json-c libuv lz4 util-linux

With the select of openssl in the Config.in a matching openssl should
be in the make dependencies list.

> +NETDATA_AUTORECONF = YES

Suggest adding a comment above this autoreconf stating why.  Something like
# netdata's source code is released without a generated configure script

> +NETDATA_CONF_OPTS = --disable-dbengine

 $ ./utils/test-pkg -p netdata -k -d  testbuild
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

Regards,
Matt
