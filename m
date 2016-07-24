From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 16:43:47 +0200
Subject: [Buildroot] [PATCH 3/3] runc: pass -extldflags '-static' on when
	BR2_STATIC_LIBS=y
In-Reply-To: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1469371427-25201-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no reason to link Go binaries statically, unless when
BR2_STATIC_LIBS=y.

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
 
-- 
2.7.4
