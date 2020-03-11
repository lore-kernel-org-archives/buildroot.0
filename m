From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 23:25:03 +0100
Subject: [Buildroot] [PATCH v6 18/28] package/cmake: Fix for using -O in
 top-level make
In-Reply-To: <20200217212350.29750-19-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-19-anaumann@ultratronik.de>
Message-ID: <20200311232503.0bafe189@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Let's add Arnout in the loop, for the make sorcery.

On Mon, 17 Feb 2020 22:23:40 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Setting -O in top level make somehow interferes with the explicit setting of
> -jX in the cmake bootstrap script. Avoid passing down MAKEFLAGS in the configure
> case.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

This commit log was a bit vague on what the issue was. If I understand
correctly, what you see is that the "make" process running to build
host-cmake is constantly entering/leaving its build directory, like
this:

make[3]: Entering directory '/home/thomas/projets/buildroot/output/build/host-cmake-3.15.5'
[ 50%] Building C object Utilities/cmlibarchive/libarchive/CMakeFiles/cmlibarchive.dir/archive_read_support_filter_rpm.c.o
make[3]: Leaving directory '/home/thomas/projets/buildroot/output/build/host-cmake-3.15.5'
make[3]: Entering directory '/home/thomas/projets/buildroot/output/build/host-cmake-3.15.5'
[ 50%] Building C object Utilities/cmlibarchive/libarchive/CMakeFiles/cmlibarchive.dir/archive_read_support_filter_none.c.o
make[3]: Leaving directory '/home/thomas/projets/buildroot/output/build/host-cmake-3.15.5'
make[3]: Entering directory '/home/thomas/projets/buildroot/output/build/host-cmake-3.15.5'
[ 50%] Building C object Utilities/cmlibarchive/libarchive/CMakeFiles/cmlibarchive.dir/archive_read_support_filter_program.c.o
make[3]: Leaving directory '/home/thomas/projets/buildroot/output/build/host-cmake-3.15.5'

Reading
https://www.gnu.org/software/make/manual/html_node/Parallel-Output.html,
it seems like it is expected for -Otarget to behave like this. However,
if you use -Orecurse, it works as expected: the entire output of the
sub-make is buffered, and output in one-go when the make target at the
Buildroot level completes.

So I'm not sure we want to prevent -Otarget from doing what it does: we
should probably instead use -Orecurse.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
