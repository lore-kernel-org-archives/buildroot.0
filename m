From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 15 Mar 2016 15:47:10 +0100
Subject: [Buildroot] [PATCH 2/2] valgrind: disable for MIPS soft-float
 when using binutils >= 2.25
In-Reply-To: <1458041310-65003-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1458041310-65003-1-git-send-email-Vincent.Riera@imgtec.com>
 <1458041310-65003-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160315144710.GO21774@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Vicente Olivert Riera wrote,

> As stated here [1], recent changes on the MIPS binutils sources have
> made it necessary for GCC to pass the -msoft-float to the assembler. Due
> to that, valgrind fails to build for MIPS soft-float when using a
> version of GCC >= 4.9 and binutils >= 2.25 because its using some
> hard-float instructions.
> 
> The combination of GCC-4.8.x and binutils >= 2.25 is not possible as its
> disabled in package/gcc/Config.in.host.
> 
> 1: https://gcc.gnu.org/ml/gcc-patches/2014-08/msg00905.html
> 
> Fixes:
>   http://autobuild.buildroot.net/results/5f5/5f576c7f8d56058a19ed0e7ff4b1ec620bcafb65/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/valgrind/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
> index 21b2608..c9c71a6 100644
> --- a/package/valgrind/Config.in
> +++ b/package/valgrind/Config.in
> @@ -8,6 +8,8 @@ config BR2_PACKAGE_VALGRIND
>  		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
>  		   BR2_x86_64
>  	depends on !BR2_STATIC_LIBS
> +	depends on !(BR2_MIPS_SOFT_FLOAT && (BR2_BINUTILS_VERSION_2_25_X || \
> +		   BR2_BINUTILS_VERSION_2_26_X))

I would rather like to come up with a fix for valgrind in the next
days. Some parts are in svn trunk and need to be backported. 
Some parts I will use from OpenWrt and a small patch from me.

I cook up a patch soon.

best regards
 Waldemar
