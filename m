From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 13 Jul 2017 07:07:27 +0300
Subject: [Buildroot] [PATCH 1/1] br toolchain: gcc5.4 bugfix
 libsanitizer powerpc
In-Reply-To: <1499918619-27858-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1499918619-27858-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170713040727.rfalp6j5n6dikbjd@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On Wed, Jul 12, 2017 at 11:03:39PM -0500, Matt Weber wrote:
> Fixes a missing include of signal.h
> 
> This breaks when building gcc 5.4.0 with
> target_platform=powerpc-unknown-linux-gnu with glibc 2.25:
> 
> ../../../../gcc-host/libsanitizer/asan/asan_linux.cc: In function 'bool __asan::AsanInterceptsSignal(int)':
> ../../../../gcc-host/libsanitizer/asan/asan_linux.cc:222:20: error: 'SIGSEGV' was not declared in this scope
>    return signum == SIGSEGV && common_flags()->handle_segv;
> 
> This applies only to gcc-5-branch, the code has been reworked for gcc 6.
> 
> Resolves Bug: https://bugs.busybox.net/show_bug.cgi?id=10061
> 
> Upstream: https://patchwork.ozlabs.org/patch/725596/

Mentioning the Buildroot bugzilla issue that this patch fixes would be nice.

> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  .../942-asan-fix-missing-include-signal-h.patch    | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch
> 
> diff --git a/package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch b/package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch
> new file mode 100644
> index 0000000..2fbc497
> --- /dev/null
> +++ b/package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch
> @@ -0,0 +1,40 @@
> +From patchwork Wed Feb  8 11:07:16 2017
> +Content-Type: text/plain; charset="utf-8"
> +MIME-Version: 1.0
> +Content-Transfer-Encoding: 7bit
> +Subject: asan: fix missing include of signal.h
> +From: Rolf Eike Beer <eb@emlix.com>
> +X-Patchwork-Id: 725596
> +Message-Id: <6824253.3U2boEivI2@devpool21>
> +To: gcc-patches at gcc.gnu.org
> +Date: Wed, 08 Feb 2017 12:07:16 +0100
> +
> +>From 205aa8e97bab553e5e6fe45896325e97962de704 Mon Sep 17 00:00:00 2001
> +From: Rolf Eike Beer <eb@emlix.com>
> +Date: Wed, 8 Feb 2017 11:42:52 +0100
> +Subject: [PATCH] asan: fix missing include of signal.h
> +
> +This breaks when building gcc 5.4.0 with 
> +target_platform=powerpc-unknown-linux-gnu with glibc 2.25:
> +
> +../../../../gcc-host/libsanitizer/asan/asan_linux.cc: In function 'bool __asan::AsanInterceptsSignal(int)':
> +../../../../gcc-host/libsanitizer/asan/asan_linux.cc:222:20: error: 'SIGSEGV' was not declared in this scope
> +   return signum == SIGSEGV && common_flags()->handle_segv;
> +
> +This applies only to gcc-5-branch, the code has been reworked for gcc 6.

Your sign-off is missing.

> +---
> + libsanitizer/asan/asan_linux.cc | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libsanitizer/asan/asan_linux.cc b/libsanitizer/asan/asan_linux.cc
> +index c504168..59087b9 100644
> +--- a/libsanitizer/asan/asan_linux.cc
> ++++ b/libsanitizer/asan/asan_linux.cc
> +@@ -29,6 +29,7 @@
> + #include <dlfcn.h>
> + #include <fcntl.h>
> + #include <pthread.h>
> ++#include <signal.h>
> + #include <stdio.h>
> + #include <unistd.h>
> + #include <unwind.h>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
