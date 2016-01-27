From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 09:21:19 +0100
Subject: [Buildroot] glibc and --enable-kernel
In-Reply-To: <20160127042104.GA6719@tungsten.ozlabs.ibm.com>
References: <20160127042104.GA6719@tungsten.ozlabs.ibm.com>
Message-ID: <20160127092119.7cf8953d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On Wed, 27 Jan 2016 15:21:04 +1100, Sam Bobroff wrote:

> I've noticed that when building glibc, buildroot's configure command doesn't
> pass any "--enable-kernel" option, which according to the documentation...
> 
> http://www.gnu.org/software/libc/manual/html_node/Configuring-and-compiling.html
> 
> ... means that glibc is always built to support the oldest possible kernel.
> 
> At first this seems like a good idea but the documentation is misleading, and
> it actually causes two problems:
> 
> 1) Unnecessary compat code: If you've built a kernel and glibc together
> (presumably this is common when using buildroot) then you have no need of any
> compat code because the only kernel you'll be using is the one you just built.
> According to the doc (above) this causes glibc to include unnecessary compat
> code which slows it down.
> 
> 2) Availability of new features: It appears from the code that the
> documentation leaves out some important information. What actually happens
> while building glibc is that the "minimum kernel version" (which is either the
> version given by "--enable-kernel=" or the oldest possible version for that
> architecture) sets both __LINUX_KERNEL_VERSION and __ABI_TAG_VERSION so that
> glibc will never use any kernel features *newer* than this version. Therefore
> you cannot get access to recent kernel features *at all* via glibc (without
> manually altering glibc.mk).

Thanks a lot for spotting this problem and for the explanation,
definitely makes sense.

> (An example of a recent feature would be the sendmmsg syscall, which
> requires a kernel version of 3.0.0 but the minimum version for PowerPC 64 is
> 2.6.24.)

Ah, so you're working on PowerPC 64, great! We have a toolchain build
problem that I reported on Power PC 64, when building for Power 8:

  http://lists.busybox.net/pipermail/buildroot/2016-January/150338.html

If you have some time to look at it, it would be great.

> I'd like to prepare a patch to make this configurable, and it obviously
> wouldn't be difficult to add but I'm not sure of the best way to do it.
> 
> The most obvious way seems to be to add a menu item to the Toolchain menu, just
> after "glibc version" (and only enabled when glibc is the C library), called
> "glibc kernel API version" with a default value of "same as kernel headers".
> The other options would be "as old as possible" or a specific version.
> 
> Comments?

I don't think you need to add additional options. We should just use
the kernel version of the chosen kernel headers, since we're guaranteed
that the running kernel will be at least more recent than the kernel
headers being used.

I.e, can you try something such as:

	--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))

BR2_TOOLCHAIN_HEADERS_AT_LEAST will be 3.0 if you use some 3.0.x kernel
headers for your toolchain.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
