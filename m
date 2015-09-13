From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 13 Sep 2015 16:27:50 +0200
Subject: [Buildroot] [PATCH 1/1] stress-ng: Depend on kernel headers >=
 3.3
In-Reply-To: <55F3FDD9.1030709@openwide.fr>
References: <1441988351-9923-1-git-send-email-corjon.j@ecagroup.com>
 <20150911195928.51c339dc@free-electrons.com> <55F3FDD9.1030709@openwide.fr>
Message-ID: <55F587E6.3020501@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien, All

Le 12/09/2015 12:26, Romain Naour a ?crit :
> Hi Thomas,
> 
> Le 11/09/2015 19:59, Thomas Petazzoni a ?crit :
>> Julien,
>>
>> On Fri, 11 Sep 2015 18:19:11 +0200, Julien Corjon wrote:
>>> perf.c need PERF_COUNT_HW_REF_CPU_CYCLES instruction which is available
>>> only since 3.3 kernel version
>>>
>>> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
>>> ---
>>>  package/stress-ng/Config.in | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
>>> index cdf9984..1e475b1 100644
>>> --- a/package/stress-ng/Config.in
>>> +++ b/package/stress-ng/Config.in
>>> @@ -4,8 +4,8 @@ config BR2_PACKAGE_STRESS_NG
>>>  	# disabled on musl: stress-malloc.c needs mallopt() and M_MMAP_THRESHOLD
>>>  	# disabled on uClibc: stress-aio.c needs aio.h
>>>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>>> -	# perf.c needs PERF_COUNT_HW_STALLED_CYCLES_FRONTEND
>>> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
>>> +	# perf.c needs PERF_COUNT_HW_REF_CPU_CYCLES
>>> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
>>
>> This seems wrong, because stress-ng.h has the definitions for all the
>> PERF_COUNT_* values:
>>
>> #if defined(__linux__) && defined(__NR_perf_event_open)
>> #define STRESS_PERF_STATS       (1)
>> #define STRESS_PERF_INVALID     (~0ULL)
>> enum {
>>         STRESS_PERF_HW_CPU_CYCLES = 0,
>>         STRESS_PERF_HW_INSTRUCTIONS,
>>         STRESS_PERF_HW_CACHE_REFERENCES,
>>         STRESS_PERF_HW_CACHE_MISSES,
>>         STRESS_PERF_HW_BRANCH_INSTRUCTIONS,
>>         STRESS_PERF_HW_BRANCH_MISSES,
>>         STRESS_PERF_HW_BUS_CYCLES,
>>         STRESS_PERF_HW_REF_CPU_CYCLES,
>>         STRESS_PERF_HW_STALLED_CYCLES_FRONTEND,
>>         STRESS_PERF_HW_STALLED_CYCLES_BACKEND,
>>
>>         STRESS_PERF_SW_PAGE_FAULTS_MIN,
>>         STRESS_PERF_SW_PAGE_FAULTS_MAJ,
>>         STRESS_PERF_SW_CONTEXT_SWITCHES,
>>         STRESS_PERF_SW_CPU_MIGRATIONS,
>>         STRESS_PERF_SW_ALIGNMENT_FAULTS,
>>
>> Can you figure out why it doesn't get used?
> 
> Here is the complete build failure with a toolchain using 3.2 kernel headers:
> [...]i586-buildroot-linux-gnu-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -Os -Wall -Wextra -DVERSION="0.04.16" -O2 -c -o perf.o perf.c
> perf.c:77:48: erreur: ?PERF_COUNT_HW_REF_CPU_CYCLES? undeclared here (not in a
> function)
> { STRESS_PERF_ ## config, PERF_TYPE_ ## type, PERF_COUNT_ ## config, label }
> ^
> perf.c:110:2: note: in expansion of macro ?PERF_INFO?
> PERF_INFO(HARDWARE, HW_REF_CPU_CYCLES, "Total Cycles"),
> ^
> Makefile:164: recipe for target 'perf.o' failed
> 
> This error is due to PERF_INFO macro from perf.c using PERF_COUNT_* values directly.
> 
> During my testing, I used an very old toolchain with 2.6 headers so I had an
> error with PERF_COUNT_HW_STALLED_CYCLES_FRONTEND and I missed
> PERF_COUNT_HW_REF_CPU_CYCLES.
> 
> I'm agree with the patch proposed by Julien, so
> Acked-by: Romain Naour <romain.naour@openwide.fr>

Julien, if you respin the patch, can you add this autobuilder reference ?
http://autobuild.buildroot.net/results/889/88909b118dc927f31ed5c3b5f3513734a88085a9/build-end.log

Thanks!

Best regards,
Romain
