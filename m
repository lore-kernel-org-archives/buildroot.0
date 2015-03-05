From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  5 Mar 2015 23:07:29 +0100
Subject: [Buildroot] [PATCH v1] directfb: fix imlib image provider
Message-ID: <1425593249-20516-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change 0002-imlib2-config.patch to patch configure.in instead of
configure to survicve the autoreconf step introduced by [1].

Fixes the following runtime error, e.g. from df_texture:

(!) Direct/Interface: Unable to dlopen `/usr/lib/directfb-1.6-0/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_imlib2.so'!
    --> /usr/lib/directfb-1.6-0/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_imlib2.so: undefined symbol: imlib_image_get_width

[1] http://git.buildroot.net/buildroot/commit/?id=7e9264956bb5693bc49274ee0b42ffb4c869e23f

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/directfb/0002-imlib2-config.patch | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/directfb/0002-imlib2-config.patch b/package/directfb/0002-imlib2-config.patch
index 1203475..ea2bf82 100644
--- a/package/directfb/0002-imlib2-config.patch
+++ b/package/directfb/0002-imlib2-config.patch
@@ -1,3 +1,8 @@
+From 8352c434e515f19dd1ba36256bfcc3ec9480838d Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 5 Mar 2015 22:38:52 +0100
+Subject: [PATCH] imlib2 config
+
 Call the imlib2-conf variable that are set by ac_cv_path_IMLIB2_CONFIG
 with the absolute path because the imlib2-config file is not covered
 by the PATH variable.
@@ -5,11 +10,18 @@ This is important for cross compiler that need to get the staging settings
 instead of the host settings.
 
 Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
+[ patch configure.in instead of configure to survive autoreconf ]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
---- directfb-1.6.3/configure.orig	2013-03-31 13:18:22.837560379 +0200
-+++ directfb-1.6.3/configure	2013-03-31 13:23:40.177541099 +0200
-@@ -19816,8 +19816,8 @@ fi
- $as_echo "$as_me: WARNING: *** Imlib2 library not found, building without Imlib2 support ***" >&2;}
+diff --git a/configure.in b/configure.in
+index 38d7e78..fa5e87f 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1094,8 +1094,8 @@ if test "x$enable_imlib2" = "xyes"; then
+     AC_MSG_WARN([*** Imlib2 library not found, building without Imlib2 support ***])
      imlib2="no"
    else
 -    IMLIB2_CFLAGS=`imlib2-config --cflags`
@@ -19,3 +31,6 @@ Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
      imlib2="yes"
    fi
  fi
+-- 
+2.1.4
+
-- 
2.1.4
