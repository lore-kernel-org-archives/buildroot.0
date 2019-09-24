From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 24 Sep 2019 08:37:00 -0300
Subject: [Buildroot] [PATCH v2] check-kernel-headers.sh: use a trap to
 remove the temporary file
Message-ID: <20190924113700.950-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The POSIX specification defines a 'trap <action> EXIT' mechanism that is
useful to perform clean-up actions in shell scripts. A trap has two main
advantages over hand-crafted clean-up mechanisms:

- It runs even if the process is terminated by a SIGTERM.
- It runs even if the script stops due to a pipeline failure (set -e).

Now we can make the script to stop immediately if a compilation error
occurs, instead of letting it try to run an unexisting program.

This change may appear to be overkill but Buildroot is an open source
project and each piece of code is a potential learning tool for other
developments. We must strive to provide good examples.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Acked-by: Yann E. MORIN <yann.morin@orange.com>
---
Changes v1->v2:
- Remove superfluous test of empty EXEC variable in the trap and add a
  comment explaining why it is not required.
- Remove error intentionally inserted in the C code to test the trap.
---
 support/scripts/check-kernel-headers.sh | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
index a8b94f6a02..9d23c00feb 100755
--- a/support/scripts/check-kernel-headers.sh
+++ b/support/scripts/check-kernel-headers.sh
@@ -9,6 +9,15 @@ HDR_M="${HDR_VER%%.*}"
 HDR_V="${HDR_VER#*.}"
 HDR_m="${HDR_V%%.*}"
 
+# Exit on any error, so we don't try to run an unexisting program if the
+# compilation fails.
+set -e
+
+# Set the clean-up trap in advance to prevent a race condition in which we
+# create the file but get a SIGTERM before setting it. Notice that we don't
+# need to care about EXEC being empty, since 'rm -f ""' does nothing.
+trap 'rm -f "${EXEC}"' EXIT
+
 EXEC="$(mktemp -p "${BUILDDIR}" -t .check-headers.XXXXXX)"
 
 # We do not want to account for the patch-level, since headers are
@@ -37,6 +46,3 @@ int main(int argc __attribute__((unused)),
 _EOF_
 
 "${EXEC}"
-ret=${?}
-rm -f "${EXEC}"
-exit ${ret}
-- 
2.18.1
