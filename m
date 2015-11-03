From: Edson Siqueira <edson.siqueira@datacom.ind.br>
Date: Tue,  3 Nov 2015 14:59:38 -0200
Subject: [Buildroot] [PATCH 1/1] boost: add option to build boost_coroutine
Message-ID: <1446569978-10357-1-git-send-email-edson.siqueira@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It was disabled by default by commit 611dfe6cb55ed72d7df3b7c102f4a723248a4037
due to the upgrade to boost 1.54.0.

Signed-off-by: Edson Siqueira <edson.siqueira@datacom.ind.br>
---
 package/boost/Config.in | 4 ++++
 package/boost/boost.mk  | 4 +---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index ac70152..150174c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -70,6 +70,10 @@ config BR2_PACKAGE_BOOST_CONTEXT
 	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel \
 			|| BR2_powerpc || BR2_sparc || BR2_x86_64)
 
+config BR2_PACKAGE_BOOST_COROUTINE
+        bool "boost-coroutine"
+        depends on BR2_PACKAGE_BOOST_CONTEXT
+
 config BR2_PACKAGE_BOOST_DATE_TIME
 	bool "boost-date_time"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 16d05cd..80325b0 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -20,13 +20,11 @@ HOST_BOOST_FLAGS = --without-icu \
 	iostreams locale log math mpi program_options python random regex \
 	serialization signals system test thread timer wave)
 
-# coroutine breaks on some weak toolchains and it's new for 1.54+
-BOOST_WITHOUT_FLAGS = coroutine
-
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
-- 
1.9.1
