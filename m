From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 19 Apr 2017 08:51:52 -0300
Subject: [Buildroot] [PATCH] gtest: fix usage on ARM platforms
Message-ID: <1492602712-28828-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ensure that GTest is compiled with -fPIC to allow linking the static
libraries with dynamically linked programs. This is not a requirement
for most architectures but is mandatory for ARM.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/gtest/gtest.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 329179d..dc43597 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -37,6 +37,13 @@ HOST_GTEST_GMOCK_PYTHONPATH = \
 # the gtest sources.
 GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
 
+# Ensure that GTest is compiled with -fPIC to allow linking the static
+# libraries with dynamically linked programs. This is not a requirement
+# for most architectures but is mandatory for ARM.
+ifeq ($(BR2_STATIC_LIBS),)
+GTEST_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
+endif
+
 GTEST_CONF_OPTS += -DBUILD_GTEST=ON
 
 ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
-- 
2.7.4
