From: Ryan Coe <bluemrp9@gmail.com>
Date: Sun, 21 Oct 2018 07:29:18 -0700
Subject: [Buildroot] [PATCH 1/1] package/mariadb: add option to disable
 build of embedded server
In-Reply-To: <20181018185920.16430-1-bernd.kuhls@t-online.de>
References: <20181018185920.16430-1-bernd.kuhls@t-online.de>
Message-ID: <6687b270-0ec6-bd4f-4ca4-3684baf2192c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 10/18/18 11:59 AM, Bernd Kuhls wrote:
> Size of output/target/usr:
>
> with embedded: 1,7G
> without embedded: 648M
>
> This config option saves space on the target if the embedded server
> is not used by any other package:
>
> https://mariadb.com/kb/en/library/embedded-mariadb-interface/
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   package/mariadb/mariadb.mk | 4 ++++
>   package/mysql/Config.in    | 5 +++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index 2523aaf062..06d6365fab 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -56,8 +56,12 @@ MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
>   MARIADB_CONF_OPTS += -DENABLE_DTRACE=0
>   
>   ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
> +ifeq ($(BR2_PACKAGE_MARIADB_SERVER_EMBEDDED),y)
>   MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
>   else
> +MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=OFF
> +endif
> +else
>   MARIADB_CONF_OPTS += -DWITHOUT_SERVER=ON
>   endif
>   
> diff --git a/package/mysql/Config.in b/package/mysql/Config.in
> index 6409c8b806..257a2901a4 100644
> --- a/package/mysql/Config.in
> +++ b/package/mysql/Config.in
> @@ -54,6 +54,11 @@ config BR2_PACKAGE_MARIADB_SERVER
>   	help
>   	  Install the mariadb server on the target.
>   
> +config BR2_PACKAGE_MARIADB_SERVER_EMBEDDED
> +	bool "mariadb embedded server"
> +	help
> +	  Install the mariadb embedded server on the target.
> +
>   endif
>   
>   if BR2_PACKAGE_ORACLE_MYSQL

Tested-by: Ryan Coe <bluemrp9@gmail.com>
