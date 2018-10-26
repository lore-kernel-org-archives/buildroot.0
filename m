From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 17:11:22 +0200
Subject: [Buildroot] [PATCH 1/1] boost: context needs thread if gcc < 6
In-Reply-To: <20181012221502.9344-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 13 Oct 2018 00:15:02 +0200")
References: <20181012221502.9344-1-fontaine.fabrice@gmail.com>
Message-ID: <875zxo4uat.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit f3a483a81be43b0ff674400e11900605969f8f1c added -std=c++11 to
 > boost build if context is selected and gcc is at least 4.7 however it
 > has the side effect that cc-tool fails to find boost_system with the
 > following error if context and system is enabled with a gcc greater
 > than 6:

 > configure:16312: /home/dawncrow/buildroot-test/scripts/instance-0/output/host/bin/x86_64-linux-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/dawncrow/buildroot-test/scripts/instance-0/output/host/x86_64-buildroot-linux-musl/sysroot/usr/include  -L/home/dawncrow/buildroot-test/scripts/instance-0/output/host/x86_64-buildroot-linux-musl/sysroot/usr/lib conftest.o -lboost_system -latomic >&5
 > conftest.o: In function `boost::system::error_category::std_category::equivalent(int, std::error_condition const&) const':
 > conftest.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition[_ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition]+0x37): undefined reference to `boost::system::detail::generic_category_instance'

 > This error is related to the fact that since boost 1.68 and commit
 > https://github.com/boostorg/system/commit/7b6dcf6ac668e24f11ec5dbc68d1fa0248d964df,
 > boost system headers are now C++14 "by default" with gcc above 6:
 > - https://github.com/boostorg/system/issues/24
 > - https://github.com/boostorg/system/issues/26
 > - https://lists.boost.org/Archives/boost/2018/08/242770.php

 > So when building with gcc > 6, cc-tool thinks that boost has
 > generic_category_instance but because boost was compiled with
 > std=c++11, this function will not be in the library causing a link error

 > Instead of "hacking" even more boost, just remove -std=c++11 from
 > boost.mk and select BOOST_THREAD with gcc lower than 6

 > Fixes:
 >  - http://autobuild.buildroot.org/results/fc8f8a64751c751b2b66301967cc008509bbaa70

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
