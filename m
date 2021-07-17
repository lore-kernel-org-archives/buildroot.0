From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 18 Jul 2021 00:33:43 +0200
Subject: [Buildroot] rpi3_qt5we build issu
In-Reply-To: <CAMBXMtbWu2e63Kb+MLfj7Jrh+NU6HpCBA86OKSqRXcyHu-M=VA@mail.gmail.com>
References: <CAMBXMtbWu2e63Kb+MLfj7Jrh+NU6HpCBA86OKSqRXcyHu-M=VA@mail.gmail.com>
Message-ID: <20210718003343.1c28e7dd@gmx.net>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Michal,

On Fri, 16 Jul 2021 14:53:50 +0200, Michal Pluska <michal.pluska2@gmail.com> wrote:

> Hello,
> 
> I try to build this configuration: raspberrypi3_qt5we_defconfig; This patch
> had to be applied:
> https://patchwork.ozlabs.org/project/buildroot/patch/20201221203952.22168-3-ps.report at gmx.net/
> 
> still I get following build error:
> ../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/string_fortified.h:29:33:
> warning: ?void* __builtin_memcpy(void*, const void*, unsigned int)?
> specified bound between 4294967288 and 4294967295 exceeds maximum object
> size 2147483647 [-Wstringop-overflow=]
>    29 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0
> (__dest));
>       |
>  ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> [14642/20194] CXX
> obj/content/browser/browser/browser_accessibility_state_impl.o
> FAILED: obj/content/browser/browser/browser_accessibility_state_impl.o
> 
> What is still missing?
> I could repeat this build error on two machines...

Note that the shown line is a warning only, but from your attached log:

	arm-buildroot-linux-gnueabihf-g++.br_real: fatal error: Killed signal terminated program cc1plus
	compilation terminated.

Most likely out-of-memory? Install more ram/swap on your build machines or
reduce the amount of parallelism of your (qt5webengine-5.15.2) build,
e.g. via setting BR2_JLEVEL or by hacking the following line in
package/qt5/qt5webengine/qt5webengine.mk:

 62 QT5WEBENGINE_ENV += NINJAFLAGS="-j$(PARALLEL_JOBS)"

Regards,
Peter

> 
> Kind Regards,
> Mipl
