From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Feb 2014 18:43:41 +0100
Subject: [Buildroot] [PATCH v2 3/6] rt-tests: use
	BR2_TOOLCHAIN_HAS_THREADS_NPTL
In-Reply-To: <1392757744-29984-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392757744-29984-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5304ED4D.9020000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/14 22:09, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/rt-tests/Config.in | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
> index 58a88a8..461e6de 100644
> --- a/package/rt-tests/Config.in
> +++ b/package/rt-tests/Config.in
> @@ -1,10 +1,6 @@
>  config BR2_PACKAGE_RT_TESTS
>  	bool "rt-tests"
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	# priority-inheritance mutex needs NPTL
> -	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
> -	# no NPTL for these archs
> -	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	help
>  	  Set of utilities for testing the real-time behaviour of a
>  	  Linux system.
> @@ -23,7 +19,5 @@ config BR2_PACKAGE_RT_TESTS
>  
>  	  http://rt.wiki.kernel.org
>  
> -comment "rt-tests needs a toolchain w/ threads"
> -	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
> -	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "rt-tests needs a toolchain w/ NPTL"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> 

 Side-track: we normally only display comments in the case that the user
can do something about it by changing the config options. So here, the
comment should also depend on !BR2_bfin && !BR2_xtensa && ...

 But this is true for all the things that depend on (e)glibc as well...

 So the situation we have now is that on e.g. blackfin, there are a lot
of packages that are hidden without comment, but also a lot that say that
(e)glibc is required.

 To fix, we'd need a symbol like BR2_TOOLCHAIN_THREADS_NPTL_AVAILABLE
(and similar for (e)glibc) to indicate if the architecture supports this
feature to begin with.

 Hm, maybe this is not a side-track after all... Could something like
that be part of this patch set? The same can be done later for (e)glibc
as well.

 And another side-track within the side-track: I noticed while checking
the comments for blackfin that I don't see any comments regarding
!STATIC. That is because even on blackfin, BR2_PREFER_STATIC is an
option... Thomas, you have that patch set to make three options for
static vs. dynamic, so that patch set probably solves that issue as well,
right? It would be good if you could extract the part that fixes the
issue (i.e. adds something like _HAVE_DYNAMIC) and submit that on the
short term.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
