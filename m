From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:36:10 +0100
Subject: [Buildroot] [PATCH 24/25] support/config-fragments/autobuild:
 use Bootlin toolchain for Xtensa uclibc
In-Reply-To: <20210202225339.2157480-25-thomas.petazzoni@bootlin.com>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
 <20210202225339.2157480-25-thomas.petazzoni@bootlin.com>
Message-ID: <20210203213610.GJ2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-02-02 23:53 +0100, Thomas Petazzoni spake thusly:
> Instead of using an external toolchain built specifically for the
> autobuilders to test Xtensa/uclibc, use a pre-built Bootlin toolchain.

To be noted: this fragment was in fact already using a bleeding-edge
Bootlin toolchain:

    $ cat support/config-fragments/autobuild/br-xtensa-full.config >.config

    $ make olddefconfig

    $ grep BOOTLIN .config
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE=y
    # BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE is not set

This is because BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y is missing from the
fragment...

I'll add a blurb to explain that in the commit log when applying.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../autobuild/bootlin-xtensa-uclibc.config               | 3 +++
>  support/config-fragments/autobuild/br-xtensa-full.config | 9 ---------
>  support/config-fragments/autobuild/toolchain-configs.csv | 2 +-
>  3 files changed, 4 insertions(+), 10 deletions(-)
>  create mode 100644 support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
>  delete mode 100644 support/config-fragments/autobuild/br-xtensa-full.config
> 
> diff --git a/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config b/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
> new file mode 100644
> index 0000000000..7975287456
> --- /dev/null
> +++ b/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
> @@ -0,0 +1,3 @@
> +BR2_xtensa=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE=y
> diff --git a/support/config-fragments/autobuild/br-xtensa-full.config b/support/config-fragments/autobuild/br-xtensa-full.config
> deleted file mode 100644
> index 9d0092143c..0000000000
> --- a/support/config-fragments/autobuild/br-xtensa-full.config
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -BR2_xtensa=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2020.02.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
> -BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> -# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
> index f7a9c7dd59..f5e9bd8cf9 100644
> --- a/support/config-fragments/autobuild/toolchain-configs.csv
> +++ b/support/config-fragments/autobuild/toolchain-configs.csv
> @@ -44,6 +44,7 @@ support/config-fragments/autobuild/bootlin-sparc-uclibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-sparc64-glibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-x86-64-uclibc.config,x86_64
> +support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
>  support/config-fragments/autobuild/br-arc-full-internal.config,any
>  support/config-fragments/autobuild/br-arc-internal-glibc.config,any
>  support/config-fragments/autobuild/br-arm-basic.config,x86_64
> @@ -61,7 +62,6 @@ support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
>  support/config-fragments/autobuild/br-powerpc-internal-full.config,any
>  support/config-fragments/autobuild/br-riscv64-full-internal.config,any
>  support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
> -support/config-fragments/autobuild/br-xtensa-full.config,x86_64
>  support/config-fragments/autobuild/br-xtensa-full-internal.config,any
>  support/config-fragments/autobuild/linaro-aarch64.config,x86
>  support/config-fragments/autobuild/linaro-aarch64-be.config,x86
> -- 
> 2.29.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
