From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 31 Jan 2020 13:47:47 -0600
Subject: [Buildroot] [PATCH 1/2] package/localedef: bump to version 2.30
In-Reply-To: <20200125234918.24829-1-romain.naour@gmail.com>
References: <20200125234918.24829-1-romain.naour@gmail.com>
Message-ID: <CANQCQpZhQPvjr27oZwBeyPOnQDjtti-1XUp+_xQHCJesYBmMiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, Jan 25, 2020 at 5:50 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> Use the same version as for glibc package.

Seems this bump requires a newer host compiler.  I found this on
Ubuntu 16.04.2  with gcc (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0
20160609

BR2_aarch64=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_4_14=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

make host-localedef

configure: error:
*** These critical programs are missing or too old: compiler
*** Check the INSTALL file for required versions.

per the INSTALL file, GCC 6.2 or higher is required

>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../0001-HACK-only-build-and-install-localedef.patch            | 0
>  .../localedef.hash                                              | 2 +-
>  package/localedef/localedef.mk                                  | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/localedef/{2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436 => 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91}/0001-HACK-only-build-and-install-localedef.patch (100%)
>  rename package/localedef/{2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436 => 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91}/localedef.hash (70%)
>
> diff --git a/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0001-HACK-only-build-and-install-localedef.patch
> similarity index 100%
> rename from package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/0001-HACK-only-build-and-install-localedef.patch
> rename to package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0001-HACK-only-build-and-install-localedef.patch
> diff --git a/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/localedef.hash b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash
> similarity index 70%
> rename from package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/localedef.hash
> rename to package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash
> index b62487ce19..4283ea04b4 100644
> --- a/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/localedef.hash
> +++ b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  a5d4cbe7eceaefd8bce1104994379818169961b59346d2f3897966912237b1e6  glibc-2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436.tar.gz
> +sha256  fe1ca8099bc2cda997d8a585f1a512e59df56c52c9c7363a4058da2725c8f4a9  glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91.tar.gz
>
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 4005737434..10a1929044 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION and SITE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436
> +LOCALEDEF_VERSION = 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
>  LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
>  LOCALEDEF_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



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
