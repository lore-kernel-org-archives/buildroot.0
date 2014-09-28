From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 23:23:58 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 0.8.1
Message-ID: <20140928214746.EE0519D79D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5638c6435787379406a4507ea6830975117a82a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version bump to 0.8.1 requires a change of the uclibc patch.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch |  100 ++++++++++++++++-----
 package/upmpdcli/upmpdcli.mk                      |    2 +-
 2 files changed, 77 insertions(+), 25 deletions(-)

diff --git a/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch b/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
index 4935efd..ee6b716 100644
--- a/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
+++ b/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
@@ -4,11 +4,59 @@ Add necessary fixes to build with uClibc
  - exp10 is not available in uClibc
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: J??rg Krause <jkrause@posteo.de>
+---
+ libupnpp/control/avtransport.cxx      | 2 ++
+ libupnpp/control/ohplaylist.cxx       | 1 +
+ libupnpp/control/renderingcontrol.cxx | 2 ++
+ libupnpp/device/device.cxx            | 1 +
+ libupnpp/soaphelp.cxx                 | 4 ++++
+ upmpd/upmpd.cxx                       | 1 +
+ upmpd/upmpdutils.cxx                  | 7 +++++++
+ 7 files changed, 18 insertions(+)
 
-Index: b/libupnpp/device.cxx
-===================================================================
---- a/libupnpp/device.cxx
-+++ b/libupnpp/device.cxx
+diff --git a/libupnpp/control/avtransport.cxx b/libupnpp/control/avtransport.cxx
+index 1aa79e2..d48af23 100644
+--- a/libupnpp/control/avtransport.cxx
++++ b/libupnpp/control/avtransport.cxx
+@@ -15,6 +15,8 @@
+  *       59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+  */
+ 
++#include <stdlib.h>
++
+ #include <string>
+ #include <functional>
+ 
+diff --git a/libupnpp/control/ohplaylist.cxx b/libupnpp/control/ohplaylist.cxx
+index 5269a5d..fe95cc1 100644
+--- a/libupnpp/control/ohplaylist.cxx
++++ b/libupnpp/control/ohplaylist.cxx
+@@ -14,6 +14,7 @@
+  *       Free Software Foundation, Inc.,
+  *       59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+  */
++#include <stdlib.h>
+ #include <arpa/inet.h>
+ 
+ #include <string>
+diff --git a/libupnpp/control/renderingcontrol.cxx b/libupnpp/control/renderingcontrol.cxx
+index 818e7c3..17d28ee 100644
+--- a/libupnpp/control/renderingcontrol.cxx
++++ b/libupnpp/control/renderingcontrol.cxx
+@@ -15,6 +15,8 @@
+  *       59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+  */
+ 
++#include <stdlib.h>
++
+ #include <string>
+ #include <functional>
+ 
+diff --git a/libupnpp/device/device.cxx b/libupnpp/device/device.cxx
+index 682c151..48c81e4 100644
+--- a/libupnpp/device/device.cxx
++++ b/libupnpp/device/device.cxx
 @@ -17,6 +17,7 @@
  #include "config.h"
  
@@ -17,8 +65,8 @@ Index: b/libupnpp/device.cxx
  #include <sys/time.h>
  
  #include <iostream>
-Index: b/libupnpp/soaphelp.cxx
-===================================================================
+diff --git a/libupnpp/soaphelp.cxx b/libupnpp/soaphelp.cxx
+index 8f25185..f4358b9 100644
 --- a/libupnpp/soaphelp.cxx
 +++ b/libupnpp/soaphelp.cxx
 @@ -16,6 +16,10 @@
@@ -32,23 +80,23 @@ Index: b/libupnpp/soaphelp.cxx
  #include <iostream>
  using namespace std;
  
-Index: b/upmpd/upmpd.cxx
-===================================================================
+diff --git a/upmpd/upmpd.cxx b/upmpd/upmpd.cxx
+index 3b45cdd..bc506ff 100644
 --- a/upmpd/upmpd.cxx
 +++ b/upmpd/upmpd.cxx
-@@ -20,6 +20,7 @@
- #include <unistd.h>
+@@ -22,6 +22,7 @@
+ #include <signal.h>
  #include <sys/types.h>
  #include <pwd.h>
 +#include <errno.h>
  
  #include <string>
  #include <iostream>
-Index: b/upmpd/upmpdutils.cxx
-===================================================================
+diff --git a/upmpd/upmpdutils.cxx b/upmpd/upmpdutils.cxx
+index 2830a2e..7cea612 100644
 --- a/upmpd/upmpdutils.cxx
 +++ b/upmpd/upmpdutils.cxx
-@@ -21,11 +21,14 @@
+@@ -21,6 +21,8 @@
  // not linking to Qt or glib just to get path-concatenating
  // functions...
  
@@ -57,21 +105,25 @@ Index: b/upmpd/upmpdutils.cxx
  #include <unistd.h>
  #include <fcntl.h>
  #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/file.h>
-+#include <stdlib.h>
- #include <math.h>
- #include <pwd.h>
+@@ -31,6 +33,7 @@
  #include <regex.h>
-@@ -35,6 +38,11 @@
+ #include <errno.h>
+ #include <string.h>
++#include <stdlib.h>
+ #ifndef O_STREAMING
  #define O_STREAMING 0
  #endif
- 
+@@ -283,6 +286,10 @@ int percentodbvalue(int value)
+ #ifdef __APPLE__
+ #define exp10 __exp10
+ #endif
 +#ifdef __UCLIBC__
 +/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
 +#define exp10(x) (exp((x) * log(10)))
 +#endif /* __UCLIBC__ */
-+
- #include <iostream>
- #include <sstream>
- #include <fstream>
+ 
+ // Translate VolumeDB to MPD 0-100
+ int dbvaluetopercent(int dbvalue)
+-- 
+2.1.1
+
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index fbd2a4f..37d8581 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 0.8.0
+UPMPDCLI_VERSION = 0.8.1
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
