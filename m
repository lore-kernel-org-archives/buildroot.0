From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Oct 2014 23:19:18 +0200
Subject: [Buildroot] [PATCH v2] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <CABbD_XBjo-UJf95vFi5innY4db=CzKDLeKqgXSsmEsf7eWw5yw@mail.gmail.com>
References: <1413132543-7148-1-git-send-email-abrodkin@synopsys.com>
 <CABbD_XBjo-UJf95vFi5innY4db=CzKDLeKqgXSsmEsf7eWw5yw@mail.gmail.com>
Message-ID: <20141017211918.GH3971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-10-14 13:16 +0200, K?roly Kasza spake thusly:
> Hi,
> 
> I tested this patch, found a minor issue:
> You can select a kernel, then select "Use Linux kernel specified for
> target" for toolchain headers, then go back to kernel and choose "Same as
> toolchain kernel headers" option. This makes
> BR2_KERNEL_HEADERS_SAME_AS_KERNEL=y
> BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
> selected together.
> This produces this error:
> 
> ---------------------------------------------------------------------------
> >>> linux-headers  Downloading
> --2014-10-14 12:10:52--
> https://www.kernel.org/pub/linux/kernel/v3.x/linux-.tar.xz
> Resolving www.kernel.org (www.kernel.org)... 198.145.20.140, 149.20.4.69,
> 199.204.44.194, ...
> Connecting to www.kernel.org (www.kernel.org)|198.145.20.140|:443...
> connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2014-10-14 12:10:54 ERROR 404: Not Found.
> 
> --2014-10-14 12:10:54--  http://sources.buildroot.net/linux-.tar.xz
> Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
> Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80...
> connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2014-10-14 12:10:54 ERROR 404: Not Found.
> 
> make: ***
> [/home/scythe/buildroot/output/build/linux-headers-/.stamp_downloaded]
> Error 1
> ---------------------------------------------------------------------------
> 
> This can be prevented by making a change in package/linux-headers/
> Config.in.host:
> ...
> +       config BR2_KERNEL_HEADERS_SAME_AS_KERNEL
> +               bool "Use Linux kernel specified for target"
> +               depends on BR2_LINUX_KERNEL
> +               depends on !BR2_LINUX_KERNEL_SAME_AS_HEADERS

Actually, I'd prefer the other way around:

    config BR2_LINUX_KERNEL_SAME_AS_HEADERS
        depends on !BR2_KERNEL_HEADERS_SAME_AS_KERNEL

Because it makes more sense to have the headers be the same as the
running kernel, rather than have the kernel be the same as the one used
for the headers.

(logically, it is the same, but the first one means that the headers
derive from the running kernel, which is IMHO much more appropriate.)

Regards,
Yann E. MORIN.

> ...
> 
> Regards,
> Karoly
> 
> 
> 
> On Sun, Oct 12, 2014 at 6:49 PM, Alexey Brodkin <alexey.brodkin@gmail.com>
> wrote:
> 
> > From: Karoly Kasza <kaszak@gmail.com>
> >
> > This is a re-work of http://patchwork.ozlabs.org/patch/346823/
> >
> > In buildroot kernel headers used for building toolchain come from upstream
> > kernel sources (even though user may specify version, but not origin).
> >
> > This change makes it possible to use exactly the same sources for both
> > headers during toolchain building and for kernel building itself.
> >
> > Moreover if "kernel" is selected to be built by defaut its sources will
> > be used for kernel headers on toolchain build.
> >
> > That way user might be sure that ABI mismatch won't happen between
> > toolchain
> > and kernel.
> >
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> >
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > ---
> > Changes v1 -> v2:
> >  * Make sure "Custom kernel headers series" is selected so
> >    BR2_TOOLCHAIN_HEADERS_AT_LEAST is properly set.
> > ---
> >  package/linux-headers/Config.in.host   | 14 ++++++++++++--
> >  package/linux-headers/linux-headers.mk |  7 +++++++
> >  2 files changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/linux-headers/Config.in.host
> > b/package/linux-headers/Config.in.host
> > index 101136a..4551daf 100644
> > --- a/package/linux-headers/Config.in.host
> > +++ b/package/linux-headers/Config.in.host
> > @@ -5,6 +5,7 @@ comment "Kernel Header Options"
> >
> >  choice
> >         prompt "Kernel Headers"
> > +       default BR2_KERNEL_HEADERS_SAME_AS_KERNEL if BR2_LINUX_KERNEL
> >         default BR2_KERNEL_HEADERS_3_17
> >         help
> >           Select the version of kernel header files you wish to use.
> > @@ -69,6 +70,13 @@ choice
> >
> >         config BR2_KERNEL_HEADERS_VERSION
> >                 bool "Manually specified Linux version"
> > +
> > +       config BR2_KERNEL_HEADERS_SAME_AS_KERNEL
> > +               bool "Use Linux kernel specified for target"
> > +               depends on BR2_LINUX_KERNEL
> > +               help
> > +                 Use the Linux kernel specified for the target in
> > +                 the Kernel menu.
> >  endchoice
> >
> >  config BR2_DEFAULT_KERNEL_VERSION
> > @@ -80,10 +88,12 @@ config BR2_DEFAULT_KERNEL_VERSION
> >
> >  choice
> >         bool "Custom kernel headers series"
> > -       depends on BR2_KERNEL_HEADERS_VERSION
> > +       depends on BR2_KERNEL_HEADERS_VERSION ||
> > BR2_KERNEL_HEADERS_SAME_AS_KERNEL
> >         default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
> >         help
> > -         Set to the kernel headers series you manually set above.
> > +         Set to the kernel headers series you manually entered in
> > +         "linux version" field or matching version of specific kernel
> > selected
> > +         for building in "kernel" section.
> >
> >           This is used to hide/show some packages that have strict
> >           requirements on the version of kernel headers.
> > diff --git a/package/linux-headers/linux-headers.mk
> > b/package/linux-headers/linux-headers.mk
> > index d770927..29a9b38 100644
> > --- a/package/linux-headers/linux-headers.mk
> > +++ b/package/linux-headers/linux-headers.mk
> > @@ -7,6 +7,12 @@
> >  # This package is used to provide Linux kernel headers for the
> >  # internal toolchain backend.
> >
> > +ifeq ($(BR2_KERNEL_HEADERS_SAME_AS_KERNEL),y)
> > +LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
> > +LINUX_HEADERS_SOURCE = $(LINUX_SOURCE)
> > +LINUX_HEADERS_SITE = $(LINUX_SITE)
> > +LINUX_HEADERS_SITE_METHOD = $(LINUX_SITE_METHOD)
> > +else
> >  LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
> >  ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
> >  LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
> > @@ -14,6 +20,7 @@ else
> >  LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
> >  endif
> >  LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
> > +endif
> >
> >  LINUX_HEADERS_INSTALL_STAGING = YES
> >
> > --
> > 1.9.3
> >
> >
> 
> 
> -- 
> 
> ?dv,
> KK

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
