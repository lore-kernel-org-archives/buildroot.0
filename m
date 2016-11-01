From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Tue,  1 Nov 2016 17:33:52 -0200
Subject: [Buildroot] [PATCH 1/3] support/download/git: log checked out sha1
Message-ID: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation to have automated tests for this script, display the
checked out sha1 in the build log.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
Another solution would be to use an environment variable set by the test
to print that info, e.g. if [ "1" == "${GIT_DOWNLOAD_AUTOTEST}" ]; then
---
 support/download/git | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/download/git b/support/download/git
index 7921411..7c44c65 100755
--- a/support/download/git
+++ b/support/download/git
@@ -85,6 +85,12 @@ if [ ${recurse} -eq 1 ]; then
     _git submodule update --init --recursive
 fi
 
+# Log the sha1. It can be used for automated tests and debug.
+if [ -z ${verbose} ]; then
+    sha1=$(_git rev-parse HEAD)
+    printf "Checked out '%s'.\n" "${sha1}"
+fi
+
 # We do not need the .git dir; we keep other .git files, in case they
 # are the only files in their directory.
 rm -rf .git
-- 
2.9.3
