From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Apr 2021 21:08:37 +0200
Subject: [Buildroot] [PATCH v1] package/valgrind: fix musl compile
In-Reply-To: <20210406214840.32198-1-ps.report@gmx.net>
References: <20210406214840.32198-1-ps.report@gmx.net>
Message-ID: <ba1fbd2d-1b99-c2df-6649-0ef42cd11f13@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/04/2021 23:48, Peter Seiderer wrote:
> The file musl.supp is missing from the download source package, add a
> patch deviated from reduced upstream commit ([1]) re-adding the missing file.
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/b106be44d6e7d82a4e3ad16c995366a46d39ee3c
> 
>   make[1]: *** No rule to make target 'musl.supp', needed by 'default.supp'.  Stop.
> 
> [1] https://sourceware.org/git/?p=valgrind.git;a=patch;h=f4d98ff79d5a79102b777ea7e23002d9f7326489
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...Patch-Suppression-file-for-musl-libc.patch | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 package/valgrind/0003-Bug-408663-Patch-Suppression-file-for-musl-libc.patch
> 
> diff --git a/package/valgrind/0003-Bug-408663-Patch-Suppression-file-for-musl-libc.patch b/package/valgrind/0003-Bug-408663-Patch-Suppression-file-for-musl-libc.patch
> new file mode 100644
> index 0000000000..b7e075e9fd
> --- /dev/null
> +++ b/package/valgrind/0003-Bug-408663-Patch-Suppression-file-for-musl-libc.patch
> @@ -0,0 +1,69 @@
> +From c5a5190ec7936e53bcd2082fb0151bc48a804b8b Mon Sep 17 00:00:00 2001
> +From: Paul Floyd <pjfloyd@wanadoo.fr>
> +Date: Tue, 8 Dec 2020 15:07:29 +0100
> +Subject: [PATCH] Bug 408663 - Patch: Suppression file for musl libc
> +
> +[Upstream https://sourceware.org/git/?p=valgrind.git;a=patch;h=f4d98ff79d5a79102b777ea7e23002d9f7326489
> + reduced to the missing musl.supp file download source file
> + Reported https://bugs.kde.org/show_bug.cgi?id=435438]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + musl.supp | 46 ++++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 46 insertions(+)
> + create mode 100644 musl.supp
> +
> +diff --git a/musl.supp b/musl.supp
> +new file mode 100644
> +index 0000000..864172a
> +--- /dev/null
> ++++ b/musl.supp
> +@@ -0,0 +1,46 @@
> ++# Suppressions for musl libc
> ++# See: https://www.openwall.com/lists/musl/2017/06/15/4
> ++
> ++{
> ++   musl-dynlink-false-positive1
> ++   Memcheck:Leak
> ++   fun:calloc
> ++   fun:load_direct_deps
> ++   fun:load_deps
> ++   fun:load_deps
> ++   fun:__dls3
> ++   fun:__dls2b
> ++   fun:__dls2
> ++}
> ++
> ++{
> ++   musl-dynlink-false-positive2
> ++   Memcheck:Leak
> ++   fun:calloc
> ++   fun:load_direct_deps
> ++   fun:load_deps
> ++   fun:load_deps
> ++   fun:__dls3
> ++   fun:__dls2
> ++}
> ++
> ++{
> ++   musl-dynlink-false-positive3
> ++   Memcheck:Leak
> ++   fun:calloc
> ++   fun:load_library
> ++   fun:load_preload
> ++   fun:__dls3
> ++   fun:__dls2b
> ++   fun:__dls2
> ++}
> ++
> ++{
> ++   musl-dynlink-false-positive4
> ++   Memcheck:Leak
> ++   fun:calloc
> ++   fun:load_library
> ++   fun:load_preload
> ++   fun:__dls3
> ++   fun:__dls2
> ++}
> +-- 
> +2.30.2
> +
> 
