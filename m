From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 19 Apr 2016 00:11:04 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/freeswitch: select OpenCV
 modules for needed mod_cv
In-Reply-To: <1461010675-8274-2-git-send-email-bernd.kuhls@t-online.de>
References: <1461010675-8274-1-git-send-email-bernd.kuhls@t-online.de>
 <1461010675-8274-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <CAHXCMMLOk+xw1cGvhTF7=o025czk20hWD__L6Aa309=TupSzFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 18, 2016 at 10:17 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Fixes
> http://autobuild.buildroot.net/results/ffd/ffd572d7bb68d8ed46ce76b2af824503c587449f/
> http://autobuild.buildroot.net/results/e53/e53e356451aa4541a76e26722fd71051896e774b/
> http://autobuild.buildroot.net/results/564/5649ff1b50a1eaafbd0e1a329bff87a65ce18da0/
> http://autobuild.buildroot.net/results/c60/c60f97c6aafb1a94cb4ce344953598eae8b4a912/
> http://autobuild.buildroot.net/results/c1a/c1ac61f9a77635962babdb6bfb31dbecb7f4d439/
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: add more suboptions
> v2: select the required suboption instead of checking for its existance
>     in freeswitch.mk (Thomas)
>
>  package/freeswitch/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
> index 1350b2b..9b3f0fc 100644
> --- a/package/freeswitch/Config.in
> +++ b/package/freeswitch/Config.in
> @@ -7,6 +7,11 @@ menuconfig BR2_PACKAGE_FREESWITCH
>         depends on BR2_USE_WCHAR # libuuid
>         select BR2_PACKAGE_LIBCURL
>         select BR2_PACKAGE_JPEG
> +       # src/mod/applications/mod_cv/mod_cv.cpp includes cv.h
... which includes headers from: core, imgproc, video, feature2d,
flann, calib3d, objdetect and legacy [1]
So I would expect to see all these modules selected.

> +       select BR2_PACKAGE_OPENCV_LIB_CONTRIB if BR2_PACKAGE_OPENCV
> +       select BR2_PACKAGE_OPENCV_LIB_FLANN if BR2_PACKAGE_OPENCV
> +       select BR2_PACKAGE_OPENCV_LIB_HIGHGUI if BR2_PACKAGE_OPENCV
Is highgui included as well in mod_cv?
To depend on highgui, a package has to explicitly include it, even
with the legacy headers.

> +       select BR2_PACKAGE_OPENCV_LIB_LEGACY if BR2_PACKAGE_OPENCV

The selection is not complete WRT what is included in cv.h, but thanks
to the inter-dependencies defined in the previous patch, all should be
there at build-time for freeswitch at least.

>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_PCRE
>         select BR2_PACKAGE_SPEEX
> --
> 2.8.0.rc3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

[1] https://github.com/Itseez/opencv/blob/2.4.12.3/include/opencv/cv.h#L63

Regards,

-- 
Samuel
