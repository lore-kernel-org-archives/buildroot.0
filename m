From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Sat, 15 Sep 2018 13:14:41 +0200
Subject: [Buildroot] [PATCH 1/3] ti-sgx-libgbm: new package
In-Reply-To: <20180914091851.6a922cda@windsurf>
References: <1530773875-19452-1-git-send-email-tolvupostur@gmail.com>
 <20180913173447.7edae0a2@windsurf>
 <CABhNV209XUpbEfLvyVbQsfVKGhTbOsvNNuX7YAQ_jakPRzpyJQ@mail.gmail.com>
 <20180914091851.6a922cda@windsurf>
Message-ID: <CABhNV20EHsChQZV=BgxEWusvKch1wMUL4OOjxB5_B3wzPjHWdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK.

So I had time to look at this.
I think the whole thing needs to be reworked. Let's park it for now.
I'll wait for the virtual package to be merged and then add a new
fully tested patch against a more recent master.
If someone bumps beaglebone_defconfig to kernel 4.14.40 (current ti
sdk 5.00), then I would bring beaglebone_qt_defconfig all the way up
to that one.

On Fri, 14 Sep 2018 at 09:18, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> > > Is there a reason for having this dependency ? It does not require
> > > having the kernel or the kernel modules built in order to build
> > > ti-sgx-libgbm.
> >
> I wanted to quickly build test ti-sgx-libgbm, and not have to build a
> kernel + kernel modules, so I dropped the "depends on" on TI SGX kernel
> modules.
> > Building the package is one thing, but what is the point of building
> > it if you don't have anything
> > that can use it? I think you need the ti-sgx kernel module for
> > anything meaningful.
>
> Build testing :-)
>

But you don't need to build ti-sgx-km (and therefore kernel) to
build this package. This is just to hide it in menuconfig.
I added these:
# make sure libdrm builds udev
ti-sgx-um: depends on BR2_PACKAGE_HAS_UDEV
# lazy way to add all the depends of ti-sgx-um
ti-sgx-libgbm: depends on BR2_PACKAGE_TI_SGX_UM
# make sure we have libdrm+udev for ti-sgx-libgbm
TI_SGX_LIBGBM_DEPENDENCIES += libdrm
Then 'make ti-sgx-libgbm' on an empty folder works fine, and doesn't build
kernel or ti-sgx-km/ti-sgx-um.

I just noticed that  ti-sgx-demos depends on ti-sgx-um, not ti-sgx-km.
This one is the same, I doubt that anyone can use it without ti-sgx-um.
So it might make more sense to just make this depend on ti-sgx-um.
But since ti-sgx-um selects it, it can't be selected alone
(always "-*-" in menuconfig or hidden/disabled).
How do you guys like to handle that kind of dependency?

> As explained above, Mesa3D is available on ARM. While it indeed doesn't
> have support for the PowerVR in TI platforms, you can still enable
> Mesa3D using the softpipe or llvmpipe drivers on ARM TI platforms, so
> it is possible to have a conflict.

You're right. I just always assumed Mesa was for Intel CPUs.
Virtual package FTW.

--
Regards
Einar J?n
