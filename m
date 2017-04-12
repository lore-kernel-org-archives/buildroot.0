From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:26 +0200
Subject: [Buildroot] [PATCH 52/53] checkpolicy: rework host installation
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-53-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

checkpolicy has a pretty peculiar interpretation of DESTDIR and PREFIX.
PREFIX simply defaults to $(DESTDIR)/usr, and is used in the rest of
the build system. DESTDIR isn't used any further.

For the host installation, we don't want the usr part, so set PREFIX
instead of DESTDIR.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/checkpolicy/checkpolicy.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index d80bb792b4..f0cca593d3 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -31,17 +31,19 @@ endef
 
 HOST_CHECKPOLICY_DEPENDENCIES = host-libselinux host-flex host-bison
 
-HOST_CHECKPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
+# PREFIX is used at build time to find host-libselinux
+HOST_CHECKPOLICY_MAKE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	PREFIX=$(HOST_DIR) \
 	LEX="$(HOST_DIR)/bin/flex" \
 	YACC="$(HOST_DIR)/bin/bison -y"
 
-# DESTDIR is used at build time to find host-libselinux
 define HOST_CHECKPOLICY_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS)
 endef
 
 define HOST_CHECKPOLICY_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) install
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
