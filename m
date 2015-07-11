From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 10:50:42 +0200
Subject: [Buildroot] [git commit] libxmlrpc: fix static build
Message-ID: <20150711085342.DB1F47FF2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22501805ed49902020d33d1bd72baba407d3a289
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/16d/16de14ace7b4e089f56b9cb173542e487cae3a9d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxmlrpc/libxmlrpc.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 7d11205..03a7095 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -35,4 +35,14 @@ LIBXMLRPC_MAKE_ENV = \
 	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 	LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)"
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBXMLRPC_STATIC_OPTS = SHARED_LIB_TYPE=NONE MUST_BUILD_SHLIB=N
+endif
+
+LIBXMLRPC_MAKE_OPTS = $(LIBXMLRPC_STATIC_OPTS)
+LIBXMLRPC_INSTALL_STAGING_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
+	DESTDIR=$(STAGING_DIR) install
+LIBXMLRPC_INSTALL_TARGET_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
+	DESTDIR=$(TARGET_DIR) install
+
 $(eval $(autotools-package))
