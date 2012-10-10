From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Oct 2012 16:03:55 +0200
Subject: [Buildroot] [PATCH v3] p7zip-light: new package
In-Reply-To: <1344840128-29740-1-git-send-email-net147@gmail.com> (Jonathan
 Liu's message of "Mon, 13 Aug 2012 16:42:08 +1000")
References: <1344840128-29740-1-git-send-email-net147@gmail.com>
Message-ID: <87pq4q77as.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jonathan" == Jonathan Liu <net147@gmail.com> writes:

 Jonathan> Signed-off-by: Jonathan Liu <net147@gmail.com>

Hi, sorry for the slow response, see below for comments.

 Jonathan> +++ b/package/Config.in
 Jonathan> @@ -13,6 +13,7 @@ source "package/gzip/Config.in"
 Jonathan>  endif
 Jonathan>  source "package/lzop/Config.in"
 Jonathan>  source "package/lzma/Config.in"
 Jonathan> +source "package/p7zip-light/Config.in"

Perhaps we should just call it p7zip like upstream, then there's no
problem if somebody wants to add an option for rar support in the
future.

 Jonathan>  source "package/xz/Config.in"
 Jonathan>  endmenu
 
 Jonathan> diff --git a/package/p7zip-light/Config.in b/package/p7zip-light/Config.in
 Jonathan> new file mode 100644
 Jonathan> index 0000000..9aaec23
 Jonathan> --- /dev/null
 Jonathan> +++ b/package/p7zip-light/Config.in
 Jonathan> @@ -0,0 +1,26 @@
 Jonathan> +config BR2_PACKAGE_P7ZIP_LIGHT
 Jonathan> +	bool "p7zip-light"
 Jonathan> +	help
 Jonathan> +	  Command-line version of the 7-Zip compressed file archiver
 Jonathan> +	  without RAR and GUI support.
 Jonathan> +
 Jonathan> +	  http://p7zip.sourceforge.net/

From the looks of the rar patch, it seems to be implemented in C++, so
you need to depend on BR2_INSTALL_LIBSTDCPP and add a comment if not
available (see iperf package for an example).

 Jonathan> +
 Jonathan> +if BR2_PACKAGE_P7ZIP_LIGHT
 Jonathan> +
 Jonathan> +config BR2_PACKAGE_P7ZIP_LIGHT_SFX
 Jonathan> +	bool "SFX support"
 Jonathan> +	help
 Jonathan> +	  Enable support for creating self-extracting archives.

Does that work on all the architectures we support in Buildroot?

 Jonathan> diff --git a/package/p7zip-light/p7zip-light-disable-rar.patch b/package/p7zip-light/p7zip-light-disable-rar.patch
 Jonathan> new file mode 100644
 Jonathan> index 0000000..d605c6b
 Jonathan> --- /dev/null
 Jonathan> +++ b/package/p7zip-light/p7zip-light-disable-rar.patch
 Jonathan> @@ -0,0 +1,112 @@
 Jonathan> +Disable RAR support
 Jonathan> +

 Jonathan> +The RAR support is non-free and licensed under the unRAR restriction.
 Jonathan> +As this support is usually not neeeded, disable it to reduce footprint
 Jonathan> +and simplify licensing.

Any plans for making this a build option and sending it upstream?

 Jonathan> diff --git a/package/p7zip-light/p7zip-light-exclude-docs.patch b/package/p7zip-light/p7zip-light-exclude-docs.patch
 Jonathan> new file mode 100644
 Jonathan> index 0000000..f01f114
 Jonathan> --- /dev/null
 Jonathan> +++ b/package/p7zip-light/p7zip-light-exclude-docs.patch
 Jonathan> @@ -0,0 +1,30 @@
 Jonathan> +Do not install documentation
 Jonathan> +
 Jonathan> +The install script installs documentation files which are not needed.
 Jonathan> +Exclude them to reduce footprint.

Why is this needed? We have BR2_HAVE_DOCUMENTATION to select if
documentation should be included or not (and automatically remove it in
the target-finalize step).

 Jonathan> diff --git a/package/p7zip-light/p7zip-light-makefile-flags.patch b/package/p7zip-light/p7zip-light-makefile-flags.patch
 Jonathan> new file mode 100644
 Jonathan> index 0000000..0babe95
 Jonathan> --- /dev/null
 Jonathan> +++ b/package/p7zip-light/p7zip-light-makefile-flags.patch
 Jonathan> @@ -0,0 +1,80 @@
 Jonathan> +Allow CC/CFLAGS/CXX/CXXFLAGS overrides
 Jonathan> +
 Jonathan> +The makefiles currently use hardcoded values for the compiler and
 Jonathan> +compiler flags. This patch removes flags that not essential or are
 Jonathan> +already added by buildroot and then modifies the makefiles to
 Jonathan> +to allow specifying custom compiler and compiler flags.
 Jonathan> +

Has this been sent upstream?

 Jonathan> @@ -0,0 +1,31 @@
 Jonathan> +#############################################################
 Jonathan> +#
 Jonathan> +# p7zip-light
 Jonathan> +#
 Jonathan> +#############################################################
 Jonathan> +P7ZIP_LIGHT_VERSION = 9.20.1
 Jonathan> +P7ZIP_LIGHT_SOURCE = p7zip_$(P7ZIP_LIGHT_VERSION)_src_all.tar.bz2
 Jonathan> +P7ZIP_LIGHT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/p7zip

BR2_SOURCEFORGE_MIRROR is gone since cdfebcfca60 (Remove
BR2_SOURCEFORGE_MIRROR variable). Please change it to use
downloads.sourceforge.net.


 Jonathan> +P7ZIP_LIGHT_LICENSE = LGPLv2.1+
 Jonathan> +
 Jonathan> +define P7ZIP_LIGHT_BUILD_CMDS
 Jonathan> +	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 Jonathan> +		CXX="$(TARGET_CXX)" CXXFLAGS="$(TARGET_CXXFLAGS)" \

You forgot LDFLAGS. It probably makes more sense to use
TARGET_CONFIGURE_OPTS instead of this implicit list.

Thanks.

-- 
Bye, Peter Korsgaard
