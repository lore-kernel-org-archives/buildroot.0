From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 19:59:28 +0200
Subject: [Buildroot] [PATCH 1/1] stress-ng: Depend on kernel headers >=
 3.3
In-Reply-To: <1441988351-9923-1-git-send-email-corjon.j@ecagroup.com>
References: <1441988351-9923-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20150911195928.51c339dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

On Fri, 11 Sep 2015 18:19:11 +0200, Julien Corjon wrote:
> perf.c need PERF_COUNT_HW_REF_CPU_CYCLES instruction which is available
> only since 3.3 kernel version
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/stress-ng/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
> index cdf9984..1e475b1 100644
> --- a/package/stress-ng/Config.in
> +++ b/package/stress-ng/Config.in
> @@ -4,8 +4,8 @@ config BR2_PACKAGE_STRESS_NG
>  	# disabled on musl: stress-malloc.c needs mallopt() and M_MMAP_THRESHOLD
>  	# disabled on uClibc: stress-aio.c needs aio.h
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
> -	# perf.c needs PERF_COUNT_HW_STALLED_CYCLES_FRONTEND
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> +	# perf.c needs PERF_COUNT_HW_REF_CPU_CYCLES
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3

This seems wrong, because stress-ng.h has the definitions for all the
PERF_COUNT_* values:

#if defined(__linux__) && defined(__NR_perf_event_open)
#define STRESS_PERF_STATS       (1)
#define STRESS_PERF_INVALID     (~0ULL)
enum {
        STRESS_PERF_HW_CPU_CYCLES = 0,
        STRESS_PERF_HW_INSTRUCTIONS,
        STRESS_PERF_HW_CACHE_REFERENCES,
        STRESS_PERF_HW_CACHE_MISSES,
        STRESS_PERF_HW_BRANCH_INSTRUCTIONS,
        STRESS_PERF_HW_BRANCH_MISSES,
        STRESS_PERF_HW_BUS_CYCLES,
        STRESS_PERF_HW_REF_CPU_CYCLES,
        STRESS_PERF_HW_STALLED_CYCLES_FRONTEND,
        STRESS_PERF_HW_STALLED_CYCLES_BACKEND,

        STRESS_PERF_SW_PAGE_FAULTS_MIN,
        STRESS_PERF_SW_PAGE_FAULTS_MAJ,
        STRESS_PERF_SW_CONTEXT_SWITCHES,
        STRESS_PERF_SW_CPU_MIGRATIONS,
        STRESS_PERF_SW_ALIGNMENT_FAULTS,

Can you figure out why it doesn't get used?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
