From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 2 May 2018 10:25:35 +0200
Subject: [Buildroot] [PATCH] uclibc: fix clock_nanosleep declaration for
 linuxthreads
In-Reply-To: <20180501181402.dtz4fewq4tf2l4f6@tarshish>
References: <20180501180648.GA19780@waldemar-brodkorb.de>
 <20180501181402.dtz4fewq4tf2l4f6@tarshish>
Message-ID: <629D8232-4E86-4C68-B026-1D73AB152E15@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

stupid me, we decoupled both in the mentioned commit,
I'll sent a new patch,

best regards and sorry for iphone tofu..

best regards
 Waldemar 

> Am 01.05.2018 um 20:14 schrieb Baruch Siach <baruch@tkos.co.il>:
> 
> Hi Waldemar,
> 
> Thanks for your quick response. One question below.
> 
>> On Tue, May 01, 2018 at 08:06:48PM +0200, Waldemar Brodkorb wrote:
>> Fixes autobuild errors:
>> http://autobuild.buildroot.net/results/a58007263355e2734a8074d52b1b26b88973c39e
>> http://autobuild.buildroot.net/results/7d6fd0872efd23c7de552ab637956902b43c3f58
>> 
>> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>> Reported-by: Baruch Siach <baruch@tkos.co.il>
>> 
>> ---
>> ...declare-clock_nanosleep-not-only-for-NPTL.patch | 36 ++++++++++++++++++++++
>> 1 file changed, 36 insertions(+)
>> create mode 100644 package/uclibc/0002-librt-declare-clock_nanosleep-not-only-for-NPTL.patch
>> 
>> diff --git a/package/uclibc/0002-librt-declare-clock_nanosleep-not-only-for-NPTL.patch b/package/uclibc/0002-librt-declare-clock_nanosleep-not-only-for-NPTL.patch
>> new file mode 100644
>> index 0000000..adc6be4
>> --- /dev/null
>> +++ b/package/uclibc/0002-librt-declare-clock_nanosleep-not-only-for-NPTL.patch
>> @@ -0,0 +1,36 @@
>> +From ffea49761b3933924cf1125857e9e737eb4a3b25 Mon Sep 17 00:00:00 2001
>> +From: Waldemar Brodkorb <wbx@openadk.org>
>> +Date: Tue, 1 May 2018 19:35:20 +0200
>> +Subject: [PATCH] librt: declare clock_nanosleep not only for NPTL
>> +
>> +Reported-by: Baruch Siach <baruch@tkos.co.il>
>> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>> +---
>> + include/time.h | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/include/time.h b/include/time.h
>> +index 785c8f6..c29038b 100644
>> +--- a/include/time.h
>> ++++ b/include/time.h
>> +@@ -356,7 +356,7 @@ extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
>> + #  endif /* __UCLIBC_HAS_REALTIME__ */
>> + 
>> + #  if defined __USE_XOPEN2K && defined __UCLIBC_HAS_ADVANCED_REALTIME__
>> +-#   ifdef __UCLIBC_HAS_THREADS_NATIVE__
>> ++#   ifdef __UCLIBC_HAS_THREADS__
> 
> Why does the clock_nanosleep() declaration depend on threading support at all?
> 
>> + /* High-resolution sleep with the specified clock.
>> + 
>> +    This function is a cancellation point and therefore not marked with
>> +@@ -367,7 +367,7 @@ extern int clock_nanosleep (clockid_t __clock_id, int __flags,
>> + 
>> + /* Return clock ID for CPU-time clock.  */
>> + extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __THROW;
>> +-#   endif /* __UCLIBC_HAS_THREADS_NATIVE__ */
>> ++#   endif /* __UCLIBC_HAS_THREADS__ */
>> + #  endif
>> + 
>> + #  if defined __UCLIBC_HAS_REALTIME__
> 
> baruch
> 
> -- 
>     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> 
