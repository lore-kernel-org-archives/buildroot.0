From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2020 21:57:51 +0100
Subject: [Buildroot] [git commit] package/libva: bump version to 2.6.0
Message-ID: <20200105205312.021128ECBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cedf5974295da8dae3f714b8a58a20de91330d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added bugfix patch to fix known issue suggested by upstream:
https://github.com/intel/libva/releases/tag/2.6.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...just-call-sequence-to-ensure-authenticate.patch | 68 ++++++++++++++++++++++
 package/libva/libva.hash                           |  6 +-
 package/libva/libva.mk                             |  2 +-
 3 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/package/libva/0001-adjust-call-sequence-to-ensure-authenticate.patch b/package/libva/0001-adjust-call-sequence-to-ensure-authenticate.patch
new file mode 100644
index 0000000000..09c766424b
--- /dev/null
+++ b/package/libva/0001-adjust-call-sequence-to-ensure-authenticate.patch
@@ -0,0 +1,68 @@
+From a80d2fe3bcc2c14c6e1434615d1be38924b668ea Mon Sep 17 00:00:00 2001
+From: Carl Zhang <carl.zhang@intel.com>
+Date: Mon, 30 Dec 2019 04:38:43 -0500
+Subject: [PATCH] adjust call sequence to ensure authenticate operation is
+ executed
+
+fixes #355
+
+Downloaded from upstream PR: https://github.com/intel/libva/pull/356
+
+Signed-off-by: Carl Zhang <carl.zhang@intel.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ va/va.c | 25 ++++++++++++++++---------
+ 1 file changed, 16 insertions(+), 9 deletions(-)
+
+diff --git a/va/va.c b/va/va.c
+index cfcabff..7f014a1 100644
+--- a/va/va.c
++++ b/va/va.c
+@@ -367,11 +367,23 @@ static VAStatus va_getDriverNameByIndex(VADisplay dpy, char **driver_name, int c
+     VADisplayContextP pDisplayContext = (VADisplayContextP)dpy;
+     const char *driver_name_env = NULL;
+     VADriverContextP ctx;
++    VAStatus status = VA_STATUS_SUCCESS;
+ 
+     ctx = CTX(dpy);
++    if (pDisplayContext->vaGetDriverNameByIndex) {
++        /*if vaGetDriverNameByIndex is implemented*/
++        status = pDisplayContext->vaGetDriverNameByIndex(pDisplayContext, driver_name, candidate_index);
++    } else {
++        if (candidate_index == 0)
++            status = pDisplayContext->vaGetDriverName(pDisplayContext, driver_name);
++        else
++            status = VA_STATUS_ERROR_INVALID_PARAMETER;
++    }    
+     driver_name_env = getenv("LIBVA_DRIVER_NAME");
+     /*if user set driver name by vaSetDriverName */
+     if (ctx->override_driver_name){
++        if(*driver_name)
++            free(*driver_name);
+         *driver_name = strdup(ctx->override_driver_name);
+         if (!(*driver_name)) {
+               va_errorMessage(dpy, "va_getDriverNameByIndex  failed with %s, out of memory\n",vaErrorStr(VA_STATUS_ERROR_ALLOCATION_FAILED));
+@@ -380,19 +392,14 @@ static VAStatus va_getDriverNameByIndex(VADisplay dpy, char **driver_name, int c
+         va_infoMessage(dpy, "User requested driver '%s'\n", *driver_name);
+         return VA_STATUS_SUCCESS;
+     } else if (driver_name_env && (geteuid() == getuid())) {
++        if(*driver_name)
++            free(*driver_name);
+         /*if user set driver name by environment variable*/
+         *driver_name = strdup(driver_name_env);
+         va_infoMessage(dpy, "User environment variable requested driver '%s'\n", *driver_name);
+         return VA_STATUS_SUCCESS;
+-    } else if (pDisplayContext->vaGetDriverNameByIndex) {
+-        /*if vaGetDriverNameByIndex is implemented*/
+-        return pDisplayContext->vaGetDriverNameByIndex(pDisplayContext, driver_name, candidate_index);
+-    } else {
+-        if (candidate_index == 0)
+-            return pDisplayContext->vaGetDriverName(pDisplayContext, driver_name);
+-        else
+-            return VA_STATUS_ERROR_INVALID_PARAMETER;
+-    }
++    } 
++    return status;
+ }
+ 
+ static char *va_getDriverPath(const char *driver_dir, const char *driver_name)
diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 4a62a9450a..d3a4f51ff6 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.5.0/libva-2.5.0.tar.bz2.sha1sum
-sha1 5bd2b0bc9d1e49cf1e21d9a63696f13a1483bd86  libva-2.5.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.6.0/libva-2.6.0.tar.bz2.sha1sum
+sha1 9d3b55d2a01e45612c03b2e7718599e760c3bf7e  libva-2.6.0.tar.bz2
 # Locally computed
-sha256 3aa89cd369a506ac4dbe5de7c0ef5da4f3d220bf986403f02fa1f6f702af6878  libva-2.5.0.tar.bz2
+sha256 486bb6b5761db6e5a9f4475bd187e0bfa7309944cfc9734d496d41930353d6c5  libva-2.6.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 176f971128..0516cd0ab9 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.5.0
+LIBVA_VERSION = 2.6.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
