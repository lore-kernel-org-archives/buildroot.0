From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 16:08:55 +0100
Subject: [Buildroot] [PATCH] package/collectd: don't remove
 postgresql_default.conf
In-Reply-To: <20200311141311.14785-1-p.debruijn@unilogic.nl>
References: <20200311141311.14785-1-p.debruijn@unilogic.nl>
Message-ID: <20200322160855.6894eb78@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Mar 2020 15:13:11 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> $(TARGET_DIR)/usr/share/collectd/postgresql_default.conf
> should not be removed when postgresql support is enabled,
> as that module tries to load that file by default.
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/collectd/collectd.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index 9258977613..14f52d6e6e 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -202,6 +202,8 @@ endif
>  ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
>  COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
>  COLLECTD_CONF_ENV += LIBS="-lpthread -lm"
> +else
> +COLLECTD_POST_INSTALL_TARGET_HOOKS += COLLECTD_REMOVE_UNNEEDED_POSTGRESQL_DEFAULT_CONF
>  endif

I moved the hook registration into a condition based on
BR2_PACKAGE_COLLECTD_POSTGRESQL instead of BR2_PACKAGE_POSTGRESQL.
Indeed you can have BR2_PACKAGE_POSTGRESQL=y but
BR2_PACKAGE_COLLECTD_POSTGRESQL disabled, and in this case, you want to
remove the file.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
