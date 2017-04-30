From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Apr 2017 14:29:36 +0200
Subject: [Buildroot] [PATCH] nanomsg: new package
In-Reply-To: <1492766524-3682-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1492766524-3682-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <f368fc1f-1cdb-1c1f-532a-396df8fb8a0d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rahul,

Le 21/04/2017 ? 11:22, Rahul Bedarkar a ?crit :
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/nanomsg/Config.in    | 23 +++++++++++++++++++++++
>  package/nanomsg/nanomsg.hash |  2 ++
>  package/nanomsg/nanomsg.mk   | 24 ++++++++++++++++++++++++
>  5 files changed, 51 insertions(+)
>  create mode 100644 package/nanomsg/Config.in
>  create mode 100644 package/nanomsg/nanomsg.hash
>  create mode 100644 package/nanomsg/nanomsg.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 123a8f9..693cfe1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1303,6 +1303,7 @@ F:	package/glog/
>  F:	package/gssdp/
>  F:	package/gupnp/
>  F:	package/gupnp-av/
> +F:	package/nanomsg/
>  
>  N:	Rahul Jain <rahul.jain@imgtec.com>
>  F:	package/uhttpd/
> diff --git a/package/Config.in b/package/Config.in
> index 4eaa95b..bfcfb73 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1306,6 +1306,7 @@ menu "Networking"
>  	source "package/libwebsockets/Config.in"
>  	source "package/lksctp-tools/Config.in"
>  	source "package/mongoose/Config.in"
> +	source "package/nanomsg/Config.in"
>  	source "package/neon/Config.in"
>  	source "package/norm/Config.in"
>  	source "package/nss-mdns/Config.in"
> diff --git a/package/nanomsg/Config.in b/package/nanomsg/Config.in
> new file mode 100644
> index 0000000..0cab8b4
> --- /dev/null
> +++ b/package/nanomsg/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_NANOMSG
> +	bool "nanomsg"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  nanomsg is a socket library that provides several common
> +	  communication patterns. It aims to make the networking layer
> +	  fast, scalable, and easy to use. Implemented in C, it works
> +	  on a wide range of operating systems with no further
> +	  dependencies.
> +
> +	  http://nanomsg.org/
> +
> +if BR2_PACKAGE_NANOMSG
> +
> +config BR2_PACKAGE_NANOMSG_TOOLS
> +	bool "Build nanomsg tools"
> +	help
> +	  Build nanomsg tools
> +
> +endif
> +
> +comment "nanomsg needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/nanomsg/nanomsg.hash b/package/nanomsg/nanomsg.hash
> new file mode 100644
> index 0000000..5f947da
> --- /dev/null
> +++ b/package/nanomsg/nanomsg.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 24afdeb71b2e362e8a003a7ecc906e1b84fd9f56ce15ec567481d1bb33132cc7  nanomsg-1.0.0.tar.gz
> diff --git a/package/nanomsg/nanomsg.mk b/package/nanomsg/nanomsg.mk
> new file mode 100644
> index 0000000..3b1c2ca
> --- /dev/null
> +++ b/package/nanomsg/nanomsg.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# nanomsg
> +#
> +################################################################################
> +
> +NANOMSG_VERSION = 1.0.0
> +NANOMSG_SITE = $(call github,nanomsg,nanomsg,$(NANOMSG_VERSION))
> +NANOMSG_INSTALL_STAGING = YES
> +NANOMSG_LICENSE = MIT
> +NANOMSG_LICENSE_FILES = COPYING
> +NANOMSG_CONF_OPTS = -DNN_ENABLE_DOC=OFF -DNN_TESTS=OFF
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +NANOMSG_CONF_OPTS += -DNN_STATIC_LIB=ON
> +endif
> +
> +ifeq ($(BR2_PACKAGE_NANOMSG_TOOLS),y)
> +NANOMSG_CONF_OPTS += -DNN_TOOLS=ON
> +else
> +NANOMSG_CONF_OPTS += -DNN_TOOLS=OFF
> +endif
> +
> +$(eval $(cmake-package))
> 
