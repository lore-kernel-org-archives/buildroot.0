From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Nov 2015 19:22:43 +0100
Subject: [Buildroot] [PATCH] libgsasl: fix auto dependencies
In-Reply-To: <1448560021-14096-1-git-send-email-gustavo@zacarias.com.ar>
References: <1448560021-14096-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151126192243.098b65ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Thu, 26 Nov 2015 14:47:01 -0300, Gustavo Zacarias wrote:
> IDN can be picked up from the distro installation so use a prefix when
> it's available or otherwise just disable it, fixes:
> http://autobuild.buildroot.org/results/5d9/5d9baf528c47c5167ec8d2a6941cb06b4ca761ca/
> 
> Also disable libgcrypt support which wasn't accounted for and doesn't
> seem to work either to possibly avoid the same problem.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libgsasl/libgsasl.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
> index f2660ca..00ce8e0 100644
> --- a/package/libgsasl/libgsasl.mk
> +++ b/package/libgsasl/libgsasl.mk
> @@ -9,6 +9,14 @@ LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
>  LIBGSASL_LICENSE = LGPLv2.1+ (library), GPLv3+ (programs)
>  LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
>  LIBGSASL_INSTALL_STAGING = YES
> -LIBGSASL_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBIDN),libidn)
> +# It doesn't seem to build with our libgcrypt so better be safe
> +LIBGSASL_CONF_OPTS = --without-libgcrypt
> +
> +ifeq ($(BR2_PACKAGE_LIBIDN),y)
> +LIBGSASL_CONF_OPTS += --with-libidn-prefix=$(STAGING_DIR)/usr
> +LIBGSASL_DEPENDENCIES += libidn
> +else
> +LIBGSASL_CONF_OPTS += --without-stringprep
> +endif

It is not immediately clear why --without-stringprep is used here
instead of --without-libidn, so this probably warrants a comment in the
code or at least in the commit log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
