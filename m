From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2015 20:43:12 +0200
Subject: [Buildroot] [git commit] czmq: unbreak static linking
Message-ID: <20150512184711.BDF2381DA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa5254f1a2bc0ea3181d51990c18681b3071b9db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/faf/faf0bb00fccb1350afaef55f6cf14c11a5f5dc3c/
http://autobuild.buildroot.net/results/8d2/8d279baa4c8bffbb01f897119092c7b736942df4/
http://autobuild.buildroot.net/results/4d3/4d3dea604da9a5a1e7fe20548813f8de474ae33f/
http://autobuild.buildroot.net/results/fd6/fd602617839817352763e51754553960b7f795ac/

And many more.

Zeromq uses C++, but czmq forgets to explicitly link with libstdc++
(or use g++ to link), breaking static linking.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/czmq/czmq.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index d25bf01..789e700 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -18,6 +18,12 @@ CZMQ_LICENSE_FILES = LICENSE
 # host-python, so disable asciidoc entirely.
 CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
 
+# zeromq uses C++, but czmq forgets to explicitly link with libstdc++
+# (or use g++ to link), breaking static linking.
+ifeq ($(BR2_STATIC_LIBS),y)
+CZMQ_CONF_ENV += LIBS='-lstdc++'
+endif
+
 define CZMQ_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
 endef
