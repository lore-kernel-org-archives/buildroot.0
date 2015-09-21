From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Sep 2015 11:36:29 +0200
Subject: [Buildroot] [PATCH v7 1/1] squeezelite: new package
In-Reply-To: <201509210347.t8L3lcth017495@ms-omx02.plus.so-net.ne.jp>
References: <201509210347.t8L3lcth017495@ms-omx02.plus.so-net.ne.jp>
Message-ID: <20150921113629.0fc4f356@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Sep 2015 12:47:38 +0900, kei-k at ca2.so-net.ne.jp wrote:

> +config BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE
> +	bool "Enable resampling function"
> +	default y
> +	depends on BR2_PACKAGE_SQUEEZELITE
> +	help
> +	  Enable resampling function
> +
> +config BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP
> +	bool "Use OpenMP for resampling"
> +	default y
> +	depends on BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE
> +	help
> +	  Enable OpenMP support for resampling

The naming of the options is a bit inconsistent: "ENABLE" in one case
and "WITH" in the other case. I believe in fact you could simplify the
option naming to just:

BR2_PACKAGE_SQUEEZELITE_RESAMPLE
BR2_PACKAGE_SQUEEZELITE_RESAMPLE_OPENMP

However, I'm a bit worried about the OpenMP option. Does it require
OpenMP support in the toolchain? If yes, then not all toolchains have
OpenMP support, so we should handle that.

> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE),y)
> +	SQUEEZELITE_MAKE_OPTS += -DRESAMPLE
> +	ifeq ($(BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP),y)

Since BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP already depends on
BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE, there's no real need to nest
the two tests. They can be made two separate tests.

> +		SQUEEZELITE_MAKE_OPTS += -DRESAMPLE_MP
> +	endif
> +endif
> +
> +define SQUEEZELITE_BUILD_CMDS
> +    $(TARGET_MAKE_ENV) $(MAKE) OPTS="$(SQUEEZELITE_MAKE_OPTS)" \
> +	CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all

Have you tried using $(TARGET_CONFIGURE_OPTS) instead of manually
passing CC and LD ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
