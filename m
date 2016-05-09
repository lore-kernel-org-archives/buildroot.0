From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 9 May 2016 23:00:51 +0200
Subject: [Buildroot] About python2 and python3
In-Reply-To: <20160509222604.25fa27a8@free-electrons.com>
References: <5730F02E.6040806@gmail.com>
 <20160509222604.25fa27a8@free-electrons.com>
Message-ID: <5730FA83.9000608@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 09/05/2016 22:26, Thomas Petazzoni ha scritto:
> So, I think we'll stick with just supporting the installation of 
> either Python 2 or Python 3. I'd rather recommend you to see why you 
> need Python 2 at all, and try to see if you can make that part work 
> with Python 3. 

Ok, it's reasonable.
Is there an easy way to find out which package(s) is selecting another?
I had to copy & paste several times the loooong "selected by" line:

> Selected by:
>
> BR2_PACKAGE_KODI [=n] &&
> BR2_INSTALL_LIBSTDCPP [=y] &&
> BR2_HOST_GCC_AT_LEAST_4_6 [=y] &&
> BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y] &&
> BR2_TOOLCHAIN_HAS_THREADS [=y] &&
> !BR2_TOOLCHAIN_USES_MUSL [=n] &&
> (BR2_PACKAGE_KODI_EGL_GLES [=y] ||
> BR2_PACKAGE_KODI_GL [=n]) &&
> BR2_USE_MMU [=y] &&
> BR2_USE_WCHAR [=y] &&
> !BR2_STATIC_LIBS [=n] &&
> BR2_PACKAGE_KODI_ARCH_SUPPORTS [=y] ||
> BR2_PACKAGE_DSTAT [=n] &&
> BR2_USE_WCHAR [=y] &&
> BR2_USE_MMU [=y] &&
> BR2_TOOLCHAIN_HAS_THREADS [=y] &&
> !BR2_STATIC_LIBS [=n] ||
> BR2_PACKAGE_SAMBA4 [=y] &&
> BR2_USE_MMU [=y] &&
> BR2_USE_WCHAR [=y] &&
> BR2_TOOLCHAIN_HAS_NATIVE_RPC [=y] &&
> BR2_TOOLCHAIN_HAS_THREADS [=y] &&
> !BR2_STATIC_LIBS [=n] &&
> !BR2_nios2 [=n] &&
> BR2_TOOLCHAIN_HAS_SYNC_4 [=y]

I guess the && operator has the precedence. So this should be read like:

(BR2_PACKAGE_KODI [=n] && BR2_INSTALL_LIBSTDCPP [=y] && 
BR2_HOST_GCC_AT_LEAST_4_6 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y] && 
BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_TOOLCHAIN_USES_MUSL [=n] && 
(BR2_PACKAGE_KODI_EGL_GLES [=y])

  ||

(BR2_PACKAGE_KODI_GL [=n]) && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && 
!BR2_STATIC_LIBS [=n] && BR2_PACKAGE_KODI_ARCH_SUPPORTS [=y])

  ||

(BR2_PACKAGE_DSTAT [=n] && BR2_USE_WCHAR [=y] && BR2_USE_MMU [=y] && 
BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n])

  ||

(BR2_PACKAGE_SAMBA4 [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && 
BR2_TOOLCHAIN_HAS_NATIVE_RPC [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && 
!BR2_STATIC_LIBS [=n] && !BR2_nios2 [=n] && BR2_TOOLCHAIN_HAS_SYNC_4[=y])

so it's the last group which selects python2: samba4.
Right now I've deselected it. Then I will try to understand if it can 
live with python3.

Best regards
Marco
