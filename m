From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] Fix util-linux build on MIPS
Message-ID: <20100825153142.CAC7A89016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=55f70939b839cd5ad826ea01fcb6d363d63ee15d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in bug #635, util-linux doesn't build due to missing
constant definitions related to the a.out binary format. We fix this
by hardcoding these constant definitions, as done in newer versions of
util-linux.

Obviously, the long term fix is to upgrade to util-linux-ng, but this
is probably not acceptable for 2010.08.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...linux-2.13-pre17-hardcode-a-out-constants.patch |   41 ++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/util-linux/util-linux-2.13-pre17-hardcode-a-out-constants.patch

diff --git a/package/util-linux/util-linux-2.13-pre17-hardcode-a-out-constants.patch b/package/util-linux/util-linux-2.13-pre17-hardcode-a-out-constants.patch
new file mode 100644
index 0000000..b115c41
--- /dev/null
+++ b/package/util-linux/util-linux-2.13-pre17-hardcode-a-out-constants.patch
@@ -0,0 +1,41 @@
+Hardcode a.out related constants
+
+The OMAGIC, NMAGIC and ZMAGIC constants, related to the legacy a.out
+binary format, are no longer available in the headers of all
+architectures, due to this binary format being deprecated. For that
+reason, util-linux fails to build.
+
+We therefore take the approach used in newer versions of
+util-linux-ng: hardcoding those values. See
+http://git.kernel.org/?p=utils/util-linux-ng/util-linux-ng.git;a=commitdiff;h=e9eb4dad0ece03914f67f6d1ded74cfbbe694ba4
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ text-utils/more.c |    7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+Index: util-linux-2.13-pre7/text-utils/more.c
+===================================================================
+--- util-linux-2.13-pre7.orig/text-utils/more.c
++++ util-linux-2.13-pre7/text-utils/more.c
+@@ -53,7 +53,6 @@
+ #include <sys/stat.h>
+ #include <sys/file.h>
+ #include <sys/wait.h>
+-#include <a.out.h>
+ #include <locale.h>
+ #include "xstrncpy.h"
+ #include "nls.h"
+@@ -504,9 +503,9 @@
+ 
+ 	if (fread(twobytes, 2, 1, f) == 1) {
+ 		switch(twobytes[0] + (twobytes[1]<<8)) {
+-		case OMAGIC:	/* 0407 */
+-		case NMAGIC:	/* 0410 */
+-		case ZMAGIC:	/* 0413 */
++		case 0407:	/* a.out obj */
++		case 0410:	/* a.out exec */
++		case 0413:	/* a.out demand exec */
+ 		case 0405:
+ 		case 0411:
+ 		case 0177545:
-- 
1.7.1
