From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Mar 2019 23:42:50 +0100
Subject: [Buildroot] [PATCH v3 3/3] upport/config-fragments/autobuild:
 test the Andes nds32 toolchain
In-Reply-To: <20190307021125.8530-4-nylon7@andestech.com>
References: <20190307021125.8530-1-nylon7@andestech.com>
 <20190307021125.8530-4-nylon7@andestech.com>
Message-ID: <20190314224250.GD6876@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nylon, All,

On 2019-03-07 10:11 +0800, Nylon Chen spake thusly:
> Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
> Signed-off-by: Greentime Hu <greentime@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  support/config-fragments/autobuild/br-andes-nds32.config | 9 +++++++++
>  support/config-fragments/autobuild/toolchain-configs.csv | 1 +
>  2 files changed, 10 insertions(+)
>  create mode 100644 support/config-fragments/autobuild/br-andes-nds32.config
> 
> diff --git a/support/config-fragments/autobuild/br-andes-nds32.config b/support/config-fragments/autobuild/br-andes-nds32.config
> new file mode 100644
> index 0000000000..cd093a20f9
> --- /dev/null
> +++ b/support/config-fragments/autobuild/br-andes-nds32.config
> @@ -0,0 +1,9 @@
> +BR2_nds32=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz"

I was going to add my reviewd-by tag, but then I notice that this
repository does not seem to be affilated with AndesTech, but it
looks like a "random" guy dropped a bunch of stuff.

Yet, there are release notes to explain how to reproduce the toolchain:

    https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases

    1. The source code of each component for this toolchain are located at
    the following path.
    a. gcc:
    path: https://github.com/andestech/gcc.git
    branch: nds32-8.1.0-upstream
    b. binutils
    path: https://github.com/andestech/binutils.git
    branch: nds32-binutils-2.30-branch-open
    c. glibc
    path: https://github.com/andestech/glibc.git
    branch: nds32-glibc-2.27-v0
    d. Linux
    path: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    branch: master

    2. User can manually generate this toolchain though build-toochain.sh
    in following git repo.
    https://github.com/andestech/build_script.git

    3. The git commit ID of each component in Andes internel git tree.
    binutils-2.30 : ee457e8114f09c1b4df7c834ad58b02c9f43c139
    gcc-8.1.0: 260e4b4bbb7f32b483482573c92c8caacf5c17ab
    linux-v4.17-rc3: 6da6c0db5316275015e8cc2959f12a17584aeb64
    glibc-2.27: e9f2165793aaf2f033a6cebff389ebbba5d799bd

The instructions in 2. do not seem to deconected from what we do. There
is this one weird trick about build ing libgcc, but maybe it can be
coaxed into working to build with the Buildroot internal toolchain?

Apart from the weird location of the toolchain:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_17=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="nds32le-linux"
> diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
> index 3681bc519f..7a3b91df27 100644
> --- a/support/config-fragments/autobuild/toolchain-configs.csv
> +++ b/support/config-fragments/autobuild/toolchain-configs.csv
> @@ -25,6 +25,7 @@ support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config,x86
>  support/config-fragments/autobuild/arm-aarch64.config,x86_64
>  support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config,x86
>  support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64
> +support/config-fragments/autobuild/br-andes-nds32.config,x86
>  support/config-fragments/autobuild/br-arc-full-internal.config,any
>  support/config-fragments/autobuild/br-arc-internal-glibc.config,any
>  support/config-fragments/autobuild/br-arcle-hs38.config,x86_64
> -- 
> 2.18.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
