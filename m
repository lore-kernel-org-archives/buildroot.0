From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 3 Feb 2018 21:27:50 +0200
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: Add upstream patch to
 fix build numa detection
In-Reply-To: <20180202135956.GB8864@x230>
References: <20180129202314.16767-1-petr.vorel@gmail.com>
 <20180130051501.hvjb7h3smtif5zvu@sapphire.tkos.co.il>
 <20180201221950.aj6hrj2do573aqcz@dell5510>
 <20180202052328.f66l4zb2n6zkoypl@tarshish>
 <20180202135956.GB8864@x230>
Message-ID: <20180203192750.pywvlwt25wlhvb4u@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

On Fri, Feb 02, 2018 at 02:59:57PM +0100, Petr Vorel wrote:
> thanks for your explanation!
> 
> > numactl is also an optional build time dependency of ltp-testsuite. When the 
> > ltp-testsuite configure script detects libnuma some additional tests are 
> > built.
> I was thinking some time ago to add this support, but it's not how it works.
> All sources which depends on NUMA have a preprocessor condition like his: [1]
> #ifdef HAVE_NUMA_V2
> ...
> #else
> 	TST_TEST_TCONF("test requires libnuma >= 2 and it's development packages");
> #endif
> (These are using new LTP test API, tests using old API or not using API at all have it
> implemented differently.)

So the behaviour of ltp-testsuite changes when its configure script detects 
libnuma, right? We want this change to be consistent whenever numactl is 
enabled in buildroot, so that ltp-testsuite would always detect libnuma when 
it is available. We don't want to leave it up to the pseudo-random packages 
build order.

> I added HAVE_NUMA_V2 in commit bf3441268 ("numa: Check for API >= v2 with autoconf"), but
> it the check  has always been like that (*) all the tests are actually being build
> regardless of NUMA support on SUT. I mean, there is no rule in Makefile which would
> prevent build them because missing NUMA. This is unusual, but the reason why tests are
> build just to say "you need libnuma support", that these files are expected in runtest
> files (files in $LTPROOT/runtest).
> 
> (*) This approach was added in the sources in 2010.
> 
> > Currently when the numactl package is enabled, ltp-testsuite would 
> > detect libnuma only if numactl happens to build before ltp-testsuite. To make 
> > builds consistent we need to make sure that numactl always build before 
> > ltp-testsuite by adding it to _DEPENDENCIES. Here is how the hwloc package 
> > does that:
> 
> > ifeq ($(BR2_PACKAGE_NUMACTL),y)
> > HWLOC_CONF_OPTS += --enable-libnuma
> > HWLOC_DEPENDENCIES += numactl
> > else
> > HWLOC_CONF_OPTS += --disable-libnuma
> > endif
> So this is not needed.

So this is needed to make the build consistent, IMO.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
