From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:52 +0200
Subject: [Buildroot] [git commit] checkpolicy: rework host installation
Message-ID: <20170705141337.D8AB17FB34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=283793a6ca28bbdb2d57a052c06ad3076390e760
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

checkpolicy has a pretty peculiar interpretation of DESTDIR and PREFIX.
PREFIX simply defaults to $(DESTDIR)/usr, and is used in the rest of
the build system. DESTDIR isn't used any further.

For the host installation, we don't want the usr part, so set PREFIX
instead of DESTDIR.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/checkpolicy/checkpolicy.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index d80bb79..f0cca59 100644
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
