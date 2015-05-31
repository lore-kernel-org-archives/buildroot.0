From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 May 2015 10:33:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: Add -lpthread to detect
 unixodbc for static build
In-Reply-To: <1433019093-16740-1-git-send-email-bernd.kuhls@t-online.de>
References: <1433019093-16740-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150531103306.499b604f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 May 2015 22:51:33 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/157/157749f8b44bc02fbed0232a2b33137aba495134/
> http://autobuild.buildroot.net/results/df4/df4e2ea098b0126867455af1891837c6d7d99a92/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/php.mk |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 9be07d5..8e79c49 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -225,6 +225,9 @@ endif
>  ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_UNIXODBC),y)
>  PHP_CONF_OPTS += --with-pdo-odbc=unixODBC,$(STAGING_DIR)/usr
>  PHP_DEPENDENCIES += unixodbc
> +ifeq ($(BR2_STATIC_LIBS),y)
> +PHP_CONF_ENV += LIBS='-lpthread'

What happens if you have multiple of such occurrences? You will pass
LIBS='-lfoo' LIBS='-lbar', etc.

Shouldn't we instead do:

PHP_LIBS += -lpthread

and then later, a single PHP_CONF_ENV += LIBS=$(PHP_LIBS)

Also, it's a shame unixodbc doesn't use pkg-config. It installs its own
odbc-config, but I guess it's compiled for the target, and most likely
returns results that are inappropriate for cross compilation.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
