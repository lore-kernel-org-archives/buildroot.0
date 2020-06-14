From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 18:35:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/icu: bump version to 67-1
In-Reply-To: <20200613163031.2566037-1-bernd.kuhls@t-online.de>
References: <20200613163031.2566037-1-bernd.kuhls@t-online.de>
Message-ID: <20200614163537.GF2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-06-13 18:30 +0200, Bernd Kuhls spake thusly:
> Release notes:
> http://site.icu-project.org/download/66
> http://site.icu-project.org/download/67
> 
> Removed patches applied upstream:
> 
> 0005:
> https://github.com/unicode-org/icu/commit/4a3a457b38cd828b7b3fa4fdbc6e2504a57275e9
> 
> 0006 - 0008:
> https://github.com/unicode-org/icu/commit/b7facd487444508c5724f8217d53bc41a76a8950
> 
> Reformatted hash file, locally computed tarball hash, upstream does not
> provide hashes anymore. Updated license hash due to upstream commit
> https://github.com/unicode-org/icu/commit/d95621c57f2becc1efd1be1d5c914624a715dac0
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This is already causing some issues in the autobuilders:

    http://autobuild.buildroot.org/results/6d2/6d2658a3c165c99df3eae87b2970e738bd386245/

    utext.cpp:572:5: error: 'max_align_t' in namespace 'std' does not name a type
         std::max_align_t    extension;
         ^

and assorted issues.

Care to have a look, please?

Regards,
Yann E. MORIN.

> ---
>  package/icu/0005-Fix-big-endian-build.patch   | 34 --------------
>  .../icu/0006-ICU-20751-Fix-nios2-build.patch  | 46 -------------------
>  ...ble-conversion-enable-for-microblaze.patch | 25 ----------
>  ...-double-conversion-enable-for-xtensa.patch | 26 -----------
>  package/icu/icu.hash                          |  5 +-
>  package/icu/icu.mk                            |  2 +-
>  6 files changed, 3 insertions(+), 135 deletions(-)
>  delete mode 100644 package/icu/0005-Fix-big-endian-build.patch
>  delete mode 100644 package/icu/0006-ICU-20751-Fix-nios2-build.patch
>  delete mode 100644 package/icu/0007-double-conversion-enable-for-microblaze.patch
>  delete mode 100644 package/icu/0008-double-conversion-enable-for-xtensa.patch
> 
> diff --git a/package/icu/0005-Fix-big-endian-build.patch b/package/icu/0005-Fix-big-endian-build.patch
> deleted file mode 100644
> index 2cb2129010..0000000000
> --- a/package/icu/0005-Fix-big-endian-build.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 9be0b489a94b57419202c552022f25cb95bfac51 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 17 Apr 2019 16:41:58 +0200
> -Subject: [PATCH] Fix big-endian build
> -
> -Bug-report: https://unicode-org.atlassian.net/browse/ICU-20533
> -Patch taken from: https://bugs.gentoo.org/682170
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> -Downloaded from
> -http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch?h=master
> -
> -[Bernd: Fixed path]
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - data/Makefile.in | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/source/data/Makefile.in b/source/data/Makefile.in
> -index 778b6c7..67203e7 100644
> ---- a/source/data/Makefile.in
> -+++ b/source/data/Makefile.in
> -@@ -148,7 +148,8 @@ ICUDATA_ARCHIVE = $(firstword $(wildcard $(srcdir)/in/$(ICUDATA_BASENAME_VERSION
> - # and convert it to the current type.
> - ifneq ($(ICUDATA_ARCHIVE),)
> - ICUDATA_SOURCE_ARCHIVE = $(OUTDIR)/$(ICUDATA_PLATFORM_NAME).dat
> --$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE) $(OUTDIR)
> -+$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE)
> -+	$(MKINSTALLDIRS) $(OUTDIR)
> - 	$(INVOKE) $(TOOLBINDIR)/icupkg -t$(ICUDATA_CHAR) $(ICUDATA_ARCHIVE) $(ICUDATA_SOURCE_ARCHIVE)
> - endif
> - else
> diff --git a/package/icu/0006-ICU-20751-Fix-nios2-build.patch b/package/icu/0006-ICU-20751-Fix-nios2-build.patch
> deleted file mode 100644
> index 6587de484d..0000000000
> --- a/package/icu/0006-ICU-20751-Fix-nios2-build.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From d9d99097a5b28f4204b3a15e82564e50f9e62f5a Mon Sep 17 00:00:00 2001
> -From: Bernd Kuhls <bernd.kuhls@t-online.de>
> -Date: Sat, 3 Aug 2019 08:05:35 +0200
> -Subject: [PATCH] ICU-20751 Fix nios2 build
> -
> -Nios2 supports double conversion, tested using qemu:
> -
> -./main || echo "correct"
> -correct
> -uname -a
> -Linux buildroot 4.19.16 #4 Sat Aug 3 14:46:48 CEST 2019 nios2 GNU/Linux
> -
> -Solves build error
> -
> -In file included from double-conversion.h:42:0,
> -                 from number_decimalquantity.cpp:19:
> -double-conversion-utils.h:119:2: error: #error Target architecture was not detected as supported by Double-Conversion.
> - #error Target architecture was not detected as supported by Double-Conversion.
> -
> -detected by buildroot autobuilders:
> -http://autobuild.buildroot.net/results/91e/91eaec34708d91f8a05af189243be0b7cabce31b/
> -
> -Patch sent upstream: https://github.com/unicode-org/icu/pull/725
> -Bug report: https://unicode-org.atlassian.net/browse/ICU-20751
> -
> -[Bernd: Fixed path]
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - source/i18n/double-conversion-utils.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
> -index 1e44fcaa0e..0cf993929f 100644
> ---- a/source/i18n/double-conversion-utils.h
> -+++ b/source/i18n/double-conversion-utils.h
> -@@ -95,6 +95,7 @@ int main(int argc, char** argv) {
> -     defined(__ARMEL__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
> -     defined(__hppa__) || defined(__ia64__) || \
> -     defined(__mips__) || \
> -+    defined(__nios2__) || \
> -     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
> -     defined(_POWER) || defined(_ARCH_PPC) || defined(_ARCH_PPC64) || \
> -     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
> --- 
> -2.20.1
> -
> diff --git a/package/icu/0007-double-conversion-enable-for-microblaze.patch b/package/icu/0007-double-conversion-enable-for-microblaze.patch
> deleted file mode 100644
> index 278c6c61ea..0000000000
> --- a/package/icu/0007-double-conversion-enable-for-microblaze.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 395f063b6af8885cc9d688eeeb44acf9d75c6045 Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Thu, 3 Oct 2019 16:31:22 +0200
> -Subject: [PATCH] double-conversion: enable for microblaze
> -
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - source/i18n/double-conversion-utils.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
> -index 0cf9939..a00037e 100644
> ---- a/source/i18n/double-conversion-utils.h
> -+++ b/source/i18n/double-conversion-utils.h
> -@@ -104,6 +104,7 @@ int main(int argc, char** argv) {
> -     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
> -     defined(__riscv) || \
> -     defined(__or1k__) || defined(__arc__) || \
> -+    defined(__microblaze__) || \
> -     defined(__EMSCRIPTEN__)
> - #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
> - #elif defined(__mc68000__) || \
> ---
> -2.23.0
> -
> diff --git a/package/icu/0008-double-conversion-enable-for-xtensa.patch b/package/icu/0008-double-conversion-enable-for-xtensa.patch
> deleted file mode 100644
> index cb6be5188b..0000000000
> --- a/package/icu/0008-double-conversion-enable-for-xtensa.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From f8f37357fa7cc403848d2bafe6152a707ca3a074 Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Mon, 28 Oct 2019 21:26:05 +0100
> -Subject: [PATCH] double-conversion: enable for xtensa
> -
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - source/i18n/double-conversion-utils.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
> -index a00037e..b3100ac 100644
> ---- a/source/i18n/double-conversion-utils.h
> -+++ b/source/i18n/double-conversion-utils.h
> -@@ -104,7 +104,7 @@ int main(int argc, char** argv) {
> -     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
> -     defined(__riscv) || \
> -     defined(__or1k__) || defined(__arc__) || \
> --    defined(__microblaze__) || \
> -+    defined(__microblaze__) || defined(__XTENSA__) || \
> -     defined(__EMSCRIPTEN__)
> - #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
> - #elif defined(__mc68000__) || \
> ---
> -2.23.0
> -
> diff --git a/package/icu/icu.hash b/package/icu/icu.hash
> index 5eb508d2cb..5c10008d8a 100644
> --- a/package/icu/icu.hash
> +++ b/package/icu/icu.hash
> @@ -1,4 +1,3 @@
> -# From https://github.com/unicode-org/icu/releases/download/release-65-1/SHASUM512.txt
> -sha512 8f1ef33e1f4abc9a8ee870331c59f01b473d6da1251a19ce403f822f3e3871096f0791855d39c8f20c612fc49cda2c62c06864aa32ddab2dbd186d2b21ce9139  icu4c-65_1-src.tgz
>  # Locally computed
> -sha256 6a18c5fac70d7860b57f5b72b4e2c9a1ba6b3d2741eef7ff9767c5379364f10d  LICENSE
> +sha256  94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc  icu4c-67_1-src.tgz
> +sha256  25e21013a7bc2fad735e28c5278a120e4c7f1c327c8c8b9b4df1751748cddbb2  LICENSE
> diff --git a/package/icu/icu.mk b/package/icu/icu.mk
> index 0b8aeeaee1..c07ca2da3b 100644
> --- a/package/icu/icu.mk
> +++ b/package/icu/icu.mk
> @@ -7,7 +7,7 @@
>  # Git tags (and therefore versions on release-monitoring.org) use the
>  # XX-Y format, but the tarballs are named XX_Y and the containing
>  # directories XX.Y.
> -ICU_VERSION = 65-1
> +ICU_VERSION = 67-1
>  ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
>  ICU_SITE = \
>  	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
> -- 
> 2.26.2
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
