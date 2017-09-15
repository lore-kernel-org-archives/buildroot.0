From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 15 Sep 2017 18:32:27 +0200
Subject: [Buildroot] [PATCH] lttng-tools: needs glibc
In-Reply-To: <80f0f99699bcdacbed2aa551ef3051ab5dd45280.1505468019.git.baruch@tkos.co.il>
References: <80f0f99699bcdacbed2aa551ef3051ab5dd45280.1505468019.git.baruch@tkos.co.il>
Message-ID: <3D6C8D45-596D-409C-94EB-9800F9C3DD9A@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
why we can't disable the dlmopen call in the test? Didn't I suggested a patch or was it just a discussion on irc?

best regards
 Waldemar 

> Am 15.09.2017 um 11:33 schrieb Baruch Siach <baruch@tkos.co.il>:
> 
> This commit partially reverts commit a6bb295642919 (lttng-tools: update
> to 2.9.5) that enabled lttng-tools for uClibc and musl. Upstream code
> does not detect dlmopen() specifically. configure only checks which
> library defines dlopen(), and fails the configuration when none is
> found. The code of the prog.c test still relies on dlmopen() GNU
> extension that uClibc and musl do not implement currently.
> 
> Fixes:
> http://autobuild.buildroot.net/results/add/add97b4b3f45841249f239367452205c38d4e4df/
> http://autobuild.buildroot.net/results/382/3825c88bb8a23708e4c2fed99f2417555078c65a/
> http://autobuild.buildroot.net/results/4ae/4aef36977f039a1533b409a7c172f0ceaa2c6088/
> 
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Cc: Philippe Proulx <eeppeliteloop@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> package/lttng-tools/Config.in | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
> index 9c86cc264643..b84f201c2a22 100644
> --- a/package/lttng-tools/Config.in
> +++ b/package/lttng-tools/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_LTTNG_TOOLS
>    depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>    depends on BR2_TOOLCHAIN_HAS_THREADS
>    depends on !BR2_STATIC_LIBS # uses dlfcn
> +    # uclibc/musl don't implement dlmopen()/LM_ID_BASE
> +    depends on BR2_TOOLCHAIN_USES_GLIBC
>    select BR2_PACKAGE_LIBURCU
>    select BR2_PACKAGE_LIBXML2
>    select BR2_PACKAGE_POPT
> @@ -27,6 +29,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
> 
>      http://lttng.org
> 
> -comment "lttng-tools needs a toolchain w/ threads, dynamic library"
> +comment "lttng-tools needs a glibc toolchain w/ threads, dynamic library"
>    depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> -    depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +    depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +        !BR2_TOOLCHAIN_USES_GLIBC
> -- 
> 2.14.1
> 
