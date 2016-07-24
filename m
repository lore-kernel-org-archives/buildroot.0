From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:59:25 +0200
Subject: [Buildroot] [git commit] runc: pass -extldflags '-static' on when
	BR2_STATIC_LIBS=y
Message-ID: <20160724200005.8524A81E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9101ce5800cce377a59d82f90ce1d2ba58674d4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no reason to link Go binaries statically, unless when
BR2_STATIC_LIBS=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/runc/runc.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 1396e0c..7ebba57 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -19,8 +19,11 @@ RUNC_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	PATH=$(BR_PATH)
 
 RUNC_GLDFLAGS = \
-	-X main.gitCommit=$(RUNC_VERSION) \
-	-extldflags '-static'
+	-X main.gitCommit=$(RUNC_VERSION)
+
+ifeq ($(BR2_STATIC_LIBS),y)
+FLANNEL_GLDFLAGS += -extldflags '-static'
+endif
 
 RUNC_GOTAGS = cgo static_build
 
