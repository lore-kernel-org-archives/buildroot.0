From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Feb 2021 22:39:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/brltty: fix build with gcc < 5
In-Reply-To: <20210221195901.4171892-1-fontaine.fabrice@gmail.com>
References: <20210221195901.4171892-1-fontaine.fabrice@gmail.com>
Message-ID: <20210225213943.GL2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-21 20:59 +0100, Fabrice Fontaine spake thusly:
> Fix build of brltty in version 6.2 with gcc < 5
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b758c6ffc7a14b24d5482e65ba6f90bc046ebd01
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...gmprivs_linux.c-fix-build-with-gcc-5.patch | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch
> 
> diff --git a/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch b/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch
> new file mode 100644
> index 0000000000..afae4115a0
> --- /dev/null
> +++ b/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch
> @@ -0,0 +1,53 @@
> +From b4339c75d1872e5cdd40f5456228c2da8cc10b06 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 21 Feb 2021 20:47:06 +0100
> +Subject: [PATCH] Programs/pgmprivs_linux.c: fix build with gcc < 5
> +
> +Build with gcc < 5 is broken since version 6.2 and
> +https://github.com/brltty/brltty/commit/8ce262f2c15f10a40d9cbae0b3c88b466970a055:
> +
> +./pgmprivs_linux.c: In function 'getPrivilegeParameterNames':
> +./pgmprivs_linux.c:2220:3: error: array initialized from non-constant array expression
> +   static const char *const names[] = NULL_TERMINATED_STRING_ARRAY(
> +   ^
> +
> +Build was partially fixed since
> +https://github.com/brltty/brltty/commit/8ae78dd560d00c5074158f90be5ac8dac80183db
> +but it forgot to update pgmprivs_linux.c
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/58afeb50a0ecdb8b527d7c9946bcae290b79b055
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/brltty/brltty/pull/312]
> +---
> + Programs/pgmprivs_linux.c | 10 ++++++----
> + 1 file changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/Programs/pgmprivs_linux.c b/Programs/pgmprivs_linux.c
> +index 56e464a82..7dfabaf9b 100644
> +--- a/Programs/pgmprivs_linux.c
> ++++ b/Programs/pgmprivs_linux.c
> +@@ -2215,13 +2215,15 @@ typedef enum {
> +   PARM_USER,
> + } Parameters;
> + 
> +-const char *const *
> +-getPrivilegeParameterNames (void) {
> +-  static const char *const names[] = NULL_TERMINATED_STRING_ARRAY(
> ++
> ++static const char *const *const pgmprivs_names =
> ++  NULL_TERMINATED_STRING_ARRAY(
> +     "path", "scfmode", "shell", "user"
> +   );
> + 
> +-  return names;
> ++const char *const *
> ++getPrivilegeParameterNames (void) {
> ++  return pgmprivs_names;
> + }
> + 
> + const char *
> +-- 
> +2.30.0
> +
> -- 
> 2.30.0
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
