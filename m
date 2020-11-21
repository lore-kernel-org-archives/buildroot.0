From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 21 Nov 2020 12:43:13 -0800
Subject: [Buildroot] [PATCH 1/1] package/ti-sgx-{km,
 um}: bump to SDK 06.01.00.08 versions
In-Reply-To: <CAFSsvmrTthn5s4+_XPUYCv5C-CVGaa=x_jcd_SVCzpuUKKUuBg@mail.gmail.com>
References: <20200702201125.3639873-1-aduskett@gmail.com>
 <CAFSsvmr1GpWw1Zno8qa8wNOOZn7Hf0KhbqTZ9eEcXAOsS4yjZQ@mail.gmail.com>
 <1605645020061-0.post@n4.nabble.com>
 <CAFSsvmrTthn5s4+_XPUYCv5C-CVGaa=x_jcd_SVCzpuUKKUuBg@mail.gmail.com>
Message-ID: <CAFSsvmpGHi+KyNeMv1zzK8=Zm=c7N519GRuDHt5cVig2f=4MuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Michael;

It was a bit of trial and error that took quite a while to figure out!
It's been quite some time since I did this but the basic
troubleshooting was in this order (ish):

- Update the various am335x Buildroot packages to match the latest release
- Find out the new packages don't work with eglfs
- Download the newest AM335x SDK release and burn it to an SD Card
- Find out that the packages also don't work
- Download the second to newest AM335x SDK release from TI and burn
that to an SD Card
- EGLFS works

At this point, I had to find a way to figure out what was the proper commit
hash. To do that, I was lucky in the sense that the user modules are
pre-compiled binary blobs. So by ways of trial and error, I checked out each
commit in order until I found .so's that were the exact match in size and date
as the ones provided in the official AM335x SDK release that had a working
eglfs. That release happened to be 909e237baf47d0bde006ff25552f5403fd7e359d
which corresponds to one commit before v06.03 was released.

At that point, I tried (and failed) to update all of the other
packages related to these
packages, and to update the board files as well so nobody else would
have to go through
the 40+ hours of work it took me to figure out how to get EGLFS
working with Buildroot on
the AM335x platform.

Hopefully, that's helpful!

Adam

> Hi Adam,
>
> I'm toying around with this package as I try to get wpewebkit working on an AM5728.
>
> I was wondering: How did you find out which commits correspond to the specific TI SDK Version?
> In the Software_Manifests provided by TI [0] I only see references to Branches. But no Tags or Commits.
> Can you give me a hint?
>
> Regards,
> Michael
>
> [0] https://software-dl.ti.com/processor-sdk-linux-rt/esd/AM57X/latest/exports/software_manifest.htm
>
> On Wed, Nov 18, 2020 at 8:56 AM Adam Duskett <aduskett@gmail.com> wrote:
>
> Hey Markus! Thanks for the comment!
>
> Ideally, your patch would come next after my patch is applied
> upstream. I can attempt to ping the maintainers directly for a review;
> however, I believe they are more focused on the 2020.11 release.
>
> Adam
>
> On Tue, Nov 17, 2020 at 12:30 PM Markus Zehnder <zehnder@live.com> wrote:
> >
> > I'm the happy ti-sgx patch user and newly subscribed to the mailing list.
> > BR2_PACKAGE_TI_SGX_DEMOS, the Qt examples and the famous
> > BR2_PACKAGE_QT5CINEX_HD are working now in Qt 5.12.8 and 5.15.0.
> >
> > For the patch to work I had to add two small things:
> > - patching qt5base.mk as mentioned in the description, but missing in the
> > patch
> > - patch Qt core to fix a compile error with the eglfs backend, related to:
> > https://bugreports.qt.io/browse/QTBUG-72567
> >
> > What's the proper way to proceed with the patch, resubmit a new patch
> > series? It would be great if it could be included.
> > If anyone needs them immediately, here's what I've added to Adam's patch:
> >
> > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> > index e0189599a7..c402f42008 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -76,9 +76,9 @@ QT5BASE_DEPENDENCIES += mesa3d
> >  else ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
> >  QT5BASE_CONFIGURE_OPTS += -gbm
> >  QT5BASE_DEPENDENCIES += gcnano-binaries
> > -else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
> > +else ifeq ($(BR2_PACKAGE_TI_SGX_UM),y)
> >  QT5BASE_CONFIGURE_OPTS += -gbm
> > -QT5BASE_DEPENDENCIES += ti-sgx-libgbm
> > +QT5BASE_DEPENDENCIES += ti-sgx-um
> >  else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
> >  QT5BASE_CONFIGURE_OPTS += -gbm
> >  QT5BASE_DEPENDENCIES += imx-gpu-viv
> >
> > qt5base patch:
> >
> > diff -Naur
> > a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
> > b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
> > ---
> > a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
> > +++
> > b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
> > @@ -80,7 +80,8 @@
> >      }
> >
> >      if (getPlatformDisplay) {
> > -        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, nativeDisplay,
> > nullptr);
> > +        qintptr nativeDisplayPtr =
> > reinterpret_cast<qintptr>(nativeDisplay);
> > +        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR,
> > reinterpret_cast<void *>(&nativeDisplayPtr), nullptr);
> >      } else {
> >          qCDebug(qLcEglfsKmsDebug, "No eglGetPlatformDisplay for GBM,
> > falling back to eglGetDisplay");
> >          display = eglGetDisplay(nativeDisplay);
> >
> >
> >
> >
> > --
> > Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
