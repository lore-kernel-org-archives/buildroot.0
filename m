From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue,  4 Jun 2019 18:07:39 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/boost: work around gcc bug 85180
 for boost-fiber option
In-Reply-To: <20190604160739.124905-1-giulio.benetti@micronovasrl.com>
References: <20190604160739.124905-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190604160739.124905-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building boost with boost-fiber enabled and optimization
but not when building with -O0. To work around this, if
BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y and boost-fiber is selected we force
using -O0.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes:
V1->V2:
* remove 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180' and its comment
  from Config.in
* reword taking into account boost-fiber option

 package/boost/Config.in | 5 ++---
 package/boost/boost.mk  | 4 ++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 783e86dc09..88b964847f 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -137,7 +137,6 @@ config BR2_PACKAGE_BOOST_FIBER
 	# since mips32r2/mips64r2.
 	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
@@ -148,9 +147,9 @@ comment "boost-fiber needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
-comment "boost-fiber needs a toolchain not affected by GCC bug 64735, 85180"
+comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || BR2_TOOLCHAIN_HAS_GCC_BUG_85180
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index a2d8395fd4..04869ed685 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -50,6 +50,10 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
 
 BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+BOOST_TARGET_CXXFLAGS += -O0
+endif
+
 BOOST_FLAGS = --with-toolset=gcc
 
 ifeq ($(BR2_PACKAGE_ICU),y)
-- 
2.17.1
