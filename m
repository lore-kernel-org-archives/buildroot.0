From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 15 Apr 2014 00:09:47 +0200
Subject: [Buildroot] [PATCH v2 1/3] nodejs: use the standard configure/make
	options
Message-ID: <1397513389-16252-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also cleanup leading whitespace.

Note that overloading LD in required to avoid linker failures.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- rebase
- remove {C,LD}FLAGS, duplicating the ones from
  {HOST,TARGET}_CONFIGURE_OPTS (ThomasP)
- update commit log
---
 package/nodejs/nodejs.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

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
 
-- 
1.9.2
