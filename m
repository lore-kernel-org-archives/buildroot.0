From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 23:34:54 +0200
Subject: [Buildroot] [PATCH v9 5/5] policycoreutils: split packages and
 bump to 2.7
In-Reply-To: <20171017185444.13989-5-Adamduskett@outlook.com>
References: <20171017185444.13989-1-Adamduskett@outlook.com>
 <20171017185444.13989-5-Adamduskett@outlook.com>
Message-ID: <20171017233454.096a9c41@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 14:54:44 -0400, Adam Duskett wrote:
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f35d6f3688..f52964bd90 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -41,8 +41,10 @@ F:	package/libsepol/
>  F:	package/nginx-naxsi/
>  F:	package/policycoreutils/
>  F:	package/python-mutagen/
> +F:	package/restorecond/
>  F:	package/refpolicy/
> -F:	package/sepolgen/
> +F:	package/selinux-python/
> +F:  package/semodule-utils/

Indentation issue.


> diff --git a/package/restorecond/Config.in b/package/restorecond/Config.in
> new file mode 100644
> index 0000000000..46fcec1dc2
> --- /dev/null
> +++ b/package/restorecond/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_RESTORECOND
> +	bool "restorecond"
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	depends on BR2_TOOLCHAIN_USES_GLIBC #libselinux
> +	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_DBUS_GLIB
> +	select BR2_PACKAGE_LIBSELINUX
> +	select BR2_PACKAGE_LIBGLIB2

Missing:

        depends on !BR2_arc
        depends on !BR2_STATIC_LIBS

you select BR2_PACKAGE_LIBSELINUX, so you have to inherit the
dependencies.

> +	help
> +	  restorecond is a daemon that watches for file creation and
> +	  then sets the default SELinux file context for that file.
> +	  
> +	  https://github.com/SELinuxProject/selinux/wiki/Releases
> +	  
> +comment "restorecond needs a toolchain w/ glibc, wchar, threads, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU || \
> +		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_USES_GLIBC

BR2_USE_MMU should be on a separate line, as we don't want to see the
comment on !BR2_USE_MMU systems. Don't forget the ARC dependency and
dynamic library dependency. Well, dynamic library is mentioned in the
comment... but not in the dependencies!


> diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
> new file mode 100644
> index 0000000000..44fdc1e4e6
> --- /dev/null
> +++ b/package/selinux-python/Config.in
> @@ -0,0 +1,63 @@
> +menuconfig BR2_PACKAGE_SELINUX_PYTHON

Please don't make this change immediately, but I'm wondering if we
should use selinux-python or python-selinux. All packages that package
Python modules are called python-<foo> in Buildroot.

Is selinux-python somewhat suggested by upstream? Or perhaps it's not
really a set of Python modules, but rather some SELinux programs that
happen to be in Python ?

I'm currently fine with selinux-python, so we can keep it as-is, and
change later (before the release preferably) depending on how the
discussion goes. I certainly don't want to hold merging this just for
this detail.


> diff --git a/package/semodule-utils/Config.in b/package/semodule-utils/Config.in
> new file mode 100644
> index 0000000000..6dc59ba501
> --- /dev/null
> +++ b/package/semodule-utils/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_SEMODULE_UTILS
> +	bool "semodule-utils"
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	depends on BR2_TOOLCHAIN_USES_GLIBC #libselinux

You're not selecting libselinux in this package, and libsepol doesn't
select it. So, why this glibc dependency?

> +	select BR2_PACKAGE_LIBSEPOL
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  semodule-utils is a package that contains tools for handling
> +	  selinux modules.
> +	  
> +	  The package will install the following utilities:
> +  	  * semodule_deps - Show the dependencies between SELinux policy packages.
> +  	  * semodule_expand - Expand a SELinux policy module package.
> +  	  * semodule_link - Link SELinux policy module packages together
> +	  * semodule_package - Create a SELinux policy module package.
> +	  
> +	  https://github.com/SELinuxProject/selinux/wiki/Releases
> +	  
> +comment "semodule-utils needs a toolchain w/ glibc, wchar, threads, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU || \
> +		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_USES_GLIBC

BR2_USE_MMU on a separate line. Why "dynamic library" in the comment?
Why glibc in the dependencies?

> diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
> new file mode 100644
> index 0000000000..18c8217ca6
> --- /dev/null
> +++ b/package/semodule-utils/semodule-utils.hash
> @@ -0,0 +1,2 @@
> +# https://github.com/SELinuxProject/selinux/wiki/Releases
> +sha256 90c98b3362a43b4da2a51a9176820a56f3e615225e23e3395bc566c4490786ba semodule-utils-2.7.tar.gz
> diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
> new file mode 100644
> index 0000000000..2c8923f82e
> --- /dev/null
> +++ b/package/semodule-utils/semodule-utils.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# semodule-utils
> +#
> +################################################################################
> +
> +SEMODULE_UTILS_VERSION = 2.7
> +SEMODULE_UTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
> +SEMODULE_UTILS_LICENSE = GPL-2.0
> +SEMODULE_UTILS_LICENSE_FILES = COPYING
> +SEMODULE_UTILS_DEPENDENCIES = libselinux

Ah, in the end, you need libselinux, but not libsepol. It seems like we
have a consistency issue here, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
