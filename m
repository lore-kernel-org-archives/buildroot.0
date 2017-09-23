From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 18:28:28 +0200
Subject: [Buildroot] [PATCH 22/49 v2] package/dahdi-tools: add USB
	support
In-Reply-To: <4fc439b83d4974f15558cf6963b500862d0a85bc.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <4fc439b83d4974f15558cf6963b500862d0a85bc.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <00872d3f-c545-9ee9-6781-06c782fb7a22@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

 I'm in the process of applying this series. Small problem here.

On 09-09-17 23:39, Yann E. MORIN wrote:
> dahdi-tools can use either libusb-1.0.x or libusb-0.1.x, and Buildroot
> packages both, respectively as libusb and as libusb-compat.

[snip]
> +# Note: libsubx was a fork of libusb, which was merged back into
> +# libusb for the 1.0.18 release in early 2014, but it looks like
> +# dahdi-tools uses the libusbx vs. libusb to differentiate whether
> +# to use the 1.0.x vs. 0.9.x libusb. Since in Buildroot, libusb-compat
> +# anyway depends on libusb, presence of libusb-compat means that
> +# libusb is enabled, so we only support libusb for dahdi-tools.
> +#
> +# Yet, we must ensure build-ordering in case libusb-compat id enabled.

 That bit doesn't make sense to me. Since we always pass --without-libusb, why
would this be needed?

> +#
> +# Yes, this is very confusing.
> +#
> +ifeq ($(BR2_PACKAGE_LIBUSB),y)
> +DAHDI_TOOLS_DEPENDENCIES += libusb
> +DAHDI_TOOLS_CONF_OPTS += --with-usb --with-libusbx
> +ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
> +DAHDI_TOOLS_DEPENDENCIES += libusb-comapt

 This will surely give a build error :-)

 Regards,
 Arnout

> +endif
> +else
> +DAHDI_TOOLS_CONF_OPTS += --without-usb --without-libusbx
> +endif
> +
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
