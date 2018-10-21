From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 21 Oct 2018 18:50:39 +0100
Subject: [Buildroot] [PATCH 1/1] boost: context needs thread if gcc < 6
In-Reply-To: <CANQCQpbnj4cL3GJ55gZKRDEF_QW-Kkp7WGCQyRwfiQGwAmZa3A@mail.gmail.com>
References: <20181012221502.9344-1-fontaine.fabrice@gmail.com>
 <CANQCQpbnj4cL3GJ55gZKRDEF_QW-Kkp7WGCQyRwfiQGwAmZa3A@mail.gmail.com>
Message-ID: <CANQCQpbTOe1ibvo22VvNw36jOYQL-us7mLgasV0VnKc1z21H8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,

On Sun, Oct 21, 2018 at 6:11 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Fabrice,
>
> On Fri, Oct 12, 2018 at 11:15 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > Commit f3a483a81be43b0ff674400e11900605969f8f1c added -std=c++11 to
> > boost build if context is selected and gcc is at least 4.7 however it
> > has the side effect that cc-tool fails to find boost_system with the
> > following error if context and system is enabled with a gcc greater
> > than 6:
> >
> > configure:16312: /home/dawncrow/buildroot-test/scripts/instance-0/output/host/bin/x86_64-linux-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/dawncrow/buildroot-test/scripts/instance-0/output/host/x86_64-buildroot-linux-musl/sysroot/usr/include  -L/home/dawncrow/buildroot-test/scripts/instance-0/output/host/x86_64-buildroot-linux-musl/sysroot/usr/lib conftest.o -lboost_system -latomic >&5
> > conftest.o: In function `boost::system::error_category::std_category::equivalent(int, std::error_condition const&) const':
> > conftest.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition[_ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition]+0x37): undefined reference to `boost::system::detail::generic_category_instance'
> >
> > This error is related to the fact that since boost 1.68 and commit
> > https://github.com/boostorg/system/commit/7b6dcf6ac668e24f11ec5dbc68d1fa0248d964df,
> > boost system headers are now C++14 "by default" with gcc above 6:
> > - https://github.com/boostorg/system/issues/24
> > - https://github.com/boostorg/system/issues/26
> > - https://lists.boost.org/Archives/boost/2018/08/242770.php
> >
> > So when building with gcc > 6, cc-tool thinks that boost has
> > generic_category_instance but because boost was compiled with
> > std=c++11, this function will not be in the library causing a link error
> >
> > Instead of "hacking" even more boost, just remove -std=c++11 from
> > boost.mk and select BOOST_THREAD with gcc lower than 6
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/fc8f8a64751c751b2b66301967cc008509bbaa70
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Retested the following cases
> -------------------------------------------
> 1) (Noted above)
> http://autobuild.buildroot.org/results/fc8f8a64751c751b2b66301967cc008509bbaa70
>  - Repeated the failure
>  - Applied patch and didn't observe the failure (GCC was 6 as
> specified in the failure)
>  - Switch GCC version to 5.4.0
> (https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2017.05-toolchains-1-1.tar.bz2)
>  - Build Ok
>
> 2) [PATCH v3,1/1] boost: context needs C++11 (
> f3a483a81be43b0ff674400e11900605969f8f1c )
> (Merged in Oct 2018)
>  - Used config from
> http://autobuild.buildroot.net/results/99f1a255b78a973faeb8bf3b94d78efc54426a8b
> on latest
>  - Had to fix up (enable) boost-chrono as the boost "selected config"
> check caught it
>  - GCC 5.3.0 was used in this build
>  - cc-tools failed similar to
> http://autobuild.buildroot.org/results/fc8f8a64751c751b2b66301967cc008509bbaa70
>        configure: error: cannot find the flags to link with Boost
> program_options
>        make[1]: *** [package/pkg-generic.mk:222:
> /accts/mlweber1/rclinux/rc-buildroot-master-dev/t_oldBoostTest/build/cc-tool-0.26/.stamp_configured]
> Error 1
>        make: *** [Makefile:16: _all] Error 2
>

I started another build when I sent this email and it passed.  When I
checked my command history on my failing build, I hadn't cleaned the
build so the boost without threads was used.  Sorry about the false
failure.  Here's my tested by.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
