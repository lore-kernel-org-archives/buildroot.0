From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 10:50:28 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] localedef: fix xlocale.h
 related compile failure
Message-ID: <20171127101635.0E20D7FB71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=beb6eab5027e55e6373d10569c39bbbd8b4dff84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Add upstream patch 'Don't include <xlocale.h>'.

Fixes Bug-10501 ([1]):

In file included from ./include/locale.h:1:0,
                 from /usr/include/libintl.h:103,
                 from ./include/libintl.h:2,
                 from glibc/locale/programs/charmap.c:25:
glibc/locale/locale.h:146:11: fatal error: xlocale.h: No such file or directory
 # include <xlocale.h>

[1] https://bugs.busybox.net/show_bug.cgi?id=10501

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d5cc76c5314f58fa18001e9abce196c1ac4a28d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../localedef/0001-Don-t-include-xlocale.h.patch   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/localedef/0001-Don-t-include-xlocale.h.patch b/package/localedef/0001-Don-t-include-xlocale.h.patch
new file mode 100644
index 0000000..9a6c2f8
--- /dev/null
+++ b/package/localedef/0001-Don-t-include-xlocale.h.patch
@@ -0,0 +1,50 @@
+From: Bernhard Walle <bernhard@bwalle.de>
+Date: Mon, 2 Oct 2017 16:55:23 +0200
+Subject: [PATCH] Don't include <xlocale.h>
+
+This header has been removed in glibc 2.26:
+
+https://abi-laboratory.pro/tracker/changelog/glibc/2.26/log.html
+
+------------------------ >8 ------------------------
+* The nonstandard header <xlocale.h> has been removed.  Most programs should
+  use <locale.h> instead.  If you have a specific need for the definition of
+  locale_t with no other declarations, please contact
+  libc-alpha at sourceware.org and explain.
+------------------------ 8< ------------------------
+
+Signed-off-by: Bernhard Walle <bernhard@bwalle.de>
+
+Upstream: https://git.pengutronix.de/cgit/ptxdist/tree/patches/localedef-eglibc-2.14.1-r17443-ptx1/0003-Don-t-include-xlocale.h.patch
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ eglibc/locale/langinfo.h | 2 +-
+ eglibc/locale/locale.h   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/eglibc/locale/langinfo.h b/eglibc/locale/langinfo.h
+index 0a5336507196..76707a4584c1 100644
+--- a/eglibc/locale/langinfo.h
++++ b/eglibc/locale/langinfo.h
+@@ -589,7 +589,7 @@ extern char *nl_langinfo (nl_item __item) __THROW;
+    more information.  */
+ 
+ /* Get locale datatype definition.  */
+-# include <xlocale.h>
++# include <locale.h>
+ 
+ /* Just like nl_langinfo but get the information from the locale object L.  */
+ extern char *nl_langinfo_l (nl_item __item, __locale_t __l);
+diff --git a/eglibc/locale/locale.h b/eglibc/locale/locale.h
+index 2aa19e76acb2..18be711a2d40 100644
+--- a/eglibc/locale/locale.h
++++ b/eglibc/locale/locale.h
+@@ -143,7 +143,7 @@ __END_NAMESPACE_STD
+    This is a proof-of-concept implementation.  */
+ 
+ /* Get locale datatype definition.  */
+-# include <xlocale.h>
++# include_next <locale.h>
+ 
+ /* Return a reference to a data structure representing a set of locale
+    datasets.  Unlike for the CATEGORY parameter for `setlocale' the
