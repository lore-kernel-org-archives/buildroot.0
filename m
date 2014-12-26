From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 15:04:38 +0100
Subject: [Buildroot] building fbtft framebuffer drivers into buildroot.
In-Reply-To: <20141226102028.GA3982@free.fr>
References: <CAFGceHGR2k7ARYDZqK0pskkNbd6wiguLkMdZ07zpPENW+NAZxw@mail.gmail.com>
 <20141226102028.GA3982@free.fr>
Message-ID: <20141226150438.08e429c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 26 Dec 2014 11:20:29 +0100, Yann E. MORIN wrote:

> I've had a look at this package, and unfortunately, it will be hard to
> get it packaged in Buildroot.
> 
> The problem is that this kernel module does not compile as an
> out-of-tree module, and their buildsystem is made so that it requires
> the kernel be patched.
> 
> This is not posible with Buildroot.

Well, yes and no. Indeed it is much easier to package if the stuff can
be built as an out-of-tree module. However, we have two examples of
things packaged in Buildroot that require patching the kernel: Xenomai
and RTAI. They use a loosely defined model that we could name "Linux
extension", see linux/linux-ext-*.mk. They basically hook up into the
Linux build process by adding some stuff to LINUX_PRE_PATCH_HOOKS.

I recently had a look at the aufs stuff, and it has the same problem:
not only it is made of modules that can be built out-of-tree, but it
also needs to patch the kernel (some core VFS changes).

So, I haven't looked at all the fbtft stuff. If it's a set of
standalone drivers that don't require any modification to the core of
the kernel, then indeed, turning them into out-of-tree modules can be a
good idea. If not, then using the "linux-ext" model can be a solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
