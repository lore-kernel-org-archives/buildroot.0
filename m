From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 15:18:24 +0200
Subject: [Buildroot] [git commit] boost: bump to 1.65.1,
	coroutine2 is now a header only library
Message-ID: <20171021132048.02AEE81071@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ef4a3405f43a284689b6451b1cfad4718339439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The coroutine2 functionality is now provided only through headers, the
compiled library has disappeared. Due to that passing "coroutine2" as
argument to --without-libraries. Hence, the
BR2_PACKAGE_BOOST_COROUTINE2 option is removed by this commit.

We don't need Config.in.legacy handling, because coroutine2 support is
now unconditionally available in boost.

While at it, add LICENSE_1_0.txt sha256sum to boost.hash.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[Thomas: drop Config.in.legacy handling, reword commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in  | 4 ----
 package/boost/boost.hash | 7 +++++--
 package/boost/boost.mk   | 9 ++++-----
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 50d0ff8..3b3c89b 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -73,10 +73,6 @@ config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT
 
-config BR2_PACKAGE_BOOST_COROUTINE2
-	bool "boost-coroutine2"
-	depends on BR2_PACKAGE_BOOST_CONTEXT
-
 config BR2_PACKAGE_BOOST_DATE_TIME
 	bool "boost-date_time"
 
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 7494c0c..6e40c0d 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,2 +1,5 @@
-# From http://www.boost.org/users/history/version_1_64_0.html
-sha256 7bcc5caace97baa948931d712ea5f37038dbb1c5d89b43ad4def4ed7cb683332  boost_1_64_0.tar.bz2
+# From http://www.boost.org/users/history/version_1_65_1.html
+sha256 9807a5d16566c57fd74fb522764e0b134a8bbe6b6e8967b83afefd30dcd3be81  boost_1_65_1.tar.bz2
+
+# Locally computed
+sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index e515faf..8ba88a7 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.64.0
+BOOST_VERSION = 1.65.1
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
@@ -14,9 +14,9 @@ BOOST_LICENSE_FILES = LICENSE_1_0.txt
 # keep host variant as minimal as possible
 HOST_BOOST_FLAGS = --without-icu \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
-	coroutine coroutine2 date_time exception filesystem graph \
-	graph_parallel iostreams locale log math mpi program_options python \
-	random regex serialization signals system test thread timer type_erasure \
+	coroutine date_time exception filesystem graph graph_parallel iostreams \
+	locale log math mpi program_options python random regex serialization \
+	signals system test thread timer type_erasure \
 	wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
@@ -24,7 +24,6 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE2),,coroutine2)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
