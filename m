From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Fri, 30 Nov 2018 11:05:11 +0100
Subject: [Buildroot] [PATCH 1/2] package/opengl/libgbm: new virtual
 package
In-Reply-To: <CABhNV20QpHnRCEi=Ky-AKCVByGkNLRxOXfMHK5H9PCr3eBeAXA@mail.gmail.com>
References: <20180913194410.24077-1-bernd.kuhls@t-online.de>
 <20181030221420.65c7aed3@windsurf> <20181105124735.3qbms4ymnrgpw3op@flea>
 <CABhNV23smKagYKYME1Na=Cyz0+hn2BPOEpKumruu3OyAmLt1fw@mail.gmail.com>
 <20181105164347.4bd8d103@windsurf>
 <CABhNV20QpHnRCEi=Ky-AKCVByGkNLRxOXfMHK5H9PCr3eBeAXA@mail.gmail.com>
Message-ID: <CABhNV207WB2Jt11iFeWroxn7K3EDKYSiz12mhr-2+wF2hM3yJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I finally had time to play with the gbm branch on
https://git.bootlin.com/users/thomas-petazzoni/buildroot/log/
I made 5 commits that add QT with EGLFS-GBM for all 2 setups.
Can I make a pull request, or how do I share them with you?

Overview of comments:
* ca32516 - configs: libgbm defconfigs build qt5 (2018-11-30)<Einar
Jon Gunnarsson>|
|  configs/libgbm_mesa3d_defconfig     | 5 +++++
|  configs/libgbm_sunxi_mali_defconfig | 8 +++++++-
|  configs/libgbm_ti_sgx_defconfig     | 9 +++++----
|  3 files changed, 17 insertions(+), 5 deletions(-)

* f9fc93c - package/sunxi-mali-mainline: Fix QT5 build for EGLFS
(2018-11-30)<Einar Jon Gunnarsson>|
|  configs/libgbm_sunxi_mali_defconfig                | 1 -
|  package/sunxi-mali-mainline/Config.in              | 3 ++-
|  package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 5 +++++
|  3 files changed, 7 insertions(+), 2 deletions(-)

* 4d7f6fb - package/qt5: fix EGLFS for embedded boards
(2018-11-30)<Einar Jon Gunnarsson>|
|  package/qt5/qt5base/qt5base.mk | 3 +++
|  1 file changed, 3 insertions(+)

* a7943f1 - package/qt5: Use any libgbm provider (2018-11-28)<Einar
Jon Gunnarsson>|
|  package/qt5/qt5base/qt5base.mk | 6 +++---
|  1 file changed, 3 insertions(+), 3 deletions(-)

* d964c09 - package/ti-sgx-um: Add dependency on wayland
(2018-11-28)<Einar Jon Gunnarsson>|
|  package/ti-sgx-um/Config.in    | 2 ++
|  package/ti-sgx-um/ti-sgx-um.mk | 1 +
|  2 files changed, 3 insertions(+)

On Tue, 6 Nov 2018 at 14:48, Einar J?n <tolvupostur@gmail.com> wrote:
>
> On Mon, 5 Nov 2018 at 16:43, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On Mon, 5 Nov 2018 16:35:02 +0100, Einar J?n wrote:
> >
> > > I'm not much help here.
> > > My only concern was building QT5 on an embedded AM335x with ti-sgx-*
> > > libraries and update the kernel to 4.9 (bumping TI SDK from 2.0 to
> > > 4.0).
> > > There is now a kernel 4.14 (TI SDK 5.0), with only minor changes to
> > > the ti-sgx-* libraries (support gbm_bo and GCC7).
> > > http://www.ti.com/tool/PROCESSOR-SDK-AM335X
> > >
> > > kmscube seems to depend heavily on the mesa3d implementation, so I
> > > don't think it's easy to make it work with the other libgbm versions.
> > > Would building a working QT be a valid test of the libgbm build?
> >
> > Yes, it would be. So what you're saying is that the libgbm
> > implementation provided by TI SGX mimics well enough the libgbm
> > implementation of Mesa3D that QT5 is happy with TI SGX libgbm
> > implementation ?
>
> That's exactly what I'm saying, but currently only with a big fat
> "works for me" caveat.
> My company has the same CPU as the beaglebone, but our boards have
> considerable HW changes.
> We're using an older 3.x kernel with ti-gfx, but I have a working
> build with QT 5.9 on kernel 4.9/4.14 and ti-sgx.
>
> I'll try to throw together a minimal working set with QT tomorrow, but
> I'm not sure how useful it is without a rootfs
> (busybox/kernel/udev/etc).
>
> > > Note that ti-sgx-um depends on wayland, due to a library dependency on
> > > libwayland-server.so.0 and libwayland-client.so.0  (see ldd libpvrs_WAYLAND.so)
> > > So the dropped dependency to wayland in ti-sgx-libgbm should have been
> > > on ti-sgx-um.
> > > Without it, QT5 will not find any EGL backend.
> > >
> > > So the ti-sgx-um should be adding
> > > select BR2_PACKAGE_WAYLAND
> > > select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> >
> > ACK.
> >
> > > That way Qt5 can build with a valid EGL backend, using ti-sgx instead
> > > of the ancient ti-gfx.
> > > But this does nothing to help build kmscube.
> >
> > Right. I'm still confused by this libgbm thing though, where everyone
> > seems to have its own implementation, but there is no common API
> > implemented by everybody.
>
> So am I. The ti-sgx-libgbm repo seems to be maintained by ti.com, but
> there seems to be no real effort into making it more than just the
> bare minimum to use ti-sgx-um.
>
> --
> Regards
> Einar J?n



-- 
Regards
Einar J?n
+31 610 957234
