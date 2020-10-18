From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2020 18:33:52 +0200
Subject: [Buildroot] [git commit] package/transmission: fix build with UTP
Message-ID: <20201018162920.8BB7881F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60d3b4e5c409b9428101a60969066ce08da76b2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update first patch to fix build of transmission 3.00 with UTP. Since
upstream commit f27596238d37 (Include stdbool.h unconditionally),
upstream no longer ever defines HAVE_STDBOOL_H, so we always fallback to
manually defining 'bool' which conflicts with the type used elsewhere in
the code.

Drop our workaround, to always include stdbool.h unconditionally.

Fixes:
 - http://autobuild.buildroot.org/results/bbfb61cf911fb29dcc02626f6eb47fff9e5e64f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - expand commit log
  - drop commented-out code
  - restore CR-LF line endings in replacement code, as used by upstream
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/transmission/0001-fix-utypes.patch | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/transmission/0001-fix-utypes.patch b/package/transmission/0001-fix-utypes.patch
index 96403a6c36..81efa884a7 100644
--- a/package/transmission/0001-fix-utypes.patch
+++ b/package/transmission/0001-fix-utypes.patch
@@ -6,25 +6,25 @@ The corresponding upstream bug report (unfixed) can be found here:
 https://trac.transmissionbt.com/ticket/5232
 
 Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+[Fabrice: adapt to 3.00, which always uses stdbool.h]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[yann.morin.1998 at free.fr:
+  - don't comment-out dropped code, just drop it
+  - use CR-LF in replacement code, as used by upstream
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 
 --- transmission-2.82.org/third-party/libutp/utypes.h	2013-08-09 04:47:43.000000000 +0200
 +++ transmission-2.82/third-party/libutp/utypes.h	2014-01-02 20:17:18.000000000 +0100
-@@ -35,8 +35,15 @@
+@@ -35,8 +35,8 @@
  typedef const char * cstr;
  typedef char * str;
  
 -#ifndef __cplusplus
 -typedef uint8 bool;
 -#endif
-+//#ifndef __cplusplus
-+//typedef uint8 bool;
-+//#endif
-+#ifndef __cplusplus
-+#ifdef HAVE_STDBOOL_H
-+#include <stdbool.h>
-+#else
-+typedef uint8 bool;
-+#endif
-+#endif
++#ifndef __cplusplus
++#include <stdbool.h>
++#endif
  
  #endif //__UTYPES_H__
