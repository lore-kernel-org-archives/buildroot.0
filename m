From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Sep 2020 16:53:06 +0200
Subject: [Buildroot] [PATCH] package/uclibc: backport static linking
 fixes
In-Reply-To: <20200908144837.169026-1-petr.vorel@gmail.com>
References: <20200908144837.169026-1-petr.vorel@gmail.com>
Message-ID: <20200908165306.577fd1b8@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Sep 2020 16:48:37 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Reported-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> not sure if the second commit, which changes Rules.mak does not require
> also some change on our side (it shouldn't, but better ask).

The commit log should ideally have a link to the autobuilder failures
that this is fixing (we have some I believe).

> diff --git a/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch b/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
> new file mode 100644
> index 0000000000..be18b32f79
> --- /dev/null
> +++ b/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
> @@ -0,0 +1,43 @@
> +From e80384786d7b7f895c97f2447d4b91af8eb5f0f4 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Wed, 2 Sep 2020 09:45:17 +0200
> +Subject: [PATCH 1/2] Revert "Fix static linking with GCC-10"

Could you generate the patches with "git format-patch -N". This is
pointed out by "make check-package".

> +
> +This reverts commit 5b58a1ebd89a4f05778441814e81817c82193fa3.
> +
> +This breaks all static builds earlier to gcc 10 :(
> +Bad testing on my side.

We need you to sign-off on the patches.

Same comment for the second patch of course.

> +diff --git a/Rules.mak b/Rules.mak
> +index f270b7bee..55e88d462 100644
> +--- a/Rules.mak
> ++++ b/Rules.mak
> +@@ -288,7 +288,7 @@ OPTIMIZATION += $(CFLAG_-fstrict-aliasing)
> + 
> + # Why -funsigned-char: I hunted a bug related to incorrect
> + # sign extension of 'char' type for 10 hours straight. Not fun.
> +-CPU_CFLAGS-y := -funsigned-char -fno-builtin
> ++CPU_CFLAGS-y := -funsigned-char -fno-builtin -fcommon

Obviously, this is papering over the problem a bit, but OK, if that's
the upstream fix for the moment, let's go with it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
