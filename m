From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 00:32:51 +0100
Subject: [Buildroot] [PATCH v5 1/1] package/cups-filters: Add new
 package cups-filters 1.8.1
In-Reply-To: <1453668465-30869-1-git-send-email-olivier.schonken@gmail.com>
References: <1453668465-30869-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20160221003251.460d29e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Olivier,

Thanks for respining. I have a few more questions, see below.

On Sun, 24 Jan 2016 22:47:45 +0200, Olivier Schonken wrote:

> diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
> new file mode 100644
> index 0000000..23bfae5
> --- /dev/null
> +++ b/package/cups-filters/Config.in
> @@ -0,0 +1,41 @@
> +comment "cups-filters needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS

This should have "depends on BR2_USE_MMU" so that the comment is not
shown on architectures for which cups-filters can anyway not be built.

> +
> +config BR2_PACKAGE_CUPS_FILTERS
> +	bool "cups-filters"
> +	# needs fork()
> +	depends on BR2_USE_MMU
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_CUPS

Are you sure you want to do a "select BR2_PACKAGE_CUPS" ?

First, if you "select BR2_PACKAGE_CUPS", you must replicate all
"depends on" of BR2_PACKAGE_CUPS. And especially the dependency on
BR2_INSTALL_LIBSTDCPP. Which means that the pdftops sub-option becomes
quite useless, since it was mainly there because this feature requires
C++ support.

Secondly, it is quite obvious that "cups-filters" would need the "cups"
package. So in fact this "select BR2_PACKAGE_CUPS" could very well be
replaced by a "depends on BR2_PACKAGE_CUPS". Especially since other
cups-depending packages such as gutenprint, foomatic-filters or hplip
already use "depends on BR2_PACKAGE_CUPS".

> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_IJS
> +	select BR2_PACKAGE_LCMS2
> +	select BR2_PACKAGE_POPPLER
> +	select BR2_PACKAGE_QPDF

You need to replicate the dependencies of all those packages you are
selecting. For libglib2, it means for example:

        depends on BR2_USE_WCHAR # gettext
        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on BR2_USE_MMU # fork()

poppler also depends on C++ support, so another reason why you need to
"depends on BR2_INSTALL_LIBSTDCPP". Ditto for qpdf.

> +if BR2_PACKAGE_CUPS_FILTERS
> +
> +config BR2_PACKAGE_CUPS_FILTERS_PDFTOPS
> +	bool "pdftops support"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  Enable pdftops support

Is it really useful to have a separate option for this? It doesn't seem
to require any additional dependency (not even C++ support, see above).
If the size difference is minimal, then we should get rid of this
option, and simply build pdftops support unconditionally.

You can update the Config.in.legacy file about pdftops support being
removed from cups, by adding in the comment that the support is now in
the cups-filters package.

Could you respin after handling those comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
