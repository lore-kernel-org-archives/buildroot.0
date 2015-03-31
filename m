From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Mar 2015 19:57:23 +0300
Subject: [Buildroot] [PATCH 1/1] package/libseccomp: needs headers >=
	3.12
In-Reply-To: <1427819637-2471-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427819637-2471-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150331165723.GP12479@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Tue, Mar 31, 2015 at 06:33:57PM +0200, Bernd Kuhls wrote:
> EM_AARCH64 was added to linux kernel with version 3.12:
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/uapi/linux/elf-em.h?h=linux-3.12.y
> 
> Fixes
> http://autobuild.buildroot.net/results/4cd/4cd6aaccde9fb0f80e49133b477f330b601f4a63/
> http://autobuild.buildroot.net/results/bd1/bd105e821de583e582199aae31fab13ef17e67a0/
> http://autobuild.buildroot.net/results/092/092143df2b91d50850067274da531c713f2ccb72/
> http://autobuild.buildroot.net/results/814/8149cf0c3ef3ef8d91b5891591a71691dc3d7427/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libseccomp/Config.in |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
> index 4e893c8..153e14a 100644
> --- a/package/libseccomp/Config.in
> +++ b/package/libseccomp/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBSECCOMP
>  	bool "libseccomp"
>  	depends on BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || \
>  		BR2_mips64el || BR2_i386 || BR2_x86_64
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12

Can't we limit the 3.12 headers dependency to BR2_aarch64?

Something like (untested):

	depends on BR2_mips || BR2_mipsel || BR2_mips64 || \
		BR2_mips64el || BR2_i386 || BR2_x86_64 \
		|| (BR2_aarch64 && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12)

>  	help
>  	  High level interface to the Linux Kernel's seccomp filter
>  
> @@ -13,3 +14,8 @@ config BR2_PACKAGE_LIBSECCOMP
>  	  and easily adopted by application developers.
>  
>  	  https://github.com/seccomp/libseccomp
> +
> +comment "libseccomp needs headers >= 3.12"
> +	depends on BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || \
> +		BR2_mips64el || BR2_i386 || BR2_x86_64
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
