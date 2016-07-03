From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jul 2016 00:50:10 +0200
Subject: [Buildroot] [PATCH 2/4] package/pulseaudio: allow to build
 without C++11 support
In-Reply-To: <1467585172-10299-2-git-send-email-romain.naour@gmail.com>
References: <1467585172-10299-1-git-send-email-romain.naour@gmail.com>
 <1467585172-10299-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160703225010.GF3482@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-04 00:32 +0200, Romain Naour spake thusly:
> C++11 support is only required for WebRTC optional support but
> pulseaudio can still be built with toolchains based on gcc 4.7 or older
> witch doesn't have it.
> 
> Add a patch to make C++11 support optional and explicitely check for
> gnu++11. Also stop the build only if no C++11 support has been found
> and WebRTC support has been resquested.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d89/d897a94a8b6a52eba03d04c24536f554a7643000
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...-C-11-is-only-required-for-WebRTC-support.patch | 45 ++++++++++++++++++++++
>  package/pulseaudio/pulseaudio.mk                   |  3 ++
>  2 files changed, 48 insertions(+)
>  create mode 100644 package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
> 
> diff --git a/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch b/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
> new file mode 100644
> index 0000000..143d73b
> --- /dev/null
> +++ b/package/pulseaudio/0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
> @@ -0,0 +1,45 @@
> +From f9691b5f0aed2ffbaac82513b8baa7e3e357c2c1 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Sun, 3 Jul 2016 20:19:48 +0200
> +Subject: [PATCH] webrtc: C++11 is only required for WebRTC support
> +
> +Make C++11 support optional and explicitely check for gnu++11.
> +
> +Stop the build only if no C++11 support has been found and WebRTC
> +support has been resquested.
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + configure.ac | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 4edc8e0..65a386a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -81,10 +81,9 @@ AC_PROG_LN_S
> + 
> + AC_PROG_CC
> + AM_PROG_CC_C_O
> +-# Only required if you want the WebRTC canceller -- no runtime dep on
> +-# libstdc++ otherwise

You've been a little bit over-zealous: that last line you remove is
still needed. ;-)

> ++# C++11 is only required if you want the WebRTC canceller -- no runtime dep on
> + AC_PROG_CXX
> +-AX_CXX_COMPILE_STDCXX_11
> ++AX_CXX_COMPILE_STDCXX_11(ext,optional)

Syntax for paramters to m4 macros are to be double-quoted:

    AX_CXX_COMPILE_STDCXX_11([ext],[optional])

Otherwise, looks good.

Regards,
Yann E. MORIN.

> + AC_PROG_GCC_TRADITIONAL
> + AC_USE_SYSTEM_EXTENSIONS
> + 
> +@@ -1414,6 +1413,9 @@ fi
> + AC_ARG_ENABLE([webrtc-aec],
> +     AS_HELP_STRING([--enable-webrtc-aec], [Enable the optional WebRTC-based echo canceller]))
> + 
> ++AS_IF([test "x$enable_webrtc_aec" = "xyes" && test "$HAVE_CXX11" = "0"],
> ++    [AC_MSG_ERROR([*** webrtc-audio-processing needs C++11 support])])
> ++
> + AS_IF([test "x$enable_webrtc_aec" != "xno"],
> +     [PKG_CHECK_MODULES(WEBRTC, [ webrtc-audio-processing >= 0.2 ], [HAVE_WEBRTC=1], [HAVE_WEBRTC=0])],
> +     [HAVE_WEBRTC=0])
> +-- 
> +2.5.5
> +
> diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
> index f50ea67..bc95d91 100644
> --- a/package/pulseaudio/pulseaudio.mk
> +++ b/package/pulseaudio/pulseaudio.mk
> @@ -21,6 +21,9 @@ PULSEAUDIO_CONF_OPTS = \
>  PULSE_AUDIO_CONF_ENV += \
>  	ac_cv_header_atomic_ops_h=no
>  
> +# 0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
> +PULSEAUDIO_AUTORECONF = YES
> +
>  PULSEAUDIO_DEPENDENCIES = \
>  	host-pkgconf libtool json-c libsndfile speex host-intltool \
>  	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
> -- 
> 2.5.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
