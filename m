From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Jun 2018 20:24:43 +0200
Subject: [Buildroot] [PATCH 1/1] boost: add option for contract library
Message-ID: <20180624182443.6004-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contract library has been added in boost 1.67 and depends on NPTL

Fixes:
 - http://autobuild.buildroot.net/results/a3dd35cfa50a1862c585a648298351c0aba257db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 10 ++++++++++
 package/boost/boost.mk  |  7 ++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index ec0e19ccb5..781bc47c00 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -77,6 +77,16 @@ config BR2_PACKAGE_BOOST_CONTEXT
 	help
 	  C++11 context switching library.
 
+config BR2_PACKAGE_BOOST_CONTRACT
+	bool "boost-contract"
+	# pthread_condattr_setclock
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	help
+	  Contract programming for C++.
+
+comment "boost-contract needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 981d701bdf..cf0cea7edd 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -14,15 +14,16 @@ BOOST_LICENSE_FILES = LICENSE_1_0.txt
 # keep host variant as minimal as possible
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
-	coroutine date_time exception filesystem graph graph_parallel iostreams \
-	locale log math mpi program_options python random regex serialization \
-	signals system test thread timer type_erasure \
+	contract coroutine date_time exception filesystem graph graph_parallel \
+	iostreams locale log math mpi program_options python random regex \
+	serialization signals system test thread timer type_erasure \
 	wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTRACT),,contract)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
-- 
2.14.1
