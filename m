From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 17:13:06 +0200
Subject: [Buildroot] [git commit] libqmi: musl compat canonicalize_file_name
Message-ID: <20170504151345.B6B3A800C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c78b65c4f161ec101ff02880788ef22eb7c87d76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds an inline equivalent of canonicalize_file_name
using realpath().

Bug report (origin of this patch):
https://bugs.freedesktop.org/show_bug.cgi?id=99944

Resolves:
http://autobuild.buildroot.net/results/afa/afa4b97e012586585b11be1e70ed3c63a7c48a4d/

  CCLD     test-generated
  CCLD     test-utils
  CCLD     test-message
../../../src/libqmi-glib/.libs/libqmi-glib.so: undefined reference to `canonicalize_file_name'
collect2: error: ld returned 1 exit status
Makefile:440: recipe for target 'test-generated' failed

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-musl-compat-canonicalize_file_name.patch  | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/libqmi/0001-musl-compat-canonicalize_file_name.patch b/package/libqmi/0001-musl-compat-canonicalize_file_name.patch
new file mode 100644
index 0000000..5656d55
--- /dev/null
+++ b/package/libqmi/0001-musl-compat-canonicalize_file_name.patch
@@ -0,0 +1,48 @@
+From 2f44edc9fbcbf2202174aec723e8a8d191c13d2f Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Mon, 1 May 2017 19:55:07 -0500
+Subject: [PATCH] musl compat canonicalize_file_name()
+
+Adds an inline equivalent of canonicalize_file_name
+using realpath().
+
+Bug report (origin of this patch):
+https://bugs.freedesktop.org/show_bug.cgi?id=99944
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/libqmi-glib/qmi-utils.h | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/src/libqmi-glib/qmi-utils.h b/src/libqmi-glib/qmi-utils.h
+index 4fd5199..4869da5 100644
+--- a/src/libqmi-glib/qmi-utils.h
++++ b/src/libqmi-glib/qmi-utils.h
+@@ -29,6 +29,24 @@
+ #error "Only <libqmi-glib.h> can be included directly."
+ #endif
+ 
++#ifndef HAVE_CANONICALIZE_FILE_NAME
++#include <limits.h>
++#include <string.h>
++#include <stdlib.h>
++#include <stdio.h>
++static char * canonicalize_file_name(const char *path)
++{
++       char buf[PATH_MAX] = { };
++
++       snprintf(buf, sizeof(buf) - 1, "%s", path);
++
++       if (!realpath(path, buf))
++               return NULL;
++
++       return strdup(buf);
++}
++#endif
++
+ #include <glib.h>
+ 
+ G_BEGIN_DECLS
+-- 
+1.9.1
+
