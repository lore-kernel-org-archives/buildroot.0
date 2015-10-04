From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Oct 2015 14:42:42 +0100
Subject: [Buildroot] [PATCH v2 1/2] python-numpy: introduce
 ARCH_SUPPORTS hidden variable
In-Reply-To: <1441285996-29463-1-git-send-email-gwenj@trabucayre.com>
References: <1441285996-29463-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <56112CD2.9050602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-09-15 14:13, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Python-numpy has specific constraints about uClibc and arch. This patch add an
> BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS hidden variable to avoid duplicate
> dependencies test for others packages which uses numpy.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/python-numpy/Config.in | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
> index 1f9938a..4c02ea6 100644
> --- a/package/python-numpy/Config.in
> +++ b/package/python-numpy/Config.in
> @@ -1,12 +1,16 @@
> +config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> +	bool
> +	# numpy needs fenv.h. Available for all architectures in
> +	# glibc, but only for x86 and x86-64 in uClibc.
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64
> +
>  config BR2_PACKAGE_PYTHON_NUMPY
>  	bool "python-numpy"
>  	# Numpy has some CPU specific code
>  	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
>  		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
>  		|| BR2_sh || BR2_x86_64

 You should also move this dependency to NUMPY_ARCH_SUPPORTS.

> -	# numpy needs fenv.h. Available for all architectures in
> -	# glibc, but only for x86 and x86-64 in uClibc.
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64

 Turns out that this is actually not needed - patch will follow. So wait a bit
before respinning and respin it based on my patch.

> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	help
>  	  NumPy is the fundamental package for scientific computing
>  	  with Python.
> 


 You should also update the reverse dependencies of python-numpy (opencv3) with
this new symbol.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
