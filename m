From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 16:43:46 +0200
Subject: [Buildroot] [PATCH 2/3] flannel: pass -extldflags '-static' on when
	BR2_STATIC_LIBS=y
In-Reply-To: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1469371427-25201-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no reason to link Go binaries statically, unless when
BR2_STATIC_LIBS=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flannel/flannel.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index b5f61a0..18c0af1 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -21,7 +21,10 @@ FLANNEL_MAKE_ENV = \
 
 FLANNEL_GLDFLAGS = \
 	-X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION) \
-	-extldflags '-static'
+
+ifeq ($(BR2_STATIC_LIBS),y)
+FLANNEL_GLDFLAGS += -extldflags '-static'
+endif
 
 define FLANNEL_CONFIGURE_CMDS
 	# Put sources at prescribed GOPATH location.
-- 
2.7.4
