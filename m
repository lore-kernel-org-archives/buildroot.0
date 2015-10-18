From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:09:33 +0200
Subject: [Buildroot] [PATCH v4 01/35] package/expedite: move to package
 directory
In-Reply-To: <1445200191-18404-2-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
 <1445200191-18404-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151018230933.2b9487dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 18 Oct 2015 22:29:17 +0200, Romain Naour wrote:
> There is no advantage for efl related packages to share the same version
> number anymore (except for Efl and Elementary).
> 
> Here are the version number used for the 1.15 stable release:
> EFL                     1.15.2
> Elementary              1.15.2
> Emotion Generic Players 1.15.0
> Evas Generic Loaders    1.15.0
> Python-EFL              1.15.0
> 
> Also, we usually do not have a sub-directory for a family of related
> packages which doen't share the same version number, so move expedite

doen't -> don't

> to the package directory. Expedite appear now in the

appear now -> now appears

> "Graphic libraries and applications (graphic/text)" in the Kconfig menu.
> 
> In a followup patch, expedite will be downloaded directly from the 1.15
> branch in the git repository since there is no new release after 1.7.0.

"no new tarball release" ?

> 
> Since expedite now select the efl package, propagate the reverse
> dependencies on mmu and wchar.

I disagree with the select here. See below.

> diff --git a/package/efl/expedite/Config.in b/package/expedite/Config.in
> similarity index 73%
> rename from package/efl/expedite/Config.in
> rename to package/expedite/Config.in
> index 1e12108..dab91c8 100644
> --- a/package/efl/expedite/Config.in
> +++ b/package/expedite/Config.in
> @@ -1,15 +1,19 @@
>  config BR2_PACKAGE_EXPEDITE
>  	bool "expedite"
> +	select BR2_PACKAGE_EFL

This should be a:

	depends on BR2_PACKAGE_EFL

in my opinion. EFL is one of these "big" stuff (like Qt, Python, Gtk)
for which people clearly know what they are doing. Nobody will want to
enable "expedite" without knowing that it relies on the EFL. For
example, gtkperf (which is also a benchmarking program, but for Gtk)
does a "depends on BR2_PACKAGE_LIBGTK2".

And if you do a "depends on" rather than a "select", then you...

>  	select BR2_PACKAGE_LIBEINA
>  	select BR2_PACKAGE_LIBEVAS
>  	select BR2_PACKAGE_LIBEET
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
> +	depends on BR2_USE_MMU # efl
> +	depends on BR2_USE_WCHAR # efl

don't have to add those lines.

>  	help
>  	  Expedite is the official Evas benchmark tool. It can test different
>  	  engines, such as X11, XRender, OpenGL (also ES variant), SDL,
>  	  DirectFB and so on. Its tests are quite extensive, trying to
>  	  reproduce real world usage cases.
>  
> -comment "expedite needs a toolchain w/ C++, threads"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +comment "expedite needs a toolchain w/ C++, threads, wchar"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +	depends on BR2_USE_MMU

... and to change the comment here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
