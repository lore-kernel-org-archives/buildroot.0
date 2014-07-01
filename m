From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Jul 2014 18:47:49 +0000 (UTC)
Subject: [Buildroot] [Bug 7250] Cannot build with -std=c++11
In-Reply-To: <bug-7250-163@https.bugs.busybox.net/>
References: <bug-7250-163@https.bugs.busybox.net/>
Message-ID: <20140701184749.A29379D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7250

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-07-01 18:47:48 UTC ---
Basically, you're affected by
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393.

uClibc does not implement C99 complex number computations (functions such as
ccosf) and therefore libstdc++ concludes that there is no fully functional C99
support, and therefore it doesn't enable std::to_string() and many other
methods.

When building with uClibc:

configure:16721: checking for ISO C99 support in <complex.h>
[...]
/tmp/cc2ksPYJ.o: In function `main':
/home/test/outputs/arm-uclibc/build/host-gcc-final-4.8.3/build/arm-buildroot-linux-uclibcgnueabihf/libstdc++-v3/conftest.cpp:49:
undefined reference to `ccosf'
/home/test/outputs/arm-uclibc/build/host-gcc-final-4.8.3/build/arm-buildroot-linux-uclibcgnueabihf/libstdc++-v3/conftest.cpp:50:
undefined reference to `ccoshf'
[...]
configure:16861: result: no
configure:17182: checking for fully enabled ISO C99 support
configure:17184: result: no

When building with glibc:

configure:17182: checking for fully enabled ISO C99 support
configure:17184: result: yes

And the std::to_string method is wrapped into a C99 conditional:

#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99) \
     && !defined(_GLIBCXX_HAVE_BROKEN_VSWPRINTF))

#include <ext/string_conversions.h>

namespace std _GLIBCXX_VISIBILITY(default)
{
_GLIBCXX_BEGIN_NAMESPACE_VERSION
[...]
  inline string
  to_string(int __val)
  { return __gnu_cxx::__to_xstring<string>(&std::vsnprintf, 4 * sizeof(int),
                                           "%d", __val); }

So, for an immediate solution, use glibc. I'll try to see if we can integrate
the patch proposed in the bug report.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
