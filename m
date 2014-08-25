From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 18:16:14 +0200
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20140825063011.07B50101AB1@stock.ovh.net>
References: <20140825063011.07B50101AB1@stock.ovh.net>
Message-ID: <20140825181614.3f5c22a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Joerg, Phil, Ezequiel, Simon, Alexander, see below.

On Mon, 25 Aug 2014 08:30:11 +0200 (CEST), Thomas Petazzoni wrote:

>        arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/e2449b2a4f2239e832adc2f51f0c7266808b7068/

-shared and -static in the same command line :)

>       bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/24ab80be6cc20bbdb2f1860a373f1d15e36ac0c6/

checking for TIFFOpen in -ltiff... no
configure: error: You will need to substantially rewrite libxtiff to
build libgeotiff without libtiff

Don't know, need to reproduce.

>       bfin |              libmatroska-1.3.0 | NOK | http://autobuild.buildroot.net/results/f9689e9606844f24d13fa08c3cb9f6b9bb3adf70/

Seems like it's trying to build a shared library in a pure static
library context.

>        arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/13019e563771ab2a6929427798e191546cde1fd9/

Peter's machine trying to build XBMC. Peter, when will you start using
autobuild-run so that we can solve such issues in a common fashion?

>        arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/38aeac634b332866ae50b6b59361d7385500ce37/

Issue caused by the host Perl being too old. I continue to suggest to
mark perl-gd as broken for the 2014.08 release.

>        arm |                procps-ng-3.3.9 | NOK | http://autobuild.buildroot.net/results/f1de9bdf857ca0347ecd23c0d39179dadfd9ec97/

So after the compiler has been used to build gazillions of packages,
procps-ng decides that the C compiler does not work:

checking whether the C compiler works... no
configure: error: in `/home/test/autobuild/instance-3/output/build/procps-ng-3.3.9':
configure: error: C compiler cannot create executables
See `config.log' for more details
make: *** [/home/test/autobuild/instance-3/output/build/procps-ng-3.3.9/.stamp_configured] Error 77

Need to reproduce.

And someone should work on improving autobuild-run to store the
config.log file when available.

>     mipsel |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/6473088e751d3ab3a5227e9d7876966934e66378/

Static linking issue.

Phil, since you are the original submitter of the sispmctl package, can
you look into this issue?

>       bfin |            uboot-tools-2014.07 | NOK | http://autobuild.buildroot.net/results/1530f8247d1652da5779994f298141b1572ce74f/

Someone tries to strip FLAT binaries.

>       bfin |                 upmpdcli-0.7.1 | NOK | http://autobuild.buildroot.net/results/8e0db6a753c7d2af2cdb11f025879c9cdb57a25d/

libupnpp/log.cxx:31: error: no matching function for call to 'std::basic_ofstream<char, std::char_traits<char> >::open(const std::basic_string<char, std::char_traits<char>, std::allocator<char> >&, std::_Ios_Openmode)'

I love C++.

Joerg, since you are the original submitter of the upmpdcli package,
can you look into this issue?

>      nios2 |              util-linux-2.24.2 | NOK | http://autobuild.buildroot.net/results/fd30974bf2f976c600717268ce340f73d48dda34/

sys-utils/prlimit.o: In function `main':
prlimit.c:(.text.startup+0x440): undefined reference to `prlimit64'
prlimit.c:(.text.startup+0x5d0): undefined reference to `prlimit64'
collect2: error: ld returned 1 exit status

Ezequiel, an idea?

>        sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/55205239b74015b7b9e8dce898d89e5246e81846/

Some tuning is needed to get webkit to build on SH4. However, I would
propose to mark Webkit as not available on SuperH, until we bump to a
newer Webkit version.

./DerivedSources/JavaScriptCore/LLIntAssembly.h: In static member function 'static JSC::JSValue JSC::LLInt::CLoop::execute(JSC::CallFrame*, JSC::OpcodeID, bool)':
./DerivedSources/JavaScriptCore/LLIntAssembly.h:2548:33: error: 'Double2Ints' was not declared in this scope
  CXX      Source/JavaScriptCore/parser/libjavascriptcoregtk_1_0_la-Lexer.lo

>       bfin |                xapp_luit-1.1.1 | NOK | http://autobuild.buildroot.net/results/13a97461e3b6098e59cfcd829e6bcafa51e50bb4/

luit.o: In function `_main':
luit.c:(.text+0xbce): undefined reference to `_fork'

	depends on BR2_USE_MMU

>       bfin | xapp_xfs-1c8459eafc04997751... | NOK | http://autobuild.buildroot.net/results/7a89f79499e167cc98449a045604d25d4fc88484/

osglue.o: In function `_CloneMyself':
os/osglue.c:(.text+0x58): undefined reference to `_fork'

	depends on BR2_USE_MMU

>    powerpc |              xscreensaver-5.22 | NOK | http://autobuild.buildroot.net/results/2c10e5bda7c5426feb95f8e9d7052945274aefa2/

Another compiler that doesn't work:

checking for C compiler default output file name... 
configure: error: in `/home/test/autobuild/instance-2/output/build/xscreensaver-5.22':
configure: error: C compiler cannot create executables
See `config.log' for more details.

> microblazeel |     xserver_xorg-server-1.16.0 | NOK | http://autobuild.buildroot.net/results/4d37c5594c0916c27c897b0d2545d1c5cc492598/

In file included from fbbits.c:27:0:
fb.h:94:2: error: #error "GLYPHPADBYTES must be 4"
 #error "GLYPHPADBYTES must be 4"

Weird, that's typically when the X.org server is built for an
unsupported architecture. We never built the X.org server on Microblaze
so far?

>       bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/97bcfe2d3765945cd7a7ba30cda21b08bf53ca86/

Did I say I love C++ ?

The same issue appears on other architectures apparently:
http://autobuild.buildroot.org/?reason=zmqpp-36413487f05b165dfc82ad307a5a1c36a795e607.

Simon, you're the original submitter of the zmqpp package. Could you
take a look? Or maybe Alexander since he has also contributed a bump of
the zmqpp package?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
