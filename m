From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:59:24 +0200
Subject: [Buildroot] [git commit] flannel: pass -extldflags '-static' on
	when BR2_STATIC_LIBS=y
Message-ID: <20160724200005.701E581E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80634e30615e276481f30127659106031712b428
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no reason to link Go binaries statically, unless when
BR2_STATIC_LIBS=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Christian Stewart <christian@paral.in>
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
