From: Alexander Dahl <post@lespocky.de>
Date: Mon, 10 May 2021 20:22:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/putty: fix build on uclibc
In-Reply-To: <20210509133412.1116330-1-fontaine.fabrice@gmail.com>
References: <20210509133412.1116330-1-fontaine.fabrice@gmail.com>
Message-ID: <20210510182221.urhfgkjbv7a4o3lb@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, May 09, 2021 at 03:34:12PM +0200, Fabrice Fontaine wrote:
> Fix build failure on uclibc raised since bump to version 0.75 in commit
> d562009f7b9701cb20bc4b1d389d19f9a647cc3b

I used configs/qemu_x86_64_defconfig for testing which also uses
uclibc and it built just fine. So it seems no general uclibc problem.

> Fixes:
>  - http://autobuild.buildroot.org/results/726f7c5ce13e78ed91e827b872e9d7ccfa13f298
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-unix-uxutils.h-fix-build-on-uclibc.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch
> 
> diff --git a/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch b/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch
> new file mode 100644
> index 0000000000..78cef8b908
> --- /dev/null
> +++ b/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch
> @@ -0,0 +1,41 @@
> +From 3f30f3a7e3f07f5ca3cef0f405b02e22a018c6e4 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 9 May 2021 15:22:29 +0200
> +Subject: [PATCH] unix/uxutils.h: fix build on uclibc
> +
> +Build on uclibc is broken since version 0.75 and commit
> +65383082bf0c49cec63f4b36001a40bd9b13edf6 because AT_HWCAP2 is used
> +even if <sys/auxv.h> is not available:
> +
> +unix/uxutils.c: In function 'platform_aes_hw_available':
> +unix/uxutils.c:13:22: error: 'AT_HWCAP2' undeclared (first use in this function)
> +   13 |     return getauxval(AT_HWCAP2) & HWCAP2_AES;
> +      |                      ^~~~~~~~~
> +
> +To fix this build failure, include <elf.h>
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/726f7c5ce13e78ed91e827b872e9d7ccfa13f298
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: sent to Simon Tatham <anakin@pobox.com>]
> +---
> + unix/uxutils.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/unix/uxutils.h b/unix/uxutils.h
> +index c9acff53..b80bf972 100644
> +--- a/unix/uxutils.h
> ++++ b/unix/uxutils.h
> +@@ -18,6 +18,8 @@
> + 
> + #if defined __arm__ || defined __aarch64__
> + 
> ++#include <elf.h>
> ++
> + #ifdef HAVE_SYS_TYPES_H
> + #include <sys/types.h>
> + #endif
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2

Looks like an arm specific issue. Nevertheless, thanks for taking care
of the fix.

Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210510/8debb3df/attachment.asc>
