From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Jan 2016 19:25:12 +0200
Subject: [Buildroot] [PATCHv2] moarvm: disable for sparc64
In-Reply-To: <20160117135521.GA11259@waldemar-brodkorb.de>
References: <20160117135521.GA11259@waldemar-brodkorb.de>
Message-ID: <20160117172512.GE10304@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Sun, Jan 17, 2016 at 02:55:21PM +0100, Waldemar Brodkorb wrote:
> Missing implementation of AO_fetch_compare_and_swap in
> libatomic_ops library for sparcv9.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   * added comment dependency suggested by Baruch Siach
>     it was not possible to use a new dependency line.
> 
> ---
>  package/moarvm/Config.in |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
> index 95f3752..038fe6b 100644
> --- a/package/moarvm/Config.in
> +++ b/package/moarvm/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_MOARVM
>  	depends on !BR2_STATIC_LIBS # libuv
>  	depends on BR2_USE_MMU # libuv
>  	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # libatomic_ops
> +	# needs AO_fetch_compare_and_swap, not implemented for sparcv9
> +	depends on !BR2_sparc64
>  	select BR2_PACKAGE_LIBUV
>  	select BR2_PACKAGE_LIBATOMIC_OPS
>  	help
> @@ -12,8 +14,8 @@ config BR2_PACKAGE_MOARVM
>  
>  	  http://moarvm.com
>  
> -comment "moarvm needs a toolchain w/ threads, dynamic library"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +comment "moarvm needs a toolchain w/ threads, dynamic library and complete atomic ops"
> +	depends on BR2_sparc64 || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

Should be 'depends on !BR2_sparc64' in a separate line. That is, hide the 
comment for sparc64. This is the rule for platform dependencies because the 
user can't just choose a different platform in most cases. For the same reason 
the comment text should not change.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
