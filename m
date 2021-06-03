From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 3 Jun 2021 14:17:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/libcamera: fix atomic linking
 with qcam
In-Reply-To: <ce1a528d-23f3-e2f6-081d-7e2962d2cc9a@ideasonboard.com>
References: <20210603053644.3432-1-fontaine.fabrice@gmail.com>
 <20210603053644.3432-2-fontaine.fabrice@gmail.com>
 <ce1a528d-23f3-e2f6-081d-7e2962d2cc9a@ideasonboard.com>
Message-ID: <CAPi7W80C77dVVQt+gf=OaMziffLjhz0t81y8Y=zKhRe2CH_GEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kieran,

Le jeu. 3 juin 2021 ? 13:06, Kieran Bingham
<kieran.bingham@ideasonboard.com> a ?crit :
>
> Hi Fabrice,
>
> On 03/06/2021 06:36, Fabrice Fontaine wrote:
> > Fix build failure with sparc v8 which is raised since commit
> > bd9b7b092cf34dc065a4b40268c18a9fe319f5e4 due to
> > https://git.linuxtv.org/libcamera.git/commit/?id=97e8b3a2eb321884fe1e15fb584f41a38cc33d51
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/d0726b2253f1f3d006e057f3b32c646c4b9b5f7a
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  .../0001-qcam-Add-libatomic-dependency        | 40 +++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 package/libcamera/0001-qcam-Add-libatomic-dependency
> >
> > diff --git a/package/libcamera/0001-qcam-Add-libatomic-dependency b/package/libcamera/0001-qcam-Add-libatomic-dependency
> > new file mode 100644
> > index 0000000000..72e4b1aee3
> > --- /dev/null
> > +++ b/package/libcamera/0001-qcam-Add-libatomic-dependency
> > @@ -0,0 +1,40 @@
> > +From 59de56f42a0fda1b8e778fb237b7bce494dc0584 Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Wed, 2 Jun 2021 22:56:49 +0200
> > +Subject: qcam: Add libatomic dependency
> > +
> > +Add libatomic dependency due to std::shared_ptr which is used by qcam
> > +since its addition in commit 97e8b3a2eb321884fe1e15fb584f41a38cc33d51:
> > +https://en.cppreference.com/w/cpp/memory/shared_ptr.
> > +
> > +This will avoid the following build failure:
> > +
> > +/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/qcam/qcam.p/main_window.cpp.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
> > +
> > +Fixes:
> > + - http://autobuild.buildroot.org/results/d0726b2253f1f3d006e057f3b32c646c4b9b5f7a
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +[Retrieved from:
> > +https://git.linuxtv.org/libcamera.git/commit/?id=59de56f42a0fda1b8e778fb237b7bce494dc0584]
>
> Given that this is now an upstream commit - wouldn't it make more sense
> to bump the libcamera version to here, rather than carry the patch back?
>
> Or is there some reason you don't want to update yet?
Yes, there is a very good reason: buildroot 2021.05 will be released
in the next few hours/days.
> --
> Kieran
>
>
> > +---
> > + src/qcam/meson.build | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/src/qcam/meson.build b/src/qcam/meson.build
> > +index acde7682..fad4cc95 100644
> > +--- a/src/qcam/meson.build
> > ++++ b/src/qcam/meson.build
> > +@@ -34,6 +34,7 @@ qcam_resources = files([
> > + ])
> > +
> > + qcam_deps = [
> > ++    libatomic,
> > +     libcamera_dep,
> > +     qt5_dep,
> > + ]
> > +--
> > +cgit v1.2.1
> > +
> >
>
> --
> Regards
> --
> Kieran
Best Regards,

Fabrice
