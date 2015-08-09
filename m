From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Aug 2015 20:52:42 +0200
Subject: [Buildroot] [PATCH 3/4 v2] Revert
 "package/gstreamer1/gst1-plugins-bad: disable opencv plugin with opencv-3"
In-Reply-To: <CAHXCMMJqUSquMMvWcUUD6hveU=MzDkCMLF6N9p5pO5VvjS3kZg@mail.gmail.com>
References: <cover.1439136753.git.yann.morin.1998@free.fr>
 <5d317246d236dfca1405ba303f28293738572614.1439136753.git.yann.morin.1998@free.fr>
 <CAHXCMMJqUSquMMvWcUUD6hveU=MzDkCMLF6N9p5pO5VvjS3kZg@mail.gmail.com>
Message-ID: <20150809185242.GC4299@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-08-09 20:36 +0200, Samuel Martin spake thusly:
> On Sun, Aug 9, 2015 at 6:14 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: Samuel Martin <s.martin49@gmail.com>
> >
> > This reverts commit 5e238a87eacf2a0c62736c4123961651afb1ba87.
> >
> > Also update the dependencies.
> >
> > Cc: Jonathan Ben Avraham <yba@tkos.co.il>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > [yann.morin.1998 at free.fr: fix dependencies at the same time]
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/gstreamer1/gst1-plugins-bad/Config.in | 19 ++++++++++++++++---
> >  1 file changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> > index bc99527..494a282 100644
> > --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> > +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> > @@ -557,9 +557,22 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
> >
> >  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
> >         bool "opencv"
> > -       depends on BR2_INSTALL_LIBSTDCPP
> > -       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> > -       depends on BROKEN # gst1-plugin-opencv does not (yet) support opencv >=3.x
> > +       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # opencv
> > +       depends on BR2_INSTALL_LIBSTDCPP # opencv
> > +       depends on BR2_USE_WCHAR # opencv
> > +       select BR2_PACKAGE_OPENCV
> > +       # Remove the following opencv modules when gstreamer fixes the
> > +       # problem of including the old "cv.h" header
> > +       # bug: https://bugzilla.gnome.org/show_bug.cgi?id=725163
> > +       select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> > +       select BR2_PACKAGE_OPENCV_LIB_CONTRIB
> > +       select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> > +       select BR2_PACKAGE_OPENCV_LIB_FLANN
> > +       select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> > +       select BR2_PACKAGE_OPENCV_LIB_LEGACY
> > +       select BR2_PACKAGE_OPENCV_LIB_ML
> > +       select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
> > +       select BR2_PACKAGE_OPENCV_LIB_VIDEO
> >         help
> >           GStreamer OpenCV Plugins
> 
> How do you ensure that gst1-plugins-bad cannot select opencv when
> opencv3 is already selected?

Because OPENCV3 depends on !OPENCV.

So, if a user selects BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV, OpenCV
gets selected, and OpenCV 3 is not available.

If you do otherwise, like;

    config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
        bool "opencv"
        depends on !BR2_PACKAGE_OPENCV3
        select BR2_PACKAGE_OPENCV

you get circular dependencies.

The only alternative is to depend on BR2_PACKAGE_OPENCV rather than
select it.

But now I see we anyway already have a circular dependency. sigh... :-(

Lemme fix that...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
