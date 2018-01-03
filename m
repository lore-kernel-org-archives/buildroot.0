From: Jan Heylen <heyleke@gmail.com>
Date: Wed,  3 Jan 2018 22:20:10 +0100
Subject: [Buildroot] [PATCH v5 2/3] pkg-cmake: add note on BUILD_STATIC_LIBS
In-Reply-To: <1515014411-3504-1-git-send-email-heyleke@gmail.com>
References: <1515014411-3504-1-git-send-email-heyleke@gmail.com>
Message-ID: <1515014411-3504-3-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

as BUILD_STATIC_LIBS is not a standard cmake variable (while BUILD_SHARED_LIBS is)
we shouldn't add it in pkg-cmake.mk, although for some packages that would
make sense. Therefore, add a note so we don't forget about this abnormality.

see: https://cmake.org/cmake/help/v3.8/manual/cmake-variables.7.html#variables-that-change-behavior
Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
---
 package/pkg-cmake.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 6739704..b75cb98 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -80,6 +80,15 @@ ifndef $(2)_CONFIGURE_CMDS
 ifeq ($(4),target)
 
 # Configure package for target
+#
+# Note:
+# BUILD_SHARED_LIBS is a cmake internal variable,
+# BUILD_STATIC_LIBS is not standard in any way, which means some
+# projects may choose another name for a similar option and there is not
+# much we can do about this.
+# see: https://cmake.org/cmake/help/v3.8/manual/cmake-variables.7.html#variables-that-change-behavior
+#
+# So: we handle BUILD_SHARED_LIBS here, but BUILD_STATIC_LIBS must be handled per package
 define $(2)_CONFIGURE_CMDS
 	(mkdir -p $$($$(PKG)_BUILDDIR) && \
 	cd $$($$(PKG)_BUILDDIR) && \
-- 
2.7.4
