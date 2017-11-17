From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Nov 2017 10:48:22 +0100
Subject: [Buildroot] Conditional setup of TARGET_ABI
In-Reply-To: <1510906984.31683.79.camel@synopsys.com>
References: <1510906984.31683.79.camel@synopsys.com>
Message-ID: <20171117104822.38277917@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Nov 2017 08:23:06 +0000, Alexey Brodkin wrote:

> I'm facing a problem which is both quite simple and obvious as well as
> there's a really good solution to it... that's in theory but on practice
> it's not that simple.

First of all, thanks for summarizing the problem!

> So the problem is linkage of Qt5Webkit library failing like that:
> ------------------------>8------------------------  
> .../output/host/lib/gcc/arc-buildroot-linux-uclibc/7.1.1/crtbeginS.o: In function
> '__do_global_dtors_aux':
> 
> crtstuff.c:(.text+0x66): relocation truncated to fit: R_ARC_S25W_PCREL
> against symbol `__st_r13_to_r15' defined in .text section in
> .../output/host/lib/gcc/arc-buildroot-linux-uclibc/7.1.1/libgcc.a(_millicodethunk_st.o)
> ------------------------>8------------------------  
> 
> Let me explain what is encrypted in the log above.
> 
> 1. __do_global_dtors_aux() gets built as a part of libgcc and is supposed to
> ? ?be then used as it is with all the apps we build later on.
> ? ?And what's also important our GCC by default tries to use as compact
> ? ?relocations as possible to save memory footprint, instruction cache
> ? ?utilization etc. So given libgcc is very compact GCC simply decides
> ? ?to use so-called R_ARC_S25W_PCREL relocation which means +-16MiB
> ? ?offset from the current location.
> 
> 2. Qt5WebKit [as well as all other libs and apps] uses functions from libgcc.
> ? ?In that case it's our __do_global_dtors_aux() which in its turn uses another
> ? ?function called __st_r13_to_r15(). And from (1) we know that distance
> ? ?between them should be less than 16MiB. Now given libQt5WebKit is much larger
> ? ?that means if the functions in question end-up placed closer to opposite ends
> ? ?of libQtxxx they won't be reachable to each other... and that's what we see here.

What isn't clear to me is where are those two functions? One is in
crtbeginS.o, so it ends up linked into the program .text section, while
the other one is in libgcc, correct?

How can the size of QtWebkit have an influence on the distance between
those functions? How can the linker now about the relative locations of
libraries, since they are loaded at runtime by the dynamic linker? Or
perhaps this issue only occurs with BR2_STATIC_LIBS=y ?

> Now what kind of solutions could be applied to that problem?
> 
> 1. Make sure problematic functions are placed close to each other.
> ? ?But that will require changes in Qt's build infrastructure... almost
> ? ?for nothing as then there comes another dependency like that,
> ? ?so it's an obvious no-go.
> 
> 2. The best fix is so-called link-time relaxation. This if exists and works
> ? ?just solves the problem. But the problem is we don't have it yet... even though
> ? ?it's a long-standing item on out todo list.
> 
> 3. Not very good but at least feasible and simple solution to rebuild libgcc
> ? ?such that longer relocations are used. That could be simply done with passing
> ? ?"-mlong-calls" to the GCC.
> ? ?But given most of the time shorter relocations work perfectly fine for us
> ? ?we'd prefer to not use longer relocations all the time... especially knowing
> ? ?that by default we use so-called "millicode" functions (that for example save and
> ? ?restore core registers on entry and exit of functions) from libgcc for each and
> ? ?every function we build it will be pretty significant performance hit system-wise.
> 
> ? ?But strictly speaking it might be any other library but not only libgcc and so
> ? ?it IMHO makes sense to build everything with "-mlong-calls".
> 
> As a shorter summary:
> IMHO the short term solution is to append "-mlong-calls" to TARGET_ABI so this
> gcc option gets applied to everything we build for the target like that:
> ---------------------->8---------------------  
> ifeq ($(BR2_arc)$(BR2_PACKAGE_QT5WEBKIT),yy)
> TARGET_ABI += -mlong-calls
> endif
> ---------------------->8---------------------  
> 
> Any thoughts?

Yes, one thought: this proposed solution of tweaking TARGET_ABI doesn't
work with pre-built external toolchains. Indeed, when you build the
toolchain, you have no idea that it will be used for building "large"
libraries such as Qt5Webkit.

So perhaps we should handle this more explicitly, i.e have an
architecture/toolchain option to enable the use of "long calls", so
that a toolchain can be built with it. Conversely, in the external
toolchain support, have a config knob that allows to say "my toolchain
uses long calls or not". And then packages can depend on it.

Is it possible to easily verify if an external toolchain was built with
-mlong-calls or not?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
