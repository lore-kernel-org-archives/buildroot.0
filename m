From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 12 Sep 2015 11:19:52 +0100
Subject: [Buildroot] [PATCH 1/1] stress-ng: Depend on kernel headers >=
 3.3
In-Reply-To: <1441988351-9923-1-git-send-email-corjon.j@ecagroup.com>
References: <1441988351-9923-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <55F3FC48.1000601@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Corjon,

On 11/09/15 17:19, Julien Corjon wrote:
> perf.c need PERF_COUNT_HW_REF_CPU_CYCLES instruction which is available
> only since 3.3 kernel version
>
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

How I tested it:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/?id=v3.2&qt=grep&q=PERF_COUNT_HW_REF_CPU_CYCLES

Not found.

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/?id=v3.3&qt=grep&q=PERF_COUNT_HW_REF_CPU_CYCLES

Found. Indeed, PERF_COUNT_HW_REF_CPU_CYCLES is available from v3.3, 
although is not an instruction (as you say in the subject) but a generic 
PMU event, as stated in the commit log:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=c37e17497e01fc0f5d2d6feb5723b210b3ab8890

Perhaps you could change your commit log to make it more accurate.

Trying to build stress-ng with a toolchain with 3.2 headers:

$ grep 'BR2_TOOLCHAIN_HEADERS_AT_LEAST=' .config
BR2_TOOLCHAIN_HEADERS_AT_LEAST="3.2"

This is the error message:

/br/output/host/usr/bin/mips-buildroot-linux-gnu-gcc -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -Wall -Wextra 
-DVERSION="0.04.16" -O2 -c -o perf.o perf.c
perf.c:77:48: error: ?PERF_COUNT_HW_REF_CPU_CYCLES? undeclared here (not 
in a function)
   { STRESS_PERF_ ## config, PERF_TYPE_ ## type, PERF_COUNT_ ## config, 
label }
                                                 ^
perf.c:110:2: note: in expansion of macro ?PERF_INFO?
   PERF_INFO(HARDWARE, HW_REF_CPU_CYCLES,  "Total Cycles"),
   ^
make[1]: *** [perf.o] Error 1

Trying to build stress-ng with a toolchain with headers > 3.2:

$ grep 'BR2_TOOLCHAIN_HEADERS_AT_LEAST=' .config
BR2_TOOLCHAIN_HEADERS_AT_LEAST="3.19"

$ file output/target/usr/bin/stress-ng
output/target/usr/bin/stress-ng: ELF 32-bit MSB executable, MIPS, MIPS32 
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for 
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with 
unknown capability 0x10000 = 0x70403, stripped

Built successfully for MIPS architecture.

Regards,

Vincent.

> ---
>   package/stress-ng/Config.in | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
> index cdf9984..1e475b1 100644
> --- a/package/stress-ng/Config.in
> +++ b/package/stress-ng/Config.in
> @@ -4,8 +4,8 @@ config BR2_PACKAGE_STRESS_NG
>   	# disabled on musl: stress-malloc.c needs mallopt() and M_MMAP_THRESHOLD
>   	# disabled on uClibc: stress-aio.c needs aio.h
>   	depends on BR2_TOOLCHAIN_USES_GLIBC
> -	# perf.c needs PERF_COUNT_HW_STALLED_CYCLES_FRONTEND
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> +	# perf.c needs PERF_COUNT_HW_REF_CPU_CYCLES
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
>   	depends on !BR2_microblaze # keyutils
>   	depends on !BR2_STATIC_LIBS # keyutils
>   	select BR2_PACKAGE_KEYUTILS # stress-key.c needs keyutils.h
> @@ -18,8 +18,8 @@ config BR2_PACKAGE_STRESS_NG
>
>   	  http://kernel.ubuntu.com/~cking/stress-ng/
>
> -comment "stress-ng needs a glibc toolchain w/ dynamic library, headers >= 3.0"
> +comment "stress-ng needs a glibc toolchain w/ dynamic library, headers >= 3.3"
>   	depends on !BR2_microblaze
>   	depends on BR2_USE_MMU
> -	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3 \
>   		|| !BR2_TOOLCHAIN_USES_GLIBC
>
