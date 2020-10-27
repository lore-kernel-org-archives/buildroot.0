From: buildroot at heine.tech <buildroot@heine.tech>
Date: Tue, 27 Oct 2020 18:40:44 +0100
Subject: [Buildroot] [PATCH 1/3] package/libabseil-cpp: enforce C++11
In-Reply-To: <20201027174046.17157-1-buildroot@heine.tech>
References: <20201027174046.17157-1-buildroot@heine.tech>
Message-ID: <20201027174046.17157-2-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Nosthoff <buildroot@heine.tech>

For gcc < 6 the c++ default is 98. Abseil needs at least 11
but doesn't enforce this anymore. So we need to do this.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libabseil-cpp/libabseil-cpp.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index dfcf892f65..8490b6d948 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -20,5 +20,15 @@ HOST_LIBABSEIL_CPP_CONF_OPTS = \
 	-DABSL_USE_GOOGLETEST_HEAD=OFF \
 	-DABSL_RUN_TESTS=OFF
 
+# abseil needs c++ >= 11 but doesn't set this anymore,
+# before gcc6 the default is 98.
+ifeq ($(BR2_GCC_AT_LEAST_6_0),)
+LIBABSEIL_CPP_CONF_OPTS += -DCMAKE_CXX_STANDARD=11
+endif
+
+ifeq ($(BR2_HOST_GCC_AT_LEAST_6_0),)
+HOST_LIBABSEIL_CPP_CONF_OPTS += -DCMAKE_CXX_STANDARD=11
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.25.1
