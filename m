From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 22 Jan 2017 12:36:08 +0100
Subject: [Buildroot] [PATCH 1/2] bctoolbox: new package
In-Reply-To: <20170112134034.29031-1-joerg.krause@embedded.rocks>
References: <20170112134034.29031-1-joerg.krause@embedded.rocks>
Message-ID: <920006c3-d58e-46ed-e88f-1e57456c16b5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

Le 12/01/2017 ? 14:40, J?rg Krause a ?crit :
> bctoolbox is a utilities library used by Belledonne Communications
> softwares like belle-sip, mediastreamer2 and linphone.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/Config.in                |  1 +
>  package/bctoolbox/Config.in      |  8 ++++++++
>  package/bctoolbox/bctoolbox.hash |  2 ++
>  package/bctoolbox/bctoolbox.mk   | 30 ++++++++++++++++++++++++++++++
>  4 files changed, 41 insertions(+)
>  create mode 100644 package/bctoolbox/Config.in
>  create mode 100644 package/bctoolbox/bctoolbox.hash
>  create mode 100644 package/bctoolbox/bctoolbox.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 8c8c33ec3..9609e9740 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1289,6 +1289,7 @@ menu "Other"
>  	source "package/argp-standalone/Config.in"
>  	source "package/armadillo/Config.in"
>  	source "package/atf/Config.in"
> +	source "package/bctoolbox/Config.in"
>  	source "package/bdwgc/Config.in"
>  	source "package/boost/Config.in"
>  	source "package/clapack/Config.in"
> diff --git a/package/bctoolbox/Config.in b/package/bctoolbox/Config.in
> new file mode 100644
> index 000000000..09165cd8d
> --- /dev/null
> +++ b/package/bctoolbox/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_BCTOOLBOX
> +	bool "bctoolbox"
> +	select BR2_PACKAGE_MBEDTLS

bctoolbox depends on threads support:
"find_package(Threads REQUIRED)"

-- Looking for pthread.h
-- Looking for pthread.h - not found
CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:148
(message):
  Could NOT find Threads (missing: Threads_FOUND)

> +	help
> +	  Utilities library used by Belledonne Communications softwares like

This line is a bit too long.

> +	  belle-sip, mediastreamer2 and linphone.
> +
> +	  https://github.com/BelledonneCommunications/bctoolbox
> diff --git a/package/bctoolbox/bctoolbox.hash b/package/bctoolbox/bctoolbox.hash
> new file mode 100644
> index 000000000..70be55c3d
> --- /dev/null
> +++ b/package/bctoolbox/bctoolbox.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  da7df7ff359a9829e9e6ef98dfe9fead0cf735b8a4a5da1b1047f467dee1b2a9  bctoolbox-0.4.0.tar.gz
> diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
> new file mode 100644
> index 000000000..a5b75a468
> --- /dev/null
> +++ b/package/bctoolbox/bctoolbox.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# bctoolbox
> +#
> +################################################################################
> +
> +BCTOOLBOX_VERSION = 0.4.0
> +BCTOOLBOX_SITE = $(call github,BelledonneCommunications,bctoolbox,$(BCTOOLBOX_VERSION))
> +BCTOOLBOX_LICENSE = GPLv2+
> +BCTOOLBOX_LICENSE_FILES = COPYING
> +BCTOOLBOX_DEPENDENCIES = mbedtls

Maybe add a comment to say that the mbedtls support is preferred over polarssl
support.

> +BCTOOLBOX_INSTALL_STAGING = YES
> +
> +BCTOOLBOX_CONF_OPTS = \
> +	-DENABLE_STRICT=OFF \
> +	-DENABLE_TESTS_COMPONENT=OFF \
> +	-DENABLE_TESTS=OFF

The build system is looking for git binary, you can add -DGIT_EXECUTABLE=OFF to
remove the error message (ignored):

-- Found Git: /usr/bin/git (found suitable version "2.9.3", minimum required is
"1.7.10")
fatal: Not a git repository (or any parent up to mount point /home)
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).

Best regards,
Romain

> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +BCTOOLBOX_CONF_OPTS += \
> +	-DENABLE_SHARED=OFF -DENABLE_STATIC=ON
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +BCTOOLBOX_CONF_OPTS += \
> +	-DENABLE_SHARED=ON -DENABLE_STATIC=ON
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +BCTOOLBOX_CONF_OPTS += \
> +	-DENABLE_SHARED=ON -DENABLE_STATIC=OFF
> +endif
> +
> +$(eval $(cmake-package))
> 
