From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Thu, 13 Sep 2018 21:53:14 +0200
Subject: [Buildroot] [PATCH 1/3] ti-sgx-libgbm: new package
In-Reply-To: <20180913173447.7edae0a2@windsurf>
References: <1530773875-19452-1-git-send-email-tolvupostur@gmail.com>
 <20180913173447.7edae0a2@windsurf>
Message-ID: <CABhNV209XUpbEfLvyVbQsfVKGhTbOsvNNuX7YAQ_jakPRzpyJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oh boy,

This was all before the birth of my first child, which seems like a
lifetime ago.

A virtual package would be fine, but I have no other comments on the 2
newest mails.

On Thu, 13 Sep 2018 at 17:34, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Einar,
>
> On Thu,  5 Jul 2018 08:57:53 +0200, Einar Jon Gunnarsson wrote:
> > ti-sgx-libgbm is a required package for ti-sgx-um in SDK 4.00
> >
> > Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>
> I tested this package, and it didn't build because it depends on libdrm
> and udev, and those dependencies are not taken into account.

I didn't think of that. I only built it on the
beaglebone-qt_defconfig, and my own am335 config,
which both have udev and libdrm.

> > diff --git a/package/ti-sgx-libgbm/Config.in b/package/ti-sgx-libgbm/Config.in
> > new file mode 100644
> > index 0000000..07536d9
> > --- /dev/null
> > +++ b/package/ti-sgx-libgbm/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_TI_SGX_LIBGBM
> > +     bool "ti-sgx-libgbm"
> > +     depends on BR2_PACKAGE_TI_SGX_KM
>
> Is there a reason for having this dependency ? It does not require
> having the kernel or the kernel modules built in order to build
> ti-sgx-libgbm.

This dependency is mostly there for consistency with the other
BR2_PACKAGE_TI_SGX_*
packages.
ti-sgx-um and ti-sgx-demos are like this, which makes hiding them in
menuconfig easier.
This one is the ti-sgx implementation of the mesa libgbm, and the
shared libs in ti-sgx-um
depend on it. It probably won't be useful on anything that else than
ARMs that use ti-sgx-um
(which also depends on ti-sgx-km).
So what are you trying to build them on?

Building the package is one thing, but what is the point of building
it if you don't have anything
that can use it? I think you need the ti-sgx kernel module for
anything meaningful.

Note that Mesa3D does not build on ARM, and this only builds on a
subset of ARM, so it is literally
impossible to create a defconfig that contains both implementations of
libgbm. Conflicts can't happen.

-- 
Regards
Einar J?n
