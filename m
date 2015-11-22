From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Sun, 22 Nov 2015 17:31:16 +0200
Subject: [Buildroot] [PATCH 1/1] INSTALL for autotools packages with
	hardcoded '-s'
Message-ID: <1448206276-6260-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

The Makefile.in's of some autotools packages such as yp-tools and ypbind-mt do
not use the "install-sh" script for installing executables but instead call the
detected BSD compatible 'install' binary directly with hardcoded '-s' parameter.
This results in a build failure when the host 'strip' is invoked on binaries
compiled for a different arch. The 'install-without-strip' script removes the
'-s' parameter and execs the 'install' binary in PATH to solve this problem.
These autotools packages can then be build under Buildroot by specifying
<package>_CONF_ENV = INSTALL=support/scripts/install-without-strip

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 support/scripts/install-without-strip |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100755 support/scripts/install-without-strip

diff --git a/support/scripts/install-without-strip b/support/scripts/install-without-strip
new file mode 100755
index 0000000..f167c28
--- /dev/null
+++ b/support/scripts/install-without-strip
@@ -0,0 +1,11 @@
+#!/bin/sh -e
+# Needed for autotools packages with hardcoded "install -s"
+
+INSTALL=$(which install)
+if [ -x "${INSTALL}" ]
+then 
+	exec ${INSTALL} $(echo ${@} | sed 's/-s//g')
+fi
+
+echo "error: $0 needs an executable \"install\" in PATH"
+exit 1
-- 
1.7.9.5
