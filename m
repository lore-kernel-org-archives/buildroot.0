From: Heiko Abraham <abrahamh@web.de>
Date: Sat, 31 May 2014 00:10:38 +0200
Subject: [Buildroot] [PATCH v2] Improve tar check if bsdtar is installed
In-Reply-To: <1401464676-2315-1-git-send-email-abrahamh@web.de>
References: <1401464676-2315-1-git-send-email-abrahamh@web.de>
Message-ID: <1401487838-4010-1-git-send-email-abrahamh@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If bsdtar is installed, fix script error for tar version detection.

bsdtar not provide all expected command line (long) options
like "--hard-dereference". To ensure compatibly mark version
of tar as 'invalid' and trigger rebuild of 'host-tar'.

Signed-off-by: Heiko Abraham <abrahamh@web.de>
---
 support/dependencies/check-host-tar.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index 2cfc2b3..932d3c4 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -14,10 +14,17 @@ fi
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
+  # mark as invalid version - not all command line options are available
+  major=0
+  minor=0
+fi
 
 # Minimal version = 1.17 (previous versions do not correctly unpack archives
 # containing hard-links if the --strip-components option is used).
-- 
1.8.5.2 (Apple Git-48)
