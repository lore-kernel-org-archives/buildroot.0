From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 22:24:18 +0100
Subject: [Buildroot] [PATCH 1/1] netsniff-ng: override NACL_INC_DIR and
 NACL_LIB_DIR to fix broken builds on system where nacl is installed + add
 dependencies on geoip,
 ncurses and zlib so that the entire netsniff-ng toolset can be build
In-Reply-To: <1447854111-5299-1-git-send-email-joris.lijssens@gmail.com>
References: <1447854111-5299-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20151119222418.170af0a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joris,

Thanks for this patch! There are however a few issues with it.

The first issue is that the commit title is way too long. The proper
format for a git commit log is:

====================================================================
<package>: title that is less than 80 chars and summarizes the change

A first paragraph that gives more details about the change. Notice how
it is separated from the title by one new line.

This is another paragraph giving additional details about the changes.

Signed-off-by: John Doe <john.doe@buildroot.org>
====================================================================

Also, you commit title that contains two parts (fixing nacl related
stuff and adding geoip, ncurses, zlib) should hint you that you should
not submit one patch but instead two patches: one for the nacl stuff
and one for the geoip/ncurses/zlib stuff.

On Wed, 18 Nov 2015 14:41:51 +0100, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/netsniff-ng/Config.in      | 3 +++
>  package/netsniff-ng/netsniff-ng.mk | 6 +++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
> index 8c48f39..fe02ea3 100644
> --- a/package/netsniff-ng/Config.in
> +++ b/package/netsniff-ng/Config.in
> @@ -6,6 +6,9 @@ config BR2_PACKAGE_NETSNIFF_NG
>  	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
>  	select BR2_PACKAGE_LIBURCU
>  	select BR2_PACKAGE_LIBNET
> +	select BR2_PACKAGE_GEOIP
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_ZLIB

Why do you make these mandatory? netsniff-ng can build perfectly fine
without them, so there is no reason to turn these optional dependencies
into mandatory dependencies.

>  	# Build with uClibc fails due to missing ceill()
>  	# Build with musl fails due to various header issues
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
> diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
> index 4fed88c..a6dfb61 100644
> --- a/package/netsniff-ng/netsniff-ng.mk
> +++ b/package/netsniff-ng/netsniff-ng.mk
> @@ -8,13 +8,17 @@ NETSNIFF_NG_VERSION = v0.5.9
>  NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
>  NETSNIFF_NG_LICENSE = GPLv2
>  NETSNIFF_NG_LICENSE_FILES = README COPYING
> +NETSNIFF_NG_CONF_ENV = \
> +			NACL_INC_DIR=/dev/null \
> +			NACL_LIB_DIR=/dev/null

Indentation should be just one tab, i.e:

NETSNIFF_NG_CONF_ENV = \
	NACL_INC_DIR=/dev/null \
	NACL_LIB_DIR=/dev/null

And a comment above would be nice, like:

# Prevent netsniff-ng configure script from finding a host installed
# nacl

>  NETSNIFF_NG_DEPENDENCIES = \
>  	libnl libpcap libcli libnetfilter_conntrack \
> -	liburcu libnet
> +	liburcu libnet geoip ncurses zlib

If you make them optional, you can do:

ifeq ($(BR2_PACKAGE_GEOIP),y)
NETSNIFF_NG_DEPENDENCIES += geoip
endif

ifeq ($(BR2_PACKAGE_NCURSES),y)
NETSNIFF_NG_DEPENDENCIES += ncurses
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
NETSNIFF_NG_DEPENDENCIES += zlib
endif

Of course, this is OK if those dependencies are independent from each
other. If you need the three of them for netsniff-ng to provide an
additional feature, then you would have to express the dependency
differently (we can talk about that later if it's the case).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
