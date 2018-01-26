From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 26 Jan 2018 16:14:58 +0100
Subject: [Buildroot] [PATCH 1/2] ltp-testsuite: disable numa tests
In-Reply-To: <20180126133700.hsnsyfj6owqo2wfz@tarshish>
References: <944db376505dab7095cf32949160c0d024d92926.1516964598.git.baruch@tkos.co.il>
 <20180126111703.65saceajkfpshqyr@dell5510>
 <20180126133700.hsnsyfj6owqo2wfz@tarshish>
Message-ID: <20180126151457.shquc4gisrpzbe6y@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

> On Fri, Jan 26, 2018 at 12:17:04PM +0100, Petr Vorel wrote:
> > Hi Baruch,
> > > The LTP_CHECK_SYSCALL_NUMA autoconf macro uses AC_RUN_IFELSE when it
> > > detects the numaif.h header. This is incompatible with cross
> > > compilation.
> > Is it really about cross compilation or about out-of-tree building?

> As I understand this is about cross compilation, which is inherently 
> incompatible with AC_RUN_IFELSE[1].
OK, doc really warn about using AC_RUN_IFELSE while cross compiling.

> > Any idea how to fix it in upstream? As we test both cross compilation and out out-of-tree
> > compilation with travis:
> > https://travis-ci.org/linux-test-project/ltp/builds/333338092

> > * aarch64 cross compilation
> > https://travis-ci.org/linux-test-project/ltp/jobs/333338103
> > * arm cross compilation
> > https://travis-ci.org/linux-test-project/ltp/jobs/333338102
> > * native out-of-tree compilation
> > https://travis-ci.org/linux-test-project/ltp/jobs/333338101

> Do you nave libnuma (numactl) installed in these tests? If not, the 
> AC_RUN_IFELSE test is skipped. You can reproduce this build failure in 
> Buildroot by first building the numactl package, and then ltp-testsuite.
In the third one [2] there is libnuma installed (ibnuma-dev package, so configure works:
/* Define to 1 if you have libnuma and it's headers version >= 2 installed. */
#define HAVE_NUMA_V2 1
The other two don't.
But all these 3 cross compile builds are build in-tree.
I tested to build cross compile out tree in our project and it's really broken.
Thanks for a bug report, I'll fix it.


Kind regards,
Petr

> [1] https://www.gnu.org/software/autoconf/manual/autoconf.html#Runtime

[2] https://api.travis-ci.org/v3/job/333338101/log.txt
