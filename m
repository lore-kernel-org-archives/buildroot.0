From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  7 Jul 2016 20:39:36 +0200
Subject: [Buildroot] [PATCH 2/3] package/runc: fix shared only build when
	libseccomp is enabled.
In-Reply-To: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1467916777-29220-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PACKAGE_LIBSECCOMP is set, the go build system will try to
find static library libseccomp.a since "static_build" and
"extldflags '-static'" are used.

Link runc statically only for static only build and prefer dynamic
linking otherwise.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Christian Stewart <christian@paral.in>
---
 package/runc/runc.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 1396e0c..66f234f 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -19,10 +19,14 @@ RUNC_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	PATH=$(BR_PATH)
 
 RUNC_GLDFLAGS = \
-	-X main.gitCommit=$(RUNC_VERSION) \
-	-extldflags '-static'
+	-X main.gitCommit=$(RUNC_VERSION)
 
-RUNC_GOTAGS = cgo static_build
+RUNC_GOTAGS = cgo
+
+ifeq ($(BR2_STATIC_LIBS),y)
+RUNC_GOTAGS += static_build
+RUNC_GLDFLAGS += -extldflags '-static'
+endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 RUNC_GOTAGS += seccomp
-- 
2.5.5
