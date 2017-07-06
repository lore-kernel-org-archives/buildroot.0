From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:16:12 +0200
Subject: [Buildroot] [PATCH 1/1] capnproto: new package
In-Reply-To: <201707061544.v66FiZQQ020306@mx1.sonologic.net>
References: <201707061544.v66FiZQQ020306@mx1.sonologic.net>
Message-ID: <20170706211612.5c4bf11c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Jul 2017 17:40:01 +0200, Koen Martens wrote:
> Cap'n Proto is an insanely fast data interchange format
> and capability-based RPC system. Think JSON, except
> binary. Or think Protocol Buffers, except faster. In
> fact, in benchmarks, Cap?n Proto is INFINITY TIMES
> faster than Protocol Buffers.
> 
> https://capnproto.org/index.html
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>

Thanks for this contribution, the patch looks mostly good. Only a few
comments below.

> diff --git a/package/capnproto/0001-execinfo.patch b/package/capnproto/0001-execinfo.patch
> new file mode 100644
> index 0000000..85ef716
> --- /dev/null
> +++ b/package/capnproto/0001-execinfo.patch
> @@ -0,0 +1,85 @@
> +Capnproto assumes that if __GLIBC__ is defined then
> +execinfo.h is available. uClibc does not implement
> +execinfo.h, but does define __GLIBC__ in features.h
> +(documented as an acceptable lie).
> +
> +We add an explicit check for existence of execinfo.h
> +to configure and use HAVE_EXECINFO_H in the code
> +that includes execinfo.h
> +
> +A more permanent patch has been submitted upstream
> +as a pull-request.
> +
> +https://github.com/capnproto/capnproto/pull/511
> +
> +Signed-off-by: Koen Martens <gmc@sonologic.nl>

Since upstream uses Git, we prefer to have a Git-formatted patch, i.e
generated with "git format-patch -N". It should also have a proper
commit title, i.e a single line at the beginning that summarizes the
commit, separated from the rest of the commit log by one empty line.

> +
> +diff -Naur a/config.h.in b/config.h.in
> +--- a/config.h.in	2017-06-08 20:03:58.000000000 +0200
> ++++ b/config.h.in	2017-07-06 12:26:45.559406000 +0200

> +diff -Naur a/configure b/configure
> +--- a/configure	2017-06-08 20:03:58.000000000 +0200
> ++++ b/configure	2017-07-06 12:26:45.559406000 +0200

Please keep only the modifications on configure.ac and exception.c++,
and enable CAPNPROTO_AUTORECONF = YES. This will re-generate the
configure script.

> diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
> new file mode 100644
> index 0000000..d25ccf7
> --- /dev/null
> +++ b/package/capnproto/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_CAPNPROTO
> +	bool "capnproto"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	help
> +	  Cap'n Proto is an insanely fast data interchange format
> +	  and capability-based RPC system. Think JSON, except
> +	  binary. Or think Protocol Buffers, except faster. In
> +	  fact, in benchmarks, Cap?n Proto is INFINITY TIMES
> +	  faster than Protocol Buffers.
> +
> +	  https://capnproto.org/index.html
> +
> +comment "capnproto needs host and target gcc >= 4.8"
> +	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
> diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
> new file mode 100644
> index 0000000..510a3b2
> --- /dev/null
> +++ b/package/capnproto/capnproto.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# capnproto
> +#
> +################################################################################
> +
> +CAPNPROTO_VERSION = 0.6.1
> +CAPNPROTO_SOURCE = capnproto-c++-$(CAPNPROTO_VERSION).tar.gz
> +CAPNPROTO_SITE = https://capnproto.org
> +CAPNPROTO_LICENSE = MIT
> +CAPNPROTO_LICENSE_FILES = LICENSE.txt
> +CAPNPROTO_INSTALL_STAGING = YES
> +CAPNPROTO_CONF_OPTS = --with-external-capnp
> +CAPNPROTO_DEPENDENCIES = host-capnproto

Could you give some details as to why the host capnproto is necessary
to build the target capnproto ?

Also, you forgot the hash file for this package.

If possible, make sure to run your new package through
utils/check-package and utils/test-pkg.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
