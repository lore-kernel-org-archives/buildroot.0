From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Jun 2021 23:15:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: import patch to
 support uclibc
In-Reply-To: <20210526183839.3062697-1-aperez@igalia.com>
References: <20210526183839.3062697-1-aperez@igalia.com>
Message-ID: <20210604211504.GI168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2021-05-26 21:38 +0300, Adrian Perez de Castro spake thusly:
> Import a small patch from the upstream Bugzilla which is needed to allow
> building WPE WebKit against uClibc.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to next, thanks.

I just added the references to the upstream commit you provided on IRC,
and added the name of the upstream reviewer to more closely match
upstream's commit log.

Ditto the webkitgtk patch, of course.

Regards,
Yann E. MORIN.

> ---
>  ...0001-Support-building-against-uClibc.patch | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 package/wpewebkit/0001-Support-building-against-uClibc.patch
> 
> diff --git a/package/wpewebkit/0001-Support-building-against-uClibc.patch b/package/wpewebkit/0001-Support-building-against-uClibc.patch
> new file mode 100644
> index 0000000000..cbed551d2d
> --- /dev/null
> +++ b/package/wpewebkit/0001-Support-building-against-uClibc.patch
> @@ -0,0 +1,76 @@
> +From 624d3b6a99778443e35fb260bef50a3969df9215 Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Wed, 26 May 2021 01:24:59 +0300
> +Subject: [PATCH] Support building against uClibc
> + https://bugs.webkit.org/show_bug.cgi?id=226244
> +
> +Reviewed by NOBODY (OOPS!).
> +
> +Source/JavaScriptCore:
> +
> +* assembler/MacroAssemblerARM64.cpp:
> +(getauxval): Provide a fallback implementation of getauxval() for
> +systems which do not provide <sys/auxv.h>, like those using uClibc
> +as their C library.
> +
> +Source/WTF:
> +
> +* wtf/PlatformRegisters.h: Use the <sys/ucontext.h> header instead of
> +<ucontext.h>, which is enough to gain access to the type definitions
> +for CPU registers and is available on every libc. On the other hand,
> +uClibc does not have <ucontext.h>, so this fixes the build in that
> +case.
> +
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +[Upstream status: https://bugs.webkit.org/show_bug.cgi?id=226244]
> +---
> + .../assembler/MacroAssemblerARM64.cpp          | 18 ++++++++++++++++++
> + Source/WTF/wtf/PlatformRegisters.h             |  2 +-
> + 2 files changed, 19 insertions(+), 1 deletion(-)
> +
> +diff --git a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
> +index 9e5c5147ea0..d20e632d825 100644
> +--- a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
> ++++ b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
> +@@ -34,7 +34,25 @@
> + 
> + #if OS(LINUX)
> + #include <asm/hwcap.h>
> ++#if __has_include(<sys/auxv.h>)
> + #include <sys/auxv.h>
> ++#else
> ++#include <linux/auxvec.h>
> ++// Provide an implementation for C libraries which do not ship one.
> ++static unsigned long getauxval(unsigned long type)
> ++{
> ++    char** env = environ;
> ++    while (*env++) { /* no-op */ }
> ++
> ++    for (auto* auxv = reinterpret_cast<unsigned long*>(env); *auxv != AT_NULL; auxv += 2) {
> ++        if (*auxv == type)
> ++            return auxv[1];
> ++    }
> ++
> ++    errno = ENOENT;
> ++    return 0;
> ++}
> ++#endif
> + #endif
> + 
> + namespace JSC {
> +diff --git a/Source/WTF/wtf/PlatformRegisters.h b/Source/WTF/wtf/PlatformRegisters.h
> +index d26ef985169..e7f15b7eb62 100644
> +--- a/Source/WTF/wtf/PlatformRegisters.h
> ++++ b/Source/WTF/wtf/PlatformRegisters.h
> +@@ -35,7 +35,7 @@
> + #elif OS(WINDOWS)
> + #include <windows.h>
> + #else
> +-#include <ucontext.h>
> ++#include <sys/ucontext.h>
> + #endif
> + 
> + namespace WTF {
> +-- 
> +2.31.1
> +
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
