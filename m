From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 23:13:31 +0100
Subject: [Buildroot] [git commit] boost: enable boost-atomic
Message-ID: <20150313221537.BE9E28182D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=858c7d91b9cbc827e7c3f28c0d58421167de2860
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was disabled in february 2013 by commit
e5434583badf1abf4a4620efa76452638ad9e177
because did not build correctly with ucLibc at the time.

It now builds correctly with both uClibc v0.9.33 and uClibc-ng.

Signed-off-by: No?? Rubinstein <nrubinstein@aldebaran.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in |    3 +++
 package/boost/boost.mk  |    4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a15b849..574f51a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -50,6 +50,9 @@ config BR2_PACKAGE_BOOST_LAYOUT
 	default "tagged" if BR2_PACKAGE_BOOST_LAYOUT_TAGGED
 	default "versioned" if BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
 
+config BR2_PACKAGE_BOOST_ATOMIC
+	bool "boost-atomic"
+
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 7b56827..70160da 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -23,11 +23,11 @@ HOST_BOOST_FLAGS = --without-icu \
 	iostreams locale log math mpi program_options python random regex \
 	serialization signals system test thread timer wave)
 
-# atomic library compile only with upstream version, wait for next release
 # coroutine breaks on some weak toolchains and it's new for 1.54+
 # log breaks with some toolchain combinations and it's new for 1.54+
-BOOST_WITHOUT_FLAGS = atomic coroutine log
+BOOST_WITHOUT_FLAGS = coroutine log
 
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
