From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed, 03 Dec 2014 00:56:08 +0100
Subject: [Buildroot] [PATCH 1/1] lighttpd: install fastcgi config for php
In-Reply-To: <1417559724-25091-1-git-send-email-bluemrp9@gmail.com>
References: <1417559724-25091-1-git-send-email-bluemrp9@gmail.com>
Message-ID: <547E5198.90208@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/2014 11:35 PM, Ryan Coe wrote:
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>   package/lighttpd/fastcgi.conf |  7 +++++++
>   package/lighttpd/lighttpd.mk  | 11 +++++++++++
>   2 files changed, 18 insertions(+)
>   create mode 100644 package/lighttpd/fastcgi.conf
>
> diff --git a/package/lighttpd/fastcgi.conf b/package/lighttpd/fastcgi.conf
> new file mode 100644
> index 0000000..2ed8bea
> --- /dev/null
> +++ b/package/lighttpd/fastcgi.conf
> @@ -0,0 +1,7 @@
> +server.modules += ( "mod_fastcgi" )
> +
> +fastcgi.server = ( ".php" => ((
> +                     "bin-path" => "/usr/bin/php-cgi",
> +                     "socket" => "/tmp/php.socket"
> +                 )))
> +
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index 8f34561..e4a3020 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -78,6 +78,17 @@ endef
>   
>   LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_CONFIG
>   
> +define LIGHTTPD_INSTALL_PHP_CONFIG
> +	$(INSTALL) -D -m 0644 package/lighttpd/fastcgi.conf \
> +		$(TARGET_DIR)/etc/lighttpd/conf.d/fastcgi.conf
> +	$(SED) 's/#include \"conf.d\/fastcgi.conf\"/include \"conf.d\/fastcgi.conf\"/' \
> +		$(TARGET_DIR)/etc/lighttpd/modules.conf
> +endef
> +
> +ifeq ($(BR2_PACKAGE_PHP_SAPI_CLI_CGI)$(BR2_PACKAGE_PHP_SAPI_CGI),y)
> +	LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_PHP_CONFIG
> +endif

You are making the assumption here that if someone selects the CGI SAPI, 
he wants to use the FastCGI interface.
Personally I would prefer plain old regular CGI above FastCGI.

Problem with the FastCGI implementation is that it creates a fixed 
number of PHP processes.
Consumes memory even when the webserver isn't executing any PHP script.
And doesn't work too well with PHP scripts that perform blocking 
operations or depend on any external server. If all PHP processes are 
occupied executing a script, the webserver cannot process any additional 
requests until a process becomes available again.


Yours sincerely,

Floris Bos
