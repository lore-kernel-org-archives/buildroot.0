From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Aug 2018 00:12:57 +0200
Subject: [Buildroot] [PATCH v2,2/2] boost: context needs C++11
In-Reply-To: <20180820221257.1553-1-fontaine.fabrice@gmail.com>
References: <20180820221257.1553-1-fontaine.fabrice@gmail.com>
Message-ID: <20180820221257.1553-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this flag, mutex is not always correctly detected with gcc 4.x
or 5.x. As a result, boost_thread is wrongly selected by boost_context.

Fixes:
 - http://autobuild.buildroot.net/results/fb046c04fe18bec973d120e4ab33971f32ba5769
 - http://autobuild.buildroot.net/results/99f1a255b78a973faeb8bf3b94d78efc54426a8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update first patch to keep selection of boost-thread but lower gcc
   version from 4.8 to 4.7
 - Update second patch to add -std=c++11 only if gcc >= 4.7

 package/boost/boost.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 14f6162003..f4a44fa123 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -61,6 +61,11 @@ else
 BOOST_FLAGS += --without-icu
 endif
 
+# boost-context needs C++11
+ifeq ($(BR2_PACKAGE_BOOST_CONTEXT)$(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),yy)
+BOOST_TARGET_CXXFLAGS += -std=c++11
+endif
+
 ifeq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
 BOOST_DEPENDENCIES += bzip2 zlib
 endif
-- 
2.14.1
