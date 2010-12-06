From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Dec 2010 20:22:32 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
 for-2011.02/fix-ccache-support
In-Reply-To: <AANLkTimzwXT4JMAv_oZxcCrRSEbGc8reZ+GfYhb8RHUZ@mail.gmail.com>
References: <cover.1291403746.git.thomas.petazzoni@free-electrons.com>
	<874oarx2r5.fsf@macbook.be.48ers.dk>
	<AANLkTimzwXT4JMAv_oZxcCrRSEbGc8reZ+GfYhb8RHUZ@mail.gmail.com>
Message-ID: <20101206202232.6bdcaddb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Dec 2010 10:44:40 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> The cdrkit package also strips off --sysroot because its build system
> CMake doesn't like it when --sysroot is part of the compiler path.

Yes.

> Actually, I am currently working on a CMAKETARGETS macro (similar to
> AUTOTARGETS) and decided to write a patch that takes --sysroot out of
> TARGET_CC and move it to the {C,CXX}FLAGS variables, to make CMake
> happy. I've been meaning to post the patch series but I don't feel
> it's ready to be merged yet. How do the Buildroot developers feel
> about
> 
> a) moving --sysroot from TARGET_CC to {C,CXX}FLAGS

No, please don't do that :-)

There are other packages that need this. See
efb1d8d3f40281645c178c150d992601c8042c1a.

commit efb1d8d3f40281645c178c150d992601c8042c1a
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Fri Jun 25 15:04:08 2010 +0200

    Cleanup TARGET_CONFIGURE_OPTS
    
    The definition of CC, LD, GCC, CPP, CXX and FC shouldn't contain the
    CFLAGS/LDFLAGS/CXXFLAGS, those should be passed through the
    appropriate variables.
    
    However, the --sysroot option is a particular case here: it needs to
    be part of the CC/LD/GCC/etc. definitions otherwise libtool strips it
    from the CFLAGS/LDFLAGS.
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

The current choice has been fairly hard to get to, we made a number of
different tries before finding a solution that seems to work relatively
fine for most packages. Therefore, I'd prefer to keep the
TARGET_CC/TARGET_CFLAGS as they are today, even if the CMAKETARGETS
infrastructure needs to do the same kind of mungling as cdrkit.mk is
doing.

If you really want to be convinced that having --sysroot in
TARGET_CFLAGS causes problems, I can probably trigger a particular
configuration to exhibit the issue.

> b) add CMAKETARGETS infrastructure

Yes, that would be great. We're likely to see more CMake-based packages
in the future.

Note that some people in the Armadeus project are working on a
different thing related to CMake and Buildroot: generate automatically
a CMake toolchain description file, to make it easy to build
CMake-based applications outside of Buildroot, using the toolchain and
staging directory of Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
