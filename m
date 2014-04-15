From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 23:17:10 +0200
Subject: [Buildroot] [git commit] nodejs: use the standard configure/make
	options
Message-ID: <20140415211825.78CCA9C7C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bde585518e305e8dac19c1b0541ca2ae9ba65e91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also cleanup leading whitespace.

Note that overloading LD in required to avoid linker failures.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index a44bfbd..46b3056 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -23,7 +23,8 @@ define HOST_NODEJS_CONFIGURE_CMDS
 	# NPM is non-functional without it, and host-openssl isn't part of
 	# buildroot.
 	(cd $(@D); \
-                ./configure \
+		$(HOST_CONFIGURE_OPTS) \
+		./configure \
 		--prefix=$(HOST_DIR)/usr \
 		--without-snapshot \
 		--without-dtrace \
@@ -75,7 +76,9 @@ define NODEJS_CONFIGURE_CMDS
 endef
 
 define NODEJS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		LD="$(TARGET_CXX)"
 endef
 
 #
@@ -107,7 +110,10 @@ endef
 endif
 
 define NODEJS_INSTALL_TARGET_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install \
+		DESTDIR=$(TARGET_DIR) \
+		$(TARGET_CONFIGURE_OPTS) \
+		LD="$(TARGET_CXX)"
 	$(NODEJS_INSTALL_MODULES)
 endef
 
