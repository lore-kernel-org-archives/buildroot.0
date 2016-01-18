From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 23:21:45 +0100
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <20160118221343.GD3380@free.fr>
References: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
 <20160109172908.GA3444@free.fr> <87y4bn6y5s.fsf@dell.be.48ers.dk>
 <20160118214704.GA3380@free.fr>
 <20160118230345.52b8f054@free-electrons.com>
 <20160118221343.GD3380@free.fr>
Message-ID: <20160118232145.32bfbd40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 18 Jan 2016 23:13:43 +0100, Yann E. MORIN wrote:

> IIRC, I think I already suggested that we set the version string from
> Kconfig, a bit like:
> 
>     choice
>         bool "headers version"
> 
>     [...]
> 
>     config BR2_PKG_HEADERS_AS_KERNEL
>         bool "like kernel"
>         depends on BR2_LINUX_KERNEL
> 
>     comment "blabla needs a kernel to be built"
>         depends on !BR2_LINUX_KERNEL
> 
>     [...]
> 
>     endchoice
> 
>     config BR2_DEFAULT_KERNEL_HEADERS
>         string
>         default BR2_LINUX_KERNEL_VERSION if BR2_PKG_HEADERS_AS_KERNEL

This is not sufficient. If you select "custom tarball", or "local",
then BR2_LINUX_KERNEL_VERSION just contains "custom". Or it will
contain just the Git tag/commit id, or just the Mercurial version. You
still lack the repo/tarball URL/local directory.

But if you have a proposal based on that, that takes into account those
issues, don't hesitate to submit a patch.

Alternatively, what we could do is simply duplicate some code from
linux.mk into linux-headers.mk and therefore have linux-header.mk
directly poke at the linux/Config.in variables. Not nice, but it solves
a long-standing request, and we don't change that often the Linux
download/patch logic.

I was trying to think of getting rid of the linux-headers package and
have the linux package provide the headers for the toolchain, but I
don't see a really feasible way of doing this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
