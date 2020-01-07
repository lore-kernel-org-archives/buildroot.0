From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jan 2020 22:15:17 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/boost: boost-thread needs a toolchain without bug 64735
In-Reply-To: <20191222223353.3981922-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 22 Dec 2019 23:33:53 +0100")
References: <20191222223353.3981922-1-fontaine.fabrice@gmail.com>
Message-ID: <87k163hst6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > boost-thread needs std::current_exception since version 1.71.0 and
 > https://github.com/boostorg/exception/commit/386f5507cb8ec99c03ca535bea4f8bd61e0de910

 > std::current_exception depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 as a
 > result, gnuradio fails to build on:

 > [ 12%] Building CXX object gnuradio-runtime/lib/pmt/CMakeFiles/gnuradio-pmt.dir/pmt_pool.cc.o
 > In file included from /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception/detail/exception_ptr.hpp:15:0,
 >                  from /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception_ptr.hpp:9,
 >                  from /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/thread/exceptional_ptr.hpp:10,
 >                  from /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/thread/future.hpp:34,
 >                  from /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/thread.hpp:24,
 >                  from /home/test/autobuild/run/instance-2/output-1/build/gnuradio-3.7.13.5/gnuradio-runtime/include/pmt/pmt_pool.h:27,
 >                  from /home/test/autobuild/run/instance-2/output-1/build/gnuradio-3.7.13.5/gnuradio-runtime/lib/pmt/pmt.cc:31:
 > /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception/diagnostic_information.hpp: In function 'std::string boost::current_exception_diagnostic_information(bool)':
 > /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception/diagnostic_information.hpp:49:26: error: 'current_exception' is not a member of 'std'
 >          else if (auto* p=std::current_exception().__cxa_exception_type())
 >                           ^
 > So add this dependency on boost-thread, boost-log and gnuradio (the only
 > reverse dependencies of boost-thread that does not already depends on
 > !BR2_TOOLCHAIN_HAS_GCC_BUG_64735)

 > Finally, add this dependency on gqrx as it is a reverse dependency of
 > gnuradio

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c384205cf50929c320d90b620f2390837721d9f9
 >  - http://autobuild.buildroot.org/results/47440354b336b943b74b72fa303b079dc962bfd0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
