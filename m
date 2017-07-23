From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 22 Jul 2017 20:53:03 -0500
Subject: [Buildroot] [PATCH 1/1] paxtest: use RUNDIR
Message-ID: <1500774783-21428-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

RUNDIR installs the test applications and shared libraries
into a different folder then /usr/lib.  This is desired as
there are a lot of test apps which would get installed into
/usr/lib without organization.  Instead, set RUNDIR=/usr/lib/paxtest
to install the test apps and libraries in a sub folder.
The genpaxtest script accounts for this path and handles
a LD_LIBRARY_PATH update as part of the paxtest script's exeuction.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/paxtest/paxtest.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/paxtest/paxtest.mk b/package/paxtest/paxtest.mk
index 5eaee86..e632e22 100644
--- a/package/paxtest/paxtest.mk
+++ b/package/paxtest/paxtest.mk
@@ -11,15 +11,20 @@ PAXTEST_LICENSE_FILES = README
 
 define PAXTEST_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		CC="$(TARGET_CC)" LD="$(TARGET_CC)" linux
+		RUNDIR="/usr/lib/paxtest" CC="$(TARGET_CC)" LD="$(TARGET_CC)" linux
 endef
 
+# The files installed to RUNDIR include test apps and shared libs.
+# Assuming /usr/bin/paxtest script solely uses these libs and apps, the
+# genpaxtest script updates LD_LIBRARY_PATH in the paxtest script
+# as part of the paxtest's creation to include the RUNDIR path for shared
+# library use.
 define PAXTEST_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
 		DESTDIR=$(TARGET_DIR) \
 		BINDIR="usr/bin" \
-		RUNDIR="usr/lib" -f Makefile.psm install
+		RUNDIR="/usr/lib/paxtest" -f Makefile.psm install
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
