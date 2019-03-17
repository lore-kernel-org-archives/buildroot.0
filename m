From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Mar 2019 19:01:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: bump to version
 2.0.13
In-Reply-To: <20190317160756.29049-1-fontaine.fabrice@gmail.com>
References: <20190317160756.29049-1-fontaine.fabrice@gmail.com>
Message-ID: <87bm29zb81.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Sun, Mar 17 2019, Fabrice Fontaine wrote:

> Remove patches (already in version)
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch   | 61 ----------------------
>  ...include-files-in-configure-COLLISION-test.patch | 38 --------------
>  package/keepalived/keepalived.hash                 |  2 +-
>  package/keepalived/keepalived.mk                   |  2 +-
>  4 files changed, 2 insertions(+), 101 deletions(-)
>  delete mode 100644 package/keepalived/0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch
>  delete mode 100644 package/keepalived/0002-Fix-order-of-include-files-in-configure-COLLISION-test.patch
>
> diff --git a/package/keepalived/0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch b/package/keepalived/0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch
> deleted file mode 100644
> index 4402b48a8b..0000000000
> --- a/package/keepalived/0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 7d4856e213f349bcd97b3644b01d6170b226de16 Mon Sep 17 00:00:00 2001
> -From: Quentin Armitage <quentin@armitage.org.uk>
> -Date: Tue, 20 Nov 2018 17:24:58 +0000
> -Subject: [PATCH] Rename TIMER_MAX to TIMER_MAXIMUM
> -
> -ulibC defines TIMER_MAX, so to avoid naming conflict rename it.
> -
> -This issue was reported by Paul Gildea <gildeap@tcd.ie> who also
> -provided the patch.
> -
> -Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/acassen/keepalived/commit/7d4856e213f349bcd97b3644b01d6170b226de16]
> ----
> - lib/parser.c | 8 ++++----
> - lib/parser.h | 2 +-
> - 2 files changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/lib/parser.c b/lib/parser.c
> -index 1d53595c0..cc9b644e2 100644
> ---- a/lib/parser.c
> -+++ b/lib/parser.c
> -@@ -1915,20 +1915,20 @@ read_timer(vector_t *strvec, size_t index, unsigned long *res, unsigned long min
> - #endif
> - 
> - 	if (!max_time)
> --		max_time = TIMER_MAX;
> -+		max_time = TIMER_MAXIMUM;
> - 
> - 	errno = 0;
> - 	timer = strtoul(vector_slot(strvec, index), &endptr, 10);
> --	*res = (timer > TIMER_MAX ? TIMER_MAX : timer) * TIMER_HZ;
> -+	*res = (timer > TIMER_MAXIMUM ? TIMER_MAXIMUM : timer) * TIMER_HZ;
> - 
> - 	if (FMT_STR_VSLOT(strvec, index)[0] == '-')
> - 		report_config_error(CONFIG_INVALID_NUMBER, "%snegative number '%s'", warn, FMT_STR_VSLOT(strvec, index));
> - 	else if (*endptr)
> - 		report_config_error(CONFIG_INVALID_NUMBER, "%sinvalid number '%s'", warn, FMT_STR_VSLOT(strvec, index));
> --	else if (errno == ERANGE || timer > TIMER_MAX)
> -+	else if (errno == ERANGE || timer > TIMER_MAXIMUM)
> - 		report_config_error(CONFIG_INVALID_NUMBER, "%snumber '%s' outside timer range", warn, FMT_STR_VSLOT(strvec, index));
> - 	else if (timer < min_time || timer > max_time)
> --		report_config_error(CONFIG_INVALID_NUMBER, "number '%s' outside range [%ld, %ld]", FMT_STR_VSLOT(strvec, index), min_time, max_time ? max_time : TIMER_MAX);
> -+		report_config_error(CONFIG_INVALID_NUMBER, "number '%s' outside range [%ld, %ld]", FMT_STR_VSLOT(strvec, index), min_time, max_time ? max_time : TIMER_MAXIMUM);
> - 	else
> - 		return true;
> - 
> -diff --git a/lib/parser.h b/lib/parser.h
> -index 88a74474a..291aa8ffe 100644
> ---- a/lib/parser.h
> -+++ b/lib/parser.h
> -@@ -38,7 +38,7 @@
> - #define MAXBUF	1024
> - 
> - /* Maximum time read_timer can return */
> --#define TIMER_MAX (ULONG_MAX / TIMER_HZ)
> -+#define TIMER_MAXIMUM (ULONG_MAX / TIMER_HZ)
> - 
> - /* Configuration test errors. These should be in decreasing order of severity */
> - typedef enum {
> diff --git a/package/keepalived/0002-Fix-order-of-include-files-in-configure-COLLISION-test.patch b/package/keepalived/0002-Fix-order-of-include-files-in-configure-COLLISION-test.patch
> deleted file mode 100644
> index 76c88a76bf..0000000000
> --- a/package/keepalived/0002-Fix-order-of-include-files-in-configure-COLLISION-test.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From e4dd33f16fe56d09c8d59d1254a4ed1d8e9bb29c Mon Sep 17 00:00:00 2001
> -From: Quentin Armitage <quentin@armitage.org.uk>
> -Date: Thu, 6 Dec 2018 12:16:08 +0000
> -Subject: [PATCH] Fix order of include files in configure COLLISION test
> -
> -Since Linux 4.4.11 (commit 1575c09) including linux/if.h after
> -net/if.h works, whereas until glibc fix their headers including
> -net/if.h after linux/if.h causes compiler redefinition errors.
> -
> -Unfortunately the test for the collision was done the wrong way
> -round, as identified in issue #1079. The patch included in the
> -issue report corrects the order of inclusion of the header files.
> -
> -What we should do is ensure that glibc header files are included
> -before Linux header files, so that at least if kernel headers from
> -4.4.11 onwards are used, the conflict will not occur.
> -
> -Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from: https://github.com/acassen/keepalived/commit/e4dd33f16fe56d09c8d59d1254a4ed1d8e9bb29c]
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)

Can we drop AUTORECONF now?

baruch

> -
> -diff --git a/configure.ac b/configure.ac
> -index 7a2e8ce1..9badcc62 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1349,8 +1349,8 @@ AC_MSG_CHECKING([for linux/if.h and net/if.h namespace collision])
> - SAV_CPPFLAGS="$CPPFLAGS"
> - CPPFLAGS="$CPPFLAGS $kernelinc"
> - AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
> --    #include <net/if.h>
> -     #include <linux/if.h>
> -+    #include <net/if.h>
> -   ]])],
> -   [
> -     AC_MSG_RESULT([no])
> diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
> index 3ad3e6e6ac..5f9f569ca7 100644
> --- a/package/keepalived/keepalived.hash
> +++ b/package/keepalived/keepalived.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256	40e0e55afed9ca313d621a9c5878579696fafb5504dab521aadaf20ba6e7f597  keepalived-2.0.10.tar.gz
> +sha256	c7fb38e8a322fb898fb9f6d5d566827a30aa5a4cd1774f474bb4041c85bcbc46  keepalived-2.0.13.tar.gz
>  sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
> index 4f6db01722..fc6b01521d 100644
> --- a/package/keepalived/keepalived.mk
> +++ b/package/keepalived/keepalived.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KEEPALIVED_VERSION = 2.0.10
> +KEEPALIVED_VERSION = 2.0.13
>  KEEPALIVED_SITE = http://www.keepalived.org/software
>  KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
>  KEEPALIVED_LICENSE = GPL-2.0+


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
