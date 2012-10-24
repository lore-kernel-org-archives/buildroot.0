From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Oct 2012 00:49:03 +0200
Subject: [Buildroot] Confused about kernel-headers.
In-Reply-To: <CAG_HyLzE8YJkdyrTCXzNeM6=8YvCfR7xdd6DBRW7rjj091FY0Q@mail.gmail.com>
References: <CAG_HyLzE8YJkdyrTCXzNeM6=8YvCfR7xdd6DBRW7rjj091FY0Q@mail.gmail.com>
Message-ID: <20121025004903.4bdbe8ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Randy Graham,

On Wed, 24 Oct 2012 15:41:16 -0700, Randy Graham wrote:

> I am using buildroot snapshot 2012.10 to build a linux-3.7-rc1 kernel for
> an ARM board and see that the latest kernel-header selectable is 3.5.x (3.7
> headers are not listed).
> 
> So, my questions are:
> 
> 1. Why do I need to specify a kernel-headers version when the source
> tarball for linux-3.7-rc1 already has it ?

You can specify a custom kernel headers version, but generally that's
not necessary. Just pick a sufficiently recent kernel version.

> 2. How does buildroot use the specified kernel-headers version?

It uses it to download kernel sources, that are used to extract kernel
headers needed to build the C library, part of the cross-compiling
toolchain. The kernel headers version does not have to be the same as
the kernel version you're building and running on your platform, see
below.

> 3. How do I go about adding the 3.7 headers if they must be used with my
> 3.7 kernel ?

They don't have to be used with the 3.7 kernel. There are often a lot
of misunderstandings on how kernel headers work.

When you run version X of the kernel on your embedded platform, it is
not a problem if your toolchain uses kernel headers from version Y of
the kernel, as long as Y <= X.

The kernel to userspace ABI is backward compatible: anything that was
available in the 3.5 kernel to userspace ABI (as described by the
kernel headers of the 3.5 kernel sources) will also be available in the
3.7 kernel. So there is absolutely no problem in running a 3.7 kernel
on a device, and having the userspace applications built with a
toolchain that has used 3.5 kernel headers.

The only thing you may loose are additional userspace interfaces added
by the 3.6 and 3.7 kernels, but those interface additions are
relatively infrequent, and they generally require a new C library
version anyway to be exposed through C library functions.

So for your project: no worry, 3.5 kernel headers, and 3.7-rc1 kernel
version will work just fine.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
