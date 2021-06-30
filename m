From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jun 2021 23:08:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix build with gcc
 4.8
In-Reply-To: <20210610054613.1711860-1-fontaine.fabrice@gmail.com>
References: <20210610054613.1711860-1-fontaine.fabrice@gmail.com>
Message-ID: <20210630210853.GA2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-10 07:46 +0200, Fabrice Fontaine spake thusly:
> Fix build failure with gcc 4.8 which is raised since bump to version 3.2
> in commit b7ff47516ea01436c53b4d1e2b7a5b595ef3ed80
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/37eb0952a763256fbf6ef3c668f6c95fbdf2dd35
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...s-getseuser.c-fix-build-with-gcc-4.8.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch
> 
> diff --git a/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch b/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch
> new file mode 100644
> index 0000000000..645e84b236
> --- /dev/null
> +++ b/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch
> @@ -0,0 +1,47 @@
> +From 5c4ddfc88f0a7f10a5e9edddbdbe8e8ef1f9945e Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 10 Jun 2021 07:38:02 +0200
> +Subject: [PATCH] libselinux/utils/getseuser.c: fix build with gcc 4.8
> +
> +Fix the following build failure with gcc 4.8 which is raised since
> +version 3.2 and
> +https://github.com/SELinuxProject/selinux/commit/156dd0de5cad31e7d437c64e11a8aef027f0a691
> +
> +getseuser.c:53:2: error: 'for' loop initial declarations are only allowed in C99 mode
> +  for (int i = 0; i < n; i++)
> +  ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/37eb0952a763256fbf6ef3c668f6c95fbdf2dd35
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/SELinuxProject/selinux/pull/289]
> +---
> + libselinux/utils/getseuser.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/utils/getseuser.c b/utils/getseuser.c
> +index ce1b7b27..34f2e887 100644
> +--- a/utils/getseuser.c
> ++++ b/utils/getseuser.c
> +@@ -9,7 +9,7 @@ int main(int argc, char **argv)
> + {
> + 	char *seuser = NULL, *level = NULL;
> + 	char **contextlist;
> +-	int rc, n;
> ++	int rc, n, i;
> + 
> + 	if (argc != 3) {
> + 		fprintf(stderr, "usage:  %s linuxuser fromcon\n", argv[0]);
> +@@ -50,7 +50,7 @@ int main(int argc, char **argv)
> + 	if (n == 0)
> + 		printf("no valid context found\n");
> + 
> +-	for (int i = 0; i < n; i++)
> ++	for (i = 0; i < n; i++)
> + 		printf("Context %d\t%s\n", i, contextlist[i]);
> + 
> + 	freeconary(contextlist);
> +-- 
> +2.30.2
> +
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
