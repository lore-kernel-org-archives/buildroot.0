From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 11 Mar 2021 16:51:18 +0200
Subject: [Buildroot] [PATCH] strace: fix build for no-MMU targets
In-Reply-To: <479cffd2532537c8d913d9c43ef4c582871ebef4.1615438767.git.baruch@tkos.co.il>
References: <479cffd2532537c8d913d9c43ef4c582871ebef4.1615438767.git.baruch@tkos.co.il>
Message-ID: <87r1klagm1.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

On Thu, Mar 11 2021, Baruch Siach wrote:
> Add patch to disable fork() calling code on !HAVE_FORK.

I forgot the reference to autobuild failure.

Fixes:
http://autobuild.buildroot.net/results/3d506e2f6337327c0783cf3cc12a8b5fb78521e4/

baruch

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
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

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
