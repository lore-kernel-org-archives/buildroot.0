From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 12:51:06 +0200
Subject: [Buildroot] [PATCH v3 2/3] package/pugixml: enable install of
 pugixml.pc
In-Reply-To: <20190616201621.23912-2-bernd.kuhls@t-online.de>
References: <20190616201621.23912-1-bernd.kuhls@t-online.de>
 <20190616201621.23912-2-bernd.kuhls@t-online.de>
Message-ID: <20190617125106.67d8ccf1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Jun 2019 22:16:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed for waylandpp >= 0.2.4 to detect pugixml:
> https://github.com/NilsBrause/waylandpp/commit/0a61175003a0a34038e39092918768360d2dd1da#diff-af3b638bc2a3e6c650974192a53c7291R39
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: no changes
> v2: changed variables for HOST_PUGIXML_CONF_OPTS (Thomas)
> 
>  package/pugixml/pugixml.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
> index 6f214c4de8..368f958920 100644
> --- a/package/pugixml/pugixml.mk
> +++ b/package/pugixml/pugixml.mk
> @@ -15,6 +15,7 @@ PUGIXML_INSTALL_STAGING = YES
>  # force-enable this option to support older gcc versions. See also:
>  # https://gcc.gnu.org/onlinedocs/gcc/Long-Long.html
>  PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
> +HOST_PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG

How is this related to install the .pc file ? Shouldn't this go in PATCH 1/3 ?

>  
>  ifeq ($(BR2_PACKAGE_PUGIXML_XPATH_SUPPORT),)
>  PUGIXML_BUILD_DEFINES += PUGIXML_NO_XPATH
> @@ -30,5 +31,9 @@ ifdef PUGIXML_BUILD_DEFINES
>  PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
>  endif
>  
> +HOST_PUGIXML_CONF_OPTS += \
> +	-DBUILD_PKGCONFIG=ON \

I understand why this is in this patch.

> +	-DBUILD_DEFINES="$(subst $(space),;,$(HOST_PUGIXML_BUILD_DEFINES))"

But this should be in PATCH 1/3, no ?

In fact, is it really useful to split PATCH 1/3 and 2/3 ? Both are just
about enabling the host variant of pugixml, we don't really need to
separate the installation of the .pc file in another patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
