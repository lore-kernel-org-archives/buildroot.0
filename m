From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 22:41:00 +0200
Subject: [Buildroot] [PATCH] package/daemon: bump to version 0.8
In-Reply-To: <ee602ffcc307dffea6df5d7df388fa2cc6df33a0.1624534780.git.baruch@tkos.co.il>
References: <ee602ffcc307dffea6df5d7df388fa2cc6df33a0.1624534780.git.baruch@tkos.co.il>
Message-ID: <20210629204100.GX2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2021-06-24 14:39 +0300, Baruch Siach spake thusly:
> Drop upstream patch.
> 
> Add another patch to fix build with musl.
> 
> Update COPYING hash because of date change.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...aemon-fix-build-with-musl-libc-again.patch | 46 +++++++++++++++++++
>  package/daemon/0001-fix-musl.patch            | 18 --------
>  package/daemon/daemon.hash                    |  4 +-
>  package/daemon/daemon.mk                      |  2 +-
>  4 files changed, 49 insertions(+), 21 deletions(-)
>  create mode 100644 package/daemon/0001-daemon-fix-build-with-musl-libc-again.patch
>  delete mode 100644 package/daemon/0001-fix-musl.patch
> 
> diff --git a/package/daemon/0001-daemon-fix-build-with-musl-libc-again.patch b/package/daemon/0001-daemon-fix-build-with-musl-libc-again.patch
> new file mode 100644
> index 000000000000..48d95f122fe7
> --- /dev/null
> +++ b/package/daemon/0001-daemon-fix-build-with-musl-libc-again.patch
> @@ -0,0 +1,46 @@
> +From b879e6886498fdd147287bffdf5867378c7f3299 Mon Sep 17 00:00:00 2001
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Thu, 24 Jun 2021 14:28:10 +0300
> +Subject: [PATCH] daemon: fix build with musl libc (again)
> +
> +Commit 6b28c54dd95b3 added HAVE_SYS_TTYDEFAULTS_H to guard
> +sys/ttydefaults.h include. This breaks musl libc build because
> +HAVE_SYS_TTYDEFAULTS_H is not defined until config.h is included.
> +
> +Move sys/ttydefaults.h include below config.h
> +
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +---
> +Upstream status: https://github.com/raforg/daemon/pull/4
> +
> + daemon.c | 7 ++++---
> + 1 file changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/daemon.c b/daemon.c
> +index 5c5ef2cb86df..f88a0d49bf84 100644
> +--- a/daemon.c
> ++++ b/daemon.c
> +@@ -1011,9 +1011,6 @@ I<elogind(8)>
> + #ifdef _RESTORE_POSIX_SOURCE
> + #define _POSIX_SOURCE
> + #endif
> +-#ifdef HAVE_SYS_TTYDEFAULTS_H /* For CEOF in musl libc (Linux only) */
> +-#include <sys/ttydefaults.h>
> +-#endif
> + #include <dirent.h>
> + #include <sys/wait.h>
> + #include <sys/stat.h>
> +@@ -1037,6 +1034,10 @@ I<elogind(8)>
> + #include <systemd/sd-login.h>
> + #endif
> + 
> ++#ifdef HAVE_SYS_TTYDEFAULTS_H /* For CEOF in musl libc (Linux only) */
> ++#include <sys/ttydefaults.h>
> ++#endif

I would have instead moved config.h before all other includes...
But oh well...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> + /* Configuration file entries */
> + 
> + typedef struct Config Config;
> +-- 
> +2.30.2
> +
> diff --git a/package/daemon/0001-fix-musl.patch b/package/daemon/0001-fix-musl.patch
> deleted file mode 100644
> index 5ebb645973f0..000000000000
> --- a/package/daemon/0001-fix-musl.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -daemon: fix build with musl
> -
> -musl requires the ttydefaults.h to be included explicitly for CEOF.
> -
> -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ----
> -
> -diff -Nuar daemon-0.6.4-orig/daemon.c daemon-0.6.4/daemon.c
> ---- daemon-0.6.4-orig/daemon.c	2010-06-12 16:37:00.000000000 +0300
> -+++ daemon-0.6.4/daemon.c	2017-05-01 22:02:17.721413468 +0300
> -@@ -864,6 +864,7 @@
> - #ifdef _RESTORE_POSIX_SOURCE
> - #define _POSIX_SOURCE
> - #endif
> -+#include <sys/ttydefaults.h>
> - #include <dirent.h>
> - #include <sys/wait.h>
> - #include <sys/stat.h>
> diff --git a/package/daemon/daemon.hash b/package/daemon/daemon.hash
> index ec7451a81ec1..c490f715487f 100644
> --- a/package/daemon/daemon.hash
> +++ b/package/daemon/daemon.hash
> @@ -1,5 +1,5 @@
>  # From http://www.libslack.org/daemon/
> -sha256  ba1f6dc87532c852bfb8f436179cd661c3458ff898f67767c414123198626dfd  daemon-0.7.1.tar.gz
> +sha256  74f12e6d4b3c85632489bd08431d3d997bc17264bf57b7202384f2e809cff596  daemon-0.8.tar.gz
>  # Locally calculated
>  sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
> -sha256  cbac6eb0e1f7f95826966c7903939d591092a7f7d7726862946cb49096e8497d  COPYING
> +sha256  91329bb9be4ae0b7800081fa054e9bb760c60005b26958c1fb8461bc66bcd998  COPYING
> diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
> index 91f77dd24a97..96a163e597e6 100644
> --- a/package/daemon/daemon.mk
> +++ b/package/daemon/daemon.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DAEMON_VERSION = 0.7.1
> +DAEMON_VERSION = 0.8
>  DAEMON_SITE = http://libslack.org/daemon/download
>  DAEMON_LICENSE = GPL-2.0+
>  DAEMON_LICENSE_FILES = LICENSE COPYING
> -- 
> 2.30.2
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
