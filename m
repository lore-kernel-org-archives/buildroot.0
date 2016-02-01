From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 1 Feb 2016 17:27:52 +0100
Subject: [Buildroot] [PATCH] libcurl: enable mbedtls support
In-Reply-To: <1452106417-12097-1-git-send-email-gustavo@zacarias.com.ar>
References: <1452106417-12097-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <56AF8788.7090702@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Gustavo Zacarias wrote:
> Now that we've got an mbedtls package in the tree we can enable the
> optional support for it in libcurl.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/libcurl/libcurl.mk | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 10514c6..8798d71 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -40,10 +40,12 @@ else ifeq ($(BR2_PACKAGE_LIBNSS),y)
>   LIBCURL_CONF_OPTS += --with-nss=$(STAGING_DIR)/usr
>   LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
>   LIBCURL_DEPENDENCIES += libnss
> +else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +LIBCURL_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr
> +LIBCURL_DEPENDENCIES += mbedtls
>   else
> -# polarssl support needs 1.3.x

This is unrelated to your change, it should be a separate patch. But
anyway I don't understand why it should be removed: we still package
polarssl 1.2.18, so the comment should still apply. Am I missing
something?

With that fixed (or explained):
  Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

And:
[Built with/without mbedtls, ran on qemu, checked that 'curl -V' shows
the SSL only with mbedtls]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
