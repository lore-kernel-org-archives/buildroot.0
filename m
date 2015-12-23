From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 09:52:52 +0100
Subject: [Buildroot] [PATCH] nwipe: new package
In-Reply-To: <1450824959-21100-1-git-send-email-yann.morin.1998@free.fr>
References: <1450824959-21100-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151223095252.40b32e45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Thanks for respining this patch. See below for some comments.

On Tue, 22 Dec 2015 23:55:59 +0100, Yann E. MORIN wrote:

> diff --git a/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch b/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch
> new file mode 100644
> index 0000000..1d04084
> --- /dev/null
> +++ b/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch
> @@ -0,0 +1,45 @@
> +From 7e0773c4738362f030f431a35b4e13cc2b4f36be Mon Sep 17 00:00:00 2001
> +From: Charles Duffy <charles@dyfis.net>
> +Date: Wed, 14 Oct 2015 16:24:01 -0500
> +Subject: [PATCH 2/2] Add libintl, libuuid dependencies to allow parted static
> + link (#12)
> +
> +libparted requires libuuid; both require libintl. Static builds currently fail
> +with link errors due to these missing dependencies.
> +
> +https://github.com/martijnvanbrummelen/nwipe/pull/13
> +
> +Signed-off-by: Charles Duffy <chaduffy@cisco.com>
> +---
> + configure.ac    | 4 +++-
> + src/Makefile.am | 2 ++
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 375c775..78f6624 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -42,7 +42,9 @@ PKG_CHECK_MODULES(
> + 	)]
> + )
> + 
> +-AC_CHECK_LIB([parted], [ped_device_probe_all], ,[AC_MSG_ERROR([parted development library not found])])
> ++AC_CHECK_LIB([intl], [libintl_dgettext]) # needed to statically link libparted, but not given in its pkgconfig file
> ++AC_CHECK_LIB([uuid], [uuid_generate])    # needed to statically link libparted, but not given in its pkgconfig file

This really seems like a workaround for something that should instead
be fixed in the parted .pc file, no? If this .pc file lacks a reference
to libintl and libuuid, then parted .pc file should be fixed.

> diff --git a/package/nwipe/Config.in b/package/nwipe/Config.in
> new file mode 100644
> index 0000000..a4b8f4a
> --- /dev/null
> +++ b/package/nwipe/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_NWIPE
> +	bool "nwipe"
> +	depends on BR2_USE_WCHAR # parted
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_PARTED
> +	help
> +	  nwipe thoroughly overwrites block devices, forked from a component at
> +	  the core of the venerable DBAN.
> +	
> +	  https://github.com/martijnvanbrummelen/nwipe
> +
> +comment "nwipe needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR

Missing comment on threads.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
