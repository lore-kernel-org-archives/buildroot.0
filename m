From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 17:36:40 +0100
Subject: [Buildroot] [git commit] package/boost: enable building of boost_log
Message-ID: <20150315163717.D311880E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f3f0adec652b9b8f0acb4fe905f2101693000ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yannick Kiekens <yannickkiekens@gmail.com>
[Thomas: tested on ARM uClibc, and AArch64 glibc, the latter being the
case that used to fail building, and was the reason why boost log had
been disabled.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in |    3 +++
 package/boost/boost.mk  |    4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 574f51a..7085c05 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -88,6 +88,9 @@ config BR2_PACKAGE_BOOST_LOCALE
 comment "boost-locale needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
+config BR2_PACKAGE_BOOST_LOG
+        bool "boost-log"
+
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 70160da..56a6c34 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -24,8 +24,7 @@ HOST_BOOST_FLAGS = --without-icu \
 	serialization signals system test thread timer wave)
 
 # coroutine breaks on some weak toolchains and it's new for 1.54+
-# log breaks with some toolchain combinations and it's new for 1.54+
-BOOST_WITHOUT_FLAGS = coroutine log
+BOOST_WITHOUT_FLAGS = coroutine
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
@@ -37,6 +36,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
