From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2010 11:10:23 +0100
Subject: [Buildroot] [git commit master] at: fix compile breakage when flex
	isn't on the target
Message-ID: <20100217101056.DD2967711B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=93df31e4047f0c5708605570de65bcd1d777c01d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch that makes sure config.h gets included in a file that uses
some of the NEEDS_* macros. The yywrap() function was missing when
flex was not available on the target, even though this configuration
is supposed to be supported by at (and handled by NEEDS_YYWRAP).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/at/at-3.1.12-0007-include-config-h.patch |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 package/at/at-3.1.12-0007-include-config-h.patch

diff --git a/package/at/at-3.1.12-0007-include-config-h.patch b/package/at/at-3.1.12-0007-include-config-h.patch
new file mode 100644
index 0000000..8afc502
--- /dev/null
+++ b/package/at/at-3.1.12-0007-include-config-h.patch
@@ -0,0 +1,16 @@
+Make sure to include config.h so that NEEDS_* macros are properly
+taken into account. This was a problem for NEEDS_YYWRAP, which was set
+to 1 in config.h, but the corresponding code wasn't compiled in.
+
+Index: at-3.1.12/parsetime.l
+===================================================================
+--- at-3.1.12.orig/parsetime.l	2010-02-10 00:17:46.000000000 +0100
++++ at-3.1.12/parsetime.l	2010-02-10 00:18:07.000000000 +0100
+@@ -4,6 +4,7 @@
+ #include <time.h>
+ #include "y.tab.h"
+ #include "parsetime.h"
++#include "config.h"
+ 
+ char *last_token = NULL;
+ char **my_argv;
-- 
1.6.3.3
