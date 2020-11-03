From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Nov 2020 23:33:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: fix build issue for
 unsupported architectures
In-Reply-To: <20201103220454.12557-1-heiko.thiery@gmail.com>
References: <20201103220454.12557-1-heiko.thiery@gmail.com>
Message-ID: <20201103223351.GN2887157@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-11-03 23:04 +0100, Heiko Thiery spake thusly:
> Release v1.9 introduced the oslat tool that only builds for supported
> architectures (i386, x86_64, PPC64) and leads to a build failure for the
> whole suite. An upstream patch changes this build error to a runtime warning.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/72322cf7239a91211b0be74c01b55873340763f8
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-Allow-build-for-not-supported-archs.patch | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/rt-tests/0002-rt-tests-oslat-Allow-build-for-not-supported-archs.patch
> 
> diff --git a/package/rt-tests/0002-rt-tests-oslat-Allow-build-for-not-supported-archs.patch b/package/rt-tests/0002-rt-tests-oslat-Allow-build-for-not-supported-archs.patch
> new file mode 100644
> index 0000000000..96b36d60dd
> --- /dev/null
> +++ b/package/rt-tests/0002-rt-tests-oslat-Allow-build-for-not-supported-archs.patch
> @@ -0,0 +1,52 @@
> +From 165b597e3003c6870f5980e8902014d9344e6cf3 Mon Sep 17 00:00:00 2001
> +From: Peter Xu <peterx@redhat.com>
> +Date: Thu, 1 Oct 2020 14:47:26 -0400
> +Subject: [PATCH] rt-tests: oslat: Allow build for not supported archs
> +
> +Now rt-tests won't build for archs other than x86/i386/ppc64 after oslat is
> +merged.  Instead of failing the build, let's make it pass.  However, whenever
> +oslat is executed, instead of running the real program, dump an error message,
> +so that people can try to implement the frc() function for it when there's a
> +real need for the new arch.
> +
> +Signed-off-by: Peter Xu <peterx@redhat.com>
> +Signed-off-by: John Kacur <jkacur@redhat.com>
> +
> +[Taken from:
> +https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/src/oslat/oslat.c?h=unstable/devel/latest&id=165b597e3003c6870f5980e8902014d9344e6cf3]
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +---
> + src/oslat/oslat.c | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/oslat/oslat.c b/src/oslat/oslat.c
> +index f1a82f2..a8b6155 100644
> +--- a/src/oslat/oslat.c
> ++++ b/src/oslat/oslat.c
> +@@ -69,7 +69,9 @@ static inline void frc(uint64_t *pval)
> + 	__asm__ __volatile__("mfspr %0, 268\n" : "=r" (*pval));
> + }
> + # else
> +-#  error Need frc() for this platform.
> ++#  define relax()          do { } while (0)
> ++#  define frc(x)
> ++#  define FRC_MISSING
> + # endif
> + #else
> + # error Need to add support for this compiler.
> +@@ -810,6 +812,12 @@ int main(int argc, char *argv[])
> + 	int i, n_cores;
> + 	cpu_set_t cpu_set;
> + 
> ++#ifdef FRC_MISSING
> ++	printf("This architecture is not yet supported. "
> ++	       "Please implement frc() function first for %s.\n", argv[0]);
> ++	return 0;
> ++#endif
> ++
> + 	CPU_ZERO(&cpu_set);
> + 
> + 	g.app_name = argv[0];
> +-- 
> +2.20.1
> +
> -- 
> 2.20.1
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
