From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 20:03:43 -0300
Subject: [Buildroot] [PATCH 1/2] package/powertop: needs ncursesw
In-Reply-To: <XnsA46AB9F2F3F85berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1427472097-30708-1-git-send-email-bernd.kuhls@t-online.de>
 <20150327173446.779683cf@free-electrons.com>
 <XnsA46AB9F2F3F85berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <551B27CF.9050402@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/27/2015 02:16 PM, Bernd Kuhls wrote:

> Hi,
> 
> powertop is a weird piece of code;)
> 
> Using this defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_POWERTOP=y
> 
> configure works
> 
> checking for NCURSES... no
> checking for library containing delwin... -lncurses
> [...]
> 
> but then this happens:
> 
> lib.cpp: In function 'void align_string(char*, size_t, size_t)':
> lib.cpp:271:59: error: 'mbsrtowcs' was not declared in this scope
>   sz = mbsrtowcs(NULL, (const char **)&buffer, max_sz, NULL);
> 
> Afaics mbsrtowcs() is a function which is only available with a wchar-enabled 
> toolchain, so my patch does the right thing, but the description needs some 
> additions.

Hi.
Actually mb* and wc* usage is a pointer towards wchar, yes.
But in ncurses-land there's no need for ncursesw since powertop doesn't
use any of the wide (*_wch) variant functions.
Hence it just sucks at finding libncurses: you can drop the
NCURSES_WCHAR select and do something like:

$(if $(BR2_PACKAGE_NCURSES_WCHAR),y)
POWERTOP_CONF_ENV += ac_cv_search_delwin="-lncursesw"
else
POWERTOP_CONF_ENV += ac_cv_search_delwin="-lncurses"
fi

(or in a single if if you're so inclined).

Regards.
