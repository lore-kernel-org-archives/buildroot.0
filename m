From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Fri, 3 Jan 2014 20:18:21 +0100
Subject: [Buildroot] [PATCH v2 1/1] transmission: Fix build error
	"conflicting types for 'UTP_Write'" after version bump
Message-ID: <BLU0-SMTP19793343AE004AB8BB60FDFD9CA0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix taken from
http://www.adminsehow.com/2012/10/how-to-install-transmission-2-71-on-debian-6-0-squeeze/

compile tested on arch sh4, fixes
http://autobuild.buildroot.org/results/638/63884de929fb7339ebf44b08cb5d1ab30010666a/

should also fix powerpc
http://autobuild.buildroot.org/results/eb4/eb486228a11a9602d4bf40e771744d2b2b40508f/

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
Changes v1 -> v2:
- add a description + Signed-off-by inside the patch (Thomas)

 .../transmission/transmission-01-fix-utypes.patch  |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/transmission/transmission-01-fix-utypes.patch

diff --git a/package/transmission/transmission-01-fix-utypes.patch b/package/transmission/transmission-01-fix-utypes.patch
new file mode 100644
index 0000000..26e3e04
--- /dev/null
+++ b/package/transmission/transmission-01-fix-utypes.patch
@@ -0,0 +1,30 @@
+Fix build error "conflicting types for 'UTP_Write'"
+
+Fetch from: http://www.adminsehow.com/2012/10/how-to-install-transmission-2-71-on-debian-6-0-squeeze/
+
+The corresponding upstream bug report (unfixed) can be found here:
+https://trac.transmissionbt.com/ticket/5232
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+--- transmission-2.82.org/third-party/libutp/utypes.h	2013-08-09 04:47:43.000000000 +0200
++++ transmission-2.82/third-party/libutp/utypes.h	2014-01-02 20:17:18.000000000 +0100
+@@ -35,8 +35,15 @@
+ typedef const char * cstr;
+ typedef char * str;
+ 
+-#ifndef __cplusplus
+-typedef uint8 bool;
+-#endif
++//#ifndef __cplusplus
++//typedef uint8 bool;
++//#endif
++#ifndef __cplusplus
++#ifdef HAVE_STDBOOL_H
++#include <stdbool.h>
++#else
++typedef uint8 bool;
++#endif
++#endif
+ 
+ #endif //__UTYPES_H__
-- 
1.7.9.5
