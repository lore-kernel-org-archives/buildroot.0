From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Sun, 12 Oct 2014 00:01:59 +0200
Subject: [Buildroot] [PATCH 1/3] package/upmpdcli: bump to version 0.8.2
In-Reply-To: <1413064597-28476-2-git-send-email-jkrause@posteo.de>
References: <1413064597-28476-1-git-send-email-jkrause@posteo.de>
 <1413064597-28476-2-git-send-email-jkrause@posteo.de>
Message-ID: <5439A8D7.9010506@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/11/2014 11:56 PM, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>   package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch | 159 ----------------------
>   package/upmpdcli/upmpdcli-0002-musl-fixes.patch   |  40 ------
>   package/upmpdcli/upmpdcli.mk                      |   2 +-
>   3 files changed, 1 insertion(+), 200 deletions(-)
>   delete mode 100644 package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
>   delete mode 100644 package/upmpdcli/upmpdcli-0002-musl-fixes.patch
>
> diff --git a/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch b/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
> deleted file mode 100644
> index 2d46b94..0000000
> --- a/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
> +++ /dev/null
> @@ -1,159 +0,0 @@
> -From 722ffb8612631b9f11d888c737facdcb0580aaad Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
> -Date: Wed, 1 Oct 2014 22:31:11 +0200
> -Subject: [PATCH 1/1] uclibc fixes
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Add necessary fixes to build with uClibc
> -
> - - Missing #include of C library headers
> - - exp10 is not available in uClibc
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ----
> - libupnpp/control/avtransport.cxx      | 2 ++
> - libupnpp/control/ohplaylist.cxx       | 1 +
> - libupnpp/control/renderingcontrol.cxx | 2 ++
> - libupnpp/device/device.cxx            | 1 +
> - libupnpp/soaphelp.cxx                 | 4 ++++
> - libupnpp/upnpavutils.cxx              | 1 +
> - upmpd/upmpd.cxx                       | 1 +
> - upmpd/upmpdutils.cxx                  | 7 +++++++
> - 8 files changed, 19 insertions(+)
> -
> -Index: b/libupnpp/control/avtransport.cxx
> -===================================================================
> ---- a/libupnpp/control/avtransport.cxx
> -+++ b/libupnpp/control/avtransport.cxx
> -@@ -15,6 +15,8 @@
> -  *       59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
> -  */
> -
> -+#include <stdlib.h>
> -+
> - #include <string>
> - #include <functional>
> -
> -Index: b/libupnpp/control/ohplaylist.cxx
> -===================================================================
> ---- a/libupnpp/control/ohplaylist.cxx
> -+++ b/libupnpp/control/ohplaylist.cxx
> -@@ -14,6 +14,7 @@
> -  *       Free Software Foundation, Inc.,
> -  *       59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
> -  */
> -+#include <stdlib.h>
> - #include <arpa/inet.h>
> -
> - #include <string>
> -Index: b/libupnpp/control/renderingcontrol.cxx
> -===================================================================
> ---- a/libupnpp/control/renderingcontrol.cxx
> -+++ b/libupnpp/control/renderingcontrol.cxx
> -@@ -15,6 +15,8 @@
> -  *       59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
> -  */
> -
> -+#include <stdlib.h>
> -+
> - #include <string>
> - #include <functional>
> -
> -Index: b/libupnpp/device/device.cxx
> -===================================================================
> ---- a/libupnpp/device/device.cxx
> -+++ b/libupnpp/device/device.cxx
> -@@ -17,6 +17,7 @@
> - #include "config.h"
> -
> - #include <time.h>
> -+#include <errno.h>
> - #include <sys/time.h>
> -
> - #include <iostream>
> -Index: b/libupnpp/soaphelp.cxx
> -===================================================================
> ---- a/libupnpp/soaphelp.cxx
> -+++ b/libupnpp/soaphelp.cxx
> -@@ -16,6 +16,10 @@
> -  */
> - #include "config.h"
> -
> -+#include <string.h>
> -+#include <stdlib.h>
> -+#include <stdio.h>
> -+
> - #include <iostream>
> - using namespace std;
> -
> -Index: b/libupnpp/upnpavutils.cxx
> -===================================================================
> ---- a/libupnpp/upnpavutils.cxx
> -+++ b/libupnpp/upnpavutils.cxx
> -@@ -14,6 +14,7 @@
> -  *       Free Software Foundation, Inc.,
> -  *       59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
> -  */
> -+#include <cstdio>
> - #include <string>
> - using namespace std;
> -
> -Index: b/upmpd/upmpd.cxx
> -===================================================================
> ---- a/upmpd/upmpd.cxx
> -+++ b/upmpd/upmpd.cxx
> -@@ -22,6 +22,7 @@
> - #include <signal.h>
> - #include <sys/types.h>
> - #include <pwd.h>
> -+#include <errno.h>
> -
> - #include <string>
> - #include <iostream>
> -Index: b/upmpd/upmpdutils.cxx
> -===================================================================
> ---- a/upmpd/upmpdutils.cxx
> -+++ b/upmpd/upmpdutils.cxx
> -@@ -21,6 +21,8 @@
> - // not linking to Qt or glib just to get path-concatenating
> - // functions...
> -
> -+#define _GNU_SOURCE
> -+
> - #include <unistd.h>
> - #include <fcntl.h>
> - #include <sys/types.h>
> -@@ -31,6 +33,7 @@
> - #include <regex.h>
> - #include <errno.h>
> - #include <string.h>
> -+#include <stdlib.h>
> - #ifndef O_STREAMING
> - #define O_STREAMING 0
> - #endif
> -@@ -283,6 +286,10 @@
> - #ifdef __APPLE__
> - #define exp10 __exp10
> - #endif
> -+#ifdef __UCLIBC__
> -+/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
> -+#define exp10(x) (exp((x) * log(10)))
> -+#endif /* __UCLIBC__ */
> -
> - // Translate VolumeDB to MPD 0-100
> - int dbvaluetopercent(int dbvalue)
> -Index: b/upmpd/ohmetacache.cxx
> -===================================================================
> ---- a/upmpd/ohmetacache.cxx
> -+++ b/upmpd/ohmetacache.cxx
> -@@ -18,6 +18,7 @@
> - #include <unistd.h>
> - #include <fcntl.h>
> - #include <string.h>
> -+#include <errno.h>
> -
> - #include <iostream>
> - using namespace std;
> diff --git a/package/upmpdcli/upmpdcli-0002-musl-fixes.patch b/package/upmpdcli/upmpdcli-0002-musl-fixes.patch
> deleted file mode 100644
> index c744319..0000000
> --- a/package/upmpdcli/upmpdcli-0002-musl-fixes.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From bd1a8b6b547e06456cbede686d8c2f3cfdfa47d1 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
> -Date: Tue, 30 Sep 2014 00:07:26 +0200
> -Subject: [PATCH 2/2] musl fixes
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Instead of using the nonstandard pthread_yield call use the standardized
> -sched_yield.
> -
> -Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ----
> - libupnpp/control/discovery.cxx | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/libupnpp/control/discovery.cxx b/libupnpp/control/discovery.cxx
> -index ac14a82..0a293c7 100644
> ---- a/libupnpp/control/discovery.cxx
> -+++ b/libupnpp/control/discovery.cxx
> -@@ -18,6 +18,7 @@
> -
> - #include <stdlib.h>
> - #include <errno.h>
> -+#include <sched.h>
> - #include <unistd.h>
> -
> - #include <iostream>
> -@@ -297,7 +298,7 @@ UPnPDeviceDirectory::UPnPDeviceDirectory(time_t search_window)
> -         m_reason = "Discover work queue start failed";
> -         return;
> -     }
> --    pthread_yield();
> -+    sched_yield();
> -     LibUPnP *lib = LibUPnP::getLibUPnP();
> -     if (lib == 0) {
> -         m_reason = "Can't get lib";
> ---
> -2.1.1
> -
> diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
> index 37d8581..0d18dc1 100644
> --- a/package/upmpdcli/upmpdcli.mk
> +++ b/package/upmpdcli/upmpdcli.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UPMPDCLI_VERSION = 0.8.1
> +UPMPDCLI_VERSION = 0.8.2
>   UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
>   UPMPDCLI_LICENSE = GPLv2+
>   UPMPDCLI_LICENSE_FILES = COPYING

Sorry, this is a duplicate. Already comitted. Please ignore.
