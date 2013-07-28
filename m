From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 18:59:32 +0200
Subject: [Buildroot] [PATCH] uclibc/arm: don't install ldd.host and
 ldconfig.host if !HAVE_SHARED
In-Reply-To: <1375030117.13990.1.camel@phoenix>
References: <1375030117.13990.1.camel@phoenix>
Message-ID: <20130728185932.5142e4b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Mon, 29 Jul 2013 00:48:37 +0800, Axel Lin wrote:
> ldd.host and ldconfig.host will be built only when HAVE_SHARED=y.
> 
> This fixes below build error when
>  # BR2_BFIN_FLAT is not set
>  # ARCH_HAS_MMU is not set
>  UCLIBC_FORMAT_FLAT=y
> 
> make[1]: Leaving directory `/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2'
> /usr/bin/install -D -m 0755 /opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/utils/ldd.host /opt/test/buildroot/buildroot/output/host/usr/bin/ldd
> /usr/bin/install: cannot stat '/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/utils/ldd.host': No such file or directory
> make: *** [/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/.stamp_staging_installed] Error 1

Which Buildroot configuration triggers this?


> +	if grep -q HAVE_SHARED=y $(@D)/.config; then \
> +		$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd; \
> +		ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd; \
> +		$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig; \
> +		ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig; \
> +	fi

I'd prefer not to grep into the uClibc configuration, and instead find
out which Buildroot configuration triggers this problem and find a
proper solution to it.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
