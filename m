From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 20 Apr 2020 10:19:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/snort3: new package
In-Reply-To: <20200129175314.129033-2-fontaine.fabrice@gmail.com>
References: <20200129175314.129033-1-fontaine.fabrice@gmail.com>
 <20200129175314.129033-2-fontaine.fabrice@gmail.com>
Message-ID: <CAEyMn7YED2RDxDrdXs8CjZ348h2L=tFViqAayuVF8uai3H89WA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

just build and it looks ok.

# utils/test-pkg -p snort3
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: SKIPPED
6 builds, 3 skipped, 0 build failed, 0 legal-info failed

Am Mi., 29. Jan. 2020 um 18:52 Uhr schrieb Fabrice Fontaine
<fontaine.fabrice@gmail.com>:
>
> Snort 3 is the next generation Snort IPS (Intrusion
> Prevention System).
>
>  - Support multiple packet processing threads
>  - Shared configuration and attribute table
>  - Use a simple, scriptable configuration
>  - Make key components pluggable
>  - Autodetect services for portless configuration
>  - Support sticky buffers in rules
>  - Autogenerate reference documentation
>  - Provide better cross platform support
>
> https://www.snort.org/snort3
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  DEVELOPERS                                    |   1 +
>  package/Config.in                             |   1 +
>  .../0001-Replace-u_int8_t-by-uint8_t.patch    | 165 ++++++++++++++++++
>  ...cip_definitions.h-include-sys-time.h.patch |  29 +++
>  package/snort3/Config.in                      |  42 +++++
>  package/snort3/snort3.hash                    |   6 +
>  package/snort3/snort3.mk                      |  57 ++++++
>  7 files changed, 301 insertions(+)
>  create mode 100644 package/snort3/0001-Replace-u_int8_t-by-uint8_t.patch
>  create mode 100644 package/snort3/0002-cip_definitions.h-include-sys-time.h.patch
>  create mode 100644 package/snort3/Config.in
>  create mode 100644 package/snort3/snort3.hash
>  create mode 100644 package/snort3/snort3.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e9cc2442ce..0a37857d0d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -887,6 +887,7 @@ F:  package/python-jedi/
>  F:     package/python-parso/
>  F:     package/rygel/
>  F:     package/safeclib/
> +F:     package/snort3/
>  F:     package/suricata/
>  F:     package/tinycbor/
>  F:     package/tinydtls/
> diff --git a/package/Config.in b/package/Config.in
> index 31396650cf..91b378f91c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2138,6 +2138,7 @@ endif
>         source "package/sngrep/Config.in"
>         source "package/snmpclitools/Config.in"
>         source "package/snort/Config.in"
> +       source "package/snort3/Config.in"
>         source "package/socat/Config.in"
>         source "package/socketcand/Config.in"
>         source "package/softether/Config.in"
> diff --git a/package/snort3/0001-Replace-u_int8_t-by-uint8_t.patch b/package/snort3/0001-Replace-u_int8_t-by-uint8_t.patch
> new file mode 100644
> index 0000000000..f861e55914
> --- /dev/null
> +++ b/package/snort3/0001-Replace-u_int8_t-by-uint8_t.patch
> @@ -0,0 +1,165 @@
> +From cd2907c6c75fa43dd4d1016a04221e335e7a9f1f Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 24 Jan 2020 22:47:39 +0100
> +Subject: [PATCH] Replace u_int8_t by uint8_t
> +
> +u_int8_t is not supported on musl so replace it by uint8_t
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/snort3/snort3/pull/113]

Newer version released and the issue seems to be fixed.

[SNIP]


> index 0000000000..e161e24165
> --- /dev/null
> +++ b/package/snort3/snort3.hash
> @@ -0,0 +1,6 @@
> +# Locally computed:
> +sha256 008bbce6d6901078f32f2e5511b8cf2204d10c7b8c941bd39640a2833f20073c  snort3-3.0.0-267.tar.gz
> +
> +# Hash for license files:
> +sha256 3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
> +sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
> diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
> new file mode 100644
> index 0000000000..17571cf272
> --- /dev/null
> +++ b/package/snort3/snort3.mk
> @@ -0,0 +1,57 @@
> +################################################################################
> +#
> +# snort3
> +#
> +################################################################################
> +
> +SNORT3_VERSION = 3.0.0-267
> +SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
> +SNORT3_LICENSE = GPL-2.0
> +SNORT3_LICENSE_FILES = COPYING LICENSE
> +
> +SNORT3_DEPENDENCIES = \
> +       host-pkgconf daq3 hwloc libdnet libpcap luajit openssl pcre zlib
> +
> +SNORT3_CONF_OPTS = \
> +       -DENABLE_GDB=OFF \
> +       -DENABLE_STATIC_DAQ=OFF \
> +       -DMAKE_DOC=OFF
> +
> +ifeq ($(BR2_PACKAGE_FLATBUFFERS),y)
> +SNORT3_DEPENDENCIES += flatbuffers
> +SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=ON
> +else
> +SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +SNORT3_DEPENDENCIES += libiconv
> +SNORT3_CONF_OPTS += -DHAVE_ICONV=ON
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> +SNORT3_DEPENDENCIES += libtirpc
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SAFECLIB),y)
> +SNORT3_DEPENDENCIES += safeclib
> +SNORT3_CONF_OPTS += -DENABLE_SAFEC=ON
> +else
> +SNORT3_CONF_OPTS += -DENABLE_SAFEC=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
> +SNORT3_DEPENDENCIES += util-linux
> +SNORT3_CONF_OPTS += -DHAVE_UUID=ON
> +else
> +SNORT3_CONF_OPTS += -DHAVE_UUID=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XZ),y)
> +SNORT3_DEPENDENCIES += xz
> +SNORT3_CONF_OPTS += -DHAVE_LZMA=ON
> +else
> +SNORT3_CONF_OPTS += -DHAVE_LZMA=OFF
> +endif
> +
> +$(eval $(cmake-package))
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

--
BR,
Heiko
