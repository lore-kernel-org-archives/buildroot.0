From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 23:42:09 +0200
Subject: [Buildroot] [git commit] rp-pppoe: pass the appropriate path for
	various tools
Message-ID: <20161024214249.019B57FED4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cebf8219f319d1153fa10a1d43d02577bff5b966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rp-pppoe configure script uses AC_PATH_PROG() to find the path of
a number of tools on the build machine. But in fact, those paths are
not used to call the tools on the build machine, but rather to replace
variables in scripts that are executed in the target.

Due to this, if those tools on the build machine are not located at
the same place as their equivalent in the target, the scripts will
fail to run. To address this, we pass the necessary cache variables to
override the autoconf checks.

The path from pppd has been taken from the build result of the pppd
package. The path for setsid, id and echo have been taken from the
build result of Busybox, assuming that full-blown variants of those
tools would be installed at the same location.

Fixes bug #8811.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rp-pppoe/rp-pppoe.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 4306254..99d231e 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -15,8 +15,16 @@ RP_PPPOE_TARGET_SCRIPTS = pppoe-connect pppoe-init pppoe-setup pppoe-start \
 	pppoe-status pppoe-stop
 RP_PPPOE_MAKE_OPTS = PLUGIN_DIR=/usr/lib/pppd/$(PPPD_VERSION)
 RP_PPPOE_CONF_OPTS = --disable-debugging
+
+# The pppd, echo, setsid and id paths must be the ones on the
+# target. Indeed, the result of these checks is used to replace
+# variables in scripts that are installed in the target.
 RP_PPPOE_CONF_ENV = \
 	rpppoe_cv_pack_bitfields=normal \
+	ac_cv_path_PPPD=/usr/sbin/pppd \
+	ac_cv_path_ECHO=/bin/echo \
+	ac_cv_path_SETSID=/usr/bin/setsid \
+	ac_cv_path_ID=/usr/bin/id \
 	PPPD_H=$(PPPD_DIR)/pppd/pppd.h
 
 define RP_PPPOE_INSTALL_TARGET_CMDS
