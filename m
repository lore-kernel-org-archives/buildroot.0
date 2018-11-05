From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Mon, 5 Nov 2018 16:35:02 +0100
Subject: [Buildroot] [PATCH 1/2] package/opengl/libgbm: new virtual
 package
In-Reply-To: <20181105124735.3qbms4ymnrgpw3op@flea>
References: <20180913194410.24077-1-bernd.kuhls@t-online.de>
 <20181030221420.65c7aed3@windsurf> <20181105124735.3qbms4ymnrgpw3op@flea>
Message-ID: <CABhNV23smKagYKYME1Na=Cyz0+hn2BPOEpKumruu3OyAmLt1fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I'm not much help here.
My only concern was building QT5 on an embedded AM335x with ti-sgx-*
libraries and update the kernel to 4.9 (bumping TI SDK from 2.0 to
4.0).
There is now a kernel 4.14 (TI SDK 5.0), with only minor changes to
the ti-sgx-* libraries (support gbm_bo and GCC7).
http://www.ti.com/tool/PROCESSOR-SDK-AM335X

kmscube seems to depend heavily on the mesa3d implementation, so I
don't think it's easy to make it work with the other libgbm versions.
Would building a working QT be a valid test of the libgbm build?

On Mon, 5 Nov 2018 at 13:47, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Tue, Oct 30, 2018 at 10:14:20PM +0100, Thomas Petazzoni wrote:
> > Hello all,
> >
> >
> > It turns out that while kmscube with Mesa3D builds (obviously),
> > neither kmscube with TI SGX or Sunxi Mali build properly:
> >
> >  - TI SGX libgbm is named libgbm.so.2, while other libgbm
> >    implementations, including the one in Mesa3D is named
> >    libgbm.so.1. Not a big issue by itself, but it hints at the two
> >    things being different.
> >
> >    Anyway, it fails to build because the libgbm API is not what
> >    kmscube expects: http://code.bulix.org/cot991-494068
> >
> >  - With Sunxi Mali, same issue, it fails to build with libgbm API
> >    issues: http://code.bulix.org/rulyvo-494069
> >
> > So I'm really wondering if libgbm has a proper standardized API like
> > OpenGL has. Another hint is that the recent version of kmscube now
> > require gbm >= 13.0, and 13.0 is basically a Mesa3D version.
> >
> > Anybody has some hints/ideas about this ?

Note that ti-sgx-um depends on wayland, due to a library dependency on
libwayland-server.so.0 and libwayland-client.so.0  (see ldd libpvrs_WAYLAND.so)
So the dropped dependency to wayland in ti-sgx-libgbm should have been
on ti-sgx-um.
Without it, QT5 will not find any EGL backend.

So the ti-sgx-um should be adding
select BR2_PACKAGE_WAYLAND
select BR2_PACKAGE_HAS_LIBEGL_WAYLAND

That way Qt5 can build with a valid EGL backend, using ti-sgx instead
of the ancient ti-gfx.
But this does nothing to help build kmscube.

--
Regards
Einar J?n
