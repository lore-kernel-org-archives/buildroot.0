From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 5 Feb 2014 11:23:55 +0100
Subject: [Buildroot] [PATCH] libatomic_ops: Update repository and bump
	version
In-Reply-To: <52F20A16.4040308@trzebnica.net>
References: <1391513105-26434-1-git-send-email-maxime.hadjinlian@gmail.com>
 <52F20A16.4040308@trzebnica.net>
Message-ID: <CAGduivwTAj4yxEX-0sk1hi4TL8+3GMS28Kx9yTAfc26VaP9dqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy, all,
On Wed, Feb 5, 2014 at 10:53 AM, Jerzy Grzegorek
<jerzy.grzegorek@trzebnica.net> wrote:
>
> Hi Maxime,
>
>
>> Change the download source to a Github repository which is more recent.
>> This patch also bump libatomic_ops version and remove a patch that is
>> now upstream.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>>   .../libatomic_ops-nothread-build-failure-fix.patch | 41
>> ----------------------
>>   package/libatomic_ops/libatomic_ops.mk             |  7 ++--
>>   2 files changed, 4 insertions(+), 44 deletions(-)
>>   delete mode 100644
>> package/libatomic_ops/libatomic_ops-nothread-build-failure-fix.patch
>>
>> diff --git
>> a/package/libatomic_ops/libatomic_ops-nothread-build-failure-fix.patch
>> b/package/libatomic_ops/libatomic_ops-nothread-build-failure-fix.patch
>> deleted file mode 100644
>> index cc14b1e..0000000
>> --- a/package/libatomic_ops/libatomic_ops-nothread-build-failure-fix.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -From 7e940ce34ff4de254d460344f1a1a486a14fb045 Mon Sep 17 00:00:00 2001
>> -From: Gilles Talis <gilles.talis@gmail.com>
>> -Date: Wed, 22 May 2013 16:21:26 -0700
>> -Subject: [PATCH] Fix build failure seen when using toolchain without
>> threads support
>> -
>> -Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
>> ----
>> - src/atomic_ops.c |    4 ++++
>> - 1 files changed, 4 insertions(+), 0 deletions(-)
>> -
>> -diff --git a/src/atomic_ops.c b/src/atomic_ops.c
>> -index b6731a2..5769643 100644
>> ---- a/src/atomic_ops.c
>> -+++ b/src/atomic_ops.c
>> -@@ -48,7 +48,9 @@
>> -
>> - #undef AO_REQUIRE_CAS
>> -
>> -+#if defined(AO_USE_PTHREAD_DEFS)
>> - #include <pthread.h>
>> -+#endif
>> -
>> - #ifndef AO_USE_NO_SIGNALS
>> - # include <signal.h>
>> -@@ -72,11 +74,13 @@
>> - # include "atomic_ops/sysdeps/standard_ao_double_t.h"
>> - #endif
>> -
>> -+#if defined(AO_USE_PTHREAD_DEFS)
>> - /*
>> -  * Lock for pthreads-based implementation.
>> -  */
>> -
>> - pthread_mutex_t AO_pt_lock = PTHREAD_MUTEX_INITIALIZER;
>> -+#endif
>> -
>> - /*
>> -  * Out of line compare-and-swap emulation based on test and set.
>> ---
>> -1.7.4.1
>> -
>> diff --git a/package/libatomic_ops/libatomic_ops.mk
>> b/package/libatomic_ops/libatomic_ops.mk
>> index fbe250c..3a38bb4 100644
>> --- a/package/libatomic_ops/libatomic_ops.mk
>> +++ b/package/libatomic_ops/libatomic_ops.mk
>> @@ -4,8 +4,9 @@
>>   #
>>
>> ################################################################################
>>   -LIBATOMIC_OPS_VERSION = 7.2
>> -LIBATOMIC_OPS_SITE =
>> http://www.hpl.hp.com/research/linux/atomic_ops/download
>> +LIBATOMIC_OPS_VERSION = 7_4_0
>> +LIBATOMIC_OPS_SITE = $(call
>> github,ivmai,libatomic_ops,libatomic_ops-$(LIBATOMIC_OPS_VERSION))
>
>
> The libatomic_ops version is : libatomic_ops-7_4_0 , so it should be
>
> LIBATOMIC_OPS_VERSION = libatomic_ops-7_4_0
> LIBATOMIC_OPS_SITE = $(call
> github,ivmai,libatomic_ops,$(LIBATOMIC_OPS_VERSION))
Yes, you are right.
I should have used the full tag's name.
>
> Please, take a look at e.g. libcec.mk
>
> Regards,
> Jerzy
>
>
>
>> +LIBATOMIC_OPS_AUTORECONF = YES
>>     # From doc/LICENSING.txt: "Our intent is to make it easy to use
>>   # libatomic_ops, in both free and proprietary software.  Hence most
>> @@ -14,7 +15,7 @@ LIBATOMIC_OPS_SITE =
>> http://www.hpl.hp.com/research/linux/atomic_ops/download
>>   # by the GNU General Public License. These are put into a separate
>>   # library, libatomic_ops_gpl.a."
>>   LIBATOMIC_OPS_LICENSE = MIT (main library) / GPLv2+ (gpl extension)
>> -LIBATOMIC_OPS_LICENSE_FILES = doc/LICENSING.txt doc/COPYING
>> +LIBATOMIC_OPS_LICENSE_FILES = doc/LICENSING.txt COPYING
>>     LIBATOMIC_OPS_INSTALL_STAGING = YES
>>
>
>
