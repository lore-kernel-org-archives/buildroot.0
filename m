From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Sep 2014 19:40:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/clamav: New package
In-Reply-To: <1411915333-5976-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411915333-5976-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140930194056.1e1801a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 28 Sep 2014 16:42:12 +0200, Bernd Kuhls wrote:

> diff --git a/package/Config.in b/package/Config.in
> index db06310..26dc69c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -917,6 +917,7 @@ menu "Miscellaneous"
>  	source "package/aespipe/Config.in"
>  	source "package/bc/Config.in"
>  	source "package/collectd/Config.in"
> +	source "package/clamav/Config.in"

Nit: clamav is before collectd by alphabetic ordering.

> diff --git a/package/clamav/Config.in b/package/clamav/Config.in
> new file mode 100644
> index 0000000..9840228
> --- /dev/null
> +++ b/package/clamav/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_CLAMAV
> +	select BR2_PACKAGE_OPENSSL
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # fork()
> +	bool "clamav"

Though it's not a written rule, I generally prefer to have the bool
"pkgname" line as the first line, before the select and dependencies.

> diff --git a/package/clamav/clamav-0002-static_linking.patch b/package/clamav/clamav-0002-static_linking.patch
> new file mode 100644
> index 0000000..71e4590
> --- /dev/null
> +++ b/package/clamav/clamav-0002-static_linking.patch
> @@ -0,0 +1,56 @@
> +Fix detection of statically linked libraries
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Has this patch been sent upstream like the first one?

Also, in the patch file name, I'd prefer to see static-linking.patch
rather than static_linking.patch. We tend to use - more commonly as a
separator in patch file names.


> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> new file mode 100644
> index 0000000..2db8577
> --- /dev/null
> +++ b/package/clamav/clamav.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# clamav
> +#
> +################################################################################
> +
> +CLAMAV_VERSION = 0.98.4
> +CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
> +CLAMAV_LICENSE = GPLv2

I've checked the license and it's indeed GPLv2 only, not GPLv2+.

> +CLAMAV_LICENSE_FILES = COPYING

There are many other COPYING files, for some portion of source code
that ClamAV has imported. Even though the whole result is distributed
under GPLv2, I believe those additional COPYING.* files must be kept,
because some of them are related to BSD licensed software that requires
the copyright holder name to be preserved.

> +CLAMAV_AUTORECONF = YES
> +CLAMAV_DEPENDENCIES = openssl zlib \
> +	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \

Same comment as for the dovecot package: you should have a select
BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE if iconv support is needed
for your package.

> +	$(if $(BR2_NEEDS_GETTEXT),gettext)

See
http://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages
for details about the gettext handling: you need to do some stuff in
your Config.in file.

> +
> +# mmap cannot be detected when cross-compiling, needed for mempool support
> +CLAMAV_CONF_ENV = \
> +	ac_cv_c_mmap_private=yes
> +
> +CLAMAV_CONF_OPT = \
> +	--sysconfdir=/etc \
> +	--with-dbdir=/var/lib/clamav \
> +	--with-openssl=$(STAGING_DIR)/usr \
> +	--with-zlib=$(STAGING_DIR)/usr \

Are OpenSSL and Zlib mandatory or optional?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
