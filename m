From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 21 Nov 2014 08:04:50 +0200
Subject: [Buildroot] [PATCH] czmq: fix static build
Message-ID: <b4686e4f4a1c32cb679db3cc7f2875556728e56c.1416549890.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

czmq configure script uses gcc to test zmq linking so libstdc++ is not added
automatically. Do this manually.

Fixes:
http://autobuild.buildroot.net/results/7b7/7b7f7614206cf9b8fef48f49cb060eca356d4949/
http://autobuild.buildroot.net/results/b3a/b3abff021d23ef0f685a44901b6041ba45bd35d7/
http://autobuild.buildroot.net/results/1f0/1f033d04231c5f058513cbca0d437b96260fbd7a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/czmq/czmq.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index d25bf01c63a4..9a127265e398 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -18,6 +18,10 @@ CZMQ_LICENSE_FILES = LICENSE
 # host-python, so disable asciidoc entirely.
 CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+CZMQ_CONF_OPTS += LIBS=-lstdc++
+endif
+
 define CZMQ_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
 endef
-- 
2.1.3
