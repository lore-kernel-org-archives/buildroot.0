From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Nov 2015 01:04:12 +0100
Subject: [Buildroot] [PATCH 2/2] netsniff-ng:new package
In-Reply-To: <1447059812-26424-2-git-send-email-joris.lijssens@gmail.com>
References: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
 <1447059812-26424-2-git-send-email-joris.lijssens@gmail.com>
Message-ID: <564285FC.4050903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Joris,

On 09-11-15 10:03, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/Config.in                  |  1 +
>  package/netsniff-ng/Config.in      | 22 ++++++++++++++++++++++
>  package/netsniff-ng/netsniff-ng.mk | 30 ++++++++++++++++++++++++++++++

 Same comment about the .hash file.

>  3 files changed, 53 insertions(+)
>  create mode 100644 package/netsniff-ng/Config.in
>  create mode 100644 package/netsniff-ng/netsniff-ng.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e0b42c0..0a80afb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -88,6 +88,7 @@ endif
>  	source "package/mcelog/Config.in"
>  	source "package/memstat/Config.in"
>  	source "package/netperf/Config.in"
> +	source "package/netsniff-ng/Config.in"
>  	source "package/oprofile/Config.in"
>  	source "package/pax-utils/Config.in"
>  	source "package/pv/Config.in"
> diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
> new file mode 100644
> index 0000000..448e853
> --- /dev/null
> +++ b/package/netsniff-ng/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_NETSNIFF_NG
> +	bool "netsniff-ng"
> +	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_LIBPCAP
> +	select BR2_PACKAGE_LIBCLI
> +	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
> +	select BR2_PACKAGE_LIBURCU

 You also have to take along the arch dependencies of liburcu:

	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc ||
BR2_x86_64

 But actually, all of these dependencies are optional, i.e. the corresponding
features will be disabled but the package still builds fine. In that case, we
handle it purely in the .mk file, see below.

> +	select BR2_PACKAGE_LIBNET
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

 Where does this dependency come from? Mention it in a comment here and/or in
the commit log.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS

 Note to other reviewers: this package unconditionally uses threads so it's not
an inherited dependency.

> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu
> +	help
> +	  netsniff-ng is a free, performant Linux network analyzer and
> +	  networking toolkit. If you will, the Swiss army knife for
> +	  network packets.
> +
> +comment "netsniff-ng needs an (e)glibc toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854

 Arch dependencies have to be repeated here.

> +
> +comment "netsniff-ng needs a toolchain not affected by GCC bug 58854"
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
> diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
> new file mode 100644
> index 0000000..6f755a1
> --- /dev/null
> +++ b/package/netsniff-ng/netsniff-ng.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# netsniff-ng
> +#
> +################################################################################
> +
> +NETSNIFF_NG_VERSION = v0.5.9
> +NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
> +NETSNIFF_NG_LICENSE = GPLv2

 I double-checked that this really is the case. Many source files don't have a
license header, but the ones that do are really v2-only.

> +NETSNIFF_NG_LICENSE_FILES = README

 Should be COPYING

 host-pkgconf is a dependency. You should also add all the selects from
Config.in as _DEPENDENCIES here. But as I said, they're not obligatory
dependencies. So this should be the dependency list:

NETSNIFF_NG_DEPENDENCIES = host-pkgconf

ifeq ($(BR2_PACKAGE_LIBNL),y)
NETSNIFF_NG_DEPENDENCIES += libnl
endif

 There is also an optional dependency on ncurses, geoip, zlib.

 Also host-flex and host-bison are optional dependencies. For these, we don't
have a good way to deal with them, so I propose to add them unconditionally.
Mention that in the commit log and/or a comment.

> +
> +define NETSNIFF_NG_CONFIGURE_CMDS
> +		(cd $(@D); \

 One tab too many here.

> +		$(TARGET_CONFIGURE_ARGS) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		./configure \
> +		--prefix=$(TARGET_DIR)/usr \
> +	)

 The brackets around it are not needed in fact.

 Unfortunately, this manually written configure script has some deficiencies. It
will look for nacl in /usr/include/nacl, so if it happens to be installed there,
we'll get a wrong build. This can be fixed by adding NACL_INC_DIR=/dev/null and
NACL_LIB_DIR=/dev/null to NETSNIFF_NG_CONF_ENV (and adding that to the _CMDS of
course).

 I've marked both patches as 'Changes requested' in patchwork, so we will forget
about them unless you send a new version.

 Regards,
 Arnout


> +endef
> +
> +define NETSNIFF_NG_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +define NETSNIFF_NG_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install -C $(@D)
> +endef
> +
> +$(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
