From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 21 Oct 2020 09:59:23 +0300
Subject: [Buildroot] [PATCH] package/gcc: Fix libs building on ARC700 with
 atomics
Message-ID: <20201021065923.22112-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we many times by now discussed that - some ARC cores might
not have atomic instructions implemented. Namely that's ARC700
w/o explicitly added atomics during design creation/configuration.

Because of that when GCC gets configured for ARC700, i.e. via
"--with-cpu=arc700" atomic ops are assumed disabled.

Usually it's not a problem as we add "-matomics" in the wraper for
building all packages if targets CPU has atomis (BR2_ARC_ATOMIC_EXT).

But when bulding target's binaries which are essential parts of
the GCC itself we don't use the wrapper. Instead xgcc is being used.
That way we lose that important part of system's configuration about
atomics and:
 1. Atomic ops won't be used where otherwise they could have been used.
 2. Some configuration checks might end-up thinking there're no atomics

In particular (2) leads to pretty obscure failure on bulding of some
packages which use C++, for example:

log4cplus: http://autobuild.buildroot.net/results/a7732fdb2ba526a114d9fb759814236c5332f8d7
------------------------>8--------------------
./.libs/liblog4cplus.so: undefined reference to `std::__atomic_futex_unsigned_base::_M_futex_notify_all(unsigned int*)'
collect2: error: ld returned 1 exit status
------------------------>8--------------------

bitcoin: http://autobuild.buildroot.net/results/f73/f73d4c77e5fd6223abdbc83e344addcfc93227b8
------------------------>8--------------------
(.text+0x110c): undefined reference to `std::__atomic_futex_unsigned_base::_M_futex_wait_until(unsigned int*, unsigned int, bool, std::chrono::duration<long long, std::ratio<1ll, 1ll> >, std::chrono::duration<long long, std::ratio<1ll, 1000000000ll> >)'
collect2: error: ld returned 1 exit status
------------------------>8--------------------

apcupsd: http://autobuild.buildroot.net/results/7a2/7a2cc7a4ac2237c185817f75e55e05d144efd100
------------------------>8--------------------
/tmp/instance-0/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/9.3.1/../../../../arc-buildroot-linux-uclibc/bin/ld: eh_throw.cc:(.text._ZL23__gxx_exception_cleanup19_Unwind_Reason_CodeP17_Unwind_Exception+0x24): undefined reference to `__gnu_cxx::__exchange_and_add(int volatile*, int)'
collect2: error: ld returned 1 exit status
------------------------>8--------------------

...and many more.

Interesting enough that was not seen earlier because "-matomic"
used to be added in TARGET_{C|CXX}FLAGS via TARGET_ABI,
but later "-matomic" was moved to ARCH_TOOLCHAIN_WRAPPER_OPTS, see
https://git.buildroot.org/buildroot/commit/?id=c568b4f37fa6d7f51e6d14d33d7eb75dfe26d7bf
and since then we started to see that new breakage which we now
attempt to fix right where it hapens on GCC configuration.

In contrast ARC HS family has atomic ops enabled by default thus
we never spotted that kind of problem for it.

More datails with analysis of what really happens under the hodd and
how do error messages above are related to libs of GCC configuration could
be found here: http://lists.busybox.net/pipermail/buildroot/2020-October/293614.html

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/gcc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 114c2887a0..48974de2fa 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -98,6 +98,14 @@ ifeq ($(BR2_ENABLE_DEBUG),y)
 GCC_COMMON_TARGET_CFLAGS += -Wno-error
 endif
 
+# Make sure libgcc & libstdc++ always get built with -matomic on ARC700
+ifeq ($(GCC_TARGET_CPU),arc700)
+ifeq ($(BR2_ARC_ATOMIC_EXT),y)
+GCC_COMMON_TARGET_CFLAGS += -matomic
+GCC_COMMON_TARGET_CXXFLAGS += -matomic
+endif
+endif
+
 # Propagate options used for target software building to GCC target libs
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
-- 
2.16.2
