From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 10:24:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Bump to version 2.3.1
In-Reply-To: <1407017477-8540-1-git-send-email-bernd.kuhls@t-online.de>
References: <1407017477-8540-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140803102404.7d7fa4b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  3 Aug 2014 00:11:17 +0200, Bernd Kuhls wrote:
> - remove obsolete option --disable-vis
> - add patch to fix compile error with uClibc
> - add patch to fix compile error in freerdp

I've applied the patch. However, I have one comment, below.


> +diff -uNr ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c.org/libavutil/libm.h ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c/libavutil/libm.h
> +--- ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c.org/libavutil/libm.h	2014-07-16 20:37:20.000000000 +0200
> ++++ ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c/libavutil/libm.h	2014-07-17 22:58:01.781316442 +0200
> +@@ -82,16 +82,6 @@
> + #define exp2f(x) ((float)exp2(x))
> + #endif /* HAVE_EXP2F */
> + 
> +-#if !HAVE_FMINF
> +-#undef fminf
> +-static av_always_inline av_const float fminf(float x, float y)
> +-{
> +-    //Note, the NaN special case is needed for C spec compliance, it should be
> +-    //optimized away if the users compiler is configured to assume no NaN
> +-    return x > y ? y : (x == x ? x : y);
> +-}
> +-#endif

This looks weird: if fminf() is already defined in uClibc, then
HAVE_FMINF should have been true and this code should not have been
included into the build.

What happened with the HAVE_FMINF test? Maybe it would be worth having
a look to do a upstream acceptable fix for this issue?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
