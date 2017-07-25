From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:20:59 +0200
Subject: [Buildroot] [git commit] paxtest: install helper applications/libs
	to /usr/lib/paxtest
Message-ID: <20170725201844.692D282156@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e29061a9e657ecbc4d9b25e1d643bd06b27c0b15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RUNDIR installs the test applications and shared libraries into a
different folder then /usr/lib. This is desired as there are a lot of
test apps which would get installed into /usr/lib without
organization. Instead, set RUNDIR=/usr/lib/paxtest to install the test
apps and libraries in a sub folder. The genpaxtest script accounts for
this path and handles a LD_LIBRARY_PATH update as part of the paxtest
script's exeuction.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
