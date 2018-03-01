From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Mar 2018 10:02:27 +0100
Subject: [Buildroot] [PATCH v2 2/9] dumb-init: new package
In-Reply-To: <20180301072012.25884-3-christian@paral.in>
References: <20180301072012.25884-1-christian@paral.in>
 <20180301072012.25884-3-christian@paral.in>
Message-ID: <20180301100227.3fb09c06@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Thu,  1 Mar 2018 02:20:05 -0500, Christian Stewart wrote:

> diff --git a/package/dumb-init/Config.in b/package/dumb-init/Config.in
> new file mode 100644
> index 0000000000..e817493605
> --- /dev/null
> +++ b/package/dumb-init/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_DUMB_INIT
> +	bool "dumb-init"
> +	help
> +	  dumb-init is a simple but valid init binary to
> +	  act as PID 1 for containers.
> +
> +	  https://github.com/Yelp/dumb-init
> diff --git a/package/dumb-init/dumb-init.hash b/package/dumb-init/dumb-init.hash
> new file mode 100644
> index 0000000000..4705ce4368
> --- /dev/null
> +++ b/package/dumb-init/dumb-init.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256	74486997321bd939cad2ee6af030f481d39751bc9aa0ece84ed55f864e309a3f	v1.2.0.tar.gz

Argh, what an annoying name for the tarball :-/

Could you add an entry with the hash of the license file ?

> diff --git a/package/dumb-init/dumb-init.mk b/package/dumb-init/dumb-init.mk
> new file mode 100644
> index 0000000000..3133384f5a
> --- /dev/null
> +++ b/package/dumb-init/dumb-init.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# dumb-init
> +#
> +################################################################################
> +
> +DUMB_INIT_VERSION = v1.2.0
> +DUMB_INIT_SITE = $(call github,Yelp,dumb-init,$(DUMB_INIT_VERSION))
> +
> +DUMB_INIT_LICENSE = MIT
> +DUMB_INIT_LICENSE_FILES = LICENSE
> +DUMB_INIT_CFLAGS += -static

This should be:

DUMB_INIT_CFLAGS = $(TARGET_CFLAGS) -static

with a comment above it that explains why we are forcing -static.

However, using -static has a problem: what happens when you're doing a
BR2_SHARED_LIBS=y configuration, i.e when there is only support for
shared libraries, and not static libraries ? And BR2_SHARED_LIBS=y is
our default.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
