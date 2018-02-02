From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 2 Feb 2018 14:59:57 +0100
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: Add upstream patch to
 fix build numa detection
In-Reply-To: <20180202052328.f66l4zb2n6zkoypl@tarshish>
References: <20180129202314.16767-1-petr.vorel@gmail.com>
 <20180130051501.hvjb7h3smtif5zvu@sapphire.tkos.co.il>
 <20180201221950.aj6hrj2do573aqcz@dell5510>
 <20180202052328.f66l4zb2n6zkoypl@tarshish>
Message-ID: <20180202135956.GB8864@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

thanks for your explanation!

> numactl is also an optional build time dependency of ltp-testsuite. When the 
> ltp-testsuite configure script detects libnuma some additional tests are 
> built.
I was thinking some time ago to add this support, but it's not how it works.
All sources which depends on NUMA have a preprocessor condition like his: [1]
#ifdef HAVE_NUMA_V2
...
#else
	TST_TEST_TCONF("test requires libnuma >= 2 and it's development packages");
#endif
(These are using new LTP test API, tests using old API or not using API at all have it
implemented differently.)

I added HAVE_NUMA_V2 in commit bf3441268 ("numa: Check for API >= v2 with autoconf"), but
it the check  has always been like that (*) all the tests are actually being build
regardless of NUMA support on SUT. I mean, there is no rule in Makefile which would
prevent build them because missing NUMA. This is unusual, but the reason why tests are
build just to say "you need libnuma support", that these files are expected in runtest
files (files in $LTPROOT/runtest).

(*) This approach was added in the sources in 2010.

> Currently when the numactl package is enabled, ltp-testsuite would 
> detect libnuma only if numactl happens to build before ltp-testsuite. To make 
> builds consistent we need to make sure that numactl always build before 
> ltp-testsuite by adding it to _DEPENDENCIES. Here is how the hwloc package 
> does that:

> ifeq ($(BR2_PACKAGE_NUMACTL),y)
> HWLOC_CONF_OPTS += --enable-libnuma
> HWLOC_DEPENDENCIES += numactl
> else
> HWLOC_CONF_OPTS += --disable-libnuma
> endif
So this is not needed.

> ltp-testsuite needs something similar.


> baruch


Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/mem/cpuset/cpuset01.c
