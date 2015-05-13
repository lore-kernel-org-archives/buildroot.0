From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 13 May 2015 22:19:44 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-05-08
In-Reply-To: <20150509063014.AA6AD101580@stock.ovh.net>
References: <20150509063014.AA6AD101580@stock.ovh.net>
Message-ID: <1431555583.3047.26.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, 2015-05-09 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-05-08
> ===============================
> 
>         success : 18 
>        failures : 4  
>        timeouts : 0  
>           TOTAL : 22 
> 
> Classification of failures by reason
> ====================================
> 
>       host-gdb-arc-2014.12-gdb | 3 
>              armadillo-4.000.4 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/1ccf0829c13896c000aed1956155a34844207b2f/

That one is similar to Python. We're building all statically, still
armadillo tries to:
---------->8-----------
Linking CXX shared library libarmadillo.so
---------->8-----------

Which inevitably leads to:
---------->8-----------
/home/test/autobuild/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.3/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/test/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libblas.a(sgemv.c.o): relocation R_ARC_32_ME against `.rodata.str1.4' can not be used when making a shared object; recompile with -fPIC
/home/test/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libblas.a: could not read symbols: Bad value
---------->8-----------

Problem happens because in armadillo version we use (4.000.4) library is
supposed to be built as shared regardless BUILD_SHARED_LIBS value:
---------->8-----------
add_library( armadillo SHARED ${PROJECT_SOURCE_DIR}/src/wrapper.cpp )
---------->8-----------

This could be fixed with a trivial patch in Buildroot or with bump of
armadillo version. Current most recent version 5.100.2 already has
required fix http://sourceforge.net/p/arma/code/3569/ (since 4.400.0).

I'm about to send a patch that bumps armadillo version to 5.100.2.

-Alexey
