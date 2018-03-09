From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Fri, 9 Mar 2018 10:04:11 +0100
Subject: [Buildroot] [PATCH] package: dropbear: make PATH configurable
In-Reply-To: <20180308214403.94906-1-mmayer@broadcom.com>
References: <20180308214403.94906-1-mmayer@broadcom.com>
Message-ID: <7fc48110-d7bc-0d75-15c5-db1bec93dc00@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/03/2018 22:44, Markus Mayer wrote:
> Make the default PATH dropbear is using configurable.
> 
> If not specified, it will continue to default to dropbear's
> DEFAULT_PATH.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
> 
> Please let me know what you think. Thanks.
> 
>  package/dropbear/Config.in   | 6 ++++++
>  package/dropbear/dropbear.mk | 8 ++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> index 6700778161ba..d38ecf50834a 100644
> --- a/package/dropbear/Config.in
> +++ b/package/dropbear/Config.in
> @@ -55,4 +55,10 @@ config BR2_PACKAGE_DROPBEAR_LASTLOG
>  	  Enable logging of dropbear access to lastlog. Notice that
>  	  Buildroot does not generate lastlog by default.
>  
> +config BR2_PACKAGE_DROPBEAR_PATH
> +	string "dropbear default path"
> +	help
> +	  Use the path specified here as dropbear's default path.
> +	  If not specified, dropbear will use "/usr/bin:/bin".
> +
>  endif
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 01a1a07b7696..ddbedf3bce93 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -51,6 +51,14 @@ define DROPBEAR_DISABLE_STANDALONE
>  	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
>  endef
>  
> +ifneq ($(BR2_PACKAGE_DROPBEAR_PATH),"")
> +define DROPBEAR_CUSTOM_PATH
> +	$(SED) 's|^\(#define DEFAULT_PATH\).*|\1 $(BR2_PACKAGE_DROPBEAR_PATH)|' $(@D)/options.h
> +endef

You should probably protect this regex a bit more.  It could overwrite
a future macro beginning with DEFAULT_PATH, or it could stop working
if someone add spaces between #define and DEFAULT_PATH.  Such future
bugs could stay unnoticed if the compilation does not fail.

Alternatively, you could append an #undef and #define at the end of
the file, so that #undef can fails if DEFAULT_PATH does not exist anymore.

BTW, you probably know that ifconfig is deprecated, and the
replacement is 'ip a' from busybox or iproute2, which is inside /bin
