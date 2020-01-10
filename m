From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 10 Jan 2020 09:00:43 -0600
Subject: [Buildroot] [PATCH 1/2] libmodescurity: new package
In-Reply-To: <20200110140017.15045-1-frank.vanbever@essensium.com>
References: <20200110140017.15045-1-frank.vanbever@essensium.com>
Message-ID: <CANQCQpaLYggZnsn12j4KoUEkR-WCPKHca7MQBcsTFdkwHMxt+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank,


On Fri, Jan 10, 2020 at 8:01 AM Frank Vanbever
<frank.vanbever@essensium.com> wrote:
>
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> ---
>  DEVELOPERS                                    |  3 +
>  package/Config.in                             |  1 +
>  ...-CANONICAL_HOST-cannot-be-determined.patch | 31 ++++++++++
>  ...test-for-uClinux-in-configure-script.patch | 28 +++++++++
>  package/libmodsecurity/Config.in              | 14 +++++
>  package/libmodsecurity/libmodsecurity.hash    |  4 ++
>  package/libmodsecurity/libmodsecurity.mk      | 59 +++++++++++++++++++
>  7 files changed, 140 insertions(+)
>  create mode 100644 package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
>  create mode 100644 package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch
>  create mode 100644 package/libmodsecurity/Config.in
>  create mode 100644 package/libmodsecurity/libmodsecurity.hash
>  create mode 100644 package/libmodsecurity/libmodsecurity.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 80843dd1a1..534f4d746c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -955,6 +955,9 @@ F:  package/ucl/
>  F:     package/upx/
>  F:     package/zxing-cpp/
>
> +N:     Frank Vanbever <frank.vanbever@essensium.com>
> +F:     package/libmodsecurity/
> +
>  N:     Ga?l Portay <gael.portay@collabora.com>
>  F:     package/qt5/qt5virtualkeyboard/
>  F:     package/qt5/qt5webengine/
> diff --git a/package/Config.in b/package/Config.in
> index 873a592d64..190cc4217c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2032,6 +2032,7 @@ menu "Networking applications"
>         source "package/leafnode2/Config.in"
>         source "package/lft/Config.in"
>         source "package/lftp/Config.in"
> +       source "package/libmodsecurity/Config.in"
>         source "package/lighttpd/Config.in"
>         source "package/linknx/Config.in"
>         source "package/links/Config.in"
> diff --git a/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch b/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
> new file mode 100644
> index 0000000000..d725d136ff
> --- /dev/null
> +++ b/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
> @@ -0,0 +1,31 @@
> +From 0832208360aab69fbaec76225db67801840a33fe Mon Sep 17 00:00:00 2001
> +From: Frank Vanbever <frank.vanbever@essensium.com>
> +Date: Fri, 10 Jan 2020 11:14:43 +0100
> +Subject: [PATCH] Fail when CANONICAL_HOST cannot be determined
> +
> +When the CANONICAL_HOST is unknown the configure script exits
> +with exit code 0 even though no makefile was produced.
> +
> +patch was submitted upstream: https://github.com/SpiderLabs/ModSecurity/pull/2235
> +
> +Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 95e48843..5e6971f4 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -193,7 +193,7 @@ case $host in
> +     ;;
> +        *)
> +     echo "Unknown CANONICAL_HOST $host"
> +-    exit
> ++    exit 1
> +     ;;
> + esac
> +
> +--
> +2.20.1
> +
> diff --git a/package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch b/package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch
> new file mode 100644
> index 0000000000..73022f31f2
> --- /dev/null
> +++ b/package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch
> @@ -0,0 +1,28 @@
> +From 13c505e30474c919ed9ae552e459769c456da21e Mon Sep 17 00:00:00 2001
> +From: Frank Vanbever <frank.vanbever@essensium.com>
> +Date: Fri, 10 Jan 2020 11:24:43 +0100
> +Subject: [PATCH] test for uClinux in configure script
> +
> +patch was submitted upstream: https://github.com/SpiderLabs/ModSecurity/pull/2235
> +
> +Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5e6971f4..51d38071 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -156,7 +156,7 @@ case $host in
> +     AC_DEFINE([MACOSX], [1], [Define if the operating system is Macintosh OSX])
> +     PLATFORM="MacOSX"
> +     ;;
> +-  *-*-linux*)
> ++  *-*-linux* | *-*uclinux*)
> +     echo "Checking platform... Identified as Linux"
> +     AC_DEFINE([LINUX], [1], [Define if the operating system is LINUX])
> +     PLATFORM="Linux"
> +--
> +2.20.1
> +
> diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
> new file mode 100644
> index 0000000000..ddd4170945
> --- /dev/null
> +++ b/package/libmodsecurity/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LIBMODSECURITY
> +       bool "libmodsecurity"
> +       select BR2_PACKAGE_PCRE
> +       help
> +         Libmodsecurity is one component of the ModSecurity
> +         v3 project. The library codebase serves as an
> +         interface to ModSecurity Connectors taking in web
> +         traffic and applying traditional ModSecurity
> +         processing. In general, it provides the capability
> +         to load/interpret rules written in the ModSecurity
> +         SecRules format and apply them to HTTP content
> +         provided by your application via Connectors.
> +
> +         https://github.com/SpiderLabs/ModSecurity
> diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
> new file mode 100644
> index 0000000000..29c0a079fe
> --- /dev/null
> +++ b/package/libmodsecurity/libmodsecurity.hash
> @@ -0,0 +1,4 @@
> +# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.3/modsecurity-v3.0.3.tar.gz.sha256
> +sha256 8aa1300105d8cc23315a5e54421192bc617a66246ad004bd89e67c232208d0f4  modsecurity-v3.0.3.tar.gz
> +# Localy calculated
> +sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
> new file mode 100644
> index 0000000000..991402057d
> --- /dev/null
> +++ b/package/libmodsecurity/libmodsecurity.mk
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# libmodsecurity
> +#
> +################################################################################
> +
> +LIBMODSECURITY_VERSION = 3.0.3
> +LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
> +LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/$(LIBMODSECURITY_VERSION)

This site path doesn't seem to work and needs a v before the $.
Current URL looks like
(https://github.com/SpiderLabs/ModSecurity/releases/download/3.0.3/modsecurity-v3.0.3.tar.gz)

LIBMODSECURITY_SITE =
https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)

> +LIBMODSECURITY_INSTALL_STAGING = YES
> +LIBMODSECURITY_LICENSE = Apache-2.0
> +LIBMODSECURITY_LICENSE_FILES = LICENSE
> +LIBMODSECURITY_AUTORECONF = YES
> +LIBMODSECURITY_CONF_ENV = \
> +       ac_cv_file_others_libinjection_src_libinjection_html5_c=yes # Necessary to work around AC_CHECK_FILE cross-compile limitation
> +
> +LIBMODSECURITY_DEPENDENCIES = pcre

It can't seem to currently find the pcre library.  Here's the error
and my reduced build config (Ubuntu 18.04 machine)

configure: SSDEEP library was not found
configure: Support for LUA was disabled by the utilization of
--without-lua or --with-lua=no
checking for libcurl config script... no
configure: *** curl library not found.
checking for libxml2 config script... no
configure: *** libxml2 library not found.
checking for libpcre config script... no
configure: *** pcre library not found.
configure: error: pcre library is required


BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_NGINX=y
BR2_PACKAGE_NGINX_MODSECURITY=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set


> +LIBMODSECURITY_CONF_OPTS =  --disable-examples
> +
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +LIBMODSECURITY_DEPENDENCIES += libxml2
> +LIBMODSECURITY_CONF_OPTS += --with-libxml="$(STAGING_DIR)"
> +else
> +LIBMODSECURITY_CONF_OPTS += --with-libxml="no"
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +LIBMODSECURITY_DEPENDENCIES += libcurl
> +LIBMODSECURITY_CONF_OPTS += --with-curl="$(STAGING_DIR)"
> +else
> +LIBMODSECURITY_CONF_OPTS += --with-curl="no"
> +endif
> +
> +ifeq ($(BR2_PACKAGE_YAJL),y)
> +LIBMODSECURITY_DEPENDENCIES += yajl
> +else
> +LIBMODSECURITY_CONF_OPTS += --with-yajl="no"
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GEOIP),y)
> +LIBMODSECURITY_DEPENDENCIES += geoip
> +else
> +LIBMODSECURITY_CONF_OPTS += --with-geoip="no"
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
> +LIBMODSECURITY_DEPENDENCIES += libmaxminddb
> +else
> +LIBMODSECURITY_CONF_OPTS += --with-maxmind="no"
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LUA),y)
> +LIBMODSECURITY_DEPENDENCIES += lua
> +LIBMODSECURITY_CONF_OPTS += --with-lua="$(STAGING_DIR)"
> +else
> +LIBMODSECURITY_CONF_OPTS += --with-lua="no"
> +endif
> +
> +$(eval $(autotools-package))
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
