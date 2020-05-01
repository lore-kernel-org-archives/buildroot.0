From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 14:07:22 +0200
Subject: [Buildroot] [PATCH v2] package/pistache: new package
In-Reply-To: <20200501092226.316943-1-thomas@ruschival.de>
References: <20200501092226.316943-1-thomas@ruschival.de>
Message-ID: <20200501120722.GT11346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-05-01 11:22 +0200, Thomas Ruschival spake thusly:
> The upstream project http://pistache.io/ does not provide release
> tarballs at https://github.com/oktal/pistache/. I have been using the
> commit 73f248acd6db4c53 successfully for some time now for a buildroot
> project.
> 
> The use of BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 is for C++14 support.
> Tested it with gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabi
> and buildroot's ./utils/test-pkg
> 
> Pistache does not build with uClibc, the macro RUSAGE_THREAD for
> getrusage() is not properly declared. This is an upstream issue:
> https://github.com/oktal/pistache/issues/175
> Hence the dependecy !BR2_TOOLCHAIN_USES_UCLIBC
> 
> Signed-off-by: Thomas Ruschival <thomas@ruschival.de>

Applied to master, with the following changes:

  - fix PISTACHE_LICENSE_FILES (missing trailing 'S')
  - add hash for license file
  - two spaces in license file
  - tweaks in commit log

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/Config.in              |  1 +
>  package/pistache/Config.in     | 20 ++++++++++++++++++++
>  package/pistache/pistache.hash |  2 ++
>  package/pistache/pistache.mk   | 21 +++++++++++++++++++++
>  4 files changed, 44 insertions(+)
>  create mode 100644 package/pistache/Config.in
>  create mode 100644 package/pistache/pistache.hash
>  create mode 100644 package/pistache/pistache.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 53c8ce0e29..c12676d859 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1754,6 +1754,7 @@ menu "Networking"
>  	source "package/ortp/Config.in"
>  	source "package/paho-mqtt-c/Config.in"
>  	source "package/paho-mqtt-cpp/Config.in"
> +	source "package/pistache/Config.in"
>  	source "package/qdecoder/Config.in"
>  	source "package/qpid-proton/Config.in"
>  	source "package/rabbitmq-c/Config.in"
> diff --git a/package/pistache/Config.in b/package/pistache/Config.in
> new file mode 100644
> index 0000000000..64d6340827
> --- /dev/null
> +++ b/package/pistache/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_PISTACHE
> +	bool "pistache"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> +	help
> +	  Pistache is a modern and elegant HTTP and REST framework
> +	  for C++. It is entirely written in pure C++14 and provides
> +	  a clear and pleasant API.
> +
> +	  https://github.com/oktal/pistache
> +
> +comment "pistache needs a glibc toolchain w/ C++, gcc >= 4.9, threads, wchar"
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
> +	BR2_TOOLCHAIN_USES_UCLIBC || \
> +	!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +	!BR2_TOOLCHAIN_HAS_THREADS || \
> +	!BR2_USE_WCHAR
> diff --git a/package/pistache/pistache.hash b/package/pistache/pistache.hash
> new file mode 100644
> index 0000000000..f81ee8a5b2
> --- /dev/null
> +++ b/package/pistache/pistache.hash
> @@ -0,0 +1,2 @@
> +#locally computed
> +sha256 bcc7640eb4ae4b178e504f18ebf29dd0a6f8189710cdc0fa4703fa27728145e4  pistache-73f248acd6db4c53e6604577b7e13fd5e756f96f.tar.gz
> diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
> new file mode 100644
> index 0000000000..7b30621b74
> --- /dev/null
> +++ b/package/pistache/pistache.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# pistache
> +#
> +################################################################################
> +
> +PISTACHE_VERSION = 73f248acd6db4c53e6604577b7e13fd5e756f96f
> +PISTACHE_SITE = $(call github,oktal,pistache,$(PISTACHE_VERSION))
> +PISTACHE_LICENSE = Apache-2.0
> +PISTACHE_LICENSE_FILE = LICENSE
> +
> +PISTACHE_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +PISTACHE_DEPENDENCIES += openssl
> +PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=ON
> +else
> +PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=OFF
> +endif
> +
> +$(eval $(cmake-package))
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
