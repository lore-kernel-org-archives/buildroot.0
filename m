From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Nov 2018 18:15:49 +0100
Subject: [Buildroot] [PATCH 2/4 v2] support/dependencies: treat BSD-tar like
 the other cases
In-Reply-To: <cover.1542474939.git.yann.morin.1998@free.fr>
References: <cover.1542474939.git.yann.morin.1998@free.fr>
Message-ID: <4f64f0e70862eef52fe97b713186f1e3bbff3449.1542474939.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when we detect that tar is BSD-tar, we fake an unsupported
version (major, minor) and rely on the version check to reject BSD-tar.

There is no reason to use such shenanigans, when we can simply reject it
from the onset.

Simplify the logic:
  - use positive logic in the condition
  - directly exit in error

Also, comment that case like the other cases are commented.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/dependencies/check-host-tar.sh | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index 0857307396..934cb61299 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -20,10 +20,11 @@ major=`echo "$version" | cut -d. -f1`
 minor=`echo "$version" | cut -d. -f2`
 bugfix=`echo "$version" | cut -d. -f3`
 version_bsd=`$tar --version | grep 'bsdtar'`
-if [ ! -z "${version_bsd}" ] ; then 
-  # mark as invalid version - not all command line options are available
-  major=0
-  minor=0
+
+# BSD tar does not have all the command-line options
+if [ -n "${version_bsd}" ] ; then
+    # echo nothing: no suitable tar found
+    exit 1
 fi
 
 # Minimal version = 1.27 (previous versions do not correctly unpack archives
-- 
2.14.1
