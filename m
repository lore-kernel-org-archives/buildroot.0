From: Jan Heylen <heyleke@gmail.com>
Date: Wed,  3 Jan 2018 21:09:24 +0100
Subject: [Buildroot] [PATCH v4 1/2] pkg-cmake: make BUILD_SHARED_LIBS part
 of generic cmake pkg logic
In-Reply-To: <1515010165-25315-1-git-send-email-heyleke@gmail.com>
References: <1515010165-25315-1-git-send-email-heyleke@gmail.com>
Message-ID: <1515010165-25315-2-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
---
Manually tested with opentracing package,
also checked that e.g. gtest configuration goes well (gtest.mk does an override of BUILD_SHARED_LIBS)

---
 package/pkg-cmake.mk             | 14 +++++++++++++-
 package/rabbitmq-c/rabbitmq-c.mk |  8 --------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 6739704..f819e90 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -71,6 +71,17 @@ else
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+CMAKE_BUILD_SHARED_LIBS = OFF
+CMAKE_BUILD_STATIC_LIBS = ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+CMAKE_BUILD_SHARED_LIBS = ON
+CMAKE_BUILD_STATIC_LIBS = ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+CMAKE_BUILD_SHARED_LIBS = ON
+CMAKE_BUILD_STATIC_LIBS = OFF
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
@@ -96,7 +107,8 @@ define $(2)_CONFIGURE_CMDS
 		-DBUILD_TEST=OFF \
 		-DBUILD_TESTS=OFF \
 		-DBUILD_TESTING=OFF \
-		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
+		-DBUILD_SHARED_LIBS=$$(CMAKE_BUILD_SHARED_LIBS) \
+		-DBUILD_STATIC_LIBS=$$(CMAKE_BUILD_STATIC_LIBS) \
 		$$(CMAKE_QUIET) \
 		$$($$(PKG)_CONF_OPTS) \
 	)
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index eef09ec..5a34e53 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -13,14 +13,6 @@ RABBITMQ_C_CONF_OPTS = \
 	-DBUILD_API_DOCS=OFF \
 	-DBUILD_TOOLS_DOCS=OFF
 
-ifeq ($(BR2_STATIC_LIBS),y)
-RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF
-endif
-
 # CMake OpenSSL detection is buggy, and doesn't properly use
 # pkg-config, so it fails when statically linking. See
 # https://gitlab.kitware.com/cmake/cmake/issues/16885.
-- 
2.7.4
