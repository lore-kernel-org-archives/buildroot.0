From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Feb 2019 23:40:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: fix build with new
 headers
In-Reply-To: <20190225055853.rq2w5qnl4jxacj53@sapphire.tkos.co.il>
References: <20190224204931.2759-1-panfilov.artyom@gmail.com>
 <20190225055853.rq2w5qnl4jxacj53@sapphire.tkos.co.il>
Message-ID: <fac051b6-8a25-df0e-22ed-4d9bf97a93a9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, Artem, All,

Le 25/02/2019 ? 06:58, Baruch Siach a ?crit?:
> Hi Artem,
> 
> On Sun, Feb 24, 2019 at 11:49:31PM +0300, Artem Panfilov wrote:
>> net_tstamp.h in recent kernel versions requires time.h for clockid_t.
> 
> This is a kernel bug. Kernel UAPI headers must not use the userspace clockid_t 
> type. This bug has been fixed in kernel commit e2c4cf7f98a5 ("net: Use 
> __kernel_clockid_t in uapi net_stamp.h") just before the v4.20 release. It 
> looks like this Linaro toolchain took the headers of a kernel -rc release.
> 
> Maybe update the Linaro toolchain to 2019.02 in master?
> Romain?

Actually it's not a Linaro toolchain anymore, it's an ARM toolchain.

Indeed, these toolchains use a 4.20 -rc kernel release.
I noticed it while updating to the 2018.11 release that was released one month
before the official kernel 4.20 release (respectively 23 Nov 2018 and 23 Dec
2018). I had to wait for BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20 symbol in Buildroot.

The latest ARM toolchain 2019.01 release use 5.0-rc1 kernel release.
We can't include this version into Buildroot since the kernel 5.0 is not
released yet.

Maybe we should report this issue to https://bugs.linaro.org ?

Best regards,
Romain

> 
> baruch
> 
>> Fixes:
>>   http://autobuild.buildroot.net/results/93903e8abfeaa7df0b6525033fa63e29f2c9e7ae
>> Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
>> ---
>>  ...fix-building-with-new-kernel-headers.patch | 55 +++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>  create mode 100644 package/linuxptp/0002-fix-building-with-new-kernel-headers.patch
>>
>> diff --git a/package/linuxptp/0002-fix-building-with-new-kernel-headers.patch b/package/linuxptp/0002-fix-building-with-new-kernel-headers.patch
>> new file mode 100644
>> index 0000000000..332e5491ff
>> --- /dev/null
>> +++ b/package/linuxptp/0002-fix-building-with-new-kernel-headers.patch
>> @@ -0,0 +1,55 @@
>> +From d663a483c40939bad58301c256d86da1f3da6cc0 Mon Sep 17 00:00:00 2001
>> +From: Miroslav Lichvar <mlichvar@redhat.com>
>> +Date: Tue, 13 Nov 2018 13:16:08 +0100
>> +Subject: [PATCH] Fix building with new kernel headers.
>> +
>> +net_tstamp.h in recent kernel versions requires time.h for clockid_t.
>> +
>> +Signed-off-by: Miroslav Lichvar <mlichvar@redhat.com>
>> +---
>> + clock.c      | 2 +-
>> + sk.c         | 1 +
>> + timemaster.c | 1 +
>> + 3 files changed, 3 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/clock.c b/clock.c
>> +index 9c493c3..8533b39 100644
>> +--- a/clock.c
>> ++++ b/clock.c
>> +@@ -17,11 +17,11 @@
>> +  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> +  */
>> + #include <errno.h>
>> ++#include <time.h>
>> + #include <linux/net_tstamp.h>
>> + #include <poll.h>
>> + #include <stdlib.h>
>> + #include <string.h>
>> +-#include <time.h>
>> + #include <sys/queue.h>
>> + 
>> + #include "address.h"
>> +diff --git a/sk.c b/sk.c
>> +index e2b1f28..30162eb 100644
>> +--- a/sk.c
>> ++++ b/sk.c
>> +@@ -18,6 +18,7 @@
>> +  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> +  */
>> + #include <errno.h>
>> ++#include <time.h>
>> + #include <linux/net_tstamp.h>
>> + #include <linux/sockios.h>
>> + #include <linux/ethtool.h>
>> +diff --git a/timemaster.c b/timemaster.c
>> +index 058678f..00db59f 100644
>> +--- a/timemaster.c
>> ++++ b/timemaster.c
>> +@@ -22,6 +22,7 @@
>> + #include <errno.h>
>> + #include <libgen.h>
>> + #include <limits.h>
>> ++#include <time.h>
>> + #include <linux/net_tstamp.h>
>> + #include <net/if.h>
>> + #include <signal.h>
>> -- 
>> 2.19.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
