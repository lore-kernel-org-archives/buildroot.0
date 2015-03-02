From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  2 Mar 2015 13:53:53 +0200
Subject: [Buildroot] [PATCH] bdwgc: fix static build
Message-ID: <663156112102c76e76ca7dc923503bea10062f5f.1425297233.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/6d3/6d3f73f7b5e4e7bd1293aae9b626f38ac456b6c4/
http://autobuild.buildroot.net/results/1ba/1ba511c629f724eee8b75b9b34fe8db154b3cfe1/
http://autobuild.buildroot.net/results/a54/a54cc1bdc5dcb4c459cfbcae3368811e2170d100/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bdwgc/bdwgc.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 9cf015ed1b41..19a66f33cf70 100644
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
-- 
2.1.4
