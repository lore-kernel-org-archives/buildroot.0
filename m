From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 14:07:16 +0200
Subject: [Buildroot] [PATCH v2] tn5250: fix static build with openssl
In-Reply-To: <d48309c2a902001ef0cd019279cb34d377690733.1440588928.git.baruch@tkos.co.il>
References: <d48309c2a902001ef0cd019279cb34d377690733.1440588928.git.baruch@tkos.co.il>
Message-ID: <20150826140716.62975ed9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Wed, 26 Aug 2015 14:35:28 +0300, Baruch Siach wrote:
> OpenSSL needs libz. Use pkg-config to find dependencies.
> 
> Fixes:
> http://autobuild.buildroot.net/results/95f/95f6df0d01e4944ecd84e830e2bbd8389e1d3e3d/
> http://autobuild.buildroot.net/results/432/432b1fdec1e6282d51ba1d859c0f4ab9ed2a5efc/
> http://autobuild.buildroot.net/results/d6a/d6a7125c21b4f92b69bb9e30b05c4727eedb63ba/
> 
> and more.
> 
> Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>    Use '--libs openssl' instead of listing the actual libraries (Vicente)
> ---
>  package/tn5250/tn5250.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
> index 213f02cb68e8..a5b70aa019a4 100644
> --- a/package/tn5250/tn5250.mk
> +++ b/package/tn5250/tn5250.mk
> @@ -13,7 +13,8 @@ TN5250_LICENSE_FILES = COPYING
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  TN5250_CONF_OPTS += --with-ssl-dir=$(STAGING_DIR)/usr
> -TN5250_DEPENDENCIES += openssl
> +TN5250_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"

I've changed this line to use += instead of = to avoid future mistakes,
and applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
