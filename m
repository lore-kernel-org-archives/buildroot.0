From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 22:13:46 +0100
Subject: [Buildroot] [PATCH 1/1] libjpeg: add pkg-config file for libjpeg
In-Reply-To: <20171023131743.32292-1-olivier.schonken@gmail.com>
References: <20171023131743.32292-1-olivier.schonken@gmail.com>
Message-ID: <20180108221346.44472cfd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Oct 2017 15:17:43 +0200, Olivier Schonken wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
> This change is necessary to successfully build cups-filters with
> either libjpeg-turbo or libjpeg
> 
>  package/libjpeg/libjpeg.mk |  7 +++++++
>  package/libjpeg/libjpeg.pc | 10 ++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 package/libjpeg/libjpeg.pc
> 
> diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
> index e5bd454479..9e8380f44c 100644
> --- a/package/libjpeg/libjpeg.mk
> +++ b/package/libjpeg/libjpeg.mk
> @@ -16,6 +16,13 @@ define LIBJPEG_REMOVE_USELESS_TOOLS
>  	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom wrjpgcom)
>  endef
>  
> +define LIBJPEG_INSTALL_STAGING_PC
> +	$(INSTALL) -D package/libjpeg/libjpeg.pc \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/libjpeg.pc
> +endef
> +
> +LIBJPEG_POST_INSTALL_STAGING_HOOKS += LIBJPEG_INSTALL_STAGING_PC
> +
>  LIBJPEG_POST_INSTALL_TARGET_HOOKS += LIBJPEG_REMOVE_USELESS_TOOLS

It is better to group the hook registration with the definition of the
hook itself, so I've tweaked this.

>  
>  $(eval $(autotools-package))
> diff --git a/package/libjpeg/libjpeg.pc b/package/libjpeg/libjpeg.pc
> new file mode 100644
> index 0000000000..41cd21ce64
> --- /dev/null
> +++ b/package/libjpeg/libjpeg.pc
> @@ -0,0 +1,10 @@
> +prefix=/usr
> +exec_prefix=/usr
> +libdir=${exec_prefix}/lib
> +includedir=${prefix}/include
> +
> +Name: libjpeg
> +Description: A JPEG codec that provides the libjpeg API
> +Version: 9.2.0

I was not totally happy with this hardcoded version, so I've changed
that to some SED logic in the .mk file to get the version from the
libjpeg source code.

I hesitated doing a patch to libjpeg instead, but I'm not sure upstream
would have accepted it, and it would have meant keeping autoreconf
forever.

So, I've applied your patch after some tweaks. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
