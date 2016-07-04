From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Jul 2016 11:16:08 +0200
Subject: [Buildroot] [PATCH v3 01/14] toolchain/toolchain-common.in: add
 BR2_TOOLCHAIN_HAS_LIBQUADMATH hidden symbol
In-Reply-To: <20160703134750.7516-2-s.martin49@gmail.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
 <20160703134750.7516-2-s.martin49@gmail.com>
Message-ID: <7e95119d-44a7-dbf5-bc60-95b8a5bab77f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-07-16 15:47, Samuel Martin wrote:
> This hidden symbol allow to know when libquadmath can be built and installed.
> 
> Also, declaring this symbol in toolchain-common.in allows to use it in
> both external and buildroot toolchain backend.
> 
> This will be needed for adding/improving the fortran support.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v2->v3:
> - new patch
> ---
>  toolchain/toolchain-common.in | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 847c905..96ce3d1 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -419,3 +419,13 @@ config BR2_TOOLCHAIN_HAS_ATOMIC
>  	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_armeb
>  	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_xtensa
>  	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_ARCH_IS_64
> +
> +# - libquadmath is not needed/available on all architectures (but gcc
> +#   correctly handles this already).
> +# - At least, libquadmath is available on:
> +#   - i*86
> +#   - x86_64
> +# - When available, libquadmath requires wchar support.
> +config BR2_TOOLCHAIN_HAS_LIBQUADMATH
> +	bool
> +	default y if BR2_i386 || BR2_x86_64

 Wouldn't it make more sense to add here:

	depends on BR2_USE_WCHAR

(and remove it from the .mk file)?

 Regards,
 Arnout
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
