From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Tue, 31 Jul 2007 10:22:03 +0200
Subject: [Buildroot] Qtopia4 fails building - target stage tries to
	run	target binaries	on build machine
In-Reply-To: <20070730185416.GA23362@zelow.no>
References: <1185796725.27015.7.camel@localhost.localdomain>
	<20070730185416.GA23362@zelow.no>
Message-ID: <1185870123.14026.4.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 2007-07-30 at 20:54 +0200, Thomas Lundquist wrote:
> On Mon, Jul 30, 2007 at 01:58:45PM +0200, Hans-Christian Egtvedt wrote:
> > 
> > I am trying to look into how to "fix" Qtopia 4 in Buildroot, at least it
> > does not compile for me (snapshot 20070717).
> 
> what happens? 

As I said, it tries to execute moc, but moc is compiled for the target.

/home/hcegtvedt/gitwork/buildroot/build_avr32/qtopia-core-opensource-src-4.2.2/bin/moc -DQT_SHARED -DQT_BUILD_CORE_LIB -DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_NO_DEBUG -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -I../../mkspecs/qws/linux-avr32-g++ -I. -I../../include -I../../include/QtCore -Iglobal -I.moc/release-shared-emb-avr32 -I.uic/release-shared-emb-avr32 io/qbuffer.h -o .moc/release-shared-emb-avr32/moc_qbuffer.cpp
/home/hcegtvedt/gitwork/buildroot/build_avr32/qtopia-core-opensource-src-4.2.2/bin/moc: 1: Syntax error: "(" unexpected

> > The makefile seems to generate target specific binaries in build_<arch>
> > directory, and host specific binaries in toolchain_build_<arch>.
> 
> which is the right thing to do.

I actually think the toolchain_build_<arch> must install into
$(STAGING_DIR) and the build_<arch> install into $(TARGET_DIR). This is
because the build toolchain needs qmake, moc, etc. built with the host
compiler to be able to make Qt binaries for the target.

And if you want to compile/use these binaries on the target they need to
be native binaries of course.

> > As I understand the toolchain_build_<arch> binaries should be installed
> > to $(STAGING_DIR) and the build_<arch> binaries should be installed to
> > $(TARGET_ROOT)?
> 
> But what is the problem? 

The problem arises when building the target Qtopia, it tries to use moc
et.al compiled for the target architecture. And when running a
big-endian AVR32 binary on my little-endian x86 laptop, it fails ;)

Suggestions are very welcome, I am trying to clean up this package.

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
