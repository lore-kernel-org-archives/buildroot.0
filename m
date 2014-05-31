From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 May 2014 09:39:40 +0200
Subject: [Buildroot] [git commit] Improve tar check if bsdtar is installed
Message-ID: <20140601083246.E02309CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc90fa9417d8b99b5d1c77aaa9e4c9ac4c8c7c58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If bsdtar is installed, fix script error for tar version detection.

bsdtar does not provide all expected command line (long) options
like "--hard-dereference". To ensure compatibility, mark version
of tar as 'invalid' and trigger build of 'host-tar'.

[Peter; slightly reworded commit text]
Signed-off-by: Heiko Abraham <abrahamh@web.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/check-host-tar.sh |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
