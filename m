From: Heiko Abraham <abrahamh@web.de>
Date: Fri, 30 May 2014 17:44:36 +0200
Subject: [Buildroot] [PATCH] Improve tar check if bsdtar is installed
Message-ID: <1401464676-2315-1-git-send-email-abrahamh@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If bsdtar is installed, fix script error for tar version detection.
Set tar version to 'invalid' to trigger rebuild of 'host-tar'.
---
 support/dependencies/check-host-tar.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index 2cfc2b3..b5818f0 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -14,10 +14,18 @@ fi
 # Output of 'tar --version' examples:
 # tar (GNU tar) 1.15.1
 # tar (GNU tar) 1.25
+# bsdtar 2.8.3 - libarchive 2.8.3
 version=`$tar --version | head -n 1 | sed 's/^.*\s\([0-9]\+\.\S\+\).*$/\1/'`
 major=`echo "$version" | cut -d. -f1`
 minor=`echo "$version" | cut -d. -f2`
 bugfix=`echo "$version" | cut -d. -f3`
+version_bsd=`$tar --version | grep 'bsdtar'`
+if [ ! -z "${version_bsd}" ] ; then 
+  # mark as invalid tar version
+  major=1
+  minor=14
+  bugfix=1
+fi
 
 # Minimal version = 1.17 (previous versions do not correctly unpack archives
 # containing hard-links if the --strip-components option is used).
-- 
1.8.5.2 (Apple Git-48)
