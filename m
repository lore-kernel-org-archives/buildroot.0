From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 25 Sep 2019 13:36:10 -0500
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: bump to version
 d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8
In-Reply-To: <20190925171201.11567-1-fontaine.fabrice@gmail.com>
References: <20190925171201.11567-1-fontaine.fabrice@gmail.com>
Message-ID: <CANQCQpYT4pe8FWtN9CKH-UZK_AjXF5tfr1x3zyNDG923O9bAzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,


On Wed, Sep 25, 2019 at 12:12 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> - Drop first patch, not needed since:
>   https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git/commit?id=d8cf8d34c0e45899f108ce966826acb0553b4b85
> - Drop second patch, not needed since:
>   https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git/commit?id=bd23a79e34ec7f058426027fbcc1b493f960da90
> - Add mmc.h as a license file
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  .../mmc-utils/0001-fix-mmc-h-includes.patch   | 41 -----------------
>  .../0002-fix-overlapping-with-strncpy.patch   | 44 -------------------
>  package/mmc-utils/mmc-utils.hash              |  3 +-
>  package/mmc-utils/mmc-utils.mk                |  3 +-
>  4 files changed, 4 insertions(+), 87 deletions(-)
>  delete mode 100644 package/mmc-utils/0001-fix-mmc-h-includes.patch
>  delete mode 100644 package/mmc-utils/0002-fix-overlapping-with-strncpy.patch
>
> diff --git a/package/mmc-utils/0001-fix-mmc-h-includes.patch b/package/mmc-utils/0001-fix-mmc-h-includes.patch
> deleted file mode 100644
> index 8d0b2eb233..0000000000
> --- a/package/mmc-utils/0001-fix-mmc-h-includes.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -mmc-utils: fix mmc.h includes
> -
> -Some toolchains include asm-generic/int-l64.h from their asm/types.h
> -file for certain 64-bit architectures. This causes a conflict between
> -types like this one:
> -
> -asm-generic/int-l64.h:28:25: error: conflicting types for '__s64'
> - typedef __signed__ long __s64;
> -            ^
> -In file included from mmc.h:17:0,
> -        from mmc_cmds.c:30:
> -asm-generic/int-ll64.h:29:44: note: previous declaration of '__s64' was
> -here
> - __extension__ typedef __signed__ long long __s64;
> -
> -[Ryan: added include of linux/types.h because mmc/ioctl.h does not
> -       include it in kernel version before 3.4]
> -
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ----
> - mmc.h |    4 +++-
> - 1 files changed, 3 insertions(+), 1 deletions(-)
> -diff --git a/mmc.h b/mmc.h
> -index 9871d62..2d54ec5 100644
> ---- a/mmc.h
> -+++ b/mmc.h
> -@@ -14,9 +14,12 @@
> -  * Boston, MA 021110-1307, USA.
> -  */
> -
> --#include <asm-generic/int-ll64.h>
> -+#include <linux/types.h>
> - #include <linux/mmc/ioctl.h>
> - #include <stdio.h>
> -+#ifndef _ASM_GENERIC_INT_L64_H
> -+#include <asm-generic/int-ll64.h>
> -+#endif
> -
> - #define CHECK(expr, msg, err_stmt) { if (expr) { fprintf(stderr, msg); err_stmt; } }
> -
> diff --git a/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch b/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch
> deleted file mode 100644
> index a562845ffa..0000000000
> --- a/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 1c90a7534658056b884d71ef82dc7ca8bad4271b Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
> -Date: Wed, 24 Oct 2018 13:00:47 +0200
> -Subject: [PATCH] mmc-utils: fix overlapping with strncpy
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -GCC 8.2 warns about an overlapping using strncpy.
> -
> -Replace strncpy with a memmove to avoid this issue.
> -
> -In file included from /usr/include/string.h:494,
> -                 from lsmmc.c:46:
> -In function ?strncpy?,
> -    inlined from ?read_file? at lsmmc.c:356:3:
> -/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: ?__builtin_strncpy? accessing 4096 bytes at offsets 0 and 1 overlaps 4095 bytes at offset 1 [-Werror=restrict]
> -   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
> -          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -cc1: all warnings being treated as errors
> -make: *** [Makefile:36: lsmmc.o] Error 1
> -
> -Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
> -Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ----
> - lsmmc.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/lsmmc.c b/lsmmc.c
> -index c4faa00..bcb854d 100644
> ---- a/lsmmc.c
> -+++ b/lsmmc.c
> -@@ -353,7 +353,7 @@ char *read_file(char *name)
> -               line[strlen(line) - 1] = '\0';
> -
> -       while (isspace(line[0]))
> --              strncpy(&line[0], &line[1], sizeof(line));
> -+              memmove(&line[0], &line[1], sizeof(line)-1);
> -
> -       return strdup(line);
> - }
> ---
> -2.16.4
> -
> diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
> index 35cd5800da..86c644f774 100644
> --- a/package/mmc-utils/mmc-utils.hash
> +++ b/package/mmc-utils/mmc-utils.hash
> @@ -1,2 +1,3 @@
>  # Locally computed
> -sha256 92ba148648688fca6e0e0e30248ebc6b432bea55584760f20a013583f20a109d  mmc-utils-37c86e60c0442fef570b75cd81aeb1db4d0cbafd.tar.gz
> +sha256 df8876e0e671f502bb8872cecca3cc6d1055253fa314f3544d22829e129e024e  mmc-utils-d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8.tar.gz
> +sha256 c3165393bcd710624e2909327a6fbeb736c47bdbe66de1c1a364ac7324d3e4d6  mmc.h
> diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
> index 9aeaf5c69c..286e73b242 100644
> --- a/package/mmc-utils/mmc-utils.mk
> +++ b/package/mmc-utils/mmc-utils.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>
> -MMC_UTILS_VERSION = 37c86e60c0442fef570b75cd81aeb1db4d0cbafd
> +MMC_UTILS_VERSION = d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8
>  MMC_UTILS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
>  MMC_UTILS_LICENSE = GPL-2.0
> +MMC_UTILS_LICENSE_FILES = mmc.h
>
>  define MMC_UTILS_BUILD_CMDS
>         $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
> --
> 2.23.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
