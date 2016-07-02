From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Jul 2016 17:29:52 +0200
Subject: [Buildroot] [PATCH v2] package/boost: add boot-type_erasure support
Message-ID: <1467473392-16516-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

Until now this library wasn't handled by the Buildroot packaging,
so add a new config option to disable it when requested.

Also disable boost-type_erasure for the host variant to keep it as
minimal as possible.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: remove the dependency on toolchain w/ NTPL threads support (Bernd)
---
 package/boost/Config.in | 3 +++
 package/boost/boost.mk  | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 0cc9a58..51d4ed7 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -154,6 +154,9 @@ config BR2_PACKAGE_BOOST_THREAD
 config BR2_PACKAGE_BOOST_TIMER
 	bool "boost-timer"
 
+config BR2_PACKAGE_BOOST_TYPE_ERASURE
+	bool "boost-type_erasure"
+
 config BR2_PACKAGE_BOOST_WAVE
 	bool "boost-wave"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index fc89265..1d42f6c 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -18,7 +18,8 @@ HOST_BOOST_FLAGS = --without-icu \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
 	coroutine coroutine2 date_time exception filesystem graph \
 	graph_parallel iostreams locale log math mpi program_options python \
-	random regex serialization signals system test thread timer wave)
+	random regex serialization signals system test thread timer type_erasure \
+	wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
@@ -47,6 +48,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SYSTEM),,system)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TYPE_ERASURE),,type_erasure)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
 
 BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
-- 
2.5.5
