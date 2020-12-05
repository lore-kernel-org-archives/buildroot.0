From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  5 Dec 2020 23:15:25 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/boost: atomics needs always lockfree atomic bytes
Message-ID: <20201205221525.236045-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 1.74.0, boost atomics needs a toolchain that always
supports lockfree atomic bytes so add dependendy on
BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS:
https://github.com/boostorg/atomic/issues/42

Fixes:
 - http://autobuild.buildroot.org/results/c03a786791e3aa7801cf1bff9934c4a105f54ce1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Use && instead of ||?in bitcoin and gqrx comment
 - Drop select of boost-atomic in boost-thread
 - Update reverse dependencies of boost-thread: boost-context,
   boost-coroutine, boost-fiber, boost-locale, boost-type_erasure,
   boost-wave

 package/azmq/Config.in          |  2 ++
 package/bitcoin/Config.in       |  4 +++-
 package/boost/Config.in         | 26 ++++++++++++++++++++------
 package/domoticz/Config.in      |  2 ++
 package/gnuradio/Config.in      |  2 ++
 package/gqrx/Config.in          |  2 ++
 package/libcpprestsdk/Config.in |  2 ++
 package/uhd/Config.in           |  2 ++
 8 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/package/azmq/Config.in b/package/azmq/Config.in
index 2904890d5f..37131a260a 100644
--- a/package/azmq/Config.in
+++ b/package/azmq/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_AZMQ
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR # boost
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_ZEROMQ
 	select BR2_PACKAGE_BOOST
@@ -21,6 +22,7 @@ config BR2_PACKAGE_AZMQ
 	  https://github.com/zeromq/azmq
 
 comment "azmq needs a toolchain w/ C++11, wchar and NPTL"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
 
diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 65af15293d..da8452ef5a 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 config BR2_PACKAGE_BITCOIN
 	bool "bitcoin"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
@@ -36,7 +37,8 @@ config BR2_PACKAGE_BITCOIN
 	  https://bitcoincore.org
 
 comment "bitcoin needs a toolchain w/ C++, threads, wchar"
-	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS && \
+		BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 121650b8bc..1f85726ca2 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -52,6 +52,7 @@ config BR2_PACKAGE_BOOST_LAYOUT
 
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	help
 	  C++11-style atomic<>.
 
@@ -82,6 +83,7 @@ config BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS || BR2_TOOLCHAIN_GCC_AT_LEAST_6 # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
@@ -101,6 +103,7 @@ comment "boost-contract needs a toolchain w/ NPTL"
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTEXT
@@ -112,7 +115,8 @@ config BR2_PACKAGE_BOOST_COROUTINE
 	  selected.
 
 comment "boost-coroutine needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS && \
+		BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_DATE_TIME
@@ -135,6 +139,7 @@ config BR2_PACKAGE_BOOST_FIBER
 	# mips support uses the "pause" instruction, only available
 	# since mips32r2/mips64r2.
 	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS || BR2_TOOLCHAIN_GCC_AT_LEAST_6 # boost-context -> boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
@@ -143,11 +148,13 @@ config BR2_PACKAGE_BOOST_FIBER
 	  C++11 userland threads library.
 
 comment "boost-fiber needs a toolchain w/ NPTL"
-	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS && \
+		(BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS || BR2_TOOLCHAIN_GCC_AT_LEAST_6)
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS && \
+		(BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS || BR2_TOOLCHAIN_GCC_AT_LEAST_6)
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
@@ -190,6 +197,7 @@ config BR2_PACKAGE_BOOST_LOCALE
 	# details.
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
 	depends on !(BR2_TOOLCHAIN_HAS_GCC_BUG_64735 && BR2_PACKAGE_ICU) # boost-thread
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS || !BR2_PACKAGE_ICU # boost-thread
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD if BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -197,16 +205,19 @@ config BR2_PACKAGE_BOOST_LOCALE
 	  Provide localization and Unicode handling tools for C++.
 
 comment "boost-locale needs a toolchain w/ dynamic library"
-	depends on BR2_PACKAGE_ICU
+	depends on BR2_PACKAGE_ICU && \
+		BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_STATIC_LIBS
 
 comment "boost-locale needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_PACKAGE_ICU
+	depends on BR2_PACKAGE_ICU && \
+		BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_DATE_TIME
@@ -218,6 +229,7 @@ config BR2_PACKAGE_BOOST_LOG
 	  Logging library.
 
 comment "boost-log needs a toolchain w/ NPTL"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 comment "boost-log needs a toolchain not affected by GCC bug 64735"
@@ -313,8 +325,8 @@ config BR2_PACKAGE_BOOST_TEST
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
-	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_SYSTEM
 	help
@@ -332,6 +344,7 @@ config BR2_PACKAGE_BOOST_TIMER
 
 config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	bool "boost-type_erasure"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
@@ -346,6 +359,7 @@ config BR2_PACKAGE_BOOST_WAVE
 	# limitation of assembler for coldfire
 	# error: Tried to convert PC relative branch to absolute jump
 	depends on !BR2_m68k_cf
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index ea7614ed51..3771e8c9eb 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LUA_5_3
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_DATE_TIME
@@ -32,6 +33,7 @@ config BR2_PACKAGE_DOMOTICZ
 
 comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index cd31ce8864..c7b01b454b 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,5 +1,6 @@
 comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
@@ -13,6 +14,7 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index d873c6a4d4..af4d69381e 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -1,6 +1,7 @@
 comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU # gnuradio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || !BR2_STATIC_LIBS
 
@@ -19,6 +20,7 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_QT5
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # gnuradio -> boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # gnuradio
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index af97509d1b..97f00e3383 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 	depends on BR2_ENABLE_LOCALE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # boost
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_BOOST
@@ -23,6 +24,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 	  https://github.com/Microsoft/cpprestsdk
 
 comment "libcpprestsdk needs a toolchain w/ NPTL, C++, wchar, locale"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 32cb4cf89d..b9aa665c31 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -1,5 +1,6 @@
 comment "uhd needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
@@ -10,6 +11,7 @@ config BR2_PACKAGE_UHD
 	bool "uhd"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
-- 
2.29.2
