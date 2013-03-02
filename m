From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Mar 2013 18:32:49 +0100
Subject: [Buildroot] [PATCH V2] new package: redis
In-Reply-To: <1362178999-16577-1-git-send-email-daniel.price@gmail.com>
References: <1362178612-16168-1-git-send-email-daniel.price@gmail.com>
 <1362178999-16577-1-git-send-email-daniel.price@gmail.com>
Message-ID: <20130302183249.52df2dee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Price,

Looks mostly good, thanks! A few comments below.

On Fri,  1 Mar 2013 15:03:19 -0800, Daniel Price wrote:

> +config BR2_PACKAGE_REDIS
> +	bool "redis"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_LARGEFILE
> +	help
> +	  Redis is an open source, advanced key-value store. It is often referred
> +	  to as a data structure server since keys can contain strings, hashes,
> +	  lists, sets and sorted sets.
> +
> +	  http://www.redis.io

We usually add a comment:

comment "redis needs largefile and thread support in toolchain"
	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS

> diff --git a/package/redis/redis-2.6.10-001-uclibc.patch b/package/redis/redis-2.6.10-001-uclibc.patch
> new file mode 100644
> index 0000000..22206eb
> --- /dev/null
> +++ b/package/redis/redis-2.6.10-001-uclibc.patch

Please don't put the version number in the patch file name. It should
be just redis-001-uclibc.patch.

> +REDIS_VERSION = 2.6.10
> +REDIS_SOURCE = redis-$(REDIS_VERSION).tar.gz
> +REDIS_SITE = http://redis.googlecode.com/files
> +REDIS_LICENSE = BSD-3c
> +REDIS_LICENSE_FILES = COPYING
> +
> +# Redis doesn't support DESTDIR (yet, see
> +# https://github.com/antirez/redis/pull/609).  We set PREFIX
> +# instead.
> +REDIS_BUILDOPTS = MALLOC=libc CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> +    PREFIX=$(TARGET_DIR)/usr

Can you try instead:

REDIS_BUILDOPTS = MALLOC=libc $(TARGET_CONFIGURE_OPTS) \
	PREFIX=$(TARGET_DIR)/usr

i.e, TARGET_CONFIGURE_OPTS already contains the definition for CC,
CFLAGS and more, so we generally prefer to use $(TARGET_CONFIGURE_OPTS)
when possible.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
