From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 May 2017 22:05:43 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-14
In-Reply-To: <20170515063020.D316C220F3@mail.free-electrons.com>
References: <20170515063020.D316C220F3@mail.free-electrons.com>
Message-ID: <20170515220543.3cf5bc30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 May 2017 08:30:20 +0200 (CEST), Thomas Petazzoni wrote:

>       successes : 242
>        failures : 12 

Excellent result. Let's look at the details.

> Detail of failures
> ===================
> 
>          arc |       binutils-arc-2017.03-rc1 | NOK | http://autobuild.buildroot.net/results/bb77100608f8bbed7ec1e3d48957a1f947be112e | ORPH
>          arc |       binutils-arc-2017.03-rc1 | NOK | http://autobuild.buildroot.net/results/f9c40610209fc22ac8c0db6bd57bd3b11bbe6d9c | ORPH

These have been solved.

>       x86_64 |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/c8f7aa85f5791d8ae8cf4b9085788adc5152286f |     
>          arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/34b35853c8d63cd81ec62c5c92e8b6cc5c804731 |     

There is a patch proposed by Romain to solve this,
https://patchwork.ozlabs.org/patch/762185/.

> microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/24640a042d84f45339246c0a18e10905494b2199 |     

Compiler issue:

/tmp/ccsrWR88.s: Assembler messages:
/tmp/ccsrWR88.s: Error: PC relative branch to label logerror which is not in the instruction space
/tmp/ccsrWR88.s: Error: PC relative branch to label logerror which is not in the instruction space
/tmp/ccsrWR88.s: Error: PC relative branch to label logerror which is not in the instruction space

It has been failing like this for ages:
http://autobuild.buildroot.net/?reason=fxload-2008_10_13. It only
happens when BR2_ENABLE_DEBUG=y.

So I have submitted https://patchwork.ozlabs.org/patch/762692/ to work
around this problem.

>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/81664ac57f04fad69f806a37929105fbdb0ee16a |     

Would be fixed by Bernd patches, but I'm not entirely convinced, though
I don't have a better solution to offer right now.

>  powerpc64le |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6190d72d70d9061970002359fb9df5d3b5daf9ef |     

make[2]: Leaving directory `/home/test/autobuild/run/instance-2/output/build/mplayer-1.3.0/ffmpeg'
libpostproc/postprocess.c:94:53: error: expected ',' or ';' before 'FFMPEG_VERSION'
 const char postproc_ffversion[] = "FFmpeg version " FFMPEG_VERSION;

>       x86_64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/c8a25af38c405594722b44aef34e5e4c549639db |     

Already fixed by https://git.buildroot.org/buildroot/commit/?id=a4aaf6eae0c99d5da0ae16c2db53eec84d549cef.

>        sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f3d76eaebd529a61bce849e355182c60f233ed06 | ORPH

Requires libatomic linking. I'll have a look.

>      powerpc |              qt5location-5.8.0 | NOK | http://autobuild.buildroot.net/results/e65383b321fe806cf42da9cf3848a2d4ed5290ee |     

BFD (GNU Binutils) 2.27 assertion fail elflink.c:2694

Linker bug... It would be nice to 1. test with binutils 2.28 and 2.
report this bug. Anyone volunteering to do that.

>       x86_64 |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/1186bfd787ae5f5762481ec89465b0ae3a3d33df |     

I've tried:

+ifeq ($(BR2_NEEDS_GETTEXT)$(BR2_PACKAGE_GETTEXT)$(BR2_STATIC_LIBS),yyy)
+UPMPDCLI_CONF_ENV += LIBS="-lintl"
+endif

But unfortunately the -lintl does not get added at the right place in
the link command line, so it still fails to build.

>        sparc |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/62d8756bb08bfe41c249d985f0ed6c2615b7d624 |     

I'm testing with:

 ifeq ($(BR2_PACKAGE_ZMQPP_CLIENT),y)
 ZMQPP_DEPENDENCIES += boost
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+ZMQPP_LDFLAGS += -latomic
+endif
 endif

Which does work, but I'm still a bit uneasy because it's apparently
Boost::program_options that triggers the use of atomic operations.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
