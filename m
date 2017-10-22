From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Oct 2017 14:18:06 +0200
Subject: [Buildroot] [PATCH] boost: fix build on ppc64le host
Message-ID: <20171022121806.11468-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/57d/57d9f0ea27e5c8ba73002bd1d0b33027f27a3779/
http://autobuild.buildroot.net/results/7c3/7c3133e822c997879fe00923ba0ad7903656c2e1/

bootstrap by default runs ./tools/build/src/engine/build.sh --guess-toolset
to detect what toolchain (compiler variant).  On x86 this returns gcc, but
on the ppc64le gcc112 autobuilder this returns xlcpp causing bootstrap.sh to
get confused and bail out:

./bootstrap.sh ..
Building Boost.Build engine with toolset ... tools/build/src/engine/###
\### No toolset specified. Please use --toolset option.
\###
\### Known toolsets are: acc, borland, cc, como, clang, darwin, gcc, gcc-nocygwin, intel-darwin, intel-linux, intel-win32, kcc, kylix, metrowerks, mipspro, msvc, qcc, pathscale, pgi, sun, sunpro, tru64cxx, vacpp, xlcpp, vc7, vc8, vc9, vc10, vc11, vc12, vc14, vc141, vmsdecc
\###/b2

Fix it by explicitly specifying the gcc toolset mode to bootstrap, similar
to how it was already done for the bjam invocations.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 8ba88a7b7c..598ffbe10e 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -12,7 +12,7 @@ BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 
 # keep host variant as minimal as possible
-HOST_BOOST_FLAGS = --without-icu \
+HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
 	coroutine date_time exception filesystem graph graph_parallel iostreams \
 	locale log math mpi program_options python random regex serialization \
@@ -50,6 +50,8 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
 
 BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
+BOOST_FLAGS = --with-toolset=gcc
+
 ifeq ($(BR2_PACKAGE_ICU),y)
 BOOST_FLAGS += --with-icu=$(STAGING_DIR)/usr
 BOOST_DEPENDENCIES += icu
-- 
2.11.0
