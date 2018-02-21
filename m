From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 22:27:00 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 1/6] package: add libnpsr host
 package
In-Reply-To: <20180221142801.28997-2-gael.portay@savoirfairelinux.com>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-2-gael.portay@savoirfairelinux.com>
Message-ID: <20180221222700.7b9b3098@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Feb 2018 09:27:56 -0500, Ga?l PORTAY wrote:
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/libnspr/Config.in.host | 10 ++++++++++
>  package/libnspr/libnspr.mk     |  7 +++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 package/libnspr/Config.in.host
> 
> diff --git a/package/libnspr/Config.in.host b/package/libnspr/Config.in.host
> new file mode 100644
> index 0000000000..a80b55e122
> --- /dev/null
> +++ b/package/libnspr/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_LIBNSPR
> +	bool "host libnspr"
> +	help
> +	  NSPR is the Netscape Portable Runtime library which provides
> +	  a platform-neutral API for system level and libc like
> +	  functions. The library is used by the Mozilla project as well
> +	  as others.
> +
> +	  http://www.mozilla.org/projects/nspr/
> +

It is not necessary to add a Config.in.host option for this package, it
is just a build dependency of another package.

> diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
> index 0c782ae309..c1662947f7 100644
> --- a/package/libnspr/libnspr.mk
> +++ b/package/libnspr/libnspr.mk
> @@ -49,4 +49,11 @@ LIBNSPR_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIBRARY= install
>  LIBNSPR_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIBRARY= install
>  endif
>  
> +ifeq ($(HOSTARCH),x86_64)
> +HOST_LIBNSPR_CONF_OPTS += --enable-64bit

x86_64 is not the only 64-bit architecture in the world: we have an
autobuilder running on a ppc64 machine for example.

We don't really have a good way today to test if the host architecture
is 64 bit or not, so it would need to be added.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
