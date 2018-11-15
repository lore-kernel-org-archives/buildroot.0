From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Thu, 15 Nov 2018 10:50:33 +0000
Subject: [Buildroot] [PATCH] gcc: Enable __cxa_atexit for final GCC
In-Reply-To: <1703588a-1fbb-85fc-d53a-31336b6b93e6@smile.fr>
References: <20181115040150.11472-1-abrodkin@synopsys.com>
 <f4e74170-b562-b93b-316c-b62dad8f7a4f@green-communications.fr>
 <b4a9357524ef910b7699e3ce4c4bb37c0147f3de.camel@synopsys.com>
 <1703588a-1fbb-85fc-d53a-31336b6b93e6@smile.fr>
Message-ID: <7791e6fc0e345dfd729a1358553f6cfff96df2b9.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Thu, 2018-11-15 at 11:35 +0100, Romain Naour wrote:
> Hi Alexey,
> 
> Le 15/11/2018 ? 11:22, Alexey Brodkin a ?crit :
> > Hi Nicolas,
> > 
> > On Thu, 2018-11-15 at 11:17 +0100, Nicolas Cavallari wrote:
> > > On 15/11/2018 05:01, Alexey Brodkin wrote:
> > > > This is what GCC manual says [1]:
> > > > -------------------------->8----------------------
> > > > --enable-__cxa_atexit
> > > > 
> > > >     Define if you want to use __cxa_atexit, rather than atexit,
> > > >     to register C++ destructors for local statics and global objects.
> > > > 
> > > >     This is essential for fully standards-compliant handling of destructors,
> > > >     but requires __cxa_atexit in libc.
> > > > 
> > > 
> > > For what is is worth, we enabled cxa_atexit in BR2_EXTRA_GCC_CONFIG_OPTIONS five
> > > years ago, to fix a crash that occurred when catching exceptions and logging
> > > them using a log system that used global variables.  But we couldn't remember
> > > the details.
> > 
> > So you've been using BR with cxa_atexit since then, right?
> > Or you mean it was enabled in upstream BR for some time and then reverted back to disabled state?
> 
> --disable-__cxa_atexit is present since 2002/2003 in Buildroot, I'm not sure the
> reason for disabling atexit is still relevant.

For me there was a reason to get cxa_atexit enabled - SEGFAULT in one of Glibc
tests on ARC so I do it it solves something as for whih problems that change might introduce
I have no ideas :)

I did a build test with all libc's for x86 but nothing more serious.

Also if we look around we'll see
 1. In OpenEmbedded it is enabled for everything except gcc-cross-initial:
    https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-devtools/gcc/gcc-configure-common.inc#L59
    https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-devtools/gcc/gcc-cross-initial.inc#L23

 2. In Crosstool-NG it is enabled by default:
    https://github.com/crosstool-ng/crosstool-ng/blob/master/config/cc/gcc.in#L270

 3. In OpenWrt it is disabled only for uClibc, otherwise enabled:
    https://github.com/openwrt/openwrt/blob/master/toolchain/gcc/common.mk#L170

So I think it looks promising.

-Alexey
