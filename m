From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Mar 2019 20:06:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: Allow to build
 with uclibc but w/o mausezahn
In-Reply-To: <20190304085741.13782-1-vadim4j@gmail.com>
References: <20190304085741.13782-1-vadim4j@gmail.com>
Message-ID: <899f39cb-501b-ef06-7884-5d4f4ef7909a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vadim,

On 04/03/2019 09:57, Vadim Kochan wrote:
> mausezahn can't be build with uclibc because uclibc
> does not provide ceill() function, so it does not allow
> to build all netsniff-ng's tools with uclibc.
> 
> Fix it by moving mausezahn under separate config option,
> which has own dependencies and packages selection (libnet & libcli).
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/netsniff-ng/Config.in      | 27 +++++++++++++++++++--------
>  package/netsniff-ng/netsniff-ng.mk | 16 +++++++++++-----
>  2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
> index c4803b2fa2..15862ff433 100644
> --- a/package/netsniff-ng/Config.in
> +++ b/package/netsniff-ng/Config.in
> @@ -1,16 +1,12 @@
> -config BR2_PACKAGE_NETSNIFF_NG
> +menuconfig BR2_PACKAGE_NETSNIFF_NG
>  	bool "netsniff-ng"
> -	# Build with uClibc fails due to missing ceill()
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>  	select BR2_PACKAGE_LIBNL
>  	select BR2_PACKAGE_LIBPCAP
> -	select BR2_PACKAGE_LIBCLI
>  	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
>  	select BR2_PACKAGE_LIBURCU
> -	select BR2_PACKAGE_LIBNET
>  	help
>  	  netsniff-ng is a free, performant Linux network analyzer and
>  	  networking toolkit. If you will, the Swiss army knife for
> @@ -18,7 +14,22 @@ config BR2_PACKAGE_NETSNIFF_NG
>  
>  	  http://netsniff-ng.org
>  
> -comment "netsniff-ng needs a glibc or musl toolchain w/ threads, headers >= 3.0"
> +if BR2_PACKAGE_NETSNIFF_NG
> +
> +config BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN
> +	bool "mausezahn"

 Is it worth to add a separate config for this? I.e., does it give significant
saving in either binary size (including libcli and libnet dependencies) or
runtime performance?

 If not, we prefer to handle it "automatically" in the .mk file only. In other
words, keep the libcli and libnet selects above but make them conditional on
!uclibc, and change the .mk file as indicated below...

> +	default y
> +	# Build with uClibc fails due to missing ceill()
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> +	select BR2_PACKAGE_LIBCLI
> +	select BR2_PACKAGE_LIBNET
> +
> +comment "mausezahn needs glibc or musl toolchain"
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC
> +
> +endif
> +
> +comment "netsniff-ng needs a toolchain w/ threads, headers >= 3.0"
>  	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC \
> -		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS  || \
> +			!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
> index 77d8921425..9fe50f10d3 100644
> --- a/package/netsniff-ng/netsniff-ng.mk
> +++ b/package/netsniff-ng/netsniff-ng.mk
> @@ -13,9 +13,14 @@ NETSNIFF_NG_LICENSE_FILES = README COPYING
>  NETSNIFF_NG_CONF_ENV = \
>  	NACL_INC_DIR=/dev/null \
>  	NACL_LIB_DIR=/dev/null
> -NETSNIFF_NG_DEPENDENCIES = \
> -	libnl libpcap libcli libnetfilter_conntrack \
> -	liburcu libnet
> +NETSNIFF_NG_DEPENDENCIES = libnl libpcap libnetfilter_conntrack liburcu
> +
> +NETSNIFF_NG_TOOLS = netsniff-ng trafgen astraceroute flowtop ifpps bpfc curvetun
> +
> +ifeq ($(BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN),y)

 ... make this condition

ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),)

(and move the comment from Config.in to here).

> +NETSNIFF_NG_DEPENDENCIES += libcli libnet
> +NETSNIFF_NG_TOOLS += mausezahn
> +endif
>  
>  ifeq ($(BR2_PACKAGE_GEOIP),y)
>  NETSNIFF_NG_DEPENDENCIES += geoip
> @@ -41,12 +46,13 @@ define NETSNIFF_NG_CONFIGURE_CMDS
>  endef
>  
>  define NETSNIFF_NG_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(NETSNIFF_NG_TOOLS)
>  endef
>  
>  define NETSNIFF_NG_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install -C $(@D)
> +		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install \
> +			-C $(@D) $(NETSNIFF_NG_TOOLS)

 I don't like very much that we have to enumerate the tools in the .mk file, but
I don't see any other possibility.

 Regards,
 Arnout

>  endef
>  
>  $(eval $(generic-package))
> 
