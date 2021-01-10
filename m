From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 14:44:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/busybox: fix selinux-related
 build error
In-Reply-To: <20210110122310.313941-1-bernd.kuhls@t-online.de>
References: <20210110122310.313941-1-bernd.kuhls@t-online.de>
Message-ID: <20210110134414.GS3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-01-10 13:23 +0100, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/b89/b89b7d0f0601bb706e76cea31cf4e43326e5540c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...3-update_passwd-fix-context-variable.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/busybox/0003-update_passwd-fix-context-variable.patch
> 
> diff --git a/package/busybox/0003-update_passwd-fix-context-variable.patch b/package/busybox/0003-update_passwd-fix-context-variable.patch
> new file mode 100644
> index 0000000000..25c07d7054
> --- /dev/null
> +++ b/package/busybox/0003-update_passwd-fix-context-variable.patch
> @@ -0,0 +1,41 @@
> +From b4828612abe378491693c9036db19e4f64768307 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 10 Jan 2021 13:15:04 +0100
> +Subject: [PATCH] update_passwd: fix context variable
> +
> +Commit
> +https://git.busybox.net/busybox/commit/libbb/update_passwd.c?id=2496616b0a8d1c80cd1416b73a4847b59b9f969a
> +
> +changed the variable used from context to seuser but forgot this
> +change resulting in build errors detected by buildroot autobuilders:
> +
> +http://autobuild.buildroot.net/results/b89/b89b7d0f0601bb706e76cea31cf4e43326e5540c//build-end.log
> +
> +libbb/update_passwd.c:51:11: error: 'context' undeclared (first use in
> + this function); did you mean 'ucontext'?
> +   freecon(context);
> +
> +Patch sent upstream:
> +http://lists.busybox.net/pipermail/busybox/2021-January/088467.html
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + libbb/update_passwd.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libbb/update_passwd.c b/libbb/update_passwd.c
> +index 7b67f30cd..a228075cc 100644
> +--- a/libbb/update_passwd.c
> ++++ b/libbb/update_passwd.c
> +@@ -48,7 +48,7 @@ static void check_selinux_update_passwd(const char *username)
> + 			bb_simple_error_msg_and_die("SELinux: access denied");
> + 	}
> + 	if (ENABLE_FEATURE_CLEAN_UP)
> +-		freecon(context);
> ++		freecon(seuser);
> + }
> + #else
> + # define check_selinux_update_passwd(username) ((void)0)
> +-- 
> +2.29.2
> +
> -- 
> 2.29.2
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
