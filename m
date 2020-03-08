From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 8 Mar 2020 16:49:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/vlc: fix build with opencv3
In-Reply-To: <20200308154220.1b2ccc1d@windsurf.home>
References: <20200228133809.687495-1-fontaine.fabrice@gmail.com>
 <20200308154220.1b2ccc1d@windsurf.home>
Message-ID: <CAPi7W83cDsLz5jfZdOzL62QAJXNe-swYUOX+b4kiEvMYjexmYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le dim. 8 mars 2020 ? 15:42, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Fri, 28 Feb 2020 14:38:09 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/210424bd33f660aa0757f62a558e1e03faf0f371
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...lter-opencv_example.cpp-fix-build-wi.patch | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644 package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
> >
> > diff --git a/package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch b/package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
> > new file mode 100644
> > index 0000000000..04c9958298
> > --- /dev/null
> > +++ b/package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
> > @@ -0,0 +1,38 @@
> > +From 67244e60fc1d8c7a9350bac30611f56c398761e5 Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Fri, 28 Feb 2020 14:29:47 +0100
> > +Subject: [PATCH] modules/video_filter/opencv_example.cpp: fix build with
> > + opencv 3.4.9
> > +
> > +Convert CV_RGB to cvScalar to avoid the following build failure with
> > +opencv 3.4.9:
> > +
> > +In file included from /home/naourr/work/instance-2/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/opencv2/imgproc/imgproc.hpp:48,
> > +                 from video_filter/opencv_example.cpp:46:
> > +video_filter/opencv_example.cpp: In function 'picture_t* Filter(filter_t*, picture_t*)':
> > +video_filter/opencv_example.cpp:200:46: error: could not convert 'cv::Scalar_<double>((double)0, (double)0, (double)0, (double)0)' from 'cv::Scalar' {aka 'cv::Scalar_<double>'} to 'CvScalar'
> > +             cvRectangle( p_img[0], pt1, pt2, CV_RGB(0,0,0), 3, 8, 0 );
>
> Thanks for looking into this. I must say I don't feel very confident
> about the fix. Have you been able to trace which change in OpenCV
> caused this build issue ?
The issue is raised by
https://github.com/opencv/opencv/pull/11159/commits/7f9253ea0a9fe2635926379420002dbf0c3fce0f
which changed the CV_RGB definition from cvScalar to cv::Scalar
however cvRectangle was not updated and still waits for a CvScalar
color.
So, a better fix would be to remove the reference on CV_RGB and use
directly cvScalar. I'll send a v2 if you agree that this is a better
proposal.
>
> Also, is the fix still compatible with OpenCV 2.x ? Indeed, VLC
> requires OpenCV > 2.0, so I guess it can still work with some 2.x
> OpenCV version.
>
> Have you considered talking with the OpenCV community to see what is
> the proper fix ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
