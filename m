From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 May 2010 00:57:35 +0200
Subject: [Buildroot] [PATCH 2/2] dependencies: check that . is not in the
	PATH
In-Reply-To: <cover.1274482644.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274482644.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c87eb21e00ac4d5e2106565f8ea70473895289ae.1274482644.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having . in the PATH makes the toolchain build process fail because it
confuses host tools and target tools.

This fixes bug #75.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/dependencies/dependencies.sh |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index f5d9163..34149c1 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -34,6 +34,21 @@ if test -n "$LD_LIBRARY_PATH" ; then
 	fi
 fi;
 
+# sanity check for CWD in PATH. Having the current working directory
+# in the PATH makes the toolchain build process break.
+# try not to rely on egrep..
+if test -n "$PATH" ; then
+	/bin/echo TRiGGER_start"$PATH"TRiGGER_end | /bin/grep ':\.:' >/dev/null 2>&1 ||
+	/bin/echo TRiGGER_start"$PATH"TRiGGER_end | /bin/grep 'TRiGGER_start\.:' >/dev/null 2>&1 ||
+	/bin/echo TRiGGER_start"$PATH"TRiGGER_end | /bin/grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
+	/bin/echo TRiGGER_start"$PATH"TRiGGER_end | /bin/grep 'TRIGGER_start\.TRIGGER_end' >/dev/null 2>&1
+	if test $? = 0; then
+		/bin/echo -e "\nYou seem to have the current working directory in your"
+		/bin/echo -e "PATH environment variable. This doesn't work.\n"
+		exit 1;
+	fi
+fi;
+
 # Verify that which is installed
 if ! which which > /dev/null ; then
 	/bin/echo -e "\nYou must install 'which' on your build machine\n";
-- 
1.6.3.3
