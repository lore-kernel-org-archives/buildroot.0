From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 May 2015 10:30:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: Add -lpthread to detect
 sqlite for static build
In-Reply-To: <1433019787-12686-1-git-send-email-bernd.kuhls@t-online.de>
References: <1433019787-12686-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150531103000.2f41cdf3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 May 2015 23:03:07 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/e69/e6993d66aeebbe994063a60871412b2235ce5455/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/php.mk |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 8e79c49..191c48c 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -204,6 +204,9 @@ endif
>  ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
>  PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
>  PHP_DEPENDENCIES += sqlite
> +ifeq ($(BR2_STATIC_LIBS),y)
> +PHP_CONF_ENV += LIBS='-lpthread'
> +endif

What about:

PHP_CONF_ENV += LIBS=$(shell $(PKG_CONFIG_HOST_BINARY) --libs sqlite3)

instead ? (Note: I haven't tested, but sqlite3 seems to provide a
correct .pc file).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
