From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Sep 2015 18:37:16 +0200
Subject: [Buildroot] [PATCHv2] package/kodi: needs .py modules
In-Reply-To: <1442178783-27567-1-git-send-email-yann.morin.1998@free.fr>
References: <1442178783-27567-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <55F8493C.2030804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-09-15 23:13, Yann E. MORIN wrote:
> Kodi segfaults as soon as it tries to load a python module:
> 
>     Could not find platform independent libraries <prefix>
>     Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
>     ImportError: No module named site
>     Segmentation fault
> 
> Turns out that keeping .py modules (with or without .pyc) fixes the
> issue.
> 
> Currently, Kodi selects python, but since the format of modules is a
> choice, we can not select it.

 I think it's a lot more user-friendly to do

	select BR2_PACKAGE_PYTHON_PY_PYC

 That removes the possibility for the user to select the PY_ONLY option, but I
don't think that that's so terribly important. And it does make life a whole lot
simpler for someone who wants to select Kodi. They already have to go and enable
an EGL provider, so let's not make their life harder by requiring manual
selection of python with the correct, non-default _PY_PYC option...

 Regards,
 Arnout


> 
> Fix that by inverting the dependency on python from Kodi:
>   - turn it into a depends rather than a select,
>   - add the dependency to ! pyc-only
>   - update the comment accordingly.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> changes v1 -> v2:
>   - fix spurious 'i' (vim insert)
> ---
>  package/kodi/Config.in | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 797f59d..6d6c47b 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -2,10 +2,11 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
>  	bool
>  	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
>  
> -comment "kodi needs a toolchain w/ C++, threads, wchar, dynamic library"
> +comment "kodi needs python and .py modiules, and a toolchain w/ C++, threads, wchar, dynamic library"
>  	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> +		|| !BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON_PYC_ONLY
>  	depends on BR2_USE_MMU
>  
>  config BR2_PACKAGE_KODI_EGL_GLES
> @@ -65,7 +66,6 @@ menuconfig BR2_PACKAGE_KODI
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_PCRE
>  	select BR2_PACKAGE_PCRE_UCP
> -	select BR2_PACKAGE_PYTHON
>  	select BR2_PACKAGE_PYTHON_BSDDB
>  	select BR2_PACKAGE_PYTHON_BZIP2
>  	select BR2_PACKAGE_PYTHON_CURSES
> @@ -94,6 +94,8 @@ menuconfig BR2_PACKAGE_KODI
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_STATIC_LIBS # python
>  	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_PYTHON
> +	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
>  	help
>  	  Kodi is an award-winning free and open source (GPL) software
>  	  media player and entertainment hub for digital media.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
