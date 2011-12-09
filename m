From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Dec 2011 20:09:26 +0100
Subject: [Buildroot] [PATCH] linux: support "local" as download method
In-Reply-To: <CAEvN+1hUU4Xd+BuMn+5DmdHAYx2Oue8QeruW50FLH0+LJ3PB2A@mail.gmail.com>
References: <1323255396-28263-1-git-send-email-tjlee@ambarella.com>
 <CAEvN+1j08xz+a+sz_3vmUa8tQ18xnv+9KR2MA9E_ub-SZeerEA@mail.gmail.com>
 <20111208223000.72d8e084@skate>
 <CAEvN+1hUU4Xd+BuMn+5DmdHAYx2Oue8QeruW50FLH0+LJ3PB2A@mail.gmail.com>
Message-ID: <20111209200926.09b1818d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 9 Dec 2011 10:44:24 +0800,
Tzu-Jung Lee <roylee17@gmail.com> a ?crit :

> But soon I realized that our team may need another METHOD to support
> out use case.
> Have we considered IN-PLACE build alternative or option?

> 
> 
> For most of the packages, it is good enough for users/developers to
> leverage the power of buildroot to
> 
>     fetch, ..., configure, build, mkimage
> 
> However for some packages, ex: linux kernel, that a team or company
> actually works on,
> 
>    modify, configure, build, mkimage
> 
> has much higher frequency than the former case.

The "override source directory" mechanism allows this, as explained in
the blog post at http://free-electrons.com/blog/buildroot-2011-11/.

Basically, the first time you will do the build, Buildroot will do a
full copy of the Linux kernel sources to the Buildroot build directory.
But then, subsequent calls to "make linux-rebuild" will only :

 * Do a "rsync" of the build tree, so it will be very fast

 * Restart the build process (will only rebuild what you have changed)

 * Re-run the installation process

So this is exactly what you want.

Supporting "in-place" building in the infrastructure is simply not
possible. Buildring directory in the source directory cannot work,
because some packages needs to be built *twice* : once for the host,
once for the target. So we definitely need two build directories for
those packages. Of course, this is not the case for the Linux kernel,
which is always built for the target in Buildroot, but the package
infrastructure is common to all packages, so we have to take into
account this constraint.

One possibility is to support out-of-tree building, which we discussed
at the latest Buildroot meeting in Prague, see
http://lists.busybox.net/pipermail/buildroot/2011-November/047229.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
