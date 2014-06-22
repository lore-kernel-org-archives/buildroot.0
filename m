From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Jun 2014 20:26:23 +0300
Subject: [Buildroot] [PATCH] package/knock: fix static build with libusb
In-Reply-To: <1403456696-8122-1-git-send-email-yann.morin.1998@free.fr>
References: <1403456696-8122-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140622172623.GC4155@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jun 22, 2014 at 07:04:56PM +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> knock depends on libpcap, that has an optional dependency on libusb.
> Alas, libpcap does not install a .pc file, so knock does not know
> that it should link with -lusb-1.0.

But libpcap does provide pcap-config for this. We already use it to fix static 
build against libpcap in a number of packages. Just posted a patch doing the 
same for knock.

baruch

> 
> When linking dynamically, this is not an issue, since the linker does
> follow the DT_NEEDED tags of libpcap, and thus pulls libusb-1.0 in at
> the same time. And since linusb uses threads, libpthread is pulled in
> as well.
> 
> However, when linking statically, all of this fails.
> 
> Fix that by telling knock's ./configure what libraries to link with
> when doing a static build and libusb is enabled.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/1eb/1eb877ebd9469c9261bf114fc7733819ae3fd562/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/knock/knock.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/knock/knock.mk b/package/knock/knock.mk
> index 8d2b41e..ace23fa 100644
> --- a/package/knock/knock.mk
> +++ b/package/knock/knock.mk
> @@ -10,4 +10,8 @@ KNOCK_LICENSE = GPLv2+
>  KNOCK_LICENSE_FILES = COPYING
>  KNOCK_DEPENDENCIES = libpcap
>  
> +ifeq ($(BR2_PREFER_STATIC_LIB)$(BR2_PACKAGE_LIBUSB),yy)
> +KNOCK_CONF_OPT = LIBS="-lusb-1.0 -pthread"
> +endif
> +
>  $(eval $(autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
