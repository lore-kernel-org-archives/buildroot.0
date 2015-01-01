From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 22:36:33 +0100
Subject: [Buildroot] [git commit] bluez5_utils: fix O_CLOEXEC build failure
Message-ID: <20150101213726.980997FA7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d28df573c9959fe0bb642908a5eeccfd532f7e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch for bluez5_utils to fix the O_CLOEXEC build failure, due
to a missing <config.h> include.

Fixes:

  http://autobuild.buildroot.org/results/c61/c6117d261d0c7f938fabddb806d0b0095fe9dfb9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-src-shared-ecc.c-include-config.h.patch   |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/bluez5_utils/0002-src-shared-ecc.c-include-config.h.patch b/package/bluez5_utils/0002-src-shared-ecc.c-include-config.h.patch
new file mode 100644
index 0000000..f339c88
--- /dev/null
+++ b/package/bluez5_utils/0002-src-shared-ecc.c-include-config.h.patch
@@ -0,0 +1,33 @@
+From 3c5a93d0be4457120d17da70918f9eb8799d6c52 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 1 Jan 2015 22:33:34 +0100
+Subject: [PATCH] src/shared/ecc.c: include <config.h>
+
+The ecc.c file forgets to include <config.h>. This causes build
+failures with certain C libraries, because ecc.c uses O_CLOEXEC, which
+is only available when _GNU_SOURCE is defined. And _GNU_SOURCE gets
+defined by <config.h>, so it should be included.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/shared/ecc.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/shared/ecc.c b/src/shared/ecc.c
+index 33c4187..41be02b 100644
+--- a/src/shared/ecc.c
++++ b/src/shared/ecc.c
+@@ -24,6 +24,10 @@
+  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+-- 
+2.1.0
+
