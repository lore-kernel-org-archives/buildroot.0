From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 17 Oct 2014 15:40:11 +0000
Subject: [Buildroot] [PATCH v2] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <CABbD_XBjo-UJf95vFi5innY4db=CzKDLeKqgXSsmEsf7eWw5yw@mail.gmail.com>
References: <1413132543-7148-1-git-send-email-abrodkin@synopsys.com>
 <CABbD_XBjo-UJf95vFi5innY4db=CzKDLeKqgXSsmEsf7eWw5yw@mail.gmail.com>
Message-ID: <1413560410.19660.5.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Karoly,

On Tue, 2014-10-14 at 13:16 +0200, K?roly Kasza wrote:
> Hi,
> 
> 
> I tested this patch, found a minor issue:
> You can select a kernel, then select "Use Linux kernel specified for
> target" for toolchain headers, then go back to kernel and choose "Same
> as toolchain kernel headers" option. This makes
> 
> BR2_KERNEL_HEADERS_SAME_AS_KERNEL=y
> BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
> selected together.
> This produces this error:
> 
> 
> ---------------------------------------------------------------------------
> >>> linux-headers  Downloading
> --2014-10-14 12:10:52--
>  https://www.kernel.org/pub/linux/kernel/v3.x/linux-.tar.xz
> Resolving www.kernel.org (www.kernel.org)... 198.145.20.140,
> 149.20.4.69, 199.204.44.194, ...
> Connecting to www.kernel.org (www.kernel.org)|198.145.20.140|:443...
> connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2014-10-14 12:10:54 ERROR 404: Not Found.
> 
> 
> --2014-10-14 12:10:54--  http://sources.buildroot.net/linux-.tar.xz
> Resolving sources.buildroot.net (sources.buildroot.net)...
> 176.9.16.109
> Connecting to sources.buildroot.net (sources.buildroot.net)|
> 176.9.16.109|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2014-10-14 12:10:54 ERROR 404: Not Found.
> 
> 
> make: ***
> [/home/scythe/buildroot/output/build/linux-headers-/.stamp_downloaded]
> Error 1
> ---------------------------------------------------------------------------

Well I sort of expected those kind of issues with cross-dependent
features.

> 
> This can be prevented by making a change
> in package/linux-headers/Config.in.host:
> ...
> +       config BR2_KERNEL_HEADERS_SAME_AS_KERNEL
> +               bool "Use Linux kernel specified for target"
> +               depends on BR2_LINUX_KERNEL
> +               depends on !BR2_LINUX_KERNEL_SAME_AS_HEADERS
> ...

Thanks for this, but unfortunately this is not the only problem.
Much more significant one is how to get kernel sources for
"linux-headers" package from the same location as "linux" package will
get them.

We cannot rely on internal variables of "linux" package like LINUX_xxx
because they could be resolved later than we need them.

So we need to do the same one calculations as we do in "linux.mk" see:
linux/linux.mk: # Compute LINUX_SOURCE and LINUX_SITE from the
configuration

In the best case it's dummy code duplication which inevitably will bite
us in the future. Still I didn't find any better solution. Any input is
much appreciated.

-Alexey
