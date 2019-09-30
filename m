From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:43:26 +0200
Subject: [Buildroot] [PATCH 06/08] package/python-aioredis: new package
In-Reply-To: <20190804011631.86261-7-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
 <20190804011631.86261-7-aduskett@gmail.com>
Message-ID: <20190930214326.08b36939@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Aug 2019 21:16:29 -0400
aduskett at gmail.com wrote:

> diff --git a/package/python-aioredis/Config.in b/package/python-aioredis/Config.in
> new file mode 100644
> index 0000000000..aa410dc9a7
> --- /dev/null
> +++ b/package/python-aioredis/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PYTHON_AIOREDIS
> +	bool "python-aioredis"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC # redis
> +	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
> +	select BR2_PACKAGE_PYTHON_HIREDIS # runtime
> +	select BR2_PACKAGE_REDIS # runtime

There is no need to select BR2_PACKAGE_REDIS, the redis server could be
a remote one, so it may not be hosted on the same machine as the one
running python-aioredis.

However, you were missing a BR2_PACKAGE_PYTHON3 dependency, because
python-aioredis only works with python 3.x.

> +comment "python-aioredis needs a toolchain w/ atomic"
> +	depends on !BR2_TOOLCHAIN_HAS_ATOMIC

This is no longer relevant due to the redis select removal, but for the
record, we don't add Config.in comments for toolchain atomics, because
there is nothing the user can do about it.

I've applied your patch with the redis dependency dropped, and the
addition of a python3 dependency.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
