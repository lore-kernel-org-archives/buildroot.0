From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:03:20 +0100
Subject: [Buildroot] [PATCH 5/7] sysrepo: Use a common repository
 location
In-Reply-To: <b19aded0e3b221e21a629a3eba7deb8d7f54dfae.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <b19aded0e3b221e21a629a3eba7deb8d7f54dfae.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <20191208230320.3d65b55d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 4 Dec 2019 10:37:37 +0100
Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:

> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
> index 113ed7a929..2ef64d13e2 100644
> --- a/package/sysrepo/sysrepo.mk
> +++ b/package/sysrepo/sysrepo.mk
> @@ -58,7 +58,7 @@ HOST_SYSREPO_CONF_OPTS = \
>  	-DCALL_TARGET_BINS_DIRECTLY=OFF \
>  	-DBUILD_EXAMPLES=OFF \
>  	-DBUILD_CPP_EXAMPLES=OFF \
> -	-DREPOSITORY_LOC=$(HOST_DIR)/etc/sysrepo \
> +	-DREPOSITORY_LOC=$(BASE_TARGET_DIR)/etc/sysrepo \

I suppose you're using $(BASE_TARGET_DIR) here instead of $(TARGET_DIR)
to work around issues with per-package directory support ?

Unfortunately, using $(BASE_TARGET_DIR) is not really a good option.
Indeed, if any host-sysrepo tool gets used during the build, it will
point to $(BASE_TARGET_DIR), which is with per-package directory
support enabled, is completely empty during the build. It only gets
populated at the very end of the build, in target-finalize.

With per-package directory, we cannot have a hardcoded path to the
target, it really needs to be dynamic. Can the sysrepoctl tool use an
environment variable for example ?

> +# There's no point in keeping the logs around
> +define SYSREPO_REMOVE_NOTIFICATION_LOG
> +	rm -rf $(BASE_TARGET_DIR)/etc/sysrepo/data/notifications/

Here, you can definitely use $(TARGET_DIR), because when the
target-finalize hooks are executed, TARGET_DIR is defined to
BASE_TARGET_DIR.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
