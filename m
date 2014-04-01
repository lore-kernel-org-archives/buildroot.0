From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Apr 2014 14:45:20 +0200
Subject: [Buildroot] [git commit] libcurl: security bump to version 7.36.0
Message-ID: <20140401124523.802729C4A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71878d297253b6ef6b8309b1c8a841833edc446e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-0005, CVE-2014-0319, CVE-2014-1263 and CVE-2014-2522.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/libcurl-01-disable-manual.patch |   31 +++++++++++++++++++++++
 package/libcurl/libcurl.mk                      |    2 +-
 2 files changed, 32 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl-01-disable-manual.patch b/package/libcurl/libcurl-01-disable-manual.patch
new file mode 100644
index 0000000..4872169
--- /dev/null
+++ b/package/libcurl/libcurl-01-disable-manual.patch
@@ -0,0 +1,31 @@
+Apply fix from 38d582ff541353d738858299d4a2b78bafac03ed to unbreak
+building with --disable-manual.
+We don't use the literal patch since that means re-generating files
+from the tarball that are usually shipped.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura curl-7.36.0.orig/src/tool_hugehelp.c curl-7.36.0/src/tool_hugehelp.c
+--- curl-7.36.0.orig/src/tool_hugehelp.c	2014-03-31 19:28:23.018515093 -0300
++++ curl-7.36.0/src/tool_hugehelp.c	2014-03-31 19:28:09.994076200 -0300
+@@ -4165,6 +4165,10 @@
+ "  these mailing lists instead of mailing any individual.\n"
+ , stdout) ;
+ }
++#else /* !USE_MANUAL */
++/* built-in manual is disabled, blank function */
++#include "tool_hugehelp.h"
++void hugehelp(void) {}
+ #endif /* USE_MANUAL */
+ #else
+ /*
+@@ -8192,5 +8196,9 @@
+   }
+   inflateEnd(&z);
+ }
++#else
++/* built-in manual is disabled, blank function */
++#include "tool_hugehelp.h"
++void hugehelp(void) {}
+ #endif /* USE_MANUAL */
+ #endif /* HAVE_LIBZ */
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 458dfb6..ab558fb 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.35.0
+LIBCURL_VERSION = 7.36.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
