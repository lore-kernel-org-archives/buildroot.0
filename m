From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue,  4 Jun 2019 17:49:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/boost: work around gcc bug 85180
In-Reply-To: <20190604154955.123665-1-giulio.benetti@micronovasrl.com>
References: <20190604154955.123665-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190604154955.123665-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building boost with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
force using -O0.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/boost/boost.mk | 4 ++++
 1 file changed, 4 insertions(+)

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
