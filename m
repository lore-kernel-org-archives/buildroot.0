From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Mar 2015 23:45:01 +0100
Subject: [Buildroot] [git commit] bdwgc: fix static build
Message-ID: <20150302224950.7B32180524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d181bb93eb1bf2d43872b354b704a0b253a0a32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/6d3/6d3f73f7b5e4e7bd1293aae9b626f38ac456b6c4/
http://autobuild.buildroot.net/results/1ba/1ba511c629f724eee8b75b9b34fe8db154b3cfe1/
http://autobuild.buildroot.net/results/a54/a54cc1bdc5dcb4c459cfbcae3368811e2170d100/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bdwgc/bdwgc.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 9cf015e..19a66f3 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -18,8 +18,13 @@ BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
 # solution.
 BDWGC_AUTORECONF = YES
 
+BDWGC_CFLAGS = $(TARGET_CFLAGS)
+ifeq ($(BR2_STATIC_LIBS),y)
+BDWGC_CFLAGS += -DGC_NO_DLOPEN
+endif
+
 # Ensure we use the system libatomic_ops, and not the internal one.
-BDWGC_CONF_OPTS = --with-libatomic-ops=yes
+BDWGC_CONF_OPTS = --with-libatomic-ops=yes CFLAGS="$(BDWGC_CFLAGS)"
 HOST_BDWGC_CONF_OPTS = --with-libatomic-ops=yes
 
 $(eval $(autotools-package))
