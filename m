From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 00:09:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/sconeserver: needs shared libs
	or non uClibc toolchain
In-Reply-To: <1472408394-20573-2-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 28 Aug 2016 20:19:54 +0200")
References: <1472408394-20573-1-git-send-email-yann.morin.1998@free.fr>
 <1472408394-20573-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87wpj07dga.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > sconeserver wants to use dlopen(), unconditionally: it does not try to
 > detect it, and it can't work without it (the code is not conditional).

 > So, when the toolchain uses uClibc, and that uClibc has been configured
 > with only static support, the dlopen() functions are not available at
 > all, and the corresponding headers are not present:

 >     ModuleLoader.cpp:29:19: fatal error: dlfcn.h: No such file or directory
 >      #include <dlfcn.h>
 >                        ^

 > However, we can't know if uClibc has shared support or is static-only,
 > especially for external toolchains.

 > The only way is to forbid the combination {uClibc,static}. So we may
 > indeed forbid working combinations, for example if the external
 > toolchain is uClibc-based and has support for shared libs...

Ehh, this I don't get. Why not simply depend on !BR2_STATIC_LIBS like we
do for other users of dlfcn.h?

If BR2_STATIC_LIBS is enabled then there won't be any .so files in the
target rootfs, so even if the C library has dlopen support it won't
work.

If an external (uClibc-based) toolchain has no shared library support
then it can only be used in BR2_STATIC_LIBS configurations.

-- 
Bye, Peter Korsgaard
