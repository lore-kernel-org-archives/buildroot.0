From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 31 Mar 2018 15:56:30 +0200
Subject: [Buildroot] [PATCH v3] snort: new package
In-Reply-To: <1515868839-25930-1-git-send-email-sergio.prado@e-labworks.com>
References: <1515868839-25930-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <697c7a58-b824-6eac-74ca-dc73eff9cb79@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergio,

Le 13/01/2018 ? 19:40, Sergio Prado a ?crit?:
> Tested on Beaglebone Black.
> 
> Build-tested with test-pkg.
> 
> Patch to fix cross-compilation errors submitted upstream [1].
> 
> [1] https://lists.snort.org/pipermail/snort-devel/2018-January/011025.html

Do you have any feed-back ?

> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
> Changes v2 -> v3
>   - using AC_CACHE_CHECK() in configure.in to preseed the variable value
>   from the environment and avoid the AC_TRY_RUN() when cross compiling (as
>   suggested by Thomas Petazzoni)
>   - since now daq has an optional dependency on libdnet, snort must depend
>   on it.
> 
> Changes v1 -> v2 (as reviewed by Thomas Petazzoni):
>   - patching configure.in instead of configure
>   - using STAGING_DIR to pass libpcap headers location to configure
> ---
>  DEVELOPERS                                         |   1 +
>  package/Config.in                                  |   1 +
>  .../snort/0001-Fix-cross-compilation-errors.patch  | 267 +++++++++++++++++++++
>  package/snort/Config.in                            |  25 ++
>  package/snort/snort.hash                           |   6 +
>  package/snort/snort.mk                             |  45 ++++
>  6 files changed, 345 insertions(+)
>  create mode 100644 package/snort/0001-Fix-cross-compilation-errors.patch
>  create mode 100644 package/snort/Config.in
>  create mode 100644 package/snort/snort.hash
>  create mode 100644 package/snort/snort.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 2f7d051e8a98..0c744a94b03c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1588,6 +1588,7 @@ F:	package/daq/
>  F:	package/libgdiplus/
>  F:	package/mongodb/
>  F:	package/pimd/
> +F:	package/snort/
>  F:	package/stella/
>  F:	package/traceroute/
>  F:	package/tunctl/
> diff --git a/package/Config.in b/package/Config.in
> index 01f4095be5aa..ee3377918e66 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1800,6 +1800,7 @@ endif
>  	source "package/shellinabox/Config.in"
>  	source "package/smcroute/Config.in"
>  	source "package/sngrep/Config.in"
> +	source "package/snort/Config.in"
>  	source "package/socat/Config.in"
>  	source "package/socketcand/Config.in"
>  	source "package/softether/Config.in"
> diff --git a/package/snort/0001-Fix-cross-compilation-errors.patch b/package/snort/0001-Fix-cross-compilation-errors.patch
> new file mode 100644
> index 000000000000..799c0182961b
> --- /dev/null
> +++ b/package/snort/0001-Fix-cross-compilation-errors.patch
> @@ -0,0 +1,267 @@
> +From f95f7f02a1646a91e9f3fadf4de2c264c65782f2 Mon Sep 17 00:00:00 2001
> +From: Sergio Prado <sergio.prado@e-labworks.com>
> +Date: Sat, 13 Jan 2018 11:07:41 -0200
> +Subject: [PATCH] Fix cross compilation errors
> +
> +Prevent configure script from trying to run programs in a cross
> +compilation environment.
> +
> +Also prevent usage of unsafe libpcap header path when cross compiling.
> +
> +Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> +---
> + configure.in | 58 ++++++++++++++++++++++++++++++----------------------------
> + 1 file changed, 30 insertions(+), 28 deletions(-)
> +

The build system looks very fragile for cross-compiling, we may expect some
failures in autobuilder. Hopefully you already caught most of issues with test-pkg.

[...]

> diff --git a/package/snort/Config.in b/package/snort/Config.in
> new file mode 100644
> index 000000000000..d1a59d505004
> --- /dev/null
> +++ b/package/snort/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_SNORT
> +	bool "snort"
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_USE_MMU # fork()
> +	depends on !BR2_STATIC_LIBS # daq
> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
> +	select BR2_PACKAGE_LIBPCAP
> +	select BR2_PACKAGE_DAQ
> +	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	help
> +	  Snort is a free and open source network intrusion
> +	  prevention system (IPS) and network intrusion detection
> +	  system (IDS). It can perform protocol analysis, content
> +	  searching/matching, and can be used to detect a variety
> +	  of attacks and probes, such as buffer overflows, stealth
> +	  port scans, CGI attacks, SMB probes, OS fingerprinting
> +	  attempts, and much more.
> +
> +	  https://www.snort.org
> +
> +comment "snort needs a toolchain w/ wchar, threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
> +		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
> diff --git a/package/snort/snort.hash b/package/snort/snort.hash
> new file mode 100644
> index 000000000000..211e862b7fc0
> --- /dev/null
> +++ b/package/snort/snort.hash
> @@ -0,0 +1,6 @@
> +# Locally computed:
> +sha256 9f6b3aeac5a109f55504bd370564ac431cb1773507929dc461626898f33f46cd  snort-2.9.11.1.tar.gz
> +
> +# Hash for license files:
> +sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
> +sha256 3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
> diff --git a/package/snort/snort.mk b/package/snort/snort.mk
> new file mode 100644
> index 000000000000..3b79c325fbe7
> --- /dev/null
> +++ b/package/snort/snort.mk
> @@ -0,0 +1,45 @@
> +################################################################################
> +#
> +# snort
> +#
> +################################################################################
> +
> +SNORT_VERSION = 2.9.11.1
> +SNORT_SOURCE = snort-$(SNORT_VERSION).tar.gz

This is the default value, you can check with check-package script

$ ./utils/check-package package/snort/*
package/snort/snort.mk:8: remove default value of _SOURCE variable
(http://nightly.buildroot.org/#generic-package-reference)
343 lines processed
1 warnings generated

> +SNORT_SITE = https://www.snort.org/downloads/snort
> +SNORT_LICENSE = GPL-2.0
> +SNORT_LICENSE_FILES = LICENSE COPYING
> +
> +SNORT_DEPENDENCIES = libpcap libdnet daq pcre
> +
> +# patching configure.in
> +SNORT_AUTORECONF = YES
> +
> +SNORT_CONF_OPTS = \
> +	--with-libpcap-includes=$(STAGING_DIR)/usr/include/pcap \
> +	--disable-static-daq
> +
> +ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> +SNORT_DEPENDENCIES += libtirpc host-pkgconf

PKG_CHECK_MODULES is used in configure.in, so host-pkgconf must be listed in
SNORT_DEPENDENCIES unconditionally.

Best regards,
Romain

> +SNORT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
> +SNORT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
> +endif
> +
> +SNORT_CONF_ENV = \
> +	CFLAGS="$(TARGET_CFLAGS) $(SNORT_CFLAGS)" \
> +	LIBS="$(SNORT_LIBS)" \
> +	have_inaddr_none=yes \
> +	have_pcap_lex_destroy=yes \
> +	have_daq_real_addresses=no \
> +	have_daq_address_space_id=yes \
> +	have_daq_flow_id=yes \
> +	have_daq_ext_modflow=no \
> +	have_daq_queryflow=no \
> +	have_daq_data_channel_flags=no \
> +	have_daq_data_channel_separate_ip_versions=no \
> +	have_daq_verdict_retry=yes \
> +	have_daq_packet_trace=no \
> +	have_daq_verdict_reason=no \
> +	sparcv9=no
> +
> +$(eval $(autotools-package))
> 
