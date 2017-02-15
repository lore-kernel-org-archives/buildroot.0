From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 22:15:20 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
 archives
In-Reply-To: <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
Message-ID: <20170215221520.41e4c66e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 22:15:39 +0200, Baruch Siach wrote:

> diff --git a/Makefile b/Makefile
> index df3b64eb03ec..b4550e098958 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -431,6 +431,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
>  ZCAT := $(call qstrip,$(BR2_ZCAT))
>  BZCAT := $(call qstrip,$(BR2_BZCAT))
>  XZCAT := $(call qstrip,$(BR2_XZCAT))
> +LZCAT := $(call qstrip,$(BR2_LZCAT))

So here, we use the value of the config option BR2_LZCAT.

> diff --git a/support/dependencies/check-host-lzip.mk b/support/dependencies/check-host-lzip.mk
> new file mode 100644
> index 000000000000..708105acd892
> --- /dev/null
> +++ b/support/dependencies/check-host-lzip.mk
> @@ -0,0 +1,5 @@
> +ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
> +DEPENDENCIES_HOST_PREREQ += host-lzip
> ++EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
> +LZCAT = $(HOST_DIR)/usr/bin/lzip -d -c

But here in the case where we are building our own host-lzip, we
completely ignore BR2_LZCAT, and use a hardcoded
$(HOST_DIR)/usr/bin/lzip -d -c.

Since there is already the exact same pattern for XZCAT, I decided to
apply your patch anyway. I also don't really understand the use case
for all those BR2_ZCAT, BR2_BZCAT, BR2_XZCAT, etc. config options.
Peter, maybe you can shed some light on why we have these?

Also Baruch: there was one too many "+" at the beginning of:

> ++EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz

so I've fixed that before applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
