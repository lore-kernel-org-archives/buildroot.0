From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Mar 2021 22:01:11 +0100
Subject: [Buildroot] [PATCH] strace: fix build for no-MMU targets
In-Reply-To: <479cffd2532537c8d913d9c43ef4c582871ebef4.1615438767.git.baruch@tkos.co.il>
References: <479cffd2532537c8d913d9c43ef4c582871ebef4.1615438767.git.baruch@tkos.co.il>
Message-ID: <20210311210111.GU2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2021-03-11 06:59 +0200, Baruch Siach spake thusly:
> Add patch to disable fork() calling code on !HAVE_FORK.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master with the autobuilder reference added, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...et_syscall_info-disable_ptrace_getre.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch
> 
> diff --git a/package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch b/package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch
> new file mode 100644
> index 000000000000..1367d2985a0f
> --- /dev/null
> +++ b/package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch
> @@ -0,0 +1,33 @@
> +From 84536a993417f3bfff4a54830fa34a3f91f5716e Mon Sep 17 00:00:00 2001
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Thu, 11 Mar 2021 06:43:26 +0200
> +Subject: [PATCH] disable_ptrace_get_syscall_info, disable_ptrace_getregset:
> + require fork()
> +
> +These helper programs require fork(), so they are incompatible with
> +no-MMU systems. Make the code depend on HAVE_FORK.
> +
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +---
> +Upstream status: https://lists.strace.io/pipermail/strace-devel/2021-March/010421.html
> +
> + src/disable_ptrace_request.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/disable_ptrace_request.c b/src/disable_ptrace_request.c
> +index 57163e77f0f4..715006941572 100644
> +--- a/src/disable_ptrace_request.c
> ++++ b/src/disable_ptrace_request.c
> +@@ -41,7 +41,8 @@ init(int argc, char **argv)
> +  && defined PR_SET_NO_NEW_PRIVS \
> +  && defined PR_SET_SECCOMP \
> +  && defined BPF_JUMP \
> +- && defined BPF_STMT
> ++ && defined BPF_STMT \
> ++ && defined HAVE_FORK
> + 
> + static unsigned int
> + get_arch(void)
> +-- 
> +2.30.1
> +
> -- 
> 2.30.1
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
