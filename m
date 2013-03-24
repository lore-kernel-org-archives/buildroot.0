From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 24 Mar 2013 11:31:07 -0300
Subject: [Buildroot] [PATCH v4 1/2] strongswan: new package
In-Reply-To: <1360854606-13787-1-git-send-email-jezz@sysmic.org>
References: <20130214143957.1095407a@skate>
 <1360854606-13787-1-git-send-email-jezz@sysmic.org>
Message-ID: <514F0E2B.6010207@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/14/2013 12:10 PM, J?r?me Pouiller wrote:

> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> new file mode 100644
> index 0000000..24b30ad
> --- /dev/null
> +++ b/package/strongswan/Config.in
> @@ -0,0 +1,105 @@
> +menuconfig BR2_PACKAGE_STRONGSWAN
> +	bool "strongswan"

depends on BR2_USE_MMU # fork()
Strongswan uses fork() so it won't build on nommu architectures like
blackfin.

> +if BR2_PACKAGE_STRONGSWAN
> +
> +config BR2_PACKAGE_STRONGSWAN_OPENSSL
> +	bool "Enables OpenSSL based crypto backends"
> +	select BR2_PACKAGE_OPENSSL
> +
> +config BR2_PACKAGE_STRONGSWAN_GCRYPT
> +	bool "Enables libgcrypt based crypto backends"
> +	select BR2_PACKAGE_LIBGCRYPT
> +	

> +config BR2_PACKAGE_STRONGSWAN_GMP
> +	bool "Enable GNU MP (libgmp) based crypto backends"
> +	select BR2_PACKAGE_GMP
> +	default y

See section 2 of the INSTALL file, one of OPENSSL/GCRYPT/GMP is required
with GMP being the default if nothing is specified.
These three should be folded into a choice so that a user isn't allowed
to N the three of them and cause build breakage.

> +config BR2_PACKAGE_STRONGSWAN_SQL
> +	bool "Enable SQL database configuration backend"
> +
> +endif

You need at least one SQL backend (mysql/sqlite) for this to be of any use.
You could probably do something like...

ifeq ($(BR2_PACKAGE_SQLITE),y)
STRONGSWAN_DEPENEDNCIES += sqlite
STRONGSWAN_CONF_OPT += --enable-sql=yes
endef
ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
STRONGSWAN_DEPENDENCIES += mysql_client
STRONGSWAN_CONF_OPT += --enable-sql=yes
endif

> +STRONGSWAN_VERSION = 5.0.1

Bump to 5.0.2 now that it's out?

Other than what i've mentioned it's looking pretty good now.
Care to send another one?
Thanks!
