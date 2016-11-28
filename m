From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 23:24:53 +0100
Subject: [Buildroot] [PATCH 4/6] ntp: fix missing optional dependencies
In-Reply-To: <20161114132238.6569-5-jezz@sysmic.org>
References: <20161114132238.6569-1-jezz@sysmic.org>
 <20161114132238.6569-5-jezz@sysmic.org>
Message-ID: <20161128232453.6f8d3f36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 14:22:36 +0100, J?r?me Pouiller wrote:
> ntpq and ntpdc may depends on libedit and libcap.
> 
> $ arm-linux-readelf -d ./usr/bin/ntpdc | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libcap.so.2]
>  0x00000001 (NEEDED)                     Shared library: [libm.so.6]
>  0x00000001 (NEEDED)                     Shared library: [libedit.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libncursesw.so.6]
>  0x00000001 (NEEDED)                     Shared library: [libssl.so.1.0.0]
>  0x00000001 (NEEDED)                     Shared library: [libcrypto.so.1.0.0]
>  0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.6]
> 
> However, build order with these libraries is not defined.
> 
> In order to keep things simple, we enforce build order even if ntpq/ntpdc are
> not selected.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

I've applied your patch, after doing one small change, see below.

> +ifeq ($(BR2_PACKAGE_LIBEDIT),y)
> +NTP_CONF_OPTS += --with-lineeditlibs=edit
> +NTP_DEPENDENCIES += libedit
> +else
> +NTP_CONF_OPTS += --with-lineeditlibs=""

I've replaced this by --without-lineeditlibs, which has the same
effect but is more commonly used in Buildroot. I did check that with
the libedit package installed, but forcing --without-lineeditlibs
really causes ntp to ignore libedit, which proves that it does work.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
