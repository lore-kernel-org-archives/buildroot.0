From: Romain Naour <romain.naour@openwide.fr>
Date: Thu,  9 Apr 2015 22:23:38 +0200
Subject: [Buildroot] [PATCH 1/3] package/boost: disable boost-log with bfin
	uClibc 2014R1 toolchain
Message-ID: <1428611020-9329-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pthread_spin_* functions are not implemented in the uClibc used by this toolchain.

In file included from libs/log/src/threadsafe_queue.cpp:33:
./boost/log/detail/spin_mutex.hpp: In constructor ?boost::log::v2_mt_posix::aux::spin_mutex::spin_mutex()?:
./boost/log/detail/spin_mutex.hpp:198: error: ?pthread_spin_init? was not declared in this scope
./boost/log/detail/spin_mutex.hpp: In destructor ?boost::log::v2_mt_posix::aux::spin_mutex::~spin_mutex()?:
./boost/log/detail/spin_mutex.hpp:205: error: ?pthread_spin_destroy? was not declared in this scope
./boost/log/detail/spin_mutex.hpp: In member function ?bool boost::log::v2_mt_posix::aux::spin_mutex::try_lock()?:
./boost/log/detail/spin_mutex.hpp:210: error: ?pthread_spin_trylock? was not declared in this scope
./boost/log/detail/spin_mutex.hpp: In member function ?void boost::log::v2_mt_posix::aux::spin_mutex::lock()?:
./boost/log/detail/spin_mutex.hpp:220: error: ?pthread_spin_lock? was not declared in this scope
./boost/log/detail/spin_mutex.hpp: In member function ?void boost::log::v2_mt_posix::aux::spin_mutex::unlock()?:
./boost/log/detail/spin_mutex.hpp:227: error: ?pthread_spin_unlock? was not declared in this scope

Fixes:
http://autobuild.buildroot.net/results/8cd/8cdac9cc67394aaae09ee816a9adddec762e3bd0/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/boost/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a004fd8..8e99324 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -88,7 +88,8 @@ comment "boost-locale needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_BOOST_LOG
-        bool "boost-log"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # missing pthread_spin_* in uClibc.
+	bool "boost-log"
 
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
-- 
1.9.3
