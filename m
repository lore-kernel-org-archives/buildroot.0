From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 21:48:53 +0200
Subject: [Buildroot] [PATCH v3 10/16] libcgroup: new package
In-Reply-To: <1380137571-688-11-git-send-email-clshotwe@rockwellcollins.com>
References: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
 <1380137571-688-11-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20131001214853.62a871b3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On this one, we're almost ready to go. A few comments below.

On Wed, 25 Sep 2013 14:32:45 -0500, Clayton Shotwell wrote:

> diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
> new file mode 100644
> index 0000000..17d2db2
> --- /dev/null
> +++ b/package/libcgroup/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_LIBCGROUP
> +	bool "libcgroup"
> +	help
> +	  libcgroup is a library that abstracts the control group file system in Linux. 

I believe this line is slightly too long. Also, the upstream URL is
missing. It should probably be:

	  http://libcg.sourceforge.net/

> diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
> new file mode 100644
> index 0000000..06f1e60
> --- /dev/null
> +++ b/package/libcgroup/libcgroup.mk
> @@ -0,0 +1,38 @@
> +################################################################################
> +#
> +# libcgroup
> +#
> +################################################################################
> +
> +LIBCGROUP_VERSION = 0.38
> +LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
> +LIBCGROUP_SITE = http://sourceforge.net/projects/libcg/files/latest/download
> +LIBCGROUP_LICENSE = LGPLv2.1
> +LIBCGROUP_LICENSE_FILES = COPYING
> +
> +LIBCGROUP_INSTALL_STAGING = YES
> +
> +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h 
> +# large file support. See https://bugzilla.redhat.com/show_bug.cgi?id=574992 
> +# for more information.
> +LIBCGROUP_CONF_ENV = \
> +	CXXFLAGS+="-U_FILE_OFFSET_BITS" \
> +	CFLAGS+="-U_FILE_OFFSET_BITS"
> +
> +LIBCGROUP_CONF_OPT = \
> +	--disable-tools \
> +	--disable-daemon \
> +	--disable-initscript-install
> +
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +	LIBCGROUP_CONF_OPT += --enable-static --disable-shared
> +endif

This part is not needed, as it is passed by the autotools
infrastructure already.

Maybe you want to resend just this patch with those fixes, so we can
get it merged quickly, independently of the other SELinux changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
