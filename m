From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 31 May 2013 22:06:46 +0200
Subject: [Buildroot] [PATCH v9 05/14] webkit: bump to version 1.9.6
In-Reply-To: <1369931437-12445-6-git-send-email-spenser@gillilanding.com>
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
 <1369931437-12445-6-git-send-email-spenser@gillilanding.com>
Message-ID: <CAHXCMMLXzK2m0jyNh8eueCdqsGGrnkUfJy_OsO9xBf3im_1RpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Spencer, all,

2013/5/30 Spenser Gilliland <spenser@gillilanding.com>:
>
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/webkit/webkit-bison-2-6-compat.patch       |  672 --------------------
>  package/webkit/webkit-disable-docrebase.patch      |   21 +
>  package/webkit/webkit-disable-tests.patch          |   76 +++
>  package/webkit/webkit-execinfo_h.patch             |   24 +
>  .../webkit-fix-build-issue-with-old-gtk.patch      |   22 -
>  package/webkit/webkit-fix-build-with-gcc-4-6.patch |   45 --
>  .../webkit-fix-compilation-on-DirectFB-2.patch     |   33 -
>  .../webkit-fix-compilation-on-DirectFB.patch       |  144 -----
>  package/webkit/webkit-fix-pool.patch               |   67 --
>  package/webkit/webkit-pthread_getattr_np.patch     |   80 ---
>  package/webkit/webkit.mk                           |   31 +-
>  11 files changed, 140 insertions(+), 1075 deletions(-)
>  delete mode 100644 package/webkit/webkit-bison-2-6-compat.patch
>  create mode 100644 package/webkit/webkit-disable-docrebase.patch
>  create mode 100644 package/webkit/webkit-disable-tests.patch
>  create mode 100644 package/webkit/webkit-execinfo_h.patch
>  delete mode 100644 package/webkit/webkit-fix-build-issue-with-old-gtk.patch
>  delete mode 100644 package/webkit/webkit-fix-build-with-gcc-4-6.patch
>  delete mode 100644 package/webkit/webkit-fix-compilation-on-DirectFB-2.patch
>  delete mode 100644 package/webkit/webkit-fix-compilation-on-DirectFB.patch
>  delete mode 100644 package/webkit/webkit-fix-pool.patch
>  delete mode 100644 package/webkit/webkit-pthread_getattr_np.patch
>
[...]
> diff --git a/package/webkit/webkit-execinfo_h.patch b/package/webkit/webkit-execinfo_h.patch
> new file mode 100644
> index 0000000..dd53e94
> --- /dev/null
> +++ b/package/webkit/webkit-execinfo_h.patch
> @@ -0,0 +1,24 @@
> +Index: webkit-1.9.6/Source/WTF/wtf/Assertions.cpp
> +===================================================================
> +--- webkit-1.9.6.orig/Source/WTF/wtf/Assertions.cpp
> ++++ webkit-1.9.6/Source/WTF/wtf/Assertions.cpp
> +@@ -61,8 +61,10 @@
> + #if (OS(DARWIN) || OS(LINUX)) && !OS(ANDROID)
> + #include <cxxabi.h>
> + #include <dlfcn.h>
> ++#if !defined(__UCLIBC__)
> + #include <execinfo.h>
> + #endif
> ++#endif
> +
> + #if OS(ANDROID)
> + #include "android/log.h"
> +@@ -268,7 +270,7 @@ void WTFReportArgumentAssertionFailure(c
> +
> + void WTFGetBacktrace(void** stack, int* size)
> + {
> +-#if (OS(DARWIN) || OS(LINUX)) && !OS(ANDROID)
> ++#if (OS(DARWIN) || OS(LINUX)) && !OS(ANDROID) && !defined(__UCLIBC__)
> +     *size = backtrace(stack, *size);
> + #elif OS(WINDOWS) && !OS(WINCE)
> +     // The CaptureStackBackTrace function is available in XP, but it is not defined

In uClibc, backtrace support is optional.
So, I'd check for it instead in the configure script, using
AC_CHECK_FUNC and AC_DEFINE autotools macros.

Regards,

-- 
Samuel
