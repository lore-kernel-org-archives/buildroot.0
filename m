From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 00:16:21 +0200
Subject: [Buildroot] [PATCH] package/valgrind: hide comment when arch is
 not supported
In-Reply-To: <20170810215111.32360-1-yann.morin.1998@free.fr>
References: <20170810215111.32360-1-yann.morin.1998@free.fr>
Message-ID: <19c02958-e0e0-954e-6fc9-9fd042e5c9e6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-08-17 23:51, Yann E. MORIN wrote:
> Currently, the comment that "valgrind needs shared libs" is not hidden
> when the architecture dependencies are not met, which can confuse some
> users (as recently seen on IRC).
> 
> Fix that by introducing the traditional _ARCH_SUPPORTS option, and have
> the comment and the symbol depend on that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Brandon Maier <brandon.maier@rockwellcollins.com>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
with one small nit:

> 
> ---
> Note: Cc-ing the people that have touched valgrind in the past 12
> months-or-so...
> ---
>  package/valgrind/Config.in | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
> index 40e219d95a..919bd1afb5 100644
> --- a/package/valgrind/Config.in
> +++ b/package/valgrind/Config.in
> @@ -1,14 +1,19 @@
>  comment "valgrind needs a toolchain w/ dynamic library"
> +	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
>  	depends on BR2_STATIC_LIBS
>  
> +config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS

 _ARCH_SUPPORTS is always the first thing in the file, even if the comment comes
before the main symbol (cfr. e.g. package/canfestival/Config.in,
package/erlang/Config.in)


 Regards,
 Arnout

> +	bool
> +	default y if BR2_ARM_CPU_ARMV7A
> +	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	default y if BR2_i386 || BR2_x86_64
> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> +	depends on !BR2_MIPS_SOFT_FLOAT
> +
>  config BR2_PACKAGE_VALGRIND
>  	bool "valgrind"
> -	depends on BR2_ARM_CPU_ARMV7A || BR2_i386 || \
> -		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> -		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
> -		   BR2_x86_64
> +	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
>  	depends on !BR2_STATIC_LIBS
> -	depends on !BR2_MIPS_SOFT_FLOAT
>  	help
>  	  Tool for debugging and profiling Linux programs.
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
