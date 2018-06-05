From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 22:07:02 +0200
Subject: [Buildroot] [PATCH 1/1] cc-tool: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20180605181514.2081-1-fontaine.fabrice@gmail.com>
References: <20180605181514.2081-1-fontaine.fabrice@gmail.com>
Message-ID: <20180605220702.303ee975@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Tue,  5 Jun 2018 20:15:14 +0200, Fabrice Fontaine wrote:
> options_description class from boost's program_options needs
> __sync_fetch_and_add_4 / __sync_fetch_and_sub_4:
> 
> Extract from config.log:
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libboost_program_options.a(options_description.o):
> In function
> `boost::program_options::options_description_easy_init::operator()(char
> const*, boost::program_options::value_semantic const*, char const*)':
> options_description.cpp:(.text+0x4240): undefined reference to
> `__sync_fetch_and_add_4'
> options_description.cpp:(.text+0x42ca): undefined reference to
> `__sync_fetch_and_sub_4'
> options_description.cpp:(.text+0x42d8): undefined reference to
> `__sync_fetch_and_sub_4
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/5677a3fd96217cbb0966063de048401cf1ccf16b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I am not super convinced by this analysis, because:

 (1) It really is the boost program options library that needs those
     sync builtins. So if it really needs, the dependency should be
     added on BR2_PACKAGE_BOOST_PROGRAM_OPTIONS, and then propagated to
     all packages that select this, which includes BR2_PACKAGE_CC_TOOL,
     but not only.

 (2) Boost can use other built-ins than __sync builtins. For example on
     SPARC, BR2_TOOLCHAIN_HAS_SYNC_4 is false, but cc-tool builds just
     fine. It's because SPARC with recent compilers have
     BR2_TOOLCHAIN_HAS_ATOMIC that is true, and Boost uses __atomic
     builtins.

 (3) Boost has an emulated atomic operation implementation (which uses
     locks) which I believe should have been used here if neither
     __sync nor __atomic builtins are available. But it wasn't used
     either. Why ?

See boost/atomic/detail/ for the different implementations of atomic
operations in Boost.

The problem is that with the crazyness of the bjam build system, I've
never been able to figure out Boost decides which atomic implementation
to use. If you figure that out, I'll owe you one beer at the next
conference :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
