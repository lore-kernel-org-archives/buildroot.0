From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Jun 2020 19:59:09 +0200
Subject: [Buildroot] [PATCH 1/3] package/libnpupnp: new package
In-Reply-To: <20200623163020.866522-1-fontaine.fabrice@gmail.com>
References: <20200623163020.866522-1-fontaine.fabrice@gmail.com>
Message-ID: <20200623175909.GV2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-23 18:30 +0200, Fabrice Fontaine spake thusly:
> npupnp (new pupnp or not pupnp ?) is an UPnP library derived from the
> venerable pupnp (https://github.com/pupnp/pupnp), based on its 1.6.x
> branch (around 1.6.25).
> 
> https://www.lesbonscomptes.com/upmpdcli/libnpupnp.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This does not build with all test-pkg configurations;

    $ echo BR2_PACKAGE_LIBNPUPNP=y >libnpupnp.conf
    $ ./utils/test-pkg -p libnpupnp -c libnpupnp.conf -d $(pwd)/run-tests
                 sourcery-arm [6/6]: FAILED

The errors are:

    src/ssdp/ssdpparser.cpp: In member function 'bool SSDPPacketParser::parse()':
    src/ssdp/ssdpparser.cpp:146:48: error: 'strcasecmp' was not declared in this scope
                 if (!strcasecmp("CACHE-CONTROL", nm)) {
                                                    ^
    src/ssdp/ssdpparser.cpp:151:39: error: 'strcasecmp' was not declared in this scope
                 if (!strcasecmp("DATE", nm)) {
                                           ^
    src/ssdp/ssdpparser.cpp:156:38: error: 'strcasecmp' was not declared in this scope
                 if (!strcasecmp("EXT", nm)) {
                                          ^
    src/ssdp/ssdpparser.cpp:161:39: error: 'strcasecmp' was not declared in this scope
                 if (!strcasecmp("HOST", nm)) {
                                           ^
    src/ssdp/ssdpparser.cpp:166:43: error: 'strcasecmp' was not declared in this scope
                 if (!strcasecmp("LOCATION", nm)) {
                                               ^
    src/ssdp/ssdpparser.cpp:171:38: error: 'strcasecmp' was not declared in this scope
                 if (!strcasecmp("MAN", nm)) {
                                          ^
    src/ssdp/ssdpparser.cpp:178:37: error: 'strcasecmp' was not declared in this scope
                 if (!strcasecmp("NT", nm)) {
                                         ^
    src/ssdp/ssdpparser.cpp:185:41: error: 'strcasecmp' was not declared in this scope
             if (!strcasecmp("SERVER", nm)) {
                                         ^
    src/ssdp/ssdpparser.cpp:192:45: error: 'strcasecmp' was not declared in this scope
             if (!strcasecmp("USER-AGENT", nm)) {
                                             ^
    src/ssdp/ssdpparser.cpp:215:33: error: 'strcmp' was not declared in this scope
         bool ret = strcmp(cp, "\r\n") == 0;
                                 ^
    src/ssdp/ssdp_device.cpp: In function 'int AdvertiseAndReply(SSDPDevMessageType, UpnpDevice_Handle, SsdpSearchType, sockaddr*, char*, char*, char*, int)':
    src/ssdp/ssdp_device.cpp:832:72: error: invalid initialization of reference of type 'const sockaddr_storage&' from expression of type '<brace-enclosed initializer list>'
                         const struct sockaddr_storage& fss{ipaddr.getaddr()};
                                                                            ^

The first ones are probably because of a too old glibc, while the later
is probably due to C++11 correctness. Care to have a look and respin the
whole series, please?

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/libnpupnp/Config.in      | 16 ++++++++++++++++
>  package/libnpupnp/libnpupnp.hash |  5 +++++
>  package/libnpupnp/libnpupnp.mk   | 14 ++++++++++++++
>  5 files changed, 37 insertions(+)
>  create mode 100644 package/libnpupnp/Config.in
>  create mode 100644 package/libnpupnp/libnpupnp.hash
>  create mode 100644 package/libnpupnp/libnpupnp.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index fb6d4cec64..4b6a346a05 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -856,6 +856,7 @@ F:	package/libmatroska/
>  F:	package/libmpdclient/
>  F:	package/libnetfilter_conntrack/
>  F:	package/libnetfilter_queue/
> +F:	package/libnpupnp/
>  F:	package/liboping/
>  F:	package/libpfm4/
>  F:	package/libraw/
> diff --git a/package/Config.in b/package/Config.in
> index e2bb004015..6a34a895af 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1712,6 +1712,7 @@ menu "Networking"
>  	source "package/libnice/Config.in"
>  	source "package/libnids/Config.in"
>  	source "package/libnl/Config.in"
> +	source "package/libnpupnp/Config.in"
>  	source "package/liboauth/Config.in"
>  	source "package/liboping/Config.in"
>  	source "package/libosip2/Config.in"
> diff --git a/package/libnpupnp/Config.in b/package/libnpupnp/Config.in
> new file mode 100644
> index 0000000000..71016b069e
> --- /dev/null
> +++ b/package/libnpupnp/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_LIBNPUPNP
> +	bool "libnpupnp"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBMICROHTTPD
> +	help
> +	  npupnp (new pupnp or not pupnp ?) is an UPnP library derived
> +	  from the venerable pupnp (https://github.com/pupnp/pupnp),
> +	  based on its 1.6.x branch (around 1.6.25).
> +
> +	  https://www.lesbonscomptes.com/upmpdcli/libnpupnp.html
> +
> +comment "libnpupnp needs a toolchain w/ C++, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
> new file mode 100644
> index 0000000000..41cc41955b
> --- /dev/null
> +++ b/package/libnpupnp/libnpupnp.hash
> @@ -0,0 +1,5 @@
> +# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.0.7.tar.gz.sha256
> +sha256  30f15caa67dc83f76b0976438165aa4704a50c7e3e5444c50bb8cbad874877ca  libnpupnp-4.0.7.tar.gz
> +
> +# Hash for license file:
> +sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
> diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
> new file mode 100644
> index 0000000000..abd80ab63b
> --- /dev/null
> +++ b/package/libnpupnp/libnpupnp.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libnpupnp
> +#
> +################################################################################
> +
> +LIBNPUPNP_VERSION = 4.0.7
> +LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
> +LIBNPUPNP_LICENSE = BSD-3-Clause
> +LIBNPUPNP_LICENSE_FILES = COPYING
> +LIBNPUPNP_INSTALL_STAGING = YES
> +LIBNPUPNP_DEPENDENCIES = expat libcurl libmicrohttpd
> +
> +$(eval $(autotools-package))
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
