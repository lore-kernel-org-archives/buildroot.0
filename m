From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Jul 2016 16:32:30 +0200
Subject: [Buildroot] [PATCH 2/2] package/boost: add boot-type_erasure support
In-Reply-To: <1467469950-11984-1-git-send-email-romain.naour@smile.fr>
References: <1467469950-11984-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1467469950-11984-2-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now this library wasn't handled by the Buildroot packaging,
since it require a toolchain with NTPL support add a new config
option to disable it when requested.

Also disable boost-type_erasure for the host variant to keep it as
minimal as possible.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/boost/Config.in | 7 +++++++
 package/boost/boost.mk  | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index d47bb40..ee4d1da 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -158,6 +158,13 @@ config BR2_PACKAGE_BOOST_THREAD
 config BR2_PACKAGE_BOOST_TIMER
 	bool "boost-timer"
 
+config BR2_PACKAGE_BOOST_TYPE_ERASURE
+	bool "boost-type_erasure"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
+comment "boost-type_erasure needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
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
