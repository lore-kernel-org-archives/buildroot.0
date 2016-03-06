From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 22:19:34 +0100
Subject: [Buildroot] [PATCH 1/1] raptor: new package
In-Reply-To: <1456200457-47727-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1456200457-47727-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160306221934.3cb30a79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt,

Thanks for this contribution. However, after review/testing, I have a
number of comments, see below.

On Mon, 22 Feb 2016 22:07:37 -0600, Matt Weber wrote:

> diff --git a/package/raptor/Config.in b/package/raptor/Config.in
> new file mode 100644
> index 0000000..61bc49b
> --- /dev/null
> +++ b/package/raptor/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_RAPTOR
> +	bool "raptor"
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LIBCURL

libcurl is not a mandatory dependency.

> +	select BR2_PACKAGE_LIBXSLT
> +	select BR2_PACKAGE_YAJL

neither is yajl.

> +RAPTOR_VERSION = 2.0.15
> +RAPTOR_SOURCE = raptor2-$(RAPTOR_VERSION).tar.gz
> +RAPTOR_SITE = http://download.librdf.org/source
> +RAPTOR_DEPENDENCIES = libxml2 libcurl libxslt yajl

See above. Only libxml2 and libxslt are mandatory. libcurl and yajl are
optional. In addition, with your package, the detection of yajl doesn't
work with the following configuration to due a missing -lm
flag at link time:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_RAPTOR=y
# BR2_TARGET_ROOTFS_TAR is not set

Note that the package doesn't fail to build (because yajl is not a
mandatory dependency), but yajl is not used.

> +RAPTOR_LICENSE = GPLv2.1 LGPLv2.1 Apache-2.0

This is not correct. First GPLv2.1 doesn't exist. Second, you are
missing an "or" between those license. And finally, they have used the
"or later" for all licenses. This is all written in the LICENSE.txt
file you reference below. So a correct license information would
probably look like:

RAPTOR_LICENSE = GPLv2+ or LGPLv2.1+ or Apache-2.0+

It is also worth nothing that there are some scary things in the
configure.in script, such as:

if test -d /usr/include/inn; then
  CPPFLAGS="$CPPFLAGS -I/usr/include/inn"
fi

So, if /usr/include/inn exists on your build machine, it will conclude
that libinn is available.

The configure script also detects the availability of icu, so you
probably want to add an optional dependency on it.

Could you rework your patch to take those comments into account?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
