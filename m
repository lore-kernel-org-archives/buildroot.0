From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 15:27:56 +0200
Subject: [Buildroot] [PATCH 2/5] package/redis: Add redis system user
In-Reply-To: <1437483774-30291-2-git-send-email-martin@barkynet.com>
References: <1437483774-30291-1-git-send-email-martin@barkynet.com>
 <1437483774-30291-2-git-send-email-martin@barkynet.com>
Message-ID: <20150721152756.1448370d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Tue, 21 Jul 2015 14:02:51 +0100, Martin Bark wrote:
> Add a redis system user and set the home directory to /var/lib/redis
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/redis/redis.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index 51c1f9c..633d411 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -9,6 +9,10 @@ REDIS_SITE = http://download.redis.io/releases
>  REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
>  REDIS_LICENSE_FILES = COPYING
>  
> +define REDIS_USERS
> +	redis -1 redis -1 * /var/lib/redis /bin/sh - Redis Server

Does it really need to have a login shell?

> +endef
> +
>  # Redis doesn't support DESTDIR (yet, see
>  # https://github.com/antirez/redis/pull/609).  We set PREFIX
>  # instead.
> @@ -22,6 +26,7 @@ endef
>  define REDIS_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) \
>  		LDCONFIG=true install
> +	$(INSTALL) -d -m 0700 $(TARGET_DIR)/var/lib/redis

I don't think this line is needed, unless you want to install specific
things to /var/lib/redis, since specifying /var/lib/redis for the
REDIS_USERS is sufficient to get this directory created and chown-ed to
the right user.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
