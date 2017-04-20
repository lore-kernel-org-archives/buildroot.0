From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:31:53 +0200
Subject: [Buildroot] [git commit] gtest: fix usage on ARM platforms
Message-ID: <20170420203215.7467F827D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2026621f3c60167aa8ba48e658be1b214d1347d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure that GTest is compiled with -fPIC to allow linking the static
libraries with dynamically linked programs. This is not a requirement
for most architectures but is mandatory for ARM.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtest/gtest.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 9e69141..337a168 100644
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
