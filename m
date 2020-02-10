From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Feb 2020 14:27:21 +0100
Subject: [Buildroot] [PATCH 2/3] package/automake: also include
 autoconf-archive in search paths
In-Reply-To: <e78e62c9d171941a0c8c8a93ba73d3edade4a9b1.1581261155.git.yann.morin.1998@free.fr>
References: <cover.1581261155.git.yann.morin.1998@free.fr>
 <e78e62c9d171941a0c8c8a93ba73d3edade4a9b1.1581261155.git.yann.morin.1998@free.fr>
Message-ID: <20200210142721.3390d716@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  9 Feb 2020 16:12:41 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> diff --git a/package/automake/automake.mk b/package/automake/automake.mk
> index 89dcaa1293..238116cb94 100644
> --- a/package/automake/automake.mk
> +++ b/package/automake/automake.mk
> @@ -33,5 +33,11 @@ $(eval $(host-autotools-package))
>  AUTOMAKE = $(HOST_DIR)/bin/automake
>  ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
>  ACLOCAL = $(HOST_DIR)/bin/aclocal
> -ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
> +ACLOCAL_PATH = $(subst $(space),:,$(strip \
> +	$(ACLOCAL_DIR) \
> +	$(ACLOCAL_HOST_DIR) \
> +	$(if $(filter host-autoconf-archive,$($(PKG)_FINAL_ALL_DEPENDENCIES)),\
> +		$(HOST_DIR)/share/autoconf-archive \
> +	) \
> +))

Meh :-/ Can we add something more explicit than that in the
infrastructure? Poking around in the package dependencies like this to
second guess which path should be added to ACLOCAL_PATH is not really
great :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
