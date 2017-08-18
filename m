From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Aug 2017 16:05:37 +0200
Subject: [Buildroot] Fixing cc-tool build issue: anyone understanding the
 Boost build system?
Message-ID: <20170818160537.07c954f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I started investigating a cc-tool build issue on m68k coldfire, i.e:
http://autobuild.buildroot.net/results/e30/e30a1cda39e996309a56e4ae23ad210356df4b03/build-end.log.
It fails with:

/home/peko/autobuild/instance-1/output/host/m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libboost_program_options.a(options_description.o): In function `boost::program_options::options_description_easy_init::operator()(char const*, char const*)':
options_description.cpp:(.text+0x3cbc): undefined reference to `__sync_fetch_and_add_4'

I.e, this means that the Boost program-options module is using
__sync_fetch_and_add_4, which isn't provided on m68k Coldfire.

Diving into the Boost source code, one can see in
boost/smart_ptr/detail/sp_counted_base.hpp that there is some support
for various ways of doing atomic operations. On m68k Coldfire, we fall
into this case:

#elif !defined( BOOST_NO_CXX11_HDR_ATOMIC )
# include <boost/smart_ptr/detail/sp_counted_base_std_atomic.hpp>

I.e we don't have BOOST_NO_CXX11_HDR_ATOMIC defined (beware of the
inverted logic). So, Boost believes that C++11 atomics are available.
Grepping for BOOST_NO_CXX11_HDR_ATOMIC in the tree, one can find
libs/config/test/boost_no_cxx11_hdr_atomic.ipp which seems to be a test
program to validate if C++11 atomics are available or not.

However adding random #error in this file never breaks the build, so it
looks as if this file is not built ? Does anyone understand how the
Boost build system works, and how it decides if
BOOST_NO_CXX11_HDR_ATOMIC should be defined or not ? Are there some
logs available where I can see if this file got built or not, and what
was the result ?

For the record, a very simple program using C++11 atomics doesn't build
on m68k Coldfire:

thomas at windsurf:~/projets/buildroot (master)$ cat toto.cpp 
#include <atomic>

int main()
{
	std::atomic<int> a;

	a.store(1);
	a.fetch_add(2);

	return 0;
}
thomas at windsurf:~/projets/buildroot (master)$ ./output/host/usr/bin/m68k-linux-gcc -o toto toto.cpp 
/tmp/ccLZZMR8.o: In function `main':
toto.cpp:(.text+0x60): undefined reference to `__sync_fetch_and_add_4'
collect2: error: ld returned 1 exit status

Therefore, I would expect Boost configuration to define
BOOST_NO_CXX11_HDR_ATOMIC. This way, it would fall back on a different
atomic implementation (potentially based on pthread locks) and the
build would work fine.

Anybody has a clue ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
