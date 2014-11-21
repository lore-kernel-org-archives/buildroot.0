From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 10:37:14 +0100
Subject: [Buildroot] [git commit] czmq: fix static build
Message-ID: <20141121115056.BAA077FE13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b88b05443a1d594d8fbcfd4e7e03972aa29a022
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

czmq configure script uses gcc to test zmq linking so libstdc++ is not added
automatically. Do this manually.

Fixes:
http://autobuild.buildroot.net/results/7b7/7b7f7614206cf9b8fef48f49cb060eca356d4949/
http://autobuild.buildroot.net/results/b3a/b3abff021d23ef0f685a44901b6041ba45bd35d7/
http://autobuild.buildroot.net/results/1f0/1f033d04231c5f058513cbca0d437b96260fbd7a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/czmq/czmq.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index d25bf01..9a12726 100644
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
